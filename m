From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] Restructure driver/power and add Tegra PMC driver
Date: Mon,  7 Jul 2014 16:16:48 +0200
Message-ID: <1404742610-4951-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi,

I recently posted a series of patches to move some drivers out of arch/arm so
that they can be shared between 64-bit and 32-bit SoCs. People objected quite
strongly, asking me to find better homes for the drivers than drivers/soc.

This is my attempt to do that for the Tegra PMC (Power-Management Controller)
which provides, among other things, control over power partitions on the SoC.
It does not contain battery charging logic or indeed anything supply-related,
but people thought that drivers/power was still the best fit (see also the
code in drivers/power/avs).

However, simply putting the driver in that directory would imply a dependency
on the power-supply class, because drivers/power is only descended into when
POWER_SUPPLY is selected. Given how the PMC isn't a power supply driver at
all that didn't seem like the right thing to do, so this became a two-patch
series.

Patch 1 move all current power-supply drivers into a drivers/power/supply
subdirectory, thereby making drivers/power available as a new home for
miscellaneous power-management or -control related drivers.

Finally patch 2 moves out the PMC related code from arch/arm/mach-tegra into
the drivers/power directory.

I would very much appreciate comments on this approach, especially from the
power-supply maintainers, since this effectively makes them the maintainers
of this new type of driver as well, and that may after all not be something
that they signed up to.

Thanks,
Thierry

