From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 1/2] ARM: tegra: config: enable TPS65910 drivers
Date: Wed, 23 May 2012 11:42:53 +0530
Message-ID: <1337753574-32699-1-git-send-email-ldewangan@nvidia.com>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: swarren@nvidia.com, olof@lixom.net
Cc: linux@arm.linux.org.uk, broonie@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Enable TPS65910 mfd, gpio and regulator drivers.
This is the PMIC module for Tegra30 based cardhu
platform.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
No change from V1.

 arch/arm/configs/tegra_defconfig |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 1198dd6..26ad2b4 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -106,16 +106,19 @@ CONFIG_I2C=y
 CONFIG_I2C_TEGRA=y
 CONFIG_SPI=y
 CONFIG_SPI_TEGRA=y
+CONFIG_GPIO_TPS65910=y
 CONFIG_POWER_SUPPLY=y
 CONFIG_BATTERY_SBS=y
 CONFIG_SENSORS_LM90=y
 CONFIG_MFD_TPS6586X=y
+CONFIG_MFD_TPS65910=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_TPS62360=y
 CONFIG_REGULATOR_TPS6586X=y
+CONFIG_REGULATOR_TPS65910=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 # CONFIG_SND_SUPPORT_OLD_API is not set
-- 
1.7.1.1
