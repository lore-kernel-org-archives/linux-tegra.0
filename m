From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH] arm64: tegra: Add missing Smaug revision
Date: Wed, 29 Jun 2016 17:52:29 +0900
Message-ID: <20160629085229.31350-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Rhyland Klein <rklein@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Cc: Olof Johansson <olof@lixom.net>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The "google,smaug-rev2" string is missing from the compatible list of
Smaug's DT. The differences of rev2 are not relevant at our current
level of support and it boots just fine, so add it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 431266a48e9c..82a96bd27bc8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -11,7 +11,8 @@
 	compatible = "google,smaug-rev8", "google,smaug-rev7",
 		     "google,smaug-rev6", "google,smaug-rev5",
 		     "google,smaug-rev4", "google,smaug-rev3",
-		     "google,smaug-rev1", "google,smaug", "nvidia,tegra210";
+		     "google,smaug-rev2", "google,smaug-rev1",
+		     "google,smaug", "nvidia,tegra210";
 
 	aliases {
 		serial0 = &uarta;
-- 
2.9.0