Thierry Reding (2):
  power: Move power-supply drivers to subdirectory
  ARM: tegra: Convert PMC to a driver

 arch/arm/mach-tegra/Makefile                      |   2 -
 arch/arm/mach-tegra/board.h                       |   7 -
 arch/arm/mach-tegra/platsmp.c                     |   1 -
 arch/arm/mach-tegra/pm.c                          |  30 +-
 arch/arm/mach-tegra/pm.h                          |  10 +-
 arch/arm/mach-tegra/pmc.c                         | 402 ---------
 arch/arm/mach-tegra/pmc.h                         |  62 --
 arch/arm/mach-tegra/powergate.c                   | 503 ------------
 arch/arm/mach-tegra/tegra.c                       |   6 -
 drivers/Makefile                                  |   2 +-
 drivers/power/Kconfig                             | 395 +--------
 drivers/power/Makefile                            |  63 +-
 drivers/power/{ => supply}/88pm860x_battery.c     |   0
 drivers/power/{ => supply}/88pm860x_charger.c     |   0
 drivers/power/supply/Kconfig                      | 392 +++++++++
 drivers/power/supply/Makefile                     |  58 ++
 drivers/power/{ => supply}/ab8500_bmdata.c        |   0
 drivers/power/{ => supply}/ab8500_btemp.c         |   0
 drivers/power/{ => supply}/ab8500_charger.c       |   0
 drivers/power/{ => supply}/ab8500_fg.c            |   0
 drivers/power/{ => supply}/abx500_chargalg.c      |   0
 drivers/power/{ => supply}/apm_power.c            |   0
 drivers/power/{ => supply}/bq2415x_charger.c      |   0
 drivers/power/{ => supply}/bq24190_charger.c      |   0
 drivers/power/{ => supply}/bq24735-charger.c      |   0
 drivers/power/{ => supply}/bq27x00_battery.c      |   0
 drivers/power/{ => supply}/collie_battery.c       |   0
 drivers/power/{ => supply}/da9030_battery.c       |   0
 drivers/power/{ => supply}/da9052-battery.c       |   0
 drivers/power/{ => supply}/ds2760_battery.c       |   0
 drivers/power/{ => supply}/ds2780_battery.c       |   0
 drivers/power/{ => supply}/ds2781_battery.c       |   0
 drivers/power/{ => supply}/ds2782_battery.c       |   0
 drivers/power/{ => supply}/generic-adc-battery.c  |   0
 drivers/power/{ => supply}/goldfish_battery.c     |   0
 drivers/power/{ => supply}/gpio-charger.c         |   0
 drivers/power/{ => supply}/intel_mid_battery.c    |   0
 drivers/power/{ => supply}/isp1704_charger.c      |   0
 drivers/power/{ => supply}/jz4740-battery.c       |   0
 drivers/power/{ => supply}/lp8727_charger.c       |   0
 drivers/power/{ => supply}/lp8788-charger.c       |   0
 drivers/power/{ => supply}/max14577_charger.c     |   0
 drivers/power/{ => supply}/max17040_battery.c     |   0
 drivers/power/{ => supply}/max17042_battery.c     |   0
 drivers/power/{ => supply}/max8903_charger.c      |   0
 drivers/power/{ => supply}/max8925_power.c        |   0
 drivers/power/{ => supply}/max8997_charger.c      |   0
 drivers/power/{ => supply}/max8998_charger.c      |   0
 drivers/power/{ => supply}/olpc_battery.c         |   0
 drivers/power/{ => supply}/pcf50633-charger.c     |   0
 drivers/power/{ => supply}/pda_power.c            |   0
 drivers/power/{ => supply}/pm2301_charger.c       |   0
 drivers/power/{ => supply}/pm2301_charger.h       |   0
 drivers/power/{ => supply}/pmu_battery.c          |   0
 drivers/power/{ => supply}/power_supply.h         |   0
 drivers/power/{ => supply}/power_supply_core.c    |   0
 drivers/power/{ => supply}/power_supply_leds.c    |   0
 drivers/power/{ => supply}/power_supply_sysfs.c   |   0
 drivers/power/{ => supply}/rx51_battery.c         |   0
 drivers/power/{ => supply}/s3c_adc_battery.c      |   0
 drivers/power/{ => supply}/sbs-battery.c          |   0
 drivers/power/{ => supply}/smb347-charger.c       |   0
 drivers/power/{ => supply}/test_power.c           |   0
 drivers/power/{ => supply}/tosa_battery.c         |   0
 drivers/power/{ => supply}/tps65090-charger.c     |   0
 drivers/power/{ => supply}/twl4030_charger.c      |   0
 drivers/power/{ => supply}/twl4030_madc_battery.c |   0
 drivers/power/{ => supply}/wm831x_backup.c        |   0
 drivers/power/{ => supply}/wm831x_power.c         |   0
 drivers/power/{ => supply}/wm8350_power.c         |   0
 drivers/power/{ => supply}/wm97xx_battery.c       |   0
 drivers/power/{ => supply}/z2_battery.c           |   0
 drivers/power/tegra-pmc.c                         | 948 ++++++++++++++++++++++
 include/linux/tegra-soc.h                         |  46 ++
 74 files changed, 1473 insertions(+), 1454 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/pmc.c
 delete mode 100644 arch/arm/mach-tegra/pmc.h
 delete mode 100644 arch/arm/mach-tegra/powergate.c
 rename drivers/power/{ => supply}/88pm860x_battery.c (100%)
 rename drivers/power/{ => supply}/88pm860x_charger.c (100%)
 create mode 100644 drivers/power/supply/Kconfig
 create mode 100644 drivers/power/supply/Makefile
 rename drivers/power/{ => supply}/ab8500_bmdata.c (100%)
 rename drivers/power/{ => supply}/ab8500_btemp.c (100%)
 rename drivers/power/{ => supply}/ab8500_charger.c (100%)
 rename drivers/power/{ => supply}/ab8500_fg.c (100%)
 rename drivers/power/{ => supply}/abx500_chargalg.c (100%)
 rename drivers/power/{ => supply}/apm_power.c (100%)
 rename drivers/power/{ => supply}/bq2415x_charger.c (100%)
 rename drivers/power/{ => supply}/bq24190_charger.c (100%)
 rename drivers/power/{ => supply}/bq24735-charger.c (100%)
 rename drivers/power/{ => supply}/bq27x00_battery.c (100%)
 rename drivers/power/{ => supply}/collie_battery.c (100%)
 rename drivers/power/{ => supply}/da9030_battery.c (100%)
 rename drivers/power/{ => supply}/da9052-battery.c (100%)
 rename drivers/power/{ => supply}/ds2760_battery.c (100%)
 rename drivers/power/{ => supply}/ds2780_battery.c (100%)
 rename drivers/power/{ => supply}/ds2781_battery.c (100%)
 rename drivers/power/{ => supply}/ds2782_battery.c (100%)
 rename drivers/power/{ => supply}/generic-adc-battery.c (100%)
 rename drivers/power/{ => supply}/goldfish_battery.c (100%)
 rename drivers/power/{ => supply}/gpio-charger.c (100%)
 rename drivers/power/{ => supply}/intel_mid_battery.c (100%)
 rename drivers/power/{ => supply}/isp1704_charger.c (100%)
 rename drivers/power/{ => supply}/jz4740-battery.c (100%)
 rename drivers/power/{ => supply}/lp8727_charger.c (100%)
 rename drivers/power/{ => supply}/lp8788-charger.c (100%)
 rename drivers/power/{ => supply}/max14577_charger.c (100%)
 rename drivers/power/{ => supply}/max17040_battery.c (100%)
 rename drivers/power/{ => supply}/max17042_battery.c (100%)
 rename drivers/power/{ => supply}/max8903_charger.c (100%)
 rename drivers/power/{ => supply}/max8925_power.c (100%)
 rename drivers/power/{ => supply}/max8997_charger.c (100%)
 rename drivers/power/{ => supply}/max8998_charger.c (100%)
 rename drivers/power/{ => supply}/olpc_battery.c (100%)
 rename drivers/power/{ => supply}/pcf50633-charger.c (100%)
 rename drivers/power/{ => supply}/pda_power.c (100%)
 rename drivers/power/{ => supply}/pm2301_charger.c (100%)
 rename drivers/power/{ => supply}/pm2301_charger.h (100%)
 rename drivers/power/{ => supply}/pmu_battery.c (100%)
 rename drivers/power/{ => supply}/power_supply.h (100%)
 rename drivers/power/{ => supply}/power_supply_core.c (100%)
 rename drivers/power/{ => supply}/power_supply_leds.c (100%)
 rename drivers/power/{ => supply}/power_supply_sysfs.c (100%)
 rename drivers/power/{ => supply}/rx51_battery.c (100%)
 rename drivers/power/{ => supply}/s3c_adc_battery.c (100%)
 rename drivers/power/{ => supply}/sbs-battery.c (100%)
 rename drivers/power/{ => supply}/smb347-charger.c (100%)
 rename drivers/power/{ => supply}/test_power.c (100%)
 rename drivers/power/{ => supply}/tosa_battery.c (100%)
 rename drivers/power/{ => supply}/tps65090-charger.c (100%)
 rename drivers/power/{ => supply}/twl4030_charger.c (100%)
 rename drivers/power/{ => supply}/twl4030_madc_battery.c (100%)
 rename drivers/power/{ => supply}/wm831x_backup.c (100%)
 rename drivers/power/{ => supply}/wm831x_power.c (100%)
 rename drivers/power/{ => supply}/wm8350_power.c (100%)
 rename drivers/power/{ => supply}/wm97xx_battery.c (100%)
 rename drivers/power/{ => supply}/z2_battery.c (100%)
 create mode 100644 drivers/power/tegra-pmc.c

-- 
2.0.1
