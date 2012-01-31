From: Leon Romanovsky <leon@leon.nu>
Subject: [PATCH 2/5] ASoC: ALC5632: Add device tree binding
	documentation
Date: Tue, 31 Jan 2012 09:29:45 +0200
Message-ID: <1327994985-27101-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: broonie@opensource.wolfsonmicro.com, lrg@ti.com, swarren@nvidia.com, alsa-devel@alsa-project.org, olof@lixom.net, linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, rdunlap@xenotime.net, devicetree-discuss@lists.ozlabs.org
Cc: Leon Romanovsky <leon@leon.nu>
List-Id: linux-tegra@vger.kernel.org

Document the device tree binding for the ALC5632 codec and update vendor
specific prefix for the Realtek.

Signed-off-by: Leon Romanovsky <leon@leon.nu>
---
 .../devicetree/bindings/sound/alc5632.txt          |   24 ++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 2 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/alc5632.txt

diff --git a/Documentation/devicetree/bindings/sound/alc5632.txt b/Documentation/devicetree/bindings/sound/alc5632.txt
new file mode 100644
index 0000000..8608f74
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/alc5632.txt
@@ -0,0 +1,24 @@
+ALC5632 audio CODEC
+
+This device supports I2C only.
+
+Required properties:
+
+  - compatible : "realtek,alc5632"
+
+  - reg : the I2C address of the device.
+
+  - gpio-controller : Indicates this device is a GPIO controller.
+
+  - #gpio-cells : Should be two. The first cell is the pin number and the
+    second cell is used to specify optional parameters (currently unused).
+
+Example:
+
+alc5632: alc5632@1e {
+	compatible = "realtek,alc5632";
+	reg = <0x1a>;
+
+	gpio-controller;
+	#gpio-cells = <2>;
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index ecc6a6c..ca8ee14 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -33,6 +33,7 @@ nxp	NXP Semiconductors
 powervr	Imagination Technologies
 qcom	Qualcomm, Inc.
 ramtron	Ramtron International
+realtek Realtek Semiconductor Corp.
 samsung	Samsung Semiconductor
 sbs	Smart Battery System
 schindler	Schindler
-- 
1.7.3.4
