Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ED0272918;
	Tue, 25 Feb 2025 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494139; cv=none; b=M26KpP5put/5GdFajSSprZgvLH3vyksfKXIorwhM8diYTXXriwoCZA5c+xccR1k5hax5LCwOQxQR1Dsn/Nj6WNxMhyG5Kk4kdhosK3ZwzFkDyUXgN0Tc/OWpuYLdLFqNh3VO//8zEwMinp54ELlIT5VyzFs7+QoftaC2GgGdc0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494139; c=relaxed/simple;
	bh=Nw/z37NOInb8JLDxqRl0jxjCjO8CGsM64MlD03u9PEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GjxDzVBuJUYPdgkTR3SeBvalR31LyvO4U6qwpxp8ulJ0pVFzmhU0s6KOM0ZXDEJ9Jd0UqQ9KxQDSAnP0taIskyftw5LPeL+CwesOQguaqJGM5m82sv3twu+M+bw59G0Apga0sHGuIcS3LK5Q+U0Be99MSM5MgLUiie/hcVDDEEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IklV5JbY; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IklV5JbY"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e08064b4ddso7620025a12.1;
        Tue, 25 Feb 2025 06:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740494135; x=1741098935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIMWDmJx+cUR/19m4+x898CBwDcGp5fuUgjUxTO6pHw=;
        b=IklV5JbYaj1y0OZlQE4H4H7Q2Y33HKQ/cLNsPIQjKELqaOxcJvWbJHIs0UY3l6isiI
         Z54WoO9zLRqTkJ7Xekq2xXtQ5f3+LCMq8hb93go73W9BuPuA9+g07dmwpeh8t+r9eDeL
         SjNGHVEVUaSvJLaqxK6d8IhpBwgum783U/g5co2irnITSNuDrVXz+KWSlbim1E+6Sz9e
         hyeByLQ2qaVehA2dacbSTLVkWaC4+79CPf5pUd3WvdRHN0TfyiLYUkcAbX/9z8rljJ/e
         VaG0cHbL4CToeo+IuhJrUEiSnL50S9fZZApmfFzDzHth95BP3L7s6mR012671vEnCnzz
         sXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494135; x=1741098935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIMWDmJx+cUR/19m4+x898CBwDcGp5fuUgjUxTO6pHw=;
        b=smqo1JtliR0LOI+JDMJKas0w4NZmwGwCTE7Q0fhVbTltsgxpsYvo1aCAVRNTZ3wrv0
         UHzauJZ6d0b/qO/xd+3K7fRNMqGUJayA7oVmVcaO+aTYj2BglGeyrY8rKi8mXPtIhSSF
         UtI3bANe8p7x8FJw1Gu8tfIfA0XDNihKicFLQvmr3uGfYiFpdtzH4zcujLmL/wEcFeZN
         sWkXePS9bTnFEjQm1Qv920mcZh9NoF+qsxgrRQT4bXgCLcu93HBUB4TThLYVuvUjlbqb
         uD3Zoz6/nZllBewPfhSWOpYt7JgbXjjp3YCSwfWEn8ZsCNqBu+Qw/N0aSAqf7gftjBih
         IInw==
X-Forwarded-Encrypted: i=1; AJvYcCULEonv/GEsnwnj7v/aMPrJtdYa7+y+D6AYkkQ90xeOfoLyH8pqurKtXy0N/S1Kb5o1JhVc/ywN9xe+ylY=@vger.kernel.org, AJvYcCVoi4ShOrygVkXKT92Di2LyHPRoH2yO1Jpqx/myGt3TW5ETTqMvdflJvQfGyEeARfzLRvu+DuL3iHwv@vger.kernel.org, AJvYcCWV1r6DWvzQ/2calMB4ZVqdfuuIcNhtIdhlsyYJbuwNHz10bKf5T4N2JWmSwid62a8F4FNRayTlm9MR@vger.kernel.org
X-Gm-Message-State: AOJu0YyKtPpUxw7BzL+kofchzS3uCxJT4Jc5kBt8Ute52Y0D9iNllMdK
	pP1NMo0OrjUccwW/eNXK10TyC1ggMUISS90dWKgxU4jXXDRHrT1B
