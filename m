From: Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: tegra: Add PCIe entry for cardhu
Date: Mon, 8 Apr 2013 21:11:28 +0530
Message-ID: <1365435688-4179-3-git-send-email-jagarwal@nvidia.com>
References: <1365435688-4179-1-git-send-email-jagarwal@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365435688-4179-1-git-send-email-jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jtukkinen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

- Add PCIe node entry for cardhu
- Enable only root port 2
- Initialize regulators required for tegra30
- Based on git://gitorious.org/thierryreding/linux.git

 arch/arm/boot/dts/tegra30-cardhu.dtsi |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index d2fdf95..b64113e 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -137,6 +137,17 @@
 		};
 	};
 
+	pcie-controller {
+		status = "okay";
+		pex-clk-supply = <&pex_hvdd_3v3_reg>;
+		vdd-supply = <&ldo1_reg>;
+		avdd-supply = <&ldo2_reg>;
+
+		pci@3,0 {
+			status = "okay";
+		};
+	};
+
 	serial@70006000 {
 		status = "okay";
 	};
-- 
1.7.0.4
