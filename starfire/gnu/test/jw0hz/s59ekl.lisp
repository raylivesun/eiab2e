;; name project s59ekl
;; name program s59
;; name extension ekl


;; define the project
(project s59ekl {
  ; define the files
  files {
    "src/main.c"
    "src/utils.c"
    "src/io.c"
    "src/timer.c"
    "src/adc.c"
    "src/doc.c"
    "src/spi.c"
    "src/uart.c"
    "src/flash.c"
    "src/eeprom.c"
    "src/nom.c"
    "src/watchdog.c"
    "src/adc_dac_spi_uart.c"
  })

  ; define the libraries
(libraries {
    "stm32l4xx_hal"
    "stm32l4xx_hal_adc"
    "stm32l4xx_hal_dac"
    "stm32l4xx_hal_spi"
    "stm32l4xx_hal_uart"
    "stm32l4xx_hal_flash"
    "stm32l4xx_hal_eeprom"
    "stm32l4xx_hal_nvm"
    "stm32l4xx_hal_watchdog"
  })

  ; define the linker script
  (linker_script "STM32L476RGTx_FLASH.ld")

  ; define the output file name
  (output_file "s59ell.elf")

  ; define the linker flags
  (linker_flags {
   "-thumb",
   "-mcp=cortex-m4",
   "-float-abi=hard",
   "-fpu=fpv4-sp-d16",
   "-Wl,--gc-sections",
   "-Wl,--entry=Reset_Handler",
   "-Wl,--warn-section-align",
   "-Wl,--start-group",
   "-Wl,--end-group",
   "-Wl,--unresolved-symbols=ignore-all")
   ; define the linker script directory
   (linker_script_directory "ld")
   ; define the include paths
   (include_paths {
     "include"
     "CMSIS/Device/ST/STM32L4xx/Include")
     ; define the library paths
     (library_paths {
       "lib"
     })
     ; define the preprocessor flags
     (preprocessor_flags {
       "-DST32L476xx",
       "-DUSE_HAL_DRIVER",
       "-DST32L476RGTx",
       "-DEBUG",
       "-O0",
       "-g3",
       "-Wall",
       "-message-length=0",
       "-function-sections",
       "-data-sections",
       "-stack-usage",
       "-MMD",
       "-MP",
       "-MF",
       "$(@:%.o=%.d)",
       "-MT",
       "$(@:%.o=%.o)"
       "-c",
       "-x",
       "c",
       "-std=gnu11")
       ; define the compiler flags
       (compiler_flags {
         "-thumb",
         "-mcp=cortex-m4",
         "-float-abi=hard",
         "-fpu=fpv4-sp-d16",
         "-Og",
         "-g3",
         "-Wall",
         "-message-length=0",
         "-function-sections",
         "-data-sections",
         "-stack-usage",
         "-MMD",
         "-MP",
         "-MF",
         "$(@:%.o=%.d)",
         "-MT",
         "$(@:%.o=%.o)"
         "-c",
         "-x",
         "c",
         "-std=gnu11",
         "-DST32L476xx",
         "-DUSE_HAL_DRIVER",
         "-DST32L476RGTx",
         "-DEBUG",
         "-O0",
         "-g3",
         "-Wall",
         "-message-length=0",
         "-function-sections",
         "-data-sections",
         "-stack-usage",
         "-MMD",
         "-MP",
         "-MF",
         "$(@:%.o=%.d)",
         "-MT",
         "$(@:%.o=%.o)"
         "-c",
         "-x",
         "c",
         "-std=gnu11",
         "-DST32L476xx",
         "-DUSE_HAL_DRIVER",
         "-DST32L476RGTx",
         "-DEBUG",
         "-O0",
         "-g3",
         "-Wall",
         "-message-length=0",
         "-function-sections",
         "-data-sections",
         "-stack-usage",
         "-MMD",
         "-MP",
         "-MF",
         "$(@:%.o=%.d)",
         "-MT",
         "$(@:%.o=%.o)"
         "-c",
         "-x",
         "c",
         "-std=gnu11",
         "-DST32L476xx",
         "-DUSE_HAL_DRIVER",
         "-DST32L476RGTx",
         "-DEBUG",
         "-O0",
         "-g3",
         "-Wall")





