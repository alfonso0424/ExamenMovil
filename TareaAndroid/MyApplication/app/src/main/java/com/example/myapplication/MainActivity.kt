package com.example.myapplication

import android.Manifest
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Color
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.os.Bundle
import android.widget.Button
import android.widget.CheckBox
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.google.android.material.card.MaterialCardView

class MainActivity : AppCompatActivity(), SensorEventListener {

    private var contador = 0
    private lateinit var sensorManager: SensorManager
    private lateinit var tvContador: TextView
    private var sensorPasos: Sensor? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        tvContador = findViewById(R.id.tvContador)
        val btnSumar = findViewById<Button>(R.id.btnSumar)
        val btnCero = findViewById<Button>(R.id.btnCero)
        val btnDetalle = findViewById<Button>(R.id.btnDetalle)

        sensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager

        if (ContextCompat.checkSelfPermission(this,
                Manifest.permission.ACTIVITY_RECOGNITION) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(this,
                arrayOf(Manifest.permission.ACTIVITY_RECOGNITION), 100)
        } else {
            configurarSensor()
        }

        btnSumar.setOnClickListener {
            contador++
            tvContador.text = "Numero de pasos: $contador"
        }

        btnCero.setOnClickListener {
            contador = 0
            tvContador.text = "Numero de pasos: $contador"
        }

        btnDetalle.setOnClickListener {
            val intent = Intent(this, Detail::class.java)
            intent.putExtra("PASOS", contador)
            startActivity(intent)
        }

        // Tarjetas de hábitos
        configurarHabito(
            findViewById(R.id.cardAgua),
            findViewById(R.id.cbAgua)
        )
        configurarHabito(
            findViewById(R.id.cardEjercicio),
            findViewById(R.id.cbEjercicio)
        )
        configurarHabito(
            findViewById(R.id.cardEstudiar),
            findViewById(R.id.cbEstudiar)
        )
    }

    private fun configurarHabito(card: MaterialCardView, cb: CheckBox) {
        // Tocar la tarjeta marca o desmarca el checkbox
        card.setOnClickListener { cb.isChecked = !cb.isChecked }

        // Cualquier cambio (tarjeta o checkbox) actualiza el color
        cb.setOnCheckedChangeListener { _, isChecked ->
            card.setCardBackgroundColor(if (isChecked) Color.parseColor("#C8E6C9") else Color.WHITE)
        }
    }

    private fun configurarSensor() {
        sensorPasos = sensorManager.getDefaultSensor(Sensor.TYPE_STEP_COUNTER)

        if (sensorPasos == null) {
            tvContador.text = "Error de sensor"
        }
    }

    override fun onResume() {
        super.onResume()
        sensorPasos?.let {
            sensorManager.registerListener(this, it, SensorManager.SENSOR_DELAY_UI)
        }
    }

    override fun onPause() {
        super.onPause()
        if (::sensorManager.isInitialized) {
            sensorManager.unregisterListener(this)
        }
    }

    override fun onSensorChanged(event: SensorEvent) {
        if (event.sensor.type == Sensor.TYPE_STEP_COUNTER) {
            val pasosTotales = event.values[0].toInt()
            tvContador.text = "Pasos totales hoy: $pasosTotales"
        }
    }

    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String?>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == 100) {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                configurarSensor()
            } else {
                tvContador.text = "Permiso no concedido del sensor"
            }
        }
    }
}