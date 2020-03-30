From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 2/5] clk: Introduce clk_round_rate_unboundly()
Date: Tue, 31 Mar 2020 02:16:14 +0300
Message-ID: <20200330231617.17079-3-digetx@gmail.com>
References: <20200330231617.17079-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200330231617.17079-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

In same cases it may be desired to round clock's rate without taking into
account current min/max requests made by the clock's users. One example is
building up OPP table based on a possible clock rates.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clk/clk.c   | 49 +++++++++++++++++++++++++++++++++++----------
 include/linux/clk.h | 18 +++++++++++++++++
 2 files changed, 56 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 39c59f063aa0..28c2e1699619 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1412,16 +1412,7 @@ unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(clk_hw_round_rate);
 
-/**
- * clk_round_rate - round the given rate for a clk
- * @clk: the clk for which we are rounding a rate
- * @rate: the rate which is to be rounded
- *
- * Takes in a rate as input and rounds it to a rate that the clk can actually
- * use which is then returned.  If clk doesn't support round_rate operation
- * then the parent rate is returned.
- */
-long clk_round_rate(struct clk *clk, unsigned long rate)
+static long __clk_round_rate(struct clk *clk, unsigned long rate, bool bound)
 {
 	struct clk_rate_request req;
 	int ret;
@@ -1434,7 +1425,13 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 	if (clk->exclusive_count)
 		clk_core_rate_unprotect(clk->core);
 
-	clk_core_get_boundaries(clk->core, &req.min_rate, &req.max_rate);
+	if (bound) {
+		clk_core_get_boundaries(clk->core, &req.min_rate,
+					&req.max_rate);
+	} else {
+		req.min_rate = 0;
+		req.max_rate = ULONG_MAX;
+	}
 	req.rate = rate;
 
 	ret = clk_core_round_rate_nolock(clk->core, &req);
@@ -1449,8 +1446,38 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 
 	return req.rate;
 }
+
+/**
+ * clk_round_rate - round the given rate for a clk
+ * @clk: the clk for which we are rounding a rate
+ * @rate: the rate which is to be rounded
+ *
+ * Takes in a rate as input and rounds it to a rate that the clk can actually
+ * use which is then returned.  If clk doesn't support round_rate operation
+ * then the parent rate is returned.
+ */
+long clk_round_rate(struct clk *clk, unsigned long rate)
+{
+	return __clk_round_rate(clk, rate, true);
+}
 EXPORT_SYMBOL_GPL(clk_round_rate);
 
+/**
+ * clk_round_rate_unboundly - unboundly round the given rate for a clk
+ * @clk: the clk for which we are rounding a rate
+ * @rate: the rate which is to be rounded
+ *
+ * Takes in a rate as input and rounds it to a rate that the clk can use
+ * which is then returned.  The given rate isn't bounded by clk users min-max
+ * rates, unlike in a case of clk_round_rate().  If clk doesn't support
+ * round_rate operation then the parent rate is returned.
+ */
+long clk_round_rate_unboundly(struct clk *clk, unsigned long rate)
+{
+	return __clk_round_rate(clk, rate, false);
+}
+EXPORT_SYMBOL_GPL(clk_round_rate_unboundly);
+
 /**
  * __clk_notify - call clk notifier chain
  * @core: clk that is changing rate
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 7fd6a1febcf4..b534643015f5 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -622,6 +622,19 @@ void devm_clk_put(struct device *dev, struct clk *clk);
  */
 long clk_round_rate(struct clk *clk, unsigned long rate);
 
+/**
+ * clk_round_rate_unboundly - adjust a rate to the rate a clock can provide
+ * @clk: clock source
+ * @rate: desired clock rate in Hz
+ *
+ * This helper function rounds the given rate to a value that hardware
+ * could actually accept, without taking into account current min/max
+ * requests. Useful for cases like OPP table buildup.
+ *
+ * Returns rounded clock rate in Hz, or negative errno.
+ */
+long clk_round_rate_unboundly(struct clk *clk, unsigned long rate);
+
 /**
  * clk_set_rate - set the clock rate for a clock source
  * @clk: clock source
@@ -857,6 +870,11 @@ static inline long clk_round_rate(struct clk *clk, unsigned long rate)
 	return 0;
 }
 
+static inline long clk_round_rate_unboundly(struct clk *clk, unsigned long rate)
+{
+	return 0;
+}
+
 static inline bool clk_has_parent(struct clk *clk, struct clk *parent)
 {
 	return true;
-- 
2.25.1
