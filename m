From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/3] drm/tegra: Use nvidia,hpd-gpios property
Date: Thu, 17 Apr 2014 14:03:00 +0200
Message-ID: <1397736181-1593-3-git-send-email-thierry.reding@gmail.com>
References: <1397736181-1593-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1397736181-1593-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Make use of the new nvidia,hpd-gpios property and remove support for the
deprecated nvidia,hpd-gpio property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt | 8 ++++----
 drivers/gpu/drm/tegra/output.c                                  | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
index efa8b8451f93..81cdc7f4f5b1 100644
--- a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
@@ -126,7 +126,7 @@ of the following host1x client modules:
   the RGB output associated with the controller. It can take the following
   optional properties:
   - nvidia,ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
-  - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
+  - nvidia,hpd-gpios: specifies a GPIO used for hotplug detection
   - nvidia,edid: supplies a binary EDID blob
   - nvidia,panel: phandle of a display panel
 
@@ -151,7 +151,7 @@ of the following host1x client modules:
 
   Optional properties:
   - nvidia,ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
-  - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
+  - nvidia,hpd-gpios: specifies a GPIO used for hotplug detection
   - nvidia,edid: supplies a binary EDID blob
   - nvidia,panel: phandle of a display panel
 
@@ -186,7 +186,7 @@ of the following host1x client modules:
 
   Optional properties:
   - nvidia,ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
-  - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
+  - nvidia,hpd-gpios: specifies a GPIO used for hotplug detection
   - nvidia,edid: supplies a binary EDID blob
   - nvidia,panel: phandle of a display panel
 
@@ -210,7 +210,7 @@ of the following host1x client modules:
 
   Optional properties:
   - nvidia,ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
-  - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
+  - nvidia,hpd-gpios: specifies a GPIO used for hotplug detection
   - nvidia,edid: supplies a binary EDID blob
   - nvidia,panel: phandle of a display panel
 
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index a3e4f1eca6f7..e8f50d57c95d 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -223,7 +223,7 @@ int tegra_output_probe(struct tegra_output *output)
 	}
 
 	output->hpd_gpio = of_get_named_gpio_flags(output->of_node,
-						   "nvidia,hpd-gpio", 0,
+						   "nvidia,hpd-gpios", 0,
 						   &flags);
 	if (gpio_is_valid(output->hpd_gpio)) {
 		unsigned long flags;
-- 
1.9.2
