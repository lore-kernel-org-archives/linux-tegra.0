From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 1/3] of: Add descriptions of thermtrip properties to Tegra PMC
 bindings
Date: Tue, 5 Aug 2014 11:12:58 +0300
Message-ID: <1407226380-747-2-git-send-email-mperttunen@nvidia.com>
References: <1407226380-747-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1407226380-747-1-git-send-email-mperttunen@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hardware-triggered thermal reset requires configuring the I2C
reset procedure. This configuration is read from the device tree,
so document the relevant properties in the binding documentation.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 .../devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
index 68ac65f..140e2aa 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
@@ -38,6 +38,19 @@ Required properties when nvidia,suspend-mode is specified:
 			      Core power good time in uS.
 - nvidia,core-pwr-off-time : Core power off time in uS.
 
+Required properties for hardware-triggered thermal reset:
+    (only tegra30, tegra114, tegra124)
+- nvidia,thermtrip-pmu-i2c-addr : I2C address of the power management unit.
+- nvidia,thermtrip-i2c-controller : Index of the I2C controller the PMU is
+                                    attached to.
+- nvidia,thermtrip-reg-addr : Address (byte) to send reset command to.
+- nvidia,thermtrip-reg-data : Data (byte) to use as reset command.
+
+Optional properties for hardware-triggered thermal reset:
+    (only tegra30, tegra114, tegra124)
+- nvidia,thermtrip-pinmux : Pinmux ID used for I2C access.
+- nvidia,thermtrip-pmu-16bit-ops : Use 16-bit operations.
+
 Required properties when nvidia,suspend-mode=<0>:
 - nvidia,lp0-vec : <start length> Starting address and length of LP0 vector
   The LP0 vector contains the warm boot code that is executed by AVP when
-- 
1.8.1.5
