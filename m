From: Yue Haibing <yuehaibing@huawei.com>
Subject: [PATCH -next] memory: tegra: Make terga20_mc_reset_ops static
Date: Wed, 10 Apr 2019 22:04:50 +0800
Message-ID: <20190410140450.31604-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, jroedel@suse.de
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>

Fix sparse warning:

drivers/memory/tegra/tegra20.c:277:33: warning:
 symbol 'terga20_mc_reset_ops' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/memory/tegra/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 7119e53..b786aec 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -274,7 +274,7 @@ static int terga20_mc_unblock_dma(struct tegra_mc *mc,
 	return 0;
 }
 
-const struct tegra_mc_reset_ops terga20_mc_reset_ops = {
+static const struct tegra_mc_reset_ops terga20_mc_reset_ops = {
 	.hotreset_assert = terga20_mc_hotreset_assert,
 	.hotreset_deassert = terga20_mc_hotreset_deassert,
 	.block_dma = terga20_mc_block_dma,
-- 
2.7.4
