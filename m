Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669B537B40E
	for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2026 08:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375562; cv=none; b=a8UxWixcXW/MByGwP452kj99LVPD5RjqwrjQIUO40z7CQLQXnoAUPSHHtu1weif4A9V61Fu4g8mEXB7Pl2ZAAImkAqtOzbMPf5nTHXJcDVtXZaB8CNSi79q1VHDkPVOCr/VitRugh639hv4fdyUalEAd/EOu/5UYaPc9jc11wn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375562; c=relaxed/simple;
	bh=OWSx1MMpR9qIKeq9ksKpLzpLKLA05SSYFkqxHQGQPB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rMLkP3XbaHZEC5SqwYnsGeXJuQWEWYlqT+AJCNHPxeIZHLL69glDY9IcfhFZancONUvz2KXVjaPnF71GaoESAODCyYlE3zc/qG54s2F+09E3hAFVz96W/b5Wmaobkw0gNIPenXsnr1XFVd2J8zlD5RTlXNv8pFcigfHqzBGpik8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhYQyODJ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhYQyODJ"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-399735e64d7so23960041fa.0
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2026 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782375558; x=1782980358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yV5eCV14Q3TCkUmPIb/jJ+sajPZ6JHRE3L068KeT1Q=;
        b=nhYQyODJ95MwrO45O0Ck8PXEgvOR2Qmcnk/KrEuCBaVpQmk9alRmx/mBMH+kz+3OkP
         0hT/hOiWx6XSMg3ht1rI1+Z3XpgCSPMcSVlFlKkXWajmLavCm85/KoLb2hvNwe29CMUr
         G/zTlCnW27h2C4axDUt6sSGOLQrEf91TSFjJ+KMNtJXrHEyPYANxK3tm9QCiCi2xCCm2
         ZY4ibN6+sGGFSHuhHZW/pFQV4bztBZvN1urPXr5DfHltvn1215KzHK13HgzA/WsEQGCs
         huxofvJcWfTlSTpQlBIrbh1ETCUpBzAFFIIU0jrsDGjDrdQ089yQPOl01YQsR0dFhUFY
         aHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375558; x=1782980358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/yV5eCV14Q3TCkUmPIb/jJ+sajPZ6JHRE3L068KeT1Q=;
        b=mgVy8u8qghG7FOij+D6HS7Jzv9VT99OEFd42yqngkDlhxTU8sKGJedxsmQZ+WRHkeY
         0kjpe5kHIT4pbV9HyU1wpp05ZAZ5ZVbhdULFpHGZ4kMtj2SuV/uojctgf0RsIH/gEWxM
         8mw1wuUIXkWP1eOPbD44D/tUVCMInGHMpOsqL7m58RUt6BaIxYajLXN6EUaLR8Hg661O
         92A3u1pWT02EK05YzeFRRhrTN3KMm/GvoZBW/utdlemqkfo+j1VWPKYlVRsbMsxGKSzE
         vdkf/PGnxtUtuT4zdjwtmNDDwx6u58womtO7yw2LBh6lu67Mjc22vk83A1sJAsojcBHs
         +4Ww==
X-Forwarded-Encrypted: i=1; AHgh+RryOhfB+dCki5sD+VPN1s4ZHxK/pbtqjWIaELEVFUyqMaZwkwyqiLJ14OBFErz4kekNEXdHFH47EoEBPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqpfrcRocEbBvYJdEQlzYsZEo+8EQZhKL17qQBHo5Ze7wT9nKa
	FfEKk5opwQRXUorLuYEh5KmxVoVAu0EjjhHYuWRRUtAKGN4KOTzlg4Cb
X-Gm-Gg: AfdE7cnVmP8xAJUCZt2YxcJPvQOl5gVVvDfWkmcH0RR8nOMl75CzR0ILcefl/xxhF7q
	gspFjEKwciq4uZSXANkiAhZd4LrwPnptLq+oezi78EAKmV4V1Fiw+rCP6olzyy7D2ExpW3LbYo3
	0CZ3jDNq28vCzTtoRDtaDu8CrToyimAMxcpXmDZEBthSgUc0qZEub62hP0h+rRJP+pOnI7uUHFq
	kiET13iYfRXFHDhOuhRQmpdfsLgwtuKyAYBmKQyQiGbp8LHrl4O+8AXsAAp3D5h9C8kbvxWMmUc
	uo29FVWdjptIP4ZeqWG5U0ixiaqoiwRgE6JuwbC0BIBG6rTzyq4V0TCItuA5pq9RpFEmB++eBgQ
	0oyWzhiKqMreDV3Y3iPUPyVobo3m3t0sdYbevDZC0WgkixhTxPBqWC1MMAJVtpCqwGsN1xWiEj+
	sxnlv8+NfgZt7SJgOw8KAMlhIfEbCyrcZITA==
X-Received: by 2002:a05:6512:3f19:b0:5aa:785d:bcb6 with SMTP id 2adb3069b0e04-5aea1f5101dmr455900e87.37.1782375557457;
        Thu, 25 Jun 2026 01:19:17 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a71csm2455548e87.45.2026.06.25.01.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:19:16 -0700 (PDT)
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
Subject: [PATCH v1 1/1 RESEND v3] clk: tegra: set up proper EMC clock implementation for Tegra114
Date: Thu, 25 Jun 2026 11:19:06 +0300
Message-ID: <20260625081906.39254-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625081906.39254-1-clamor95@gmail.com>
References: <20260625081906.39254-1-clamor95@gmail.com>
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

