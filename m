Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14C73438BD
	for <linux-tegra@vger.kernel.org>; Sun, 31 May 2026 09:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780219641; cv=none; b=YJX4Az3oXSre20Xxtk08fxc8bQasl4PafgHxUW9Bmu/+478xnOxFV8B+OmXdVKAN9zcuplJ2H3sMmEAg0zszOifOKAESzzKP2Z2Lo9YMRHWLiezVwliLpx0eGyElTESmgP6L6p6YmRS8jivhBaidsXwDNyBNL85D09Xm6OYI2T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780219641; c=relaxed/simple;
	bh=OWSx1MMpR9qIKeq9ksKpLzpLKLA05SSYFkqxHQGQPB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ArspJVqONFkUVkZD+V5YiMaNcVC9lkxrMZFSnQkQ1v3cNGRh1VGx6Hd2WXyxjEUsV071fvDt+uOWBS+wDqRrF20vn9YStkGEFmm9NV54ph2HZqd5/TNmwo1yinmZMekHdnaMK3ab8XxMgd4sVYp3KYpDJzzTnh0WiJeJ5KgmoyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XP+vYEEN; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XP+vYEEN"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490a765d410so4347105e9.1
        for <linux-tegra@vger.kernel.org>; Sun, 31 May 2026 02:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780219638; x=1780824438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yV5eCV14Q3TCkUmPIb/jJ+sajPZ6JHRE3L068KeT1Q=;
        b=XP+vYEENUxcCcvVgsgwSMgOwHzAmOjyVZrFSiTJj55xaULwMHHEAkEYDJcnjOit11p
         iZB8cHglVy9RwBVV6LDuI4oFke3GoJ0iuoAd+pRbJpC3vk5A5a7rWOti/UYgA9waaLeq
         tzydxqojoSLncwppmcywgix9vGiSnn1ndigZxQIuDk/EEKObc3kqa56+ySpqnlRinnhU
         A90f1wV/f1ue9ErC/8zY+80bzYiJVfB1jxxs1jncbCvz4iiDtd3F81+q6swLSHPnvRXl
         aSSmtfW9k6eSOQ4j5j3O/6ek8rtAfpBZ3pOFkHB29inzSV7dpGMtbRVsy+BEwJm+4RIO
         I70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780219638; x=1780824438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/yV5eCV14Q3TCkUmPIb/jJ+sajPZ6JHRE3L068KeT1Q=;
        b=dVisnwLv/zMmxATvp5G2wlgcGfawdP5XUMrfgw0TadgQs3dsnzb5DM/wjLUFQhFw7C
         /Udl7NykdRyjT32PhZqdwywrduhavMn9N34Zi+/SY69GQydd9P54rlNYhx9IqSR3nyaK
         OZlhCkMrr6045cHmFKY1cT2wwcAbwbozioN5jJo04J7tHQNzAVqhvI8ARXC4i9DWXH6Z
         qzlyGNjK7I6hR+fH5gaMhkcZQGtF5A73NdFl1NyV3TOTLF8OGt6rHKk8O1GnlRJmTsMQ
         +YiBdRzpIi9uEHcV7D91G4vTHbc7aD2OjID9BahA7vovYOmTDifkMp0O/0U3yf0Y0/lB
         076w==
X-Forwarded-Encrypted: i=1; AFNElJ/GxYY8+0GJk6+vh+plsms56BVrq4fK9VR1p6iDF/Ze0zjgu3VxxE3aEBcH74n7iJmj/xSlW/labmWrIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtYZdHKXSzMIo4RDMZ4Oywi6H5z/qKck3DfthNUwYfeZc+rTcQ
	mJO6eSZLDU00dWOaHnsrIWv4MTZ1j7NdsPHc1YvD9F+dstB6letM+vye
X-Gm-Gg: Acq92OGjz5Ca5oVO2MIwJO3hsMCqD0uVD2XRPpoE+ZrgayQeqnG1H6FwCS/ZL2j2iXc
	3lZ/IIVHdSBkLdhsZuGgU+y2VWV9Z+SiLNeGokiOifCxTc679hCF75ni0OlyO0bjY2o2t2CzBby
	qMmRoTwol2CFdAnVOldAFh3a/bTvZ7SyijFzP/uFX9HEisBw3llPeI9iKV8YqOy1IUpnY+XKQ3G
	m8p7S6FMkvSpOPgR3SkZ9UgcN1T98BbSlK5YZyNy6Cwj/lF92xvbgGW8IBWOmHpMjW60cukjOvk
	V24KQJ5bGFdpXmtc3hixshFotG2uQ9qkoodq2/hErP3hKANcHrinzEEa8bKnpylM04cJpc9yQYo
	YUAegAXDl3iVRL/7bjXkeIbduuXx+V/zOMp8DFGztjsuNeaN2XEz29h4auHWB4cX9hzAKbffwfA
	ptVoHKq9e+bZDEYZmQ3KcGq80=
