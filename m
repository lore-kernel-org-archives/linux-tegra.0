From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] clk: tegra: fix pllcx pdiv for Tegra124
Date: Mon, 25 Nov 2013 15:20:23 +0200
Message-ID: <1385385623-8952-3-git-send-email-pdeschrijver@nvidia.com>
References: <1385385623-8952-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385385623-8952-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The post divider field for pllcx on Tegra124 has some more allowed values than
the one on Tegra114. Fix the code to reflect this.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra124.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 54af043..863c38b 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -263,8 +263,11 @@ static struct div_nmp pllcx_nmp = {
 static struct pdiv_map pllc_p[] = {
 	{ .pdiv = 1, .hw_val = 0 },
 	{ .pdiv = 2, .hw_val = 1 },
+	{ .pdiv = 3, .hw_val = 2 },
 	{ .pdiv = 4, .hw_val = 3 },
+	{ .pdiv = 6, .hw_val = 4 },
 	{ .pdiv = 8, .hw_val = 5 },
+	{ .pdiv = 12, .hw_val = 6 },
 	{ .pdiv = 16, .hw_val = 7 },
 	{ .pdiv = 0, .hw_val = 0 },
 };
-- 
1.7.7.rc0.72.g4b5ea.dirty
