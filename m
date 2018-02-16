From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: How to test new bootloaders on Jetson TX1? - ATF
Date: Fri, 16 Feb 2018 04:04:23 +0100
Message-ID: <d219bbd4-df4c-f6b7-e64d-5f305fe5d854@suse.de>
References: <5ff3ffde-653c-ea50-490c-efcc6dccecc2@suse.de>
 <0247bb39-1f53-5c45-4d37-247813b53b96@nvidia.com>
 <8d80b0d3-eaed-b1ab-02c9-86f81ac4b7fa@suse.de>
 <33de1065-1372-282c-9646-30a63729e08e@nvidia.com>
 <71bf7527-3fb7-293f-8a1c-63ce74882649@suse.de>
 <fa89b123-bfcb-6f91-59cc-bae29aef19ab@nvidia.com>
 <d6a44448867a47028685fb0af0005d59@HQMAIL101.nvidia.com>
 <205465fc7b2f4547ac81c7394108e2c7@bgmail103.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------250E906D4C3B517D1CF5535E"
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <205465fc7b2f4547ac81c7394108e2c7@bgmail103.nvidia.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Varun Wadekar <vwadekar@nvidia.com>
Cc: Alexander Graf <agraf@suse.de>, Jonathan Hunter <jonathanh@nvidia.com>, U-Boot <u-boot@lists.denx.de>, Tom Warren <TWarren@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Mian Yousaf Kaukab <yousaf.kaukab@suse.com>
List-Id: linux-tegra@vger.kernel.org

This is a multi-part message in MIME format.
--------------250E906D4C3B517D1CF5535E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Varun,

Am 15.02.2018 um 17:57 schrieb Varun Wadekar:
> Andreas, can you try the TOS packaging script available in our public repo?
> 
> http://nv-tegra.nvidia.com/gitweb/?p=3rdparty/ote_partner/tlk.git;a=blob;f=tools/gen_tos_part_img.py;h=47828f7028e56a6cffb9b773502b13dc431a015e;hb=HEAD

Great, that script does work. It is lacking usage output, but looking at
the code, its arguments were self-documenting.

> Please let me know if this does not work for you.
> 
> For the upstream ATF code, our downstream has not caught up with upstream yet, so I am not sure if upstream would directly work for TX1. But its definitely worth a try.

I tried R28.1 flash.sh -k TOS with my ATF v1.4 with Spectre backports,
without SPD. BL31 appears to initialize okay, but later something runs
into an unhandled SMC 0x82000015 - things then go south and it doesn't
reach the Nvidia U-Boot. Serial log attached.

According to
https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/arm-sip-service.rst
that SMC function ID falls into the SiP range, so indeed something
Nvidia-specific missing in v1.4?

Regards,
Andreas

https://build.opensuse.org/package/show/hardware:boot/arm-trusted-firmware-tegra210

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)

--------------250E906D4C3B517D1CF5535E
Content-Type: text/x-log;
 name="boot.mine.tos.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="boot.mine.tos.log"

