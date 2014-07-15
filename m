From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/6] clock support for Tegra132
Date: Tue, 15 Jul 2014 18:24:30 +0300
Message-ID: <1405437890-6468-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Tegra132 has almost the same clock structure as Tegra124, except for the CPU
related clocks.

Patch 1 is a small change to not stop initializing clocks when an error is
	encountered
Patch 2 makes tegra_clocks_apply_init_table an arch_initcall to make it work
	on ARM64
Patch 3 updates the Tegra124 binding doc with the details about the clock
	changes for Tegra132
Patch 4 adds a new binding for the CPU clocks on Tegra132
Patch 5 Implements the changes to the CAR clocks for Tegra132
Patch 6 Implements the new Tegar132 ccplex clocks

Peter De Schrijver (6):
  clk: tegra: don't abort clk init on error
  clk: tegra: make tegra_clocks_apply_init_table arch_initcall
  clk: tegra: Update binding doc Tegra132
  clk: tegra: add nvidia,tegra132-ccplex-clk binding
  clk: tegra: Add support for Tegra132 CAR clocks
  clk: tegra: Add Tegra132 ccplex clocks

 .../bindings/clock/nvidia,tegra124-car.txt         |    8 +++--
 .../bindings/clock/nvidia,tegra132-ccplex-clk.txt  |   27 ++++++++++++++++
 arch/arm/mach-tegra/tegra.c                        |    3 --
 drivers/clk/tegra/Makefile                         |    2 +
 drivers/clk/tegra/clk-tegra124.c                   |   32 ++++++++++++++++++++
 drivers/clk/tegra/clk.c                            |    9 ++++--
 include/dt-bindings/clock/tegra132-ccplex.h        |   12 +++++++
 include/linux/clk/tegra.h                          |    2 -
 8 files changed, 84 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra132-ccplex-clk.txt
 create mode 100644 include/dt-bindings/clock/tegra132-ccplex.h

-- 
1.7.7.rc0.72.g4b5ea.dirty
