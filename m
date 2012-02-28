From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v7 09/20] tegra: fdt: Add additional USB binding
Date: Tue, 28 Feb 2012 10:07:47 -0800
Message-ID: <1330452478-5039-10-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This adds a property to indicate a port which can switch between host and device
mode.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
Changes in v5:
- Add dr_mode property to control host/device/otg mode
- Add nvidia,has-legacy-mode property per review comments

Changes in v7:
- Fix space indent nit

 doc/device-tree-bindings/usb/tegra-usb.txt |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/doc/device-tree-bindings/usb/tegra-usb.txt b/doc/device-tree-bindings/usb/tegra-usb.txt
index 035d63d..5282d44 100644
--- a/doc/device-tree-bindings/usb/tegra-usb.txt
+++ b/doc/device-tree-bindings/usb/tegra-usb.txt
@@ -11,3 +11,15 @@ Required properties :
  - phy_type : Should be one of "ulpi" or "utmi".
  - nvidia,vbus-gpio : If present, specifies a gpio that needs to be
    activated for the bus to be powered.
+
+Optional properties:
+  - dr_mode : dual role mode. Indicates the working mode for
+    nvidia,tegra20-ehci compatible controllers.  Can be "host", "peripheral",
+    or "otg".  Default to "host" if not defined for backward compatibility.
+      host means this is a host controller
+      peripheral means it is device controller
+      otg means it can operate as either ("on the go")
+  - nvidia,has-legacy-mode : boolean indicates whether this controller can
+    operate in legacy mode (as APX 2500 / 2600). In legacy mode some
+    registers are accessed through the APB_MISC base address instead of
+    the USB controller.
-- 
1.7.7.3