[0000.120] [TegraBoot] (version 00.00.2014.50-mobile-d44d4bf0)
[0000.125] Processing in cold boot mode Bootloader 2
[0000.130] A02 Bootrom Patch rev = 63
[0000.133] Power-up reason: reset button
[0000.137] No Battery Present
[0000.139] RamCode = 0
[0000.142] Platform has Ddr4 type ram
[0000.145] max77620 disabling SD1 Remote Sense
[0000.149] Setting Ddr voltage to 1125mv
[0000.153] Serial Number of Pmic Max77663: 0x1417b9
[0000.161] Entering ramdump check
[0000.164] Get RamDumpCarveOut = 0xff23f000
[0000.168] RamDumpCarveOut=0xff23f000,  RamDumperFlag=0x0
[0000.173] Last reboot was clean, booting normally!
[0000.178] Sdram initialization is successful 
[0000.182] SecureOs Carveout Base=0xff800000 Size=0x00800000
[0000.187] GSC1 Carveout Base=0xff700000 Size=0x00100000
[0000.192] GSC2 Carveout Base=0xff600000 Size=0x00100000
[0000.197] GSC3 Carveout Base=0xff500000 Size=0x00100000
[0000.203] GSC4 Carveout Base=0xff400000 Size=0x00100000
[0000.208] GSC5 Carveout Base=0xff300000 Size=0x00100000
[0000.213] BpmpFw Carveout Base=0xff2c0000 Size=0x00040000
[0000.218] Lp0 Carveout Base=0xff2bf000 Size=0x00001000
[0000.234] RamDump Carveout Base=0xff23f000 Size=0x00080000
[0000.239] Platform-DebugCarveout: 0
[0000.242] Nck Carveout Base=0xff03f000 Size=0x00200000
[0000.247] Non secure mode, and RB not enabled.
[0000.277] Using GPT Primary to query partitions 
[0000.282] Loading Tboot-CPU binary
[0000.331] Verifying bootloader in OdmNonSecureSBK mode
[0000.341] Bootloader load address is 0xa0000000, entry address is 0xa0000258
[0000.348] Bootloader downloaded successfully.
[0000.352] Downloaded Tboot-CPU binary to 0xa0000258
[0000.357] MAX77620_GPIO1 Configured.
[0000.361] MAX77620_GPIO5 Configured.
[0000.364] CPU power rail is up
[0000.367] CPU clock enabled
[0000.371] Performing RAM repair
[0000.374] Updating A64 Warmreset Address to 0xa00002e9
[0000.402] Bootloader DTB Load Address: 0x83000000
[0000.430] Kernel DTB Load Address: 0x83100000
[0000.435] Loading cboot binary
[0000.529] Verifying bootloader in OdmNonSecureSBK mode
[0000.567] Bootloader load address is 0x92c00000, entry address is 0x92c00258
[0000.574] Bootloader downloaded successfully.
[0000.578] GPT: Partition NOT found ! 
[0000.582] Find Partition via GPT Failed
[0000.585] Find Partition via PT Failed
[0000.589] function NvTbootGetBinaryOffsets: 0x1 error
[0000.594] Error in NvTbootLoadBinary: 0x1 !
[0000.598] Next binary entry address: 0x92c00258 
[0000.602] BoardId: 2180
[0000.607] dram memory type is 3
[0000.611] WB0 init successful
[0000.637] Bpmp FW successfully loaded
[0000.640] Set NvDecSticky Bits
[0000.644] GSC1 address : ff700000
[0000.647] GSC2 address ff63fffc value c0edbbcc
[0000.652] GSC2 address : ff600000
[0000.656] GSC3 address : ff500000
[0000.659] GSC4 address : ff400000
[0000.663] GSC5 address : ff300000
[0000.666] GSC MC Settings done
[0000.670] TOS old plaintext Image length 41168
[0000.675] *** Secure OS image signature not verified ***
[0000.681] Loading and Validation of Secure OS Successful
[0000.686] NvTbootPackSdramParams: start. 
[0000.691] NvTbootPackSdramParams: done. 
[0000.694] Tegraboot started after 98254 us
[0000.698] Basic modules init took 290274 us
[0000.702] Sec Bootdevice Read Time = 216 ms, Read Size = 9488 KB
[0000.708] Sec Bootdevice Write Time = -1940251271 ms, Write Size = -68719477 KB
[0000.715] Next stage binary read took 23772 us
[0000.720] Carveout took 207065 us
[0000.723] CPU initialization took 92193 us
[0000.727] Total time taken by TegraBoot 613304 us

[0000.731] Starting CPU & Halting co-processor 

