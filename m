Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2B932A3F4;
	Wed, 20 Aug 2025 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755702833; cv=none; b=SBEK3ip48sBlrFtClr8vstwgvh1OcMLaQwH9O8DUJQTmQbb62AAMubr6Y50vP6g49eom4b1r52n57X+oNNiZv7wei8ztOnrvvbTOHWlRJ3VYY4iG44xslmZ0iREkLhpaAyUYdlmg/4XcBYkbbjUnbTjqC8RJlW83WoAKbo3t7vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755702833; c=relaxed/simple;
	bh=owTRPtqrvczC5EPPWXPj6YcqU35/jyPT8pjXzkhIZ1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n5eZWxTlPq7F/F4gOH+C1y70FXOfra3s8Lw4oNLoGztq0rhEYQ59ETGAPHAjefLFaptC4dRrHnWfHgJGy1CXaC/E8P7eJi/jK7p4EY22QsxSBOgbXkcu5rqA2T/EbvErZdRgIROMesJ2xQJNAoTsiFbrBm+Lax8CUv3Z7e26GZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Plu94ALK; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Plu94ALK"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb78da8a7so1056035266b.1;
        Wed, 20 Aug 2025 08:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755702830; x=1756307630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJb3d8AETVqrx6c17VKT25NC3GUd37gM8BTULpRUjZ4=;
        b=Plu94ALKP7jvLjR45QBR/QZnUVIipY97BIVWx+Y960tRlQOjDTsxyZZ1sb5gQDm2ZQ
         b+P968YvrvrQTt0dF0h4Hij/t5xNRrCHiowNX6P2Pbpk/K0b6V96Y+YxCbgQw1WkOrjf
         nwTn/04cObmeYmMTxYQrf0a+RmoI3EWKMoj5zE+fr/tE/3VybCxOGHuPHMdS1rToEa9Z
         S4tgi01/6xG85wqVHsYJ9y/VKx2E87R394htgKZFl9G1rr6Is08HPuG7ffM0NTczArSo
         BkiAaf9WFrgFg5UwR7oLrSRIJYQ4zgeKa+TUTd/WJdyw6UyqsSKibfx10PIVhW3zxPEn
         Sv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755702830; x=1756307630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJb3d8AETVqrx6c17VKT25NC3GUd37gM8BTULpRUjZ4=;
        b=k+YRVDzHfEblVTlrxg6ZC7yRYZNWzi1gxGp0A9Xyhgt6w5lfeA32k33LqB/Z/S3nVd
         mvHF+RUg+T+J9B3OsRiPVGVPNtXuFLKjP9IFwdohHwkbMjoEzqtty1H3ef6seQM8AzP2
         V2VKGfxwKwGlZYCb3GCPbi+xvQewKm8SNJZKKLJoVTQ652IbfDYrVRy7uxUJZBIdHC3e
         hN97NofSTwQikB7NWp/5Jevz1JPo9UY3iAHFNa2y1e9hmMnQUT5F8rdjKlUeHURbnSP7
         kuoiG/mzGQ6gmrCdTbFYpU7Uo8YoJ4fWH6umtcaJ5uzMxCXG81SrkUkFtErTTUPeQM2r
         /Szw==
X-Forwarded-Encrypted: i=1; AJvYcCVjfyNgtD/PePhHtt3Xhg7oIBZ4MI9MpZxZkDLfAXr2rOVKQwzBrYP0WsxHiGi5mYJ953nLLsjCbTckn9Y=@vger.kernel.org, AJvYcCWHHBFS9oP3xoRX2VQ+thJ3e9oq5Izmg6CwvSrH53Vw0Atkl+1ENBjWKGa3dIbzJkXzJ/zoIsNnv2O+@vger.kernel.org, AJvYcCXRKdEEGp2D6A5XRucSRqtH2fKlHZGO32CCnu8RBceIvJylDE5GomoPuA8u+ZbImNA/McPMrS5WNOFt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3PCib4Q9imKG28zZqhymNYxyvtczg3GIThumVDmuu95zST8Qt
	Uuh/D66KYbGfYIL6I9pW5FMnlstQjKf/DOaUCUNX09OyYOyzAnJZ8aSt
X-Gm-Gg: ASbGncsOld++N2X2LuL906tc5nc384yJVyi8aFp8CrqGemwLuh1pc9nsiXy2jzMiuix
	LitQUnWi2Vc8o2AueUyTv6jcukY6SK4pvEYjKCc3IMTN8l+Fx5ufgjXyOBj2FRGx0Gqgo9V/WFu
	+zheyjgyak0r3iCLO9Ic5eFtVTQZi0s0xQTM9c1JIIB7KVKBQJEQHv2uwNZnQJsBoXX9yidnCML
	UH5UXvrC8eU3eJFZc8xg70/hISUQlw3hluTOZ9d5wTEtiPuHcyfCOYt0Cj80P+GN4r6fXKFS6os
	1U0T6P6dU7jmbQMeCV3j3M1BwdVIHnXnd9mRQPWM0n64xZkVq2bKpjZCMsaPTErCs5xMhZ5VWq0
	zWhceJ0KuLLNe59HzymDv1aLg
X-Google-Smtp-Source: AGHT+IEdb2sJYMnTSfZPUYmdhPOAVg6v/3Xx6MGRH063d/okeRlKff1hM9JGS7oGjYBaXQSmwv0khQ==
X-Received: by 2002:a17:907:c25:b0:afc:b618:ca7c with SMTP id a640c23a62f3a-afdf01fa122mr277772666b.48.1755702829840;
        Wed, 20 Aug 2025 08:13:49 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdef1d34f8sm175905166b.83.2025.08.20.08.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:13:49 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 5/9] clk: tegra: remove EMC to MC clock mux in Tegra114
Date: Wed, 20 Aug 2025 18:13:19 +0300
Message-ID: <20250820151323.167772-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250820151323.167772-1-clamor95@gmail.com>
References: <20250820151323.167772-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configure EMC without mux for correct EMC driver support.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c | 48 ++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 3eaa97c7d79e..54e8fb5a7bfb 100644
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
 
@@ -1321,6 +1309,28 @@ static int tegra114_reset_deassert(unsigned long id)
 	return 0;
 }
 
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
@@ -1362,16 +1372,24 @@ static void __init tegra114_clock_init(struct device_node *np)
 	tegra_audio_clk_init(clk_base, pmc_base, tegra114_clks,
 			     tegra114_audio_plls,
 			     ARRAY_SIZE(tegra114_audio_plls), 24000000);
+
+	tegra_clk_apply_init_table = tegra114_clock_apply_init_table;
+
 	tegra_super_clk_gen4_init(clk_base, pmc_base, tegra114_clks,
 					&pll_x_params);
 
 	tegra_init_special_resets(1, tegra114_reset_assert,
 				  tegra114_reset_deassert);
 
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
2.48.1

