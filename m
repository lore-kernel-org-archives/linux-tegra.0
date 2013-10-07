From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] Update dts file to support lm90 well
Date: Mon, 7 Oct 2013 17:28:27 +0800
Message-ID: <1381138109-22727-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add nct1008 dt entry on Tegra114 Dalmore.
Add vcc-supply for nct1008 on Tegra30 Cardhu.
Didn't add vcc-supply on Tegra20 Ventana, because on this platform,
the vcc for nct1008 is physically present and enabled.

Wei Ni (2):
  ARM: tegra: add DT entry for nct1008 to Dalmore
  ARM: tegra: add vcc supply for nct1008 to Cardhu

 arch/arm/boot/dts/tegra114-dalmore.dts |   10 +++++++++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi  |    3 ++-
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
1.7.9.5