64INFO:    Configuring TrustZone DRAM Memory Carveout
INFO:    BL3-1: Boot CPU: ARM Processor [80000000]
INFO:    BL3-1: Tegra: MMU enabled
NOTICE:  BL31: v1.4(debug):
NOTICE:  BL31: Built : 12:00:00, Feb 10 2018
INFO:    Setting up secondary CPU boot
INFO:    Tegra Memory Controller (v1)
INFO:    BL3-1: Tegra platform setup complete
INFO:    BL31: Initializing runtime services
WARNING: BL31: cortex_a57: CPU workaround for 813419 was missing!
INFO:    BL31: cortex_a57: CPU workaround for disable_ldnp_overread was applied
INFO:    BL31: cortex_a57: CPU workaround for 826974 was applied
INFO:    BL31: cortex_a57: CPU workaround for 826977 was applied
INFO:    BL31: cortex_a57: CPU workaround for 828024 was applied
INFO:    BL31: cortex_a57: CPU workaround for 829520 was applied
INFO:    BL31: cortex_a57: CPU workaround for 833471 was applied
INFO:    BL31: cortex_a57: CPU workaround for cve_2017_5715 was applied
INFO:    BL31: Preparing for EL3 exit to normal world
INFO:    Entry point address = 0xa0000614
INFO:    SPSR = 0x3c9
[0000.947] RamCode = 0
[0000.969] LPDDR4 Training: Read DT: Number of tables = 10
[0000.974] EMC Training (SRC-freq: 204000; DST-freq: 40800)
[0000.979] EMC Training Skipped
[0000.982] EMC Training (SRC-freq: 204000; DST-freq: 68000)
[0000.987] EMC Training Skipped
[0000.990] EMC Training (SRC-freq: 204000; DST-freq: 102000)
[0000.995] EMC Training Skipped
[0000.998] EMC Training (SRC-freq: 204000; DST-freq: 204000)
[0001.003] EMC Training Skipped
[0001.006] EMC Training (SRC-freq: 204000; DST-freq: 408000)
[0001.012] EMC Training Successful
[0001.015] EMC Training (SRC-freq: 204000; DST-freq: 665600)
[0001.021] EMC Training Successful
[0001.024] EMC Training (SRC-freq: 204000; DST-freq: 800000)
[0001.035] EMC Training Successful
[0001.038] EMC Training (SRC-freq: 204000; DST-freq: 1065600)
[0001.061] EMC Training Successful
[0001.064] EMC Training (SRC-freq: 204000; DST-freq: 1331200)
[0001.086] EMC Training Successful
[0001.089] EMC Training (SRC-freq: 204000; DST-freq: 1600000)
[0001.109] EMC Training Successful
[0001.112] Switching to 800000 KHz Success
[0001.122] RamCode = 0
[0001.126] DT Write: emc-table@40800 succeeded
[0001.131] DT Write: emc-table@68000 succeeded
[0001.137] DT Write: emc-table@102000 succeeded
[0001.144] DT Write: emc-table@204000 succeeded
[0001.150] DT Write: emc-table@408000 succeeded
[0001.156] DT Write: emc-table@665600 succeeded
[0001.162] DT Write: emc-table@800000 succeeded
[0001.168] DT Write: emc-table@1065600 succeeded
[0001.174] DT Write: emc-table@1331200 succeeded
[0001.180] DT Write: emc-table@1600000 succeeded
[0001.184] LPDDR4 Training: Write DT: Number of tables = 10
[0001.220] 
[0001.221] Debug Init done
[0001.223] Marked DTB cacheable
[0001.226] Bootloader DTB loaded at 0x83000000
[0001.231] Marked DTB cacheable
[0001.234] Kernel DTB loaded at 0x83100000
[0001.238] DeviceTree Init done
[0001.258] Pinmux applied successfully
[0001.264] gicd_base: 0x50041000
[0001.269] gicc_base: 0x50042000
[0001.271] Interrupts Init done
[0001.277] Using base:0x60005008 & irq:33 for tick-timer
[0001.282] Using base:0x60005000 for delay-timer
[0001.287] platform_init_timer: DONE
[0001.290] Timer(tick) Init done
[0001.296] osc freq = 38400 khz
[0001.301] 
[0001.302] welcome to cboot
[0001.305] 
[0001.306] Cboot Version: 00.00.2014.50-t210-fadd1be5
[0001.311] calling constructors
[0001.314] initializing heap
[0001.316] initializing threads
[0001.319] initializing timers
[0001.322] creating bootstrap completion thread
[0001.327] top of bootstrap2()
[0001.330] CPU: ARM Cortex A57
[0001.332] CPU: MIDR: 0x411FD071, MPIDR: 0x80000000
[0001.337] initializing platform
[0001.363] config for ddr50 mode completed
[0001.367] sdmmc bdev is already initialized
[0001.371] Enable APE clock
[0001.374] Un-powergate APE partition
[0001.377] of_register: registering tegra_udc to of_hal
[0001.382] of_register: registering inv20628-driver to of_hal
[0001.388] of_register: registering ads1015-driver to of_hal
[0001.394] of_register: registering lp8557-bl-driver to of_hal
[0001.399] of_register: registering bq2419x_charger to of_hal
[0001.405] of_register: registering cpc to of_hal
[0001.410] of_register: registering bq27441_fuel_gauge to of_hal
[0001.430] gpio framework initialized
[0001.433] of_register: registering tca9539_gpio to of_hal
[0001.438] of_register: registering tca9539_gpio to of_hal
[0001.444] of_register: registering i2c_bus_driver to of_hal
[0001.449] of_register: registering i2c_bus_driver to of_hal
[0001.455] of_register: registering i2c_bus_driver to of_hal
[0001.460] pmic framework initialized
[0001.464] of_register: registering max77620_pmic to of_hal
[0001.469] regulator framework initialized
[0001.473] of_register: registering tegra_xhci to of_hal
[0001.479] initializing target
[0001.488] gpio_driver_register: register 'tegra_gpio_driver' driver
[0001.500] fixed regulator driver initialized
[0001.575] initializing OF layer
[0001.578] NCK carveout not present
[0001.581] Skipping dts_overrides
[0001.585] of_children_init: Ops found for compatible string nvidia,tegra210-xhci
[0001.594] of_children_init: Ops found for compatible string nvidia,tegra210-i2c
[0001.626] I2C Bus Init done
[0001.629] of_children_init: Ops found for compatible string nvidia,tegra210-i2c
[0001.644] I2C Bus Init done
[0001.646] of_children_init: Ops found for compatible string ti,tca9539
[0001.661] tca9539_init: i2c bus: 2, slave addr: 0xe8
[0001.666] gpio_driver_register: register 'tca9539_gpio_driver' driver
[0001.673] of_children_init: Ops found for compatible string ti,tca9539
[0001.687] tca9539_init: i2c bus: 2, slave addr: 0xee
[0001.693] gpio_driver_register: register 'tca9539_gpio_driver' driver
[0001.699] of_children_init: Ops found for compatible string nvidia,tegra210-i2c
[0001.715] I2C Bus Init done
[0001.717] of_children_init: Ops found for compatible string nvidia,tegra210-i2c
[0001.733] I2C Bus Init done
[0001.735] of_children_init: Ops found for compatible string nvidia,tegra210-i2c
[0001.751] I2C Bus Init done
[0001.754] of_children_init: Ops found for compatible string maxim,max77620
[0001.770] max77620_init using irq 118
[0001.774] register 'maxim,max77620' pmic
[0001.779] gpio_driver_register: register 'max77620-gpio' driver
[0001.785] of_children_init: Ops found for compatible string nvidia,tegra210-i2c
[0001.801] I2C Bus Init done
[0001.806] NCK carveout not present
[0001.809] shim_invoke: No NCT, Calling dts updates
[0001.831] Find /i2c@7000c000's alias i2c0
[0001.834] get eeprom at 1-a2, size 256, type 0
[0001.839] get eeprom at 1-ae, size 256, type 0
[0001.854] Find /i2c@7000c400's alias i2c1
[0001.858] get eeprom at 2-a0, size 256, type 0
[0001.874] Find /i2c@7000c500's alias i2c2
[0001.878] get eeprom at 3-a0, size 256, type 0
[0001.883] get eeprom at 3-ae, size 256, type 0
[0001.894] Find /host1x/i2c@546c0000's alias i2c6
[0001.899] get eeprom at 7-a8, size 256, type 0
[0001.903] pm_ids_update: Updating 1,a2, size 256, type 0
[0001.909] I2C slave not started
[0001.912] I2C write failed
[0001.914] Writing offset failed
[0001.917] eeprom_init: EEPROM read failed
[0001.921] pm_ids_update: eeprom init failed
[0001.925] pm_ids_update: Updating 1,ae, size 256, type 0
[0001.931] I2C slave not started
[0001.934] I2C write failed
[0001.936] Writing offset failed
[0001.939] eeprom_init: EEPROM read failed
[0001.943] pm_ids_update: eeprom init failed
[0001.947] pm_ids_update: Updating 2,a0, size 256, type 0
[0001.953] I2C slave not started
[0001.956] I2C write failed
[0001.958] Writing offset failed
[0001.961] eeprom_init: EEPROM read failed
[0001.965] pm_ids_update: eeprom init failed
[0001.969] pm_ids_update: Updating 3,a0, size 256, type 0
[0001.999] pm_ids_update: The pm board id is 2180-1000-410
[0002.009] Adding plugin-manager/ids/2180-1000-410=/i2c@7000c500:module@0x50
[0002.019] pm_ids_update: pm id update successful
[0002.023] pm_ids_update: Updating 3,ae, size 256, type 0
[0002.053] pm_ids_update: The pm board id is 2597-0000-500
[0002.061] Adding plugin-manager/ids/2597-0000-500=/i2c@7000c500:module@0x57
[0002.070] pm_ids_update: pm id update successful
[0002.075] pm_ids_update: Updating 7,a8, size 256, type 0
[0002.082] I2C slave not started
[0002.085] I2C write failed
[0002.088] Writing offset failed
[0002.091] eeprom_init: EEPROM read failed
[0002.095] pm_ids_update: eeprom init failed
[0002.129] updating /chosen/nvidia,wifi-mac node 00:04:4b:79:74:7d
[0002.138] updating /chosen/nvidia,bluetooth-mac node 00:04:4b:79:74:7e
[0002.148] updating /chosen/nvidia,ethernet-mac node 00:04:4b:79:74:7f
[0002.154] Plugin Manager: Parse ODM data 0x00084000
[0002.190] Find /i2c@7000c000's alias i2c0
[0002.194] get eeprom at 1-a2, size 256, type 0
[0002.199] get eeprom at 1-ae, size 256, type 0
[0002.214] Find /i2c@7000c400's alias i2c1
[0002.218] get eeprom at 2-a0, size 256, type 0
[0002.234] Find /i2c@7000c500's alias i2c2
[0002.238] get eeprom at 3-a0, size 256, type 0
[0002.242] get eeprom at 3-ae, size 256, type 0
[0002.254] Find /host1x/i2c@546c0000's alias i2c6
[0002.259] get eeprom at 7-a8, size 256, type 0
[0002.263] pm_ids_update: Updating 1,a2, size 256, type 0
[0002.268] I2C slave not started
[0002.271] I2C write failed
[0002.274] Writing offset failed
[0002.277] eeprom_init: EEPROM read failed
[0002.281] pm_ids_update: eeprom init failed
[0002.285] pm_ids_update: Updating 1,ae, size 256, type 0
[0002.290] I2C slave not started
[0002.293] I2C write failed
[0002.296] Writing offset failed
[0002.299] eeprom_init: EEPROM read failed
[0002.303] pm_ids_update: eeprom init failed
[0002.307] pm_ids_update: Updating 2,a0, size 256, type 0
[0002.312] I2C slave not started
[0002.315] I2C write failed
[0002.318] Writing offset failed
[0002.321] eeprom_init: EEPROM read failed
[0002.325] pm_ids_update: eeprom init failed
[0002.329] pm_ids_update: Updating 3,a0, size 256, type 0
[0002.359] pm_ids_update: The pm board id is 2180-1000-410
[0002.367] Adding plugin-manager/ids/2180-1000-410=/i2c@7000c500:module@0x50
[0002.374] pm_ids_update: pm id update successful
[0002.378] pm_ids_update: Updating 3,ae, size 256, type 0
[0002.409] pm_ids_update: The pm board id is 2597-0000-500
[0002.416] Adding plugin-manager/ids/2597-0000-500=/i2c@7000c500:module@0x57
[0002.423] pm_ids_update: pm id update successful
[0002.428] pm_ids_update: Updating 7,a8, size 256, type 0
[0002.436] I2C slave not started
[0002.439] I2C write failed
[0002.441] Writing offset failed
[0002.444] eeprom_init: EEPROM read failed
[0002.448] pm_ids_update: eeprom init failed
[0002.482] Chip UID is 00000001640ca5871c00000016058200
[0002.490] shim_cmdline_install: /chosen/bootargs: root=/dev/mmcblk0p1 rw rootwait console=ttyS0,115200n8 console=tty0 OS=l4t fbcon=map:0 net.ifnames=0    androidboot.modem=none androidboot.serialno=03246161949850008205 androidboot.security=non-secure
[0002.514] Add serial number:03246161949850008205 as DT property
[0002.522] calling apps_init()
[0002.526] Found 18 GPT partitions in "sdmmc3_user"
[0002.531] Proceeding to Cold Boot
[0002.534] starting app android_boot_app
[0002.538] Device state: unlocked
[0002.541] display console init
[0002.546] skip-display-init in bootloader
[0002.550] set_instance_and_out_type: invalid out_type
[0002.555] display_console_init: No display init
[0002.566] Gpio keyboard init success
[0002.569] bct_init bctinit 
[0002.572] device_query_partition_size: failed to open partition sdmmc3_user:BMP !
[0002.580] BMP partition read faDT entry for leds-pwm not found
i[0002.594] led!
[0002.595] blob_init: blob-partition BMP header read failed
[0002.601] load_bmp_blob: BMP blob initialization failed
[0002.606] Could not load/initialize BMP blob...ignoring
[0002.611] bl_battery_charging: connected to external power supply
[0002.622] display_console_ioctl: No display init
[0002.627] switch_backlight failed
[0002.630] bct_init bctinit 
[0002.633] device_query_partition_size: failed to open partition sdmmc3_user:MSC !
[0002.640] MSC Partition not found
[0002.644] bct_init bctinit 
[0002.646] bct_init bctinit 
[0002.650] blob_init: USP partition does not have valid Blob
[0002.655] Loading android kernel
[0002.659] Default: NOT skip verified boot.
ERROR:   tegra_sip_handler: unhandled SMC (0x82000015)
[0002.668] Failed to pass verified boot params
[0002.672] Failed while loading kernel and ramdisk images
[0002.678] Failed to boot Android
[0002.681] starting fastboot mode
[0002.687] fastboot cmd_init done.
[0002.690] platform does not support off-mode-charge
[0002.695] usbdcd_init Initialize USBF driver
[0002.699]  usbdcd_phy_open oscfreq = 5
[0002.708] usbdcd_start Start the initialized controller
[000[0002.716] -- suspend --
2.716] display_console_clear: No display init
[0002.723] Error in fastboot menu
[0002.726] Continue booting ...
[0002.729] 
[0002.730] display_console_clear: No display init
[0002.734] Loading android kernel
[0002.738] Default: NOT skip verified boot.
ERROR:   tegra_sip_handler: unhandled SMC (0x82000015)
[0002.747] Failed to pass verified boot params
[0002.752] Failed while loading kernel and ramdisk images
[0002.757] Failed to boot Android
[0002.760] starting fastboot mode
[0002.794] fastboot cmd_init done.
[0002.797] platform does not support off-mode-charge
[0[0002.805] display_console_clear: No display init
[0002.810] Error in fastboot menu
[0002.813] Continue booting ...
[0002.816] 
[0002.817] display_console_clear: No display init
[0002.821] 
[0002.823] -----------------------------------------------
[0002.828] Synchronous Exception: DATA ABORT (FAR: 8)
[0002.833] -----------------------------------------------
[0002.838] PAR_ELX: 0x80b
[0002.841] 
[0002.842] ESR 0x96000005: ec 0x25, il 0x1, iss 0x5
[0002.847] -----------------------------------------------
[0002.852]  [Stack Trace]
[0002.854] 
[0002.855] => pc:0x92C39C94, sp:0x92C9A7E0
[0002.859] => pc:0x92C3893C, sp:0x92C9AA10
[0002.863] => pc:0x92C38854, sp:0x92C9AA30
[0002.867] => pc:0x92C03DEC, sp:0x92C9AA40
[0002.871] => pc:0x92C38948, sp:0x92C9AAC0
[0002.875] => pc:0x92C38854, sp:0x92C9AC20
[0002.879] => pc:0x92C03DEC, sp:0x92C9AC30
[0002.883] => pc:0x92C0464C, sp:0x92C9ACB0
[0002.887] => pc:0x92C036C0, sp:0x92C9AE10
[0002.891] => pc:0x92C02CF8, sp:0x92C9AE90
[0002.895] => pc:0x92C02CC0, sp:0x92C9AEA0
[0002.899] -----------------------------------------------
[0002.904] iframe 0x92c9a6f0:
[0002.907] x0  0x        92c64000 x1  0x               0 x2  0x             260 x3  0x               2
[0002.916] x4  0x               a x5  0x        92c9a7d0 x6  0x              20 x7  0x        6d365a2f
[0002.926] x8  0x               a x9  0x               8 x10 0x        92c9260e x11 0x             401
[0002.935] x12 0x        10000000 x13 0x              40 x14 0x               1 x15 0x        92cb6a48
[0002.944] x16 0x           ffff0 x17 0x           10000 x18 0x               0 x19 0x        92c90000
[0002.953] x20 0x        92c64518 x21 0x        83028ab0 x22 0x        92c64000 x23 0x        92c90000
[0002.963] x24 0x             400 x25 0x              24 x26 0x        92c9aab0 x27 0x               0
[0002.972] x28 0x               0 x29 0x        92c9aa10 lr  0x        92c38940 sp  0x        92c9a7e0
[0002.981] elr 0x        92c39c94
[0002.985] spsr 0x        60000309
[0002.988] -----------------------------------------------
[0002.993] panic (caller 0x92c01238): die
[0002.997] HALT: spinning forever...


--------------250E906D4C3B517D1CF5535E
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVS1Cb290IG1h
aWxpbmcgbGlzdApVLUJvb3RAbGlzdHMuZGVueC5kZQpodHRwczovL2xpc3RzLmRlbnguZGUvbGlz
dGluZm8vdS1ib290Cg==

--------------250E906D4C3B517D1CF5535E--
