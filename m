From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v6 11/14] ARM: tegra: Fix Beaver's PCIe lane configuration
Date: Fri,  9 Aug 2013 16:49:29 +0200
Message-ID: <1376059772-16669-12-git-send-email-treding@nvidia.com>
References: <1376059772-16669-1-git-send-email-treding@nvidia.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1376059772-16669-1-git-send-email-treding@nvidia.com>
Sender: linux-pci-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

Beaver's PCIe lane configuration most closely matches x2 x2 x2 rather
than x4 x1 x1, since clocks 0 and 2 are used, and lanes 0 and 5 are used,
and the only way those align is with a x2 x2 x2 configuration.

Also, disable root port 1; there's nothing connected to it. Root port 0
is the on-board PCIe Ethernet, and port 2 is the mini-PCIe slot.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra30-beaver.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index 4d9fa31..e1dd644 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -18,16 +18,16 @@
 
 		pci@1,0 {
 			status = "okay";
-			nvidia,num-lanes = <4>;
+			nvidia,num-lanes = <2>;
 		};
 
 		pci@2,0 {
-			status = "okay";
-			nvidia,num-lanes = <1>;
+			nvidia,num-lanes = <2>;
 		};
 
 		pci@3,0 {
-			nvidia,num-lanes = <1>;
+			status = "okay";
+			nvidia,num-lanes = <2>;
 		};
 	};
 
-- 
1.8.3.4
