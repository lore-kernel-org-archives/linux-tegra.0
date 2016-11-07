From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V4 0/6] Add support for Tegra GMI bus controller
Date: Mon,  7 Nov 2016 09:29:59 +0100
Message-ID: <1478507405-13204-1-git-send-email-mirza.krak@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mirza Krak <mirza.krak-3xdUHytR7SMQwY+2splSUA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mirza Krak <mirza.krak-3xdUHytR7SMQwY+2splSUA@public.gmane.org>

Hi.

This patch series adds support for the Tegra GMI bus controller.

I have tested this series on a Tegra30 using a Colibri T30 SOM on a custom
carrier board which has multiple CAN controllers (SJA1000) connected to the
GMI bus.

I have re-based on top of latest tegra/for-next in V4. Also see individual
patches for changes in V4.

Hopefully this will be the last round.

See below links for previous discussions.

Comments on RFC:
https://marc.info/?l=linux-clk&m=146893557629903&w=2
https://marc.info/?l=linux-tegra&m=146893541829801&w=2
https://marc.info/?l=linux-tegra&m=146893542429814&w=2

Comments on V1:
https://marc.info/?l=linux-arm-kernel&m=147051551821122&w=2
https://marc.info/?l=linux-arm-kernel&m=147051553121150&w=2
https://marc.info/?l=linux-arm-kernel&m=147194856600627&w=2
https://marc.info/?l=linux-arm-kernel&m=147072742432211&w=2

Comments on V2:
https://marc.info/?l=devicetree&m=147522253920226&w=2
https://marc.info/?l=linux-tegra&m=147204588027687&w=2
https://marc.info/?l=linux-tegra&m=147204588027687&w=2
https://marc.info/?l=devicetree&m=147256931318922&w=2

Comments on V3:
https://marc.info/?l=linux-tegra&m=147789181607782&w=2
https://marc.info/?l=linux-tegra&m=147816818203104&w=2
https://marc.info/?l=linux-tegra&m=147816897003332&w=2
https://marc.info/?l=linux-tegra&m=147818119107204&w=2

Mirza Krak (6):
  clk: tegra: add TEGRA20_CLK_NOR to init table
  clk: tegra: add TEGRA30_CLK_NOR to init table
  dt/bindings: Add bindings for Tegra GMI controller
  ARM: tegra: Add Tegra30 GMI support
  ARM: tegra: Add Tegra20 GMI support
  bus: Add support for Tegra Generic Memory Interface

 .../devicetree/bindings/bus/nvidia,tegra20-gmi.txt | 132 ++++++++++
 arch/arm/boot/dts/tegra20.dtsi                     |  13 +
 arch/arm/boot/dts/tegra30.dtsi                     |  13 +
 drivers/bus/Kconfig                                |   7 +
 drivers/bus/Makefile                               |   1 +
 drivers/bus/tegra-gmi.c                            | 275 +++++++++++++++++++++
 drivers/clk/tegra/clk-tegra20.c                    |   1 +
 drivers/clk/tegra/clk-tegra30.c                    |   1 +
 8 files changed, 443 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra20-gmi.txt
 create mode 100644 drivers/bus/tegra-gmi.c

--
2.1.4
