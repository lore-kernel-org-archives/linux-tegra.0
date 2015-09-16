From: Vince Hsu <vinceh@nvidia.com>
Subject: [PATCH] clk: tegra: dfll: add missing rcu_read_unlock() for error path
Date: Wed, 16 Sep 2015 14:14:54 +0800
Message-ID: <1442384094-22144-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@codeaurora.org, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, vinceh@nvidia.com, Vince Hsu <vince.h@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Vince Hsu <vince.h@nvidia.com>

The commit e770940218028c6a5927fda45f2ca9db5d9b35e0 ("clk: tegra: dfll:
Properly protect OPP list") added the rcu_read_{lock,unlock} but missed
one in the error path. So add the missing one.

Signed-off-by: Vince Hsu <vince.h@nvidia.com>
---
Hi,

I noticed the missed unlock because we had a similar fix as the commit
e77094021 in ChromeOS[1]. 

[1] https://chromium-review.googlesource.com/#/c/223661/


 drivers/clk/tegra/clk-dfll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 4adff56dd0ef..c4e3a52e225b 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -685,8 +685,10 @@ static int find_lut_index_for_rate(struct tegra_dfll *td, unsigned long rate)
 	rcu_read_lock();
 
 	opp = dev_pm_opp_find_freq_ceil(td->soc->dev, &rate);
-	if (IS_ERR(opp))
+	if (IS_ERR(opp)) {
+		rcu_read_unlock();
 		return PTR_ERR(opp);
+	}
 	uv = dev_pm_opp_get_voltage(opp);
 
 	rcu_read_unlock();
-- 
2.1.4

