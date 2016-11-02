From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] soc/tegra: pmc: Add support for IO pad configuration and sub-driver
Date: Wed, 2 Nov 2016 14:29:46 +0530
Message-ID: <1478077189-24426-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra SoC support the configutaion of IO pads to multi-level voltage
and low power state. The conifguration is done via pictrl framework
and the io pad driver in pinctrl frameowrk uses the APIs from pmc to
access PMC registers.

This series add the API to get the IO pad power status and register
the pmc child devices like IO pad drvier.

The patches were send earlier part of different series but applied
partially in the Thierry's t186 branch
	https://github.com/thierryreding/linux/tree/tegra186.

Resending the patches as the new start to avoid any confusion.
This need to be applied in
	https://github.com/thierryreding/linux/tree/tegra186

Laxman Dewangan (3):
  soc/tegra: pmc: Remove legacy Tegra I/O rail API
  soc/tegra: pmc: Add interface to get IO pad power status
  soc/tegra: pmc: Register PMC child devices as platform device

 drivers/soc/tegra/pmc.c | 81 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/soc/tegra/pmc.h | 14 +++------
 2 files changed, 86 insertions(+), 9 deletions(-)

-- 
2.1.4