X-Gm-Gg: ASbGncsEixO2yWUKzFji6oTeDKSiN02vdEG81Qf9L9Zzyy/jmQtQ0Uc+w05LqACPLR9
	1tvhf8rPR+Hyc1ypbTSf5F7ccGNZSLspKy/6izEPIZNkkarVAquxLGAT5jAlYtRoVplUQ1OT7B9
	DDjzfkBwRupJJ1AgOjF/ViyGNZHTLhFx7XjE4V4E1H7GQVqzZj9IClot5Kdj7TwPsH4n5JA2jm2
	AUz79T9btoNMu3Fu3o6Kya/u+uR8cMkbEVxrn1IVeHEdqwhmi2Vi6KNuwQW+g82r0f+rUUhmqpd
	s1h3ln1sxYD6dQOilQ==
X-Google-Smtp-Source: AGHT+IHxA8BqL0SPvamtoqs4zB0f3XxLm0IfjqUDttjpXDibEB4oawAB9jcoGU7/4y8Qs+amifnDIQ==
X-Received: by 2002:a05:6402:4409:b0:5e0:8c55:504 with SMTP id 4fb4d7f45d1cf-5e0b70bf3a7mr16666919a12.7.1740494135374;
        Tue, 25 Feb 2025 06:35:35 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e460ff8629sm1298750a12.59.2025.02.25.06.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:35:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v1 5/9] clk: tegra114: remove emc to mc clock mux
Date: Tue, 25 Feb 2025 16:34:57 +0200
Message-ID: <20250225143501.68966-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225143501.68966-1-clamor95@gmail.com>
References: <20250225143501.68966-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configure EMC without mux for EMC driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c | 48 ++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 73303458e886..b19dd4e6e17c 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -619,10 +619,6 @@ static const char *mux_plld_out0_plld2_out0[] = {
 };
 #define mux_plld_out0_plld2_out0_idx NULL
 
-static const char *mux_pllmcp_clkm[] = {
-	"pll_m_out0", "pll_c_out0", "pll_p_out0", "clk_m", "pll_m_ud",
-};
-
 static const struct clk_div_table pll_re_div_table[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
@@ -669,7 +665,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_csi] = { .dt_id = TEGRA114_CLK_CSI, .present = true },
 	[tegra_clk_i2c2] = { .dt_id = TEGRA114_CLK_I2C2, .present = true },
 	[tegra_clk_uartc] = { .dt_id = TEGRA114_CLK_UARTC, .present = true },
-	[tegra_clk_emc] = { .dt_id = TEGRA114_CLK_EMC, .present = true },
 	[tegra_clk_usb2] = { .dt_id = TEGRA114_CLK_USB2, .present = true },
 	[tegra_clk_usb3] = { .dt_id = TEGRA114_CLK_USB3, .present = true },
 	[tegra_clk_vde_8] = { .dt_id = TEGRA114_CLK_VDE, .present = true },
@@ -1045,14 +1040,7 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
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
 
@@ -1300,6 +1288,28 @@ void tegra114_clock_deassert_dfll_dvco_reset(void)
 }
 EXPORT_SYMBOL(tegra114_clock_deassert_dfll_dvco_reset);
 
+#ifdef CONFIG_TEGRA124_CLK_EMC
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
+#endif
+
 static void __init tegra114_clock_init(struct device_node *np)
 {
 	struct device_node *node;
@@ -1341,13 +1351,21 @@ static void __init tegra114_clock_init(struct device_node *np)
 	tegra_audio_clk_init(clk_base, pmc_base, tegra114_clks,
 			     tegra114_audio_plls,
 			     ARRAY_SIZE(tegra114_audio_plls), 24000000);
+
+	tegra_clk_apply_init_table = tegra114_clock_apply_init_table;
+
 	tegra_super_clk_gen4_init(clk_base, pmc_base, tegra114_clks,
 					&pll_x_params);
 
+#ifdef CONFIG_TEGRA124_CLK_EMC
+	tegra_add_of_provider(np, tegra114_clk_src_onecell_get);
+	clks[TEGRA114_CLK_EMC] = tegra124_clk_register_emc(clk_base, np,
+							   &emc_lock);
+#else
 	tegra_add_of_provider(np, of_clk_src_onecell_get);
-	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
+#endif
 
-	tegra_clk_apply_init_table = tegra114_clock_apply_init_table;
+	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
 
 	tegra_cpu_car_ops = &tegra114_cpu_car_ops;
 }
-- 
2.43.0

