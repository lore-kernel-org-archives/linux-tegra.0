Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA74184548
	for <linux-tegra@vger.kernel.org>; Mon, 12 Aug 2024 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723469675; cv=none; b=jfBN9WG7cyfSftnDLpVyBfXQ0Cu80YRgLhzOoXQzJjUR9sj3U8mBJ95j9K4LxcUMG2je0FEiemNfzkKjnAW/VBadlTf8YSMsYHjRrNuDQIVYpm+0GFu5vQImJ44Xn5vp37E2Jr3Ab2/2tnnb88uJrdMSJ2WRJNwJEYGryZbTJ1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723469675; c=relaxed/simple;
	bh=0agCSQdAmRYcJrMldLHC+cO/HYUzM/jNOwE7xvoTJWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GY6HDMDs2Unc/HylQZ4k60seJN4EJSkvWPPd4tDIeAUGA9wXwmSYfjS1dIu1adlzgtGDo8dqfSdDV36DXpr8Z179ndzCK8b2kwl3tXsFdvVBR3DJB/eIfakLib0r8lGfL8HwFFz/bYBGqVDCxtqTzplbJ9GPOb4A1CLlOI44Qak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x5/EoD3p; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x5/EoD3p"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4280c55e488so25330685e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 12 Aug 2024 06:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723469670; x=1724074470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HsPnMwUlmEcWVK9mERUpPYYwG4/ZxKmrdaWPZk7BfDs=;
        b=x5/EoD3prrcyXNazsILQ2iNFnFIM2mAvbTgykwuwfMjS9RQ/MlZNJDUO4dgdOC1GDW
         EwaK91VugvWuHxLefXM5UY5M5sUqW+BrXSoC8yZAhrh3Cpv8rnB5cHxXDoQrTrOxDNQE
         lAoJpOgMxdBgPw3kkOCFHuiTTmnNVfAAQlSwJRIJdnAD5K5gMjHqCgEdpvaY+H+fp2fO
         Sr6lvH3oA4urFP/Lh9nHyFuPfE7cJo2bunQiVIzjD/DnFJjyr149E3BZ7O4gOD3KEh45
         HAjAkwZr57lgDEjUO0ydCw2M31dp3j8cOK5cFYmcMMxf1zuoyhtK058x3+jACGQnivzg
         ZjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723469670; x=1724074470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsPnMwUlmEcWVK9mERUpPYYwG4/ZxKmrdaWPZk7BfDs=;
        b=cUGiA2jeouVe/p9U+JbeJHdPZo39PDWY4orCOjZ1q8+14weBXlY1wGjZffEiVWg5MJ
         zTvdmqgfvGlhaiMbIb7rPLnkBpSIq+VuiRCCBaV0e6e4/wl8CZuNltdjkVPN/qKV/i10
         pv0e2m0pMvHY9GHxW6P5T0fABZ1NdYLNfMVfOWtbSdqOqw3l97POeoRmiy+U9aCIa/Yd
         2GCk+1ldr3FATerlOZ20vJKTF0bADW0ewaV26tDHaQhsvhWhYCGrHas6z7mMG87nFR+x
         P/k8iJtddjRNdhplD8AXDkesYRwXX9sksv6+Wt62pwXHyNtNmq34WW9OKoYzXHBLBxDa
         NzuA==
X-Forwarded-Encrypted: i=1; AJvYcCVn2PO3CtMYANYBmlo+QQ77ipDL2+KxtQWxeI3G14WlyjshblqF7GeqTXZNpRtCIcOWlL5W8FRlTL77yR1zqiWN8A0R+0oQfit2GIg=
X-Gm-Message-State: AOJu0YwHEJFijdzfHMyzEGd7qsbl6QJd1+uu/SiCDY/QfkY/VZmE4JBm
	+e7TFeQEt5J8cb5J0ZmuiSSYgvpd5hS+FwfG5XVMhED2FOZ/mCtTqemn0ac6bp8=
X-Google-Smtp-Source: AGHT+IGNiDAP0NpC4elbocTXmRTxZwypqEwP2T7NoNQBek7gp6Czs1sj30tLHKhrLESNRMviHtEwcw==
X-Received: by 2002:a05:600c:350a:b0:424:a401:f012 with SMTP id 5b1f17b1804b1-429d4ce06abmr1140655e9.3.1723469670362;
        Mon, 12 Aug 2024 06:34:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:34:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:34:01 +0200
Subject: [PATCH 7/9] memory: tegra20-emc: simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-7-5065a8f361d2@linaro.org>
References: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
In-Reply-To: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0agCSQdAmRYcJrMldLHC+cO/HYUzM/jNOwE7xvoTJWs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9WsUwse3YgLVrnCc6/fae3A3AcursWIyaSR
 hcKG6MOheaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPVgAKCRDBN2bmhouD
 17skD/4mk0mqH2rEuc6Lpcv9Fk9Z9Ofg651HdFCPIT9SXWaxdSmtuzFF10HgMdna2jAU8gVSx5a
 teBho/PIDCcTaBnRl2nfMGaohe9F6FvBXUBt3gyoUK8ws7VHkvJDSa/KJPlwupUztYS3WvUSHFJ
 /EKc9LxNYJ8WOl4h+a0KHjCPQTOMJphsYrmP5wO1v5mHNoWuBnbxURpMSzEe0EXtHGKbL7ftoyN
 V/BvKwz/AlFcGp4vn7CRcjByp042rkUjWrM5C4QOffDdnaEVCsGlTdPd+Q9j/oGG1oPiwjNj9Rk
 EJXOpzGg5QR2OlVBAR/BiPH/O17Zo3xLAKEYGwnEv+9n5xQfoRhFkU8txLoW6kUVxO5EHRHQ9Iq
 VYYUKRr3n4cNsQXegkWk0h9MKqG2jWOe/sLHWWTNQTxBLqOo0PtVSqPwNVK0Yo4xadzdNZ4B/xJ
 DVjB1RIhzwfhUHHCqwIVYmOMmTnMUTTJZz3r3S0skj4aAHPWpyPj+S23pPD8bzAWFXDWETY+Vsy
 Qk3XC066YomliavGy2tfSIyRH61lPSAHFkN3db4nQcAqKVS8DlXh1sFwiBMUK1q1oAPQGu22y9J
 QwLihlnuAYhwjSTYotz/5tGVxKjNaIefeTjk+X+fU46eFbpPJpU7TYmqN7iQqDK38/OJ8k+YGO5
 /7zMI7a8ZaQdSXQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra20-emc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 97cf59523b0b..7193f848d17e 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -410,7 +410,6 @@ static int cmp_timings(const void *_a, const void *_b)
 static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 					  struct device_node *node)
 {
-	struct device_node *child;
 	struct emc_timing *timing;
 	int child_count;
 	int err;
@@ -428,15 +427,13 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 
 	timing = emc->timings;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		if (of_node_name_eq(child, "lpddr2"))
 			continue;
 
 		err = load_one_timing_from_dt(emc, timing++, child);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
 
 		emc->num_timings++;
 	}

-- 
2.43.0

