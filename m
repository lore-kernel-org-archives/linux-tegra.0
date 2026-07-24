Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F763EE1DC
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 09:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883867; cv=none; b=i8FGupCe+mfPbeganK27iyxe3/JrbO3vhgj/OyPc3SfG7wVxmhTAdxQw00V3Gchi3ryyhre0iaT8PXnoxY7laJouwKwssImaDE2wJny56QBntKn59a1mHtjyrkgI0FcHwrMJjOeAVsrHijRtZZJIpwi8dzeNzFYFS9v+jYFdivQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883867; c=relaxed/simple;
	bh=avXrZ+5B5tjwtUKvf/CVoHvEaPEqaWPpS7ZwUFxswLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ilcOxs7ibQZDcuyqaOikUqMgPMcYtk/jXGGBL2GsIQdNQGmf54jCQE54A+jqFyF+sAT7y3kbSvy42YoLZ264g50o+/EXf+LKmVKJz4IvOfZ3HT/nksdo46vXzqyctY3LmWeSIEtEpVDte3BRX/sUHsxYivXagoNNCptHryoyOPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PdbonZ0+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PdbonZ0+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso1238215e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 02:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883864; x=1785488664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HQnvaHgupyGQPniAuZ9m3sJLh0U25N0HAPnxpHfI//A=;
        b=PdbonZ0+K8CvkHkhmfNPZRo2SIl1mZ2JZqCEwKmWZEW1/AXWUDKVls26FrII52X6D5
         Ye3CgwEzYbI4RlWOxvtjcZupLhHMz7mLbLAcXPx6bC9BcRRovILbcVRMxc9Z9IyzwTc1
         ymrwyR52g/fL5XL9Z7lg5C0wql1nlpdbubbUXmmHkmracWnCIvI7SwhBu9dKtnyBnu5q
         hipsLOiNpW1VVivIG0wg9Pidqvf6IHfADcVLu0J+4EMcoSQSBp+yC3rrJ4ool9yeJPDl
         VGAUZBYslSd5mRwZe9DSj82zHpltY8tKnvudE844gcdU3OOjwvsqJ1p64eTBayuJhHcl
         9mPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883864; x=1785488664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HQnvaHgupyGQPniAuZ9m3sJLh0U25N0HAPnxpHfI//A=;
        b=Ts0BZ6mnibit8Q/RTPhyjf4RNcOUHdNFlrwFa7HEoxtRFY4/VFMgww21RkVYTpiXsN
         SD1KnWD1yNi4akn2uLL2YxFpDLoeYLIMzpo979Q7angTjbTcdjamiN8uX6TjPFZJBXnr
         DN+sOPqiqA6d+GlV+P9634fn1Vu+SjdBPzgq8hvJma5+19Boz510yq7KjWqoUGR/RWi7
         U4MGdBO0v6UR/lzMWapKayuXfw0ZuEK8GlbVicjt1ETNKBv5UpNf5Mx8bsMU84glHN4C
         lf82SLtsArOgFwJV53yRnhKYk9R1IjcEOVTprvv2pBr1sVn2ISVyL4QmIzZT3gsU1VhQ
         h1Yw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1fqRqoBb++1xNOlblEymhwtoTM2Qct+GZ6ozyA09OzsblKo0iTPzHMThNe65hiCXPi6rMyvS2ByoE5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG2nq8/SPDlsqWCvKeDFTXjxUNPcx90DLlvvHxG8PFg9FiSO/u
	FvYC1dbktvASG6ldE1Ed5CA3Kjsjde6oHGJSnYYnNTRmSU+j85c8Har0rM3JJ5XM4n8=
