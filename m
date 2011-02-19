From: Colin Cross <ccross@android.com>
Subject: [PATCH v2 02/21] ARM: tegra: clock: Don't BUG on changing an enabled
	PLL
Date: Sat, 19 Feb 2011 14:25:51 -0800
Message-ID: <1298154371-5641-4-git-send-email-ccross__39113.5602993474$1298154738$gmane$org@android.com>
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
 arch/arm/mach-tegra/tegra2_clocks.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 240f921..db27e59 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -620,7 +620,6 @@ static int tegra2_pll_clk_set_rate(struct clk *c, unsigned long rate)
 	const struct clk_pll_table *sel;
 
 	pr_debug("%s: %s %lu\n", __func__, c->name, rate);
-	BUG_ON(c->refcnt != 0);
 
 	input_rate = c->parent->rate;
 	for (sel = c->pll_table; sel->input_rate != 0; sel++) {
-- 
1.7.3.1
