From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V5 0/3] soc/tegra: Add support for IO pads power and voltage control
Date: Thu, 12 May 2016 17:51:43 +0530
Message-ID: <1463055706-17744-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The IO pins of Tegra SoCs are grouped for common control of IO interface
like setting voltage signal levels and power state of the interface. The 
group is generally referred as IO pads. The power state and voltage control
of IO pins can be done at IO pads level.

Tegra124 onwards IO pads support the power down state when system is
active. The voltage levels on IO pads are auto detected on Tegra124/
Tegra132 but it is not in Tegra210. For Tegra210, the SW need to
explicitly configure the voltage levels of IO pads

This series add the interface for the IO pad power state and voltage
configurations. Modifies the client to use new APIs.
Register the child devices to provide the client interface to configure
IO pads power state and voltage from Device tree.

---
Changes from V2: 
- Drop the pinctrl driver from series till pmc interfce is finalise.
- Move client to use the new APIs.
- Remove older APIs to configure IO rail and related macros.

Changes from V3: 
- keep value  to be unsigned long in the dpd_prepare.
- Make all pad_id/io_pad_id to id.
- tegra_io_pad_ -> tegra_io_pads
- dpd_bit -> bit, pwr_mask/bit to mask/bit.
- Rename function to tegra_io_pads_{set,get}_voltage_config
- Make the io pad tables common for all SoC.
- Make io_pads enums.
- Add enums for voltage.
- Drop patch of adding sub devs

Changes from V4:
- Change IO_PAD to IO_PADS.
- Change enum for voltage config 

Laxman Dewangan (3):
  soc/tegra: pmc: Use BIT macro for register field definition
  soc/tegra: pmc: Correct type of variable for tegra_pmc_readl()
  soc/tegra: pmc: Add support for IO pads power state and voltage

 drivers/gpu/drm/tegra/sor.c |   8 +-
 drivers/soc/tegra/pmc.c     | 273 +++++++++++++++++++++++++++++++++++---------
 include/soc/tegra/pmc.h     | 132 +++++++++++++++------
 3 files changed, 321 insertions(+), 92 deletions(-)

-- 
2.1.4
