From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 1/5] dt-bindings: tegra186-gpio: Add information for Tegra194
Date: Wed, 20 Jun 2018 15:54:02 +0300
Message-ID: <20180620125406.11906-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: vbhadram@nvidia.com, devicetree@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

The Tegra194 GPIO controller is similar to the one in Tegra186.
Add relevant information to the device tree binding documentation.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
index c82a2e221bc1..adff16c71d21 100644
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
@@ -68,6 +68,8 @@ Required properties:
     One of:
     - "nvidia,tegra186-gpio".
     - "nvidia,tegra186-gpio-aon".
+    - "nvidia,tegra194-gpio".
+    - "nvidia,tegra194-gpio-aon".
 - reg-names
     Array of strings.
     Contains a list of names for the register spaces described by the reg
@@ -91,6 +93,8 @@ Required properties:
     depending on compatible value:
     - "nvidia,tegra186-gpio": 6 entries.
     - "nvidia,tegra186-gpio-aon": 1 entry.
+    - "nvidia,tegra194-gpio": 6 entries.
+    - "nvidia,tegra194-gpio-aon": 1 entry.
 - gpio-controller
     Boolean.
     Marks the device node as a GPIO controller/provider.
-- 
2.16.1
