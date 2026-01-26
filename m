Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D1925B1DA
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 18:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769453914; cv=none; b=Oa3KlSJK7GdmdBSmIfrh4xGSrlgVCtwT7ztWRiHYFYiS+Vj847v3GNONJxf+bIsjXo4sk+HCM9Fx49gmYeUueQCh6eEjmsvH5Ls+14siLSYl2RDvMzPg5QjTVlbsqIh19dQpJ1XqhmPZKmionMNrF1HRsJ7htsWDcG5ry9P91aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769453914; c=relaxed/simple;
	bh=3YniX+5sx8EF/kKB0wkP85t7/hSvFvOceyOl6eToutQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXyAPCbO63oZ608T6lxzCuJLgF0uLBCtEBeO7yW/N1Nf4VJzVxXfTnguAGwD8S/AmDlb9E5znv+eF1ybUEAYxhoE5wliLXprsxhFeK1cZco1miiODPZfase52KvwLQuC810SMJEB0FZH9Mg2vpdvSXeO3008o6y4z/futqY7K5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPj0hxLR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPj0hxLR"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so40469305e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 10:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769453911; x=1770058711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ojtk0fFLfc8Bpu13uX4lJTdZjs+skZIfo0qtTZT9RBo=;
        b=LPj0hxLRaFiP2o/eNuPvEZ6WWUG32/M3bwywiC8bzF2htn4EzWyfsP8MRTdH255vWv
         AK04snrXE/H3xcFLIhsDW6qKcaXX9uU0U51nznFr8RRvGDLAWW68dVhbC5JfJRbRmWWP
         +WKcAFy7j0g9u6ZNG6h2xVoxgGXpEAydpqm5nd0KOHSG9ItA79m4UtgZZkbqywPDBHXV
         lPHiy5+uj3jWBG7x/nJE1UEdpfV/nCFkEhRIq9AiwA96oYajo+2b9sZTVAm/5nXHJvxf
         +LSHSGDgXPy1ZlX57Wd4TZQ6QHxHcjZJ227FqCZS5Kr8bJkkc+QDnhBLtPRGcUQM3tFE
         yqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769453911; x=1770058711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ojtk0fFLfc8Bpu13uX4lJTdZjs+skZIfo0qtTZT9RBo=;
        b=SnOHaI3IIy71JeVB1k8oNuYs1YpD6NUm0o3opagSlqXz57YK4i6XRSL8aTJmyZ8Ecf
         1s8/3lMtXlyXa0iPe2hBaA6qGkw00+X2UQ6NbICSOvwfel77Wrl/N0CeLJmTTZBHrZou
         ETe5BiqmNmpLF7hM0KmQZpmh0CzY/ftL3AgUWBfErIfMK7Llm50TmEird7wNMWYSE7Pj
         nOXP4N3sN/26+Bl7PudiZXmx9jRPNAKhyo+FqTlmlJBKS/mDXJWmrzpI84G3XsdDMKHY
         ETBjMGYEwWAHXa4KqTDLjf8ZrA+ENU0oeOlPUjGBtUnuLQh3JYL8DqaZuwU7HgM/s3+p
         xXPg==
X-Forwarded-Encrypted: i=1; AJvYcCVckukD70B+FFc2dS+WDWe+eBlULht35oDWCAcKKQ+k+77Q7ZOhExCdx1HcdK+vJXhWnvhmL4qG4W0/vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFtB4LziRlvCZQIk2Ij8MCE4UYjZP+KfgoTwtY2fIPUjP+RhdR
	/Yd8tVAtuh10Vz1Xnb0xA5neC2qX2jkm2WhkkgH2BPBqr7xK+S8Z5aV/
X-Gm-Gg: AZuq6aLAOT6QDlf+kymQGAVzQMquDojbO6eqWAir96YHgoXdjpTbOvoTsf3Nw9Ar5dy
	XcT7CdhTyaq5suhJJ+VHYK9PodWe048GFoq2FDJZhXoJccHy7lghajdKvVMaCZGydhMhyDAwcY5
	+TNJ2ba2PGF4ZOIB+31pBacPZnJdr0fSYaoalBEYzL4sNFOaNktpiy8JnCCVmoGTFm7nOnEy/5i
	lpvHAIiPv7qgg/VE35GdjI86ofzpTXSB7fFy5CIm0y4aS9J8veWm7yBP/c3yZBiX8PJlMyEru6+
	f2KIFmvBqUu2bWnOmpU5Kky7Hh5H7g6lUv1w2i940t9Ly/EvGuPOs8+pVGQJOAJk14Ek6YnkDxq
	gniVySK3LXWFfXN3ntMub5lP6tKtGIBJea02YxHYS//vkfdxJnrSWh+0UYt5ps8VOq6AHzHyuet
	+j
X-Received: by 2002:a05:600c:628f:b0:480:1c85:88bf with SMTP id 5b1f17b1804b1-4805cf67216mr80901085e9.27.1769453910539;
        Mon, 26 Jan 2026 10:58:30 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c3732dsm7296265e9.11.2026.01.26.10.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 10:58:30 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] clk: tegra: set up proper EMC clock implementation for Tegra114
Date: Mon, 26 Jan 2026 20:58:18 +0200
Message-ID: <20260126185818.78003-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126185818.78003-1-clamor95@gmail.com>
References: <20260126185818.78003-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove current emc and emc_mux clocks and replace them with the proper EMC
clock implementation for correct EMC driver support.

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

