From: Colin Cross <ccross@android.com>
Subject: [PATCH v2 13/21] ARM: tegra: clock: Remove unnecessary uses of #ifdef
	CONFIG_DEBUG_FS
Date: Sat, 19 Feb 2011 14:26:02 -0800
Message-ID: <1298154371-5641-15-git-send-email-ccross@android.com>
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
 arch/arm/mach-tegra/clock.c         |    6 ++----
 arch/arm/mach-tegra/clock.h         |    2 +-
 arch/arm/mach-tegra/tegra2_clocks.c |    4 +---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock.c
index f6c934a..8d01a49 100644
--- a/arch/arm/mach-tegra/clock.c
+++ b/arch/arm/mach-tegra/clock.c
@@ -135,7 +135,7 @@ void clk_init(struct clk *c)
 
 	if (!c->ops || !c->ops->enable) {
 		c->refcnt++;
-		c->set = 1;
+		c->set = true;
 		if (c->parent)
 			c->state = c->parent->state;
 		else
@@ -169,9 +169,7 @@ int clk_enable(struct clk *c)
 				goto out;
 			}
 			c->state = ON;
-#ifdef CONFIG_DEBUG_FS
-			c->set = 1;
-#endif
+			c->set = true;
 		}
 	}
 	c->refcnt++;
diff --git a/arch/arm/mach-tegra/clock.h b/arch/arm/mach-tegra/clock.h
index bb755c2..ebe6ea8 100644
--- a/arch/arm/mach-tegra/clock.h
+++ b/arch/arm/mach-tegra/clock.h
@@ -80,8 +80,8 @@ struct clk {
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry		*dent;
-	bool			set;
 #endif
+	bool			set;
 	struct clk_ops		*ops;
 	unsigned long		rate;
 	unsigned long		max_rate;
diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index dd53af3..196c249 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -1218,9 +1218,7 @@ static void tegra_clk_shared_bus_init(struct clk *c)
 	c->max_rate = c->parent->max_rate;
 	c->u.shared_bus_user.rate = c->parent->max_rate;
 	c->state = OFF;
-#ifdef CONFIG_DEBUG_FS
-	c->set = 1;
-#endif
+	c->set = true;
 
 	spin_lock_irqsave(&c->parent->spinlock, flags);
 
-- 
1.7.3.1
