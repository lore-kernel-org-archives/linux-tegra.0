From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] Correct SMMU register map
Date: Thu, 7 Nov 2013 11:58:24 +0800
Message-ID: <1383796706-10729-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Current SMMU register map for Tegra30 and Tegra114 doesn't
match the TRM. So set to the correct values.

Mark Zhang (2):
  ARM: tegra: Correct Tegra30 SMMU register map
  ARM: tegra: Correct Tegra114 SMMU register map

 arch/arm/boot/dts/tegra114.dtsi | 9 ++++++---
 arch/arm/boot/dts/tegra30.dtsi  | 9 ++++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

-- 
1.8.1.5
