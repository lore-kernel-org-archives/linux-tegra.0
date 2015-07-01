From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 4/4] ARM: tegra: Enable Nouveau in defconfig
Date: Wed, 1 Jul 2015 18:13:48 +0900
Message-ID: <1435742028-8237-5-git-send-email-acourbot@nvidia.com>
References: <1435742028-8237-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435742028-8237-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Since Nouveau support is complete, enable it in the Tegra configuration
so supported boards can take advantage of it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 arch/arm/configs/tegra_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index d199eb249151..a5ef73116fdd 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -292,3 +292,6 @@ CONFIG_EARLY_PRINTK=y
 CONFIG_CRYPTO_TWOFISH=y
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
 CONFIG_CRC_CCITT=y
+CONFIG_DRM_NOUVEAU=m
+CONFIG_NOUVEAU_DEBUG=5
+CONFIG_NOUVEAU_DEBUG_DEFAULT=3
-- 
2.4.4
