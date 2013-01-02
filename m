From: Bryan Wu <pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] ARM: DT: tegra: Add board leaver compatible properties
Date: Wed, 2 Jan 2013 14:50:24 -0800
Message-ID: <1357167025-6167-1-git-send-email-pengw@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Bryan Wu <pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/tegra.txt |   51 ++++++++++++++++++++---
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra.txt b/Documentation/devicetree/bindings/arm/tegra.txt
index 6e69d2e..ff9199a 100644
--- a/Documentation/devicetree/bindings/arm/tegra.txt
+++ b/Documentation/devicetree/bindings/arm/tegra.txt
@@ -1,14 +1,53 @@
 NVIDIA Tegra device tree bindings
 -------------------------------------------
 
-Boards with the tegra20 SoC shall have the following properties:
+- Boards with the tegra20 SoC shall have the following properties:
+  Required root node property:
+  compatible = "nvidia,tegra20";
 
-Required root node property:
+- Boards with the tegra30 SoC shall have the following properties:
+  Required root node property:
+  compatible = "nvidia,tegra30";
 
-compatible = "nvidia,tegra20";
+Boards
+-------------------------------------------
+
+- NVIDIA Tegra20 Harmony evaluation board:
+  compatible = "nvidia,harmony", "nvidia,tegra20";
+
+- Avionic Design Medcom-Wide board:
+  compatible = "ad,medcom-wide", "ad,tamonten", "nvidia,tegra20";
+
+- Toshiba AC100 / Dynabook AZ;
+  compatible = "compal,paz00", "nvidia,tegra20";
+
+- Avionic Design Plutux board:
+  compatible = "ad,plutux", "ad,tamonten", "nvidia,tegra20";
+
+- NVIDIA Seaboard:
+  compatible = "nvidia,seaboard", "nvidia,tegra20";
+
+- Avionic Design Tamonten SOM:
+  compatible = "ad,tamonten", "nvidia,tegra20";
+
+- Avionic Design Tamonten Evaluation Carrier:
+  compatible = "ad,tec", "ad,tamonten", "nvidia,tegra20";
+
+- Compulab TrimSlice board:
+  compatible = "compulab,trimslice", "nvidia,tegra20";
+
+- NVIDIA Tegra20 Ventana evaluation board:
+  compatible = "nvidia,ventana", "nvidia,tegra20";
+
+- NVIDIA Tegra20 Whistler evaluation board:
+  compatible = "nvidia,whistler", "nvidia,tegra20";
+
+- NVIDIA Tegra30 Cardhu evaluation board:
+  compatible = "nvidia,cardhu", "nvidia,tegra30";
 
-Boards with the tegra30 SoC shall have the following properties:
+- NVIDIA Tegra30 Cardhu A02 evaluation board:
+  compatible = "nvidia,cardhu-a02", "nvidia,cardhu", "nvidia,tegra30";
 
-Required root node property:
+- NVIDIA Tegra30 Cardhu A04 (A05, A06, A07) evaluation board:
+  compatible = "nvidia,cardhu-a04", "nvidia,cardhu", "nvidia,tegra30";
 
-compatible = "nvidia,tegra30";
-- 
1.7.10.4