X-Gm-Gg: AR+sD12wiPQ9dnHGs9jZAkrv5czLJhZwD7c7xl+CkVBG+FQqy/2vR+Ql08iFWSj10Nv
	SCfSMXidgdwVad0jVV9gLOp/2lgJ6LgXUvitws5q+0YE+ItDWsmn0vIPhIGxLygVFR8IWCJ3aCz
	JDxw+BSjaMIHm7ndKqP40p+8Gm3qHT4mJtRQTlc9YE7XiHN02urWnfFztQ2Cc3KNxu0LHLfWVY+
	r6tWn8obHbESbhweuQyH3R6xWOx2lz4YT8b43KwA0HV+dgteIcdL7C7Vqeiy+uge3MDrfmx9jcn
	ptJz/F5rom9TnoB7gHaeXemLnrcRaVbJsFoH/xlFEsA8n5nbuEGF7E+Pl2qxf+HrN/KICsidQHq
	fhzeIZKxhBItJ/lUnG5ZjO4Fxw9DgvSoDI+NDm01tTbAranGxsEIgiyskyvToN0w0fHINnXknGP
	iQbs4Jvk6titA=
X-Received: by 2002:a05:600c:1f92:b0:495:4c62:9d43 with SMTP id 5b1f17b1804b1-49573d1ff7bmr72020495e9.34.1784883863694;
        Fri, 24 Jul 2026 02:04:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957af6b049sm62081735e9.6.2026.07.24.02.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:57 +0200
Subject: [PATCH v2 6/7] clk: tegra: clean-up simple provider misuse of the
 consumer API
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-6-56f306156d25@baylibre.com>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=avXrZ+5B5tjwtUKvf/CVoHvEaPEqaWPpS7ZwUFxswLY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyqC3CQlE9ZZIVg5FO31DSHE8VYccHPXetZHC
 CBbG7T1HaCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqggAKCRDm/A8cN/La
 hdLjEACXqz7q4lL8DurbW6pS/HNGz1tLg+/2ZSOd2a7o3s1z2YOBOJHX5vpJFLW/nIYJQw5So1e
 bjWoWmm6BY5JCwtK8uqJ2bemWRXcpKLvIlUZY0FVmgQESFPtFI6OdwKwVPkWbdp0eS6LCSh/q6G
 JuMStoA3PBKgBu53Ve6ciKUHdiiBoMmgvHq0BSCaqIGndaJkgfdg4XuoiI/jJm6AzgtMB/1nUqs
 jbtnez8Ei4l7beEGIPt0nkoY3Nkfb+0yB+/jwtJ6N0qPr6whsRWIHOAdwMqA8Iq1+REmschxKZG
 rXPy0b12PE93ipjZMtunqFaT6XGz/iBiZRfZ1C5sGRIKSwh58YEZyIJDtz4lXRKejKn9ziciY/R
 JzXZTezQ7P2U3Wzw8rE957D+tus8PvY0lrAY8jzO6MQ6Xm9T7WbR6OP7GtkdQMOKn0NLEShvhbe
 oVzeAVhbWJXuikQDeKeq6wN+DATSFxT/BCw9z1g0PPQ4DuJoYiOXw0DbuoIL/1ar9IvnWpzAWzv
 +YYi227ullORrzbQ225A5CHiau0GS0MokdcCulaJSeznIQwGVMkbJy6v0tlxRii8q2Qtb9CCoQI
 rqGyS2+E25eCLne9dNnKOrjnKPB1NUFEawcRFsnJ1o1K+N0G+eiJ5YPh5DcnSVvF1h1Kl0VzA/E
 k1+4dgdZ/1iNGHQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/tegra/clk-tegra210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 0c86cff719e3..df1d7b471745 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -1460,7 +1460,7 @@ static int tegra210_pllx_dyn_ramp(struct tegra_clk_pll *pllx,
 	udelay(1);
 
 	pr_debug("%s: dynamic ramp to m = %u n = %u p = %u, Fout = %lu kHz\n",
-		 __clk_get_name(pllx->hw.clk), cfg->m, cfg->n, cfg->p,
+		 clk_hw_get_name(&pllx->hw), cfg->m, cfg->n, cfg->p,
 		 cfg->input_rate / cfg->m * cfg->n /
 		 pllx->params->pdiv_tohw[cfg->p].pdiv / 1000);
 

-- 
2.47.3

