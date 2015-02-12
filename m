From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v6 12/15] clk: Expose clk_hw_reparent to providers
Date: Thu, 12 Feb 2015 15:06:28 +0100
Message-ID: <1423750042-6535-13-git-send-email-tomeu.vizoso@collabora.com>
References: <1423750042-6535-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423750042-6535-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Mikko Perttunen <mikko.perttunen@kapsi.fi>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

To be used by clock implementations for switching to a new parent during
rate change.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/clk/clk.c            | 8 ++++++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 4bb2250..db89258 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1968,6 +1968,14 @@ static void clk_core_reparent(struct clk_core *clk,
 	__clk_recalc_rates(clk, POST_RATE_CHANGE);
 }
 
+void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent)
+{
+	if (!hw)
+		return;
+
+	clk_core_reparent(hw->core, !new_parent ? NULL : new_parent->core);
+}
+
 /**
  * clk_has_parent - check if a clock is a possible parent for another
  * @clk: clock source
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 17dd6e9..b1db1cc 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -589,6 +589,7 @@ long __clk_mux_determine_rate_closest(struct clk_hw *hw, unsigned long rate,
 			      unsigned long max_rate,
 			      unsigned long *best_parent_rate,
 			      struct clk_hw **best_parent_p);
+void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
 
 /*
  * FIXME clock api without lock protection
-- 
1.9.3
