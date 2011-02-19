From: Colin Cross <ccross@android.com>
Subject: [PATCH v2 11/21] ARM: tegra: cpufreq: Take an extra reference to pllx
Date: Sat, 19 Feb 2011 14:26:00 -0800
Message-ID: <1298154371-5641-13-git-send-email-ccross__2789.85862755707$1298154587$gmane$org@android.com>
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

During cpu frequency changes, take an extra reference to pllx so
that it doesn't turn off and on while the cpu is temporarily on
pllp.  If the cpu is moved to pllp permanently, pllx will be
turned off.

Signed-off-by: Colin Cross <ccross@android.com>
---
 arch/arm/mach-tegra/cpu-tegra.c     |    2 ++
 arch/arm/mach-tegra/tegra2_clocks.c |   15 +++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/cpu-tegra.c b/arch/arm/mach-tegra/cpu-tegra.c
index cda03f1..f02ba60 100644
--- a/arch/arm/mach-tegra/cpu-tegra.c
+++ b/arch/arm/mach-tegra/cpu-tegra.c
@@ -173,6 +173,8 @@ static int tegra_cpu_init(struct cpufreq_policy *policy)
 	if (IS_ERR(cpu_clk))
 		return PTR_ERR(cpu_clk);
 
+	clk_enable(cpu_clk);
+
 	cpufreq_frequency_table_cpuinfo(policy, freq_table);
 	cpufreq_frequency_table_get_attr(freq_table, policy->cpu);
 	policy->cur = tegra_getspeed(policy->cpu);
diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index ab013b1..a1c86d8 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -385,10 +385,16 @@ static void tegra2_cpu_clk_disable(struct clk *c)
 static int tegra2_cpu_clk_set_rate(struct clk *c, unsigned long rate)
 {
 	int ret;
+	/*
+	 * Take an extra reference to the main pll so it doesn't turn
+	 * off when we move the cpu off of it
+	 */
+	clk_enable(c->u.cpu.main);
+
 	ret = clk_set_parent(c->parent, c->u.cpu.backup);
 	if (ret) {
 		pr_err("Failed to switch cpu to clock %s\n", c->u.cpu.backup->name);
-		return ret;
+		goto out;
 	}
 
 	if (rate == clk_get_rate(c->u.cpu.backup))
@@ -397,17 +403,18 @@ static int tegra2_cpu_clk_set_rate(struct clk *c, unsigned long rate)
 	ret = clk_set_rate(c->u.cpu.main, rate);
 	if (ret) {
 		pr_err("Failed to change cpu pll to %lu\n", rate);
-		return ret;
+		goto out;
 	}
 
 	ret = clk_set_parent(c->parent, c->u.cpu.main);
 	if (ret) {
 		pr_err("Failed to switch cpu to clock %s\n", c->u.cpu.main->name);
-		return ret;
+		goto out;
 	}
 
 out:
-	return 0;
+	clk_disable(c->u.cpu.main);
+	return ret;
 }
 
 static struct clk_ops tegra_cpu_ops = {
-- 
1.7.3.1
