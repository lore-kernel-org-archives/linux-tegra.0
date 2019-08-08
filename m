From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v8 07/21] clk: Add API to get index of the clock parent
Date: Thu, 8 Aug 2019 16:46:46 -0700
Message-ID: <1565308020-31952-8-git-send-email-skomatineni@nvidia.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch adds an API clk_hw_get_parent_index to get index of the
clock parent to use during the clock restore operations on system
resume.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/clk.c            | 17 +++++++++++++++++
 include/linux/clk-provider.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c0990703ce54..f26252e48f73 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1643,6 +1643,23 @@ static int clk_fetch_parent_index(struct clk_core *core,
 	return i;
 }
 
+/**
+ * clk_hw_get_parent_index - return the index of parent clock
+ * @hw: clk_hw associated with the clk being consumed
+ * @parent_hw: clk_hw associated with the parent of clk
+ *
+ * Fetches and returns the index of parent clock.
+ * if hw or parent_hw is NULL, returns -EINVAL.
+ */
+int clk_hw_get_parent_index(struct clk_hw *hw, struct clk_hw *parent_hw)
+{
+	if (!hw || !parent_hw)
+		return -EINVAL;
+
+	return clk_fetch_parent_index(hw->core, parent_hw->core);
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_parent_index);
+
 /*
  * Update the orphan status of @core and all its children.
  */
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2ae7604783dd..477112946dd2 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -817,6 +817,7 @@ unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,
 					  unsigned int index);
+int clk_hw_get_parent_index(struct clk_hw *hw, struct clk_hw *parent_hw);
 unsigned int __clk_get_enable_count(struct clk *clk);
 unsigned long clk_hw_get_rate(const struct clk_hw *hw);
 unsigned long __clk_get_flags(struct clk *clk);
-- 
2.7.4