X-Received: by 2002:a05:600c:4f05:b0:490:50e8:45c3 with SMTP id 5b1f17b1804b1-490a28cf434mr119706925e9.0.1780219638142;
        Sun, 31 May 2026 02:27:18 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0e8c1bsm68462675e9.3.2026.05.31.02.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 02:27:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1 RESEND v2] clk: tegra: set up proper EMC clock implementation for Tegra114
Date: Sun, 31 May 2026 12:26:53 +0300
Message-ID: <20260531092653.12589-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260531092653.12589-1-clamor95@gmail.com>
References: <20260531092653.12589-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove current emc and emc_mux clocks and replace them with the proper EMC
clock implementation for correct EMC driver support.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/clk/tegra/clk-tegra114.c | 39 ++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 8bde72aa5e68..853ef707654a 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -622,10 +622,6 @@ static const char *mux_plld_out0_plld2_out0[] = {
 };
 #define mux_plld_out0_plld2_out0_idx NULL
 
-static const char *mux_pllmcp_clkm[] = {
-	"pll_m_out0", "pll_c_out0", "pll_p_out0", "clk_m", "pll_m_ud",
-};
-
 static const struct clk_div_table pll_re_div_table[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
@@ -672,7 +668,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_csi] = { .dt_id = TEGRA114_CLK_CSI, .present = true },
 	[tegra_clk_i2c2] = { .dt_id = TEGRA114_CLK_I2C2, .present = true },
 	[tegra_clk_uartc] = { .dt_id = TEGRA114_CLK_UARTC, .present = true },
-	[tegra_clk_emc] = { .dt_id = TEGRA114_CLK_EMC, .present = true },
 	[tegra_clk_usb2] = { .dt_id = TEGRA114_CLK_USB2, .present = true },
 	[tegra_clk_usb3] = { .dt_id = TEGRA114_CLK_USB3, .present = true },
 	[tegra_clk_vde_8] = { .dt_id = TEGRA114_CLK_VDE, .present = true },
@@ -1048,14 +1043,7 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 					     0, 82, periph_clk_enb_refcnt);
 	clks[TEGRA114_CLK_DSIB] = clk;
 
-	/* emc mux */
-	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
-			       ARRAY_SIZE(mux_pllmcp_clkm),
-			       CLK_SET_RATE_NO_REPARENT,
-			       clk_base + CLK_SOURCE_EMC,
-			       29, 3, 0, &emc_lock);
-
-	clk = tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
+	clk = tegra_clk_register_mc("mc", "emc", clk_base + CLK_SOURCE_EMC,
 				    &emc_lock);
 	clks[TEGRA114_CLK_MC] = clk;
 
@@ -1321,6 +1309,26 @@ static int tegra114_reset_deassert(unsigned long id)
 	return 0;
 }
 
+static struct clk *tegra114_clk_src_onecell_get(struct of_phandle_args *clkspec,
+						void *data)
+{
+	struct clk_hw *hw;
+	struct clk *clk;
+
+	clk = of_clk_src_onecell_get(clkspec, data);
+	if (IS_ERR(clk))
+		return clk;
+
+	hw = __clk_get_hw(clk);
+
+	if (clkspec->args[0] == TEGRA114_CLK_EMC) {
+		if (!tegra124_clk_emc_driver_available(hw))
+			return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	return clk;
+}
+
 static void __init tegra114_clock_init(struct device_node *np)
 {
 	struct device_node *node;
@@ -1368,7 +1376,10 @@ static void __init tegra114_clock_init(struct device_node *np)
 	tegra_init_special_resets(1, tegra114_reset_assert,
 				  tegra114_reset_deassert);
 
-	tegra_add_of_provider(np, of_clk_src_onecell_get);
+	tegra_add_of_provider(np, tegra114_clk_src_onecell_get);
+	clks[TEGRA114_CLK_EMC] = tegra124_clk_register_emc(clk_base, np,
+							   &emc_lock);
+
 	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
 
 	tegra_clk_apply_init_table = tegra114_clock_apply_init_table;
-- 
2.51.0

