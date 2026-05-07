Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12293FB07C
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 13:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162023; cv=none; b=B1jBoPQJO8haOpuOq+2bmsqMkQ549dmLUjGYr1gzNrjur/9Bgni9NrQBT5ncBUVRZ86q4GOvkLbSeijPASJkWD1+w2m2ThUD9fybcW+GIIhxTPuDPbyFq5mqUrmsVKpCjiAM1qv5/DQdpQ2IR1gCjYMKx1fESGbyl4iaSKjZumk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162023; c=relaxed/simple;
	bh=OWSx1MMpR9qIKeq9ksKpLzpLKLA05SSYFkqxHQGQPB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=srQ34EZS5qPRUzgcOQKUK+yvsh0SAGhdeJk3gc2j65ofFj9rc+N/jc1Ks/L/MQS/OgRznjzStFXPbQYLBIm1cmOCaim5uF3qGo6sF+LvgTI2/e9RCZ+j85Dwj47DDSlIU8JA1+iKD40s9CFqvELos6mp0eE17CNFfIlTiWQucJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBAY+WMx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBAY+WMx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso6916255e9.1
        for <linux-tegra@vger.kernel.org>; Thu, 07 May 2026 06:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778162020; x=1778766820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yV5eCV14Q3TCkUmPIb/jJ+sajPZ6JHRE3L068KeT1Q=;
        b=CBAY+WMxkELH7KHWcwMM4egP1XSSCTXx8H2EeWdm7O9AObNVNmt/EZv1Ur/oYz3nkK
         JZ0Cvge169QITDyGuHQ5+rzmo0BRBLDw+6bsBHJjeqvXTQa+fg6WWqeetAbAJXAtNV/E
         Bz9+8C15RNrsj/rAc8UH52AK7c88LH2hyZp0/Xnj1J7wgb8k9FBz2fXETvEXM4DbuOg9
         2NyK5kXutpQO7Bu1k89kc0fkMGEzpsZtc2i4RX+5CsUqiJqICxaoUvWbXhmAR8n6mORV
         BZyNTgmdP3EltIXJBewU0U4Gb8mrFGJxjlmuFlcFr+R0NvxJ6gtZ1yeQZvAUJx0xI7+D
         mK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778162020; x=1778766820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/yV5eCV14Q3TCkUmPIb/jJ+sajPZ6JHRE3L068KeT1Q=;
        b=pxOJQauEgLqUragx+YssAtqQ3yuV9/8trqh2d7CtTo6Yi/cdJ3GhNaLY5ndnyTWQfW
         A1nnHQ9JjtIxWK6MouJjcT5maWSJMgpg7tYFs/MP5bZ6u+Z0BC2Ts/q+6qHPx+NQnBlM
         ZQ+/zCNMSKAiftJWFV3+2XfhTXPGl3NubiEv9uB0Qxfz23yFX1o2wMVHPzO2l4Bf/Y68
         aoO43JDAQ1/svLbAY+LGgDyZAPXql0jYpouRY+V0IF04BDgL24lPyKvXaUvpyWYQia26
         EUji1H4+IMx6tz4TSmY184mEpB2gSslZ2PD4WRpkE9Q3DF55zmPaqssP/h6CWNSEOeds
         I7xA==
X-Forwarded-Encrypted: i=1; AFNElJ9E1xPspZBMTEhD1WdxZ+WwdELObUkmXYruzHTiC21KXYnDI99PIW7whHmd4puDSJXl77NCg1+vfkDtng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi037Vrtukg1mroXp4EO9EYGUDy55khDmfQIwDvhe3pX6jOayw
	/GNQpahenegCvsUPFm4yju2hs5OID/IzZobS5ycV4YTAmVFZNJqW6rfG
X-Gm-Gg: AeBDietN8MjtgIh+mjQY/P90OI2CYOEQA/S9QuW6KLhpSUapOQBvYitxxF4t9hRYlZ/
	A1JFXecINEK26an5oGJHr+RSebMVqFGhR9WfkEArNZivdxUiYgfSdKnGPYV99TCInVpBaCY8gtC
	aLzRPUxglPMcegX7W+RuTq9Kj8MpEhjTmKOhK5INTit9JHsYEfC8LzySVCYy/cyryUd2hq72oAW
	raIMkMGlQILjEGhC228SojuuZQrbMnHt1nYVx77iJcQyhX1Nsud4yLPiUmZF61BDxQYQGIj86Rk
	Knfs9UminhbUkXoxbGscZiaAhIMlkaDg8TO+aZVXN9ebrZc3zuHMymUAgEHsPg0WDROkh6fTwzh
	DvjmLzxR0Y+y00TNHMKkMbhJR0H4K54ndPeGDBZLHkU/W5PkKdqf2tkdSYrK27BGvK7I8UgdY4t
	cRwmCMNiPeRZa87SsIuw5MVHM=
X-Received: by 2002:a05:600c:1e8a:b0:488:fd7e:1063 with SMTP id 5b1f17b1804b1-48e51f4cdcdmr128182155e9.29.1778162020091;
        Thu, 07 May 2026 06:53:40 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538fad5fsm137882125e9.10.2026.05.07.06.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:53:39 -0700 (PDT)
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
Subject: [PATCH v1 1/1 RESEND] clk: tegra: set up proper EMC clock implementation for Tegra114
Date: Thu,  7 May 2026 16:53:14 +0300
Message-ID: <20260507135314.76817-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260507135314.76817-1-clamor95@gmail.com>
References: <20260507135314.76817-1-clamor95@gmail.com>
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

