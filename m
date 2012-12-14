From: Venu Byravarasu <vbyravarasu@nvidia.com>
Subject: [PATCH 1/2] arm: tegra: Add new DT property to USB node.
Date: Fri, 14 Dec 2012 12:29:07 +0530
Message-ID: <1355468348-8821-2-git-send-email-vbyravarasu@nvidia.com>
References: <1355468348-8821-1-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1355468348-8821-1-git-send-email-vbyravarasu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, swarren@wwwdotorg.org, linux@arm.linux.org.uk, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, sjg@chromium.org, olof@lixom.net
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, Venu Byravarasu <vbyravarasu@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

As Tegra USB host driver is using instance number for resetting
PORT0 twice, adding a new DT property for handling this.

Signed-off-by: Venu Byravarasu <vbyravarasu@nvidia.com>
---
 .../bindings/usb/nvidia,tegra20-ehci.txt           |    2 ++
 arch/arm/boot/dts/tegra20.dtsi                     |    1 +
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
index e9b005d..443a2b4 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
@@ -27,3 +27,5 @@ Optional properties:
     registers are accessed through the APB_MISC base address instead of
     the USB controller. Since this is a legacy issue it probably does not
     warrant a compatible string of its own.
+  - nvidia,needs-double-reset : boolean is to be set for some of the Tegra2
+    USB ports, which need reset twice due to hardware issues.
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index b8effa1..3ebbd0c 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -364,6 +364,7 @@
 		phy_type = "utmi";
 		nvidia,has-legacy-mode;
 		status = "disabled";
+		nvidia,needs-double-reset;
 	};
 
 	usb@c5004000 {
-- 
1.7.0.4
