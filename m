From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 2/2] clk: tegra20: Enable lock-status polling for PLLs
Date: Thu, 30 Aug 2018 21:42:10 +0300
Message-ID: <20180830184210.5369-2-digetx@gmail.com>
References: <20180830184210.5369-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830184210.5369-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Currently all PLL's on Tegra20 use a hardcoded delay despite of having
a lock-status bit. The lock-status polling was disabled ~7 years ago
because PLLE was failing to lock and was a suspicion that other PLLs
might be faulty too. Other PLLs are okay, hence enable the lock-status
polling for them. This reduces delay of any operation that require PLL
to lock.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2:	Don't enable polling for PLLE as it known to not being able to lock.

 drivers/clk/tegra/clk-tegra20.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index cc857d4d4a86..cfde3745a0db 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -298,7 +298,8 @@ static struct tegra_clk_pll_params pll_c_params = {
 	.lock_enable_bit_idx = PLL_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.freq_table = pll_c_freq_table,
-	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE |
+		 TEGRA_PLL_USE_LOCK,
 };
 
 static struct tegra_clk_pll_params pll_m_params = {
@@ -314,7 +315,8 @@ static struct tegra_clk_pll_params pll_m_params = {
 	.lock_enable_bit_idx = PLL_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.freq_table = pll_m_freq_table,
-	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE |
+		 TEGRA_PLL_USE_LOCK,
 };
 
 static struct tegra_clk_pll_params pll_p_params = {
@@ -331,7 +333,7 @@ static struct tegra_clk_pll_params pll_p_params = {
 	.lock_delay = 300,
 	.freq_table = pll_p_freq_table,
 	.flags = TEGRA_PLL_FIXED | TEGRA_PLL_HAS_CPCON |
-		 TEGRA_PLL_HAS_LOCK_ENABLE,
+		 TEGRA_PLL_HAS_LOCK_ENABLE | TEGRA_PLL_USE_LOCK,
 	.fixed_rate =  216000000,
 };
 
@@ -348,7 +350,8 @@ static struct tegra_clk_pll_params pll_a_params = {
 	.lock_enable_bit_idx = PLL_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.freq_table = pll_a_freq_table,
-	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE |
+		 TEGRA_PLL_USE_LOCK,
 };
 
 static struct tegra_clk_pll_params pll_d_params = {
@@ -364,7 +367,8 @@ static struct tegra_clk_pll_params pll_d_params = {
 	.lock_enable_bit_idx = PLLDU_MISC_LOCK_ENABLE,
 	.lock_delay = 1000,
 	.freq_table = pll_d_freq_table,
-	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE |
+		 TEGRA_PLL_USE_LOCK,
 };
 
 static const struct pdiv_map pllu_p[] = {
@@ -387,7 +391,8 @@ static struct tegra_clk_pll_params pll_u_params = {
 	.lock_delay = 1000,
 	.pdiv_tohw = pllu_p,
 	.freq_table = pll_u_freq_table,
-	.flags = TEGRA_PLLU | TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLLU | TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE |
+		 TEGRA_PLL_USE_LOCK,
 };
 
 static struct tegra_clk_pll_params pll_x_params = {
@@ -403,7 +408,8 @@ static struct tegra_clk_pll_params pll_x_params = {
 	.lock_enable_bit_idx = PLL_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.freq_table = pll_x_freq_table,
-	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_HAS_LOCK_ENABLE |
+		 TEGRA_PLL_USE_LOCK,
 };
 
 static struct tegra_clk_pll_params pll_e_params = {
-- 
2.18.0
