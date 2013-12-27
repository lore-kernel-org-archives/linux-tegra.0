From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH 1/7] clk: tegra: Fix PLLP rate table
Date: Thu, 26 Dec 2013 16:44:21 -0800
Message-ID: <1388105067-24438-2-git-send-email-abrestic@chromium.org>
References: <1388105067-24438-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1388105067-24438-1-git-send-email-abrestic@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Gabe Black <gabeblack@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org, Gabe Black <gabeblack@google.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Gabe Black <gabeblack@chromium.org>

This table had settings for 216MHz, but PLLP is (and is supposed to be)
configured at 408MHz.  If that table is used and PLLP_BASE_OVRRIDE is
not set, the kernel will panic in clk_pll_recalc_rate().

Signed-off-by: Gabe Black <gabeblack@google.com>
Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
 drivers/clk/tegra/clk-tegra124.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index aff86b5..28bb238 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -516,11 +516,11 @@ static struct div_nmp pllp_nmp = {
 };
 
 static struct tegra_clk_pll_freq_table pll_p_freq_table[] = {
-	{12000000, 216000000, 432, 12, 1, 8},
-	{13000000, 216000000, 432, 13, 1, 8},
-	{16800000, 216000000, 360, 14, 1, 8},
-	{19200000, 216000000, 360, 16, 1, 8},
-	{26000000, 216000000, 432, 26, 1, 8},
+	{12000000, 408000000, 408, 12, 0, 8},
+	{13000000, 408000000, 408, 13, 0, 8},
+	{16800000, 408000000, 340, 14, 0, 8},
+	{19200000, 408000000, 340, 16, 0, 8},
+	{26000000, 408000000, 408, 26, 0, 8},
 	{0, 0, 0, 0, 0, 0},
 };
 
-- 
1.8.5.1
