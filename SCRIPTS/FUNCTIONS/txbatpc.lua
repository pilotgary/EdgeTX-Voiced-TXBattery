local TXBATT = "tx-voltage"

local function my_run(event, touchState)

  local gs = getGeneralSettings()
  local MIN_VOLTAGE = gs.battMin
  local MAX_VOLTAGE = gs.battMax

  local voltage = getValue(TXBATT)
  print(TXBATT, ":", voltage)
  playFile("/SOUNDS/en/SCRIPTS/TXBATPC/txbat.wav")

  if not voltage then 
	print("Tx Voltage Unavailable")
    playFile("/SOUNDS/en/SCRIPTS/TXBATPC/TxBatU.wav")
    return -1
  end

  local percent = (voltage - MIN_VOLTAGE) / (MAX_VOLTAGE - MIN_VOLTAGE) * 100
  percent = math.floor(percent + 0.5)
  if percent < 0 then percent = 0 end
  if percent > 100 then percent = 100 end

  print("TX battery:")
  print(percent)
  
  playNumber(percent, UNIT_PERCENT, 0)
  
  if percent < 10 then
	print( "Charge soon")
	playFile("/SOUNDS/en/SCRIPTS/TXBATPC/chrgtx.wav")
  end
  
  return -1
end

return { run = my_run }