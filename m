From: Yue Haibing <yuehaibing@huawei.com>
Subject: [PATCH -next] clk: tegra: Make tegra_clk_super_mux_ops static
Date: Tue, 19 Mar 2019 23:35:04 +0800
Message-ID: <20190319153504.23072-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>

Fix sparse warning:

drivers/clk/tegra/clk-super.c:124:22:
 warning: symbol 'tegra_clk_super_mux_ops' was not declared. Should it be static?

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/clk/tegra/clk-super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index 84267cf..b5ff76c 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -121,7 +121,7 @@ static int clk_super_set_parent(struct clk_hw *hw, u8 index)
 	return err;
 }
 
-const struct clk_ops tegra_clk_super_mux_ops = {
+static const struct clk_ops tegra_clk_super_mux_ops = {
 	.get_parent = clk_super_get_parent,
 	.set_parent = clk_super_set_parent,
 };
-- 
2.7.4
