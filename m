From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 02/19] dt-bindings: clock: tegra124-dfll: add Tegra210 support
Date: Tue, 4 Dec 2018 17:25:31 +0800
Message-ID: <20181204092548.3038-3-josephl@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204092548.3038-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add Tegra210 support for DFLL clock.

Cc: devicetree@vger.kernel.org
Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 .../devicetree/bindings/clock/nvidia,tegra124-dfll.txt        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
index 8c97600d2bad..4bd44dd7ec1e 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
@@ -10,7 +10,9 @@ control module that will automatically adjust the VDD_CPU voltage by
 communicating with an off-chip PMIC either via an I2C bus or via PWM signals.
 
 Required properties:
-- compatible : should be "nvidia,tegra124-dfll"
+- compatible : should be one of:
+  - "nvidia,tegra124-dfll": for Tegra124
+  - "nvidia,tegra210-dfll": for Tegra210
 - reg : Defines the following set of registers, in the order listed:
         - registers for the DFLL control logic.
         - registers for the I2C output logic.
-- 
2.19.2
