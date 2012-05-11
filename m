From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V3 3/4] ARM: tegra: config: enable REGULATOR_TPS62360
Date: Fri, 11 May 2012 12:08:44 +0530
Message-ID: <1336718325-8372-4-git-send-email-ldewangan@nvidia.com>
References: <1336718325-8372-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1336718325-8372-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@secretlab.ca, rob.herring@calxeda.com, linux@arm.linux.org.uk, lrg@ti.com, broonie@opensource.wolfsonmicro.com, swarren@nvidia.com, olof@lixom.net
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Enable regulator REGULATOR_TPS62360 for the core power
of cardhu.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
No changes from V1 and V2.

 arch/arm/configs/tegra_defconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 7a90abb..415ada1 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -114,6 +114,7 @@ CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
 CONFIG_REGULATOR_GPIO=y
+CONFIG_REGULATOR_TPS62360=y
 CONFIG_REGULATOR_TPS6586X=y
 CONFIG_SOUND=y
 CONFIG_SND=y
-- 
1.7.1.1
