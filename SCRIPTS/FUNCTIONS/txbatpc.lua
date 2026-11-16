local TXBATT = "tx-voltage"

local function playLocalizedAudio(filename)
  local settings = getGeneralSettings()
  local voiceLang = settings.voice or "en"
  local basePath = "/SOUNDS/"
  local targetPath = basePath .. voiceLang .. "/SCRIPTS/TXBATPC/" .. filename

  -- Fall back to English if the localized file is missing.
  if fstat(targetPath) == nil then
    targetPath = basePath .. "en/SCRIPTS/TXBATPC/" .. filename
  end

  -- Play only when the localized or fallback file exists.
  if fstat(targetPath) ~= nil then
    playFile(targetPath)
  end
end

local function my_run(event, touchState)

  local gs = getGeneralSettings()
  local MIN_VOLTAGE = gs.battMin
  local MAX_VOLTAGE = gs.battMax

  local voltage = getValue(TXBATT)
  print(TXBATT, ":", voltage)
  playLocalizedAudio("txbat.wav")

  if not voltage then 
	print("Tx Voltage Unavailable")
    playLocalizedAudio("TxBatU.wav")
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
	playLocalizedAudio("chrgtx.wav")
  end
  
  return -1
end

return { run = my_run }
