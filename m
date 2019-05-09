From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [Patch-V2 4/4] soc/tegra: select pinctrl for Tegra194
Date: Thu, 9 May 2019 13:38:16 +0530
Message-ID: <1557389296-10257-4-git-send-email-kyarlagadda@nvidia.com>
References: <1557389296-10257-1-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557389296-10257-1-git-send-email-kyarlagadda@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Cc: pdeschrijver@nvidia.com, josephl@nvidia.com, smangipudi@nvidia.com, ldewangan@nvidia.com, vidyas@nvidia.com, Krishna Yarlagadda <kyarlagadda@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Select PINCTRL_TEGRA194 by default for Tegra194 SOC needed
for dynamically controlling PCIe pins

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 drivers/soc/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index a0b0344..6f0df55 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -108,6 +108,7 @@ config ARCH_TEGRA_186_SOC
 config ARCH_TEGRA_194_SOC
 	bool "NVIDIA Tegra194 SoC"
 	select MAILBOX
+	select PINCTRL_TEGRA194
 	select TEGRA_BPMP
 	select TEGRA_HSP_MBOX
 	select TEGRA_IVC
-- 
2.7.4
