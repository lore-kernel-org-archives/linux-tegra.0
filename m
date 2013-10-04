From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/5] clk: tegra124: Add common clk IDs to clk-id.h
Date: Fri, 4 Oct 2013 12:12:42 +0300
Message-ID: <1380878014-22088-4-git-send-email-pdeschrijver@nvidia.com>
References: <1380878014-22088-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380878014-22088-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Tegra124 introduces a number of a new clocks. Introduce the corresponding
the IDs for them.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-id.h |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index b2a4d45..4ac3017 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -191,6 +191,33 @@ enum clk_id {
 	tegra_clk_clk_out_3_mux,
 	tegra_clk_dsia_mux,
 	tegra_clk_dsib_mux,
+
+	tegra124_clk_isp,
+	tegra_clk_uarte,
+	tegra_clk_entropy,
+	tegra_clk_i2c6,
+	tegra_clk_hdmi_audio,
+	tegra_clk_clk72Mhz,
+	tegra_clk_vic03,
+	tegra_clk_adx1,
+	tegra_clk_amx1,
+	tegra_clk_sor0,
+	tegra_clk_sata_oob,
+	tegra_clk_sata,
+	tegra_clk_vi_sensor2,
+	tegra_clk_ispb,
+	tegra_clk_vim2_clk,
+	tegra_clk_pcie,
+	tegra_clk_afi,
+	tegra_clk_sata_cold,
+	tegra_clk_dpaux,
+	tegra_clk_gpu,
+	tegra_clk_pll_p_out5,
+	tegra_clk_cml0,
+	tegra_clk_cml1,
+	tegra_clk_pll_c4,
+	tegra_clk_pll_dp,
+
 	tegra_clk_max,
 };
 
-- 
1.7.7.rc0.72.g4b5ea.dirty
