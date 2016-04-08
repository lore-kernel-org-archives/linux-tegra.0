From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 5/5] clk: tegra: dfll: Reformat CVB frequency table
Date: Fri,  8 Apr 2016 15:31:37 +0200
Message-ID: <1460122297-14420-5-git-send-email-thierry.reding@gmail.com>
References: <1460122297-14420-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1460122297-14420-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Increase the readability of the CVB frequency table by reformatting it a
little.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 50 +++++++++++++++---------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index d052d9fa8230..c205809ba580 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -48,31 +48,31 @@ static const struct cvb_table tegra124_cpu_cvb_tables[] = {
 		.speedo_scale = 100,
 		.voltage_scale = 1000,
 		.entries = {
-			{204000000UL,   {1112619, -29295, 402} },
-			{306000000UL,	{1150460, -30585, 402} },
-			{408000000UL,	{1190122, -31865, 402} },
-			{510000000UL,	{1231606, -33155, 402} },
-			{612000000UL,	{1274912, -34435, 402} },
-			{714000000UL,	{1320040, -35725, 402} },
-			{816000000UL,	{1366990, -37005, 402} },
-			{918000000UL,	{1415762, -38295, 402} },
-			{1020000000UL,	{1466355, -39575, 402} },
-			{1122000000UL,	{1518771, -40865, 402} },
-			{1224000000UL,	{1573009, -42145, 402} },
-			{1326000000UL,	{1629068, -43435, 402} },
-			{1428000000UL,	{1686950, -44715, 402} },
-			{1530000000UL,	{1746653, -46005, 402} },
-			{1632000000UL,	{1808179, -47285, 402} },
-			{1734000000UL,	{1871526, -48575, 402} },
-			{1836000000UL,	{1936696, -49855, 402} },
-			{1938000000UL,	{2003687, -51145, 402} },
-			{2014500000UL,	{2054787, -52095, 402} },
-			{2116500000UL,	{2124957, -53385, 402} },
-			{2218500000UL,	{2196950, -54665, 402} },
-			{2320500000UL,	{2270765, -55955, 402} },
-			{2422500000UL,	{2346401, -57235, 402} },
-			{2524500000UL,	{2437299, -58535, 402} },
-			{0,		{      0,      0,   0} },
+			{  204000000UL, { 1112619, -29295, 402 } },
+			{  306000000UL, { 1150460, -30585, 402 } },
+			{  408000000UL, { 1190122, -31865, 402 } },
+			{  510000000UL, { 1231606, -33155, 402 } },
+			{  612000000UL, { 1274912, -34435, 402 } },
+			{  714000000UL, { 1320040, -35725, 402 } },
+			{  816000000UL, { 1366990, -37005, 402 } },
+			{  918000000UL, { 1415762, -38295, 402 } },
+			{ 1020000000UL, { 1466355, -39575, 402 } },
+			{ 1122000000UL, { 1518771, -40865, 402 } },
+			{ 1224000000UL, { 1573009, -42145, 402 } },
+			{ 1326000000UL, { 1629068, -43435, 402 } },
+			{ 1428000000UL, { 1686950, -44715, 402 } },
+			{ 1530000000UL, { 1746653, -46005, 402 } },
+			{ 1632000000UL, { 1808179, -47285, 402 } },
+			{ 1734000000UL, { 1871526, -48575, 402 } },
+			{ 1836000000UL, { 1936696, -49855, 402 } },
+			{ 1938000000UL, { 2003687, -51145, 402 } },
+			{ 2014500000UL, { 2054787, -52095, 402 } },
+			{ 2116500000UL, { 2124957, -53385, 402 } },
+			{ 2218500000UL, { 2196950, -54665, 402 } },
+			{ 2320500000UL, { 2270765, -55955, 402 } },
+			{ 2422500000UL, { 2346401, -57235, 402 } },
+			{ 2524500000UL, { 2437299, -58535, 402 } },
+			{          0UL, {       0,      0,   0 } },
 		},
 		.cpu_dfll_data = {
 			.tune0_low = 0x005020ff,
-- 
2.8.0

