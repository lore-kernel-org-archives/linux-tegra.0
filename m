From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 05/65] clk: tegra: dfll: Fix a potential Oop in remove()
Date: Thu, 14 Feb 2019 21:10:21 -0500
Message-ID: <20190215021121.177674-5-sashal@kernel.org>
References: <20190215021121.177674-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215021121.177674-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Stephen Boyd <sboyd@kernel.org>, Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit d39eca547f3ec67140a5d765a426eb157b978a59 ]

If tegra_dfll_unregister() fails then "soc" is an error pointer.  We
should just return instead of dereferencing it.

Fixes: 1752c9ee23fb ("clk: tegra: dfll: Fix drvdata overwriting issue")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index 269d3595758b..edc31bb56674 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -133,9 +133,11 @@ static int tegra124_dfll_fcpu_remove(struct platform_device *pdev)
 	struct tegra_dfll_soc_data *soc;
 
 	soc = tegra_dfll_unregister(pdev);
-	if (IS_ERR(soc))
+	if (IS_ERR(soc)) {
 		dev_err(&pdev->dev, "failed to unregister DFLL: %ld\n",
 			PTR_ERR(soc));
+		return PTR_ERR(soc);
+	}
 
 	tegra_cvb_remove_opp_table(soc->dev, soc->cvb, soc->max_freq);
 
-- 
2.19.1
