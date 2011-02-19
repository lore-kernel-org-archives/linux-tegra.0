From: Colin Cross <ccross@android.com>
Subject: [PATCH v2 03/21] ARM: tegra: clock: Drop debugging
Date: Sat, 19 Feb 2011 14:25:52 -0800
Message-ID: <1298154371-5641-5-git-send-email-ccross__19151.204385753$1298154790$gmane$org@android.com>
References: <1298154371-5641-1-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1298154371-5641-1-git-send-email-ccross@android.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.orglinux-tegra@vger.kernel.org
Cc: Russell King <linux@arm.linux.org.uk>, konkers@android.com, linux-kernel@vger.kernel.org, Colin Cross <ccross@android.com>, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Colin Cross <ccross@android.com>
---
 arch/arm/mach-tegra/clock.c |   19 ++-----------------
 1 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock.c
index 77948e0..f55bb83 100644
--- a/arch/arm/mach-tegra/clock.c
+++ b/arch/arm/mach-tegra/clock.c
@@ -138,7 +138,6 @@ static void clk_recalculate_rate(struct clk *c)
 
 int clk_reparent(struct clk *c, struct clk *parent)
 {
-	pr_debug("%s: %s\n", __func__, c->name);
 	c->parent = parent;
 	list_del(&c->sibling);
 	list_add_tail(&c->sibling, &parent->children);
@@ -148,9 +147,8 @@ int clk_reparent(struct clk *c, struct clk *parent)
 static void propagate_rate(struct clk *c)
 {
 	struct clk *clkp;
-	pr_debug("%s: %s\n", __func__, c->name);
+
 	list_for_each_entry(clkp, &c->children, sibling) {
-		pr_debug("   %s\n", clkp->name);
 		clk_recalculate_rate(clkp);
 		propagate_rate(clkp);
 	}
@@ -160,8 +158,6 @@ void clk_init(struct clk *c)
 {
 	unsigned long flags;
 
-	pr_debug("%s: %s\n", __func__, c->name);
-
 	spin_lock_irqsave(&clock_lock, flags);
 
 	INIT_LIST_HEAD(&c->children);
@@ -183,7 +179,7 @@ void clk_init(struct clk *c)
 int clk_enable_locked(struct clk *c)
 {
 	int ret;
-	pr_debug("%s: %s\n", __func__, c->name);
+
 	if (c->refcnt == 0) {
 		if (c->parent) {
 			ret = clk_enable_locked(c->parent);
@@ -247,7 +243,6 @@ EXPORT_SYMBOL(clk_enable);
 
 void clk_disable_locked(struct clk *c)
 {
-	pr_debug("%s: %s\n", __func__, c->name);
 	if (c->refcnt == 0) {
 		WARN(1, "Attempting to disable clock %s with refcnt 0", c->name);
 		return;
@@ -298,8 +293,6 @@ int clk_set_parent_locked(struct clk *c, struct clk *parent)
 {
 	int ret;
 
-	pr_debug("%s: %s\n", __func__, c->name);
-
 	if (!c->ops || !c->ops->set_parent)
 		return -ENOSYS;
 
@@ -359,8 +352,6 @@ int clk_set_rate_cansleep(struct clk *c, unsigned long rate)
 	int ret = 0;
 	unsigned long flags;
 
-	pr_debug("%s: %s\n", __func__, c->name);
-
 	mutex_lock(&dvfs_lock);
 
 	if (rate > c->rate)
@@ -388,8 +379,6 @@ int clk_set_rate(struct clk *c, unsigned long rate)
 	int ret = 0;
 	unsigned long flags;
 
-	pr_debug("%s: %s\n", __func__, c->name);
-
 	if (clk_is_dvfs(c))
 		BUG();
 
@@ -408,8 +397,6 @@ unsigned long clk_get_rate(struct clk *c)
 
 	spin_lock_irqsave(&clock_lock, flags);
 
-	pr_debug("%s: %s\n", __func__, c->name);
-
 	ret = c->rate;
 
 	spin_unlock_irqrestore(&clock_lock, flags);
@@ -419,8 +406,6 @@ EXPORT_SYMBOL(clk_get_rate);
 
 long clk_round_rate(struct clk *c, unsigned long rate)
 {
-	pr_debug("%s: %s\n", __func__, c->name);
-
 	if (!c->ops || !c->ops->round_rate)
 		return -ENOSYS;
 
-- 
1.7.3.1
