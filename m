From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V5 3/7] soc/tegra: default select TEGRA_TIMER for Tegra210
Date: Fri, 1 Feb 2019 11:36:17 +0800
Message-ID: <20190201033621.16814-4-josephl@nvidia.com>
References: <20190201033621.16814-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190201033621.16814-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>
Cc: linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The tegra timer is necessary for Tegra210 to support CPU idle power-down
state. So select it by default.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
v5:
 * add ack tag from Thierry
v4:
 * new added in this version
---
 drivers/soc/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index fe4481676da6..a0b03443d8c1 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -76,6 +76,7 @@ config ARCH_TEGRA_210_SOC
 	select PINCTRL_TEGRA210
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
+	select TEGRA_TIMER
 	help
 	  Enable support for the NVIDIA Tegra210 SoC. Also known as Tegra X1,
 	  the Tegra210 has four Cortex-A57 cores paired with four Cortex-A53
-- 
2.20.1
