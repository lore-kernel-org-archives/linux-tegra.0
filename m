From: Shardar Shariff Md <smohammed@nvidia.com>
Subject: [PATCH 2/2] i2c: tegra: add multimaster mode property to binding
Date: Mon, 14 Mar 2016 14:14:34 +0530
Message-ID: <1457945074-30020-2-git-send-email-smohammed@nvidia.com>
References: <1457945074-30020-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1457945074-30020-1-git-send-email-smohammed@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: ldewangan@nvidia.com, wsa@the-dreams.de, swarren@wwwdotorg.org, thierry.reding@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, smohammed@nvidia.com
List-Id: linux-tegra@vger.kernel.org

- Document the usage "nvidia,multimaster-mode" property
for enabling multimaster mode.
- Add compatible string for Tegra 210 SOC.

Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
---
 Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
index 87507e9..fa5eb35 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
@@ -2,6 +2,7 @@ NVIDIA Tegra20/Tegra30/Tegra114 I2C controller driver.
 
 Required properties:
 - compatible : should be:
+	"nvidia,tegra210-i2c"
 	"nvidia,tegra114-i2c"
 	"nvidia,tegra30-i2c"
 	"nvidia,tegra20-i2c"
@@ -56,6 +57,8 @@ Required properties:
 - dma-names: Must include the following entries:
   - rx
   - tx
+- nvidia,multimaster-mode: Must contain an entry for the bus operating
+  in multimaster mode.
 
 Example:
 
@@ -71,5 +74,6 @@ Example:
 		reset-names = "i2c";
 		dmas = <&apbdma 16>, <&apbdma 16>;
 		dma-names = "rx", "tx";
+		nvidia,multimaster-mode;
 		status = "disabled";
 	};
-- 
1.8.1.5
