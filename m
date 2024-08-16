Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6559D1BBBE7
	for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723805708; cv=none; b=X2rFRGSFtm8t9demO3c55w2qucx4s/Y5Jx18KAUv6BEJAYUqotKMzn7u98OlvrFV+EPTH0opKm9Wdto3RNWb9lajsq3EUj7Jx7OHQm/Z2K4Yi4IjBXcSYpZFZG47T5z3m/5Aq8hk3oR239CzWdGTBxhK94sQOVQ6hbpfTmPq+LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723805708; c=relaxed/simple;
	bh=sLKW5NlUarRy9P9QN6fIhLPqmjJ63FYokcmqbGYfWRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RuJ2KkNrYirUZ75Z6ZxKOOHpMCpa9CdIdCrOXk0xvspnN+gBijjgNhLkKSGoe4hn0ENtVo3cM2bUFoVwev+uGtUqT7PdzO0019XRueyuEPTZTrfraKgLN8Wxew+9WoUWsf29qw6cDqgKEQnesW/pCddwg2UqsXOrUz8PktCh19o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OjYMvv1m; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OjYMvv1m"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3718eaf4046so758471f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 03:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723805704; x=1724410504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sr/Bjb9gFmI1Ph7TbTdrGjwvQKhvfIr9sm0jS+XptdU=;
        b=OjYMvv1mQ1GVTLtiQpH7vHela0nXJpHtdfjNPDFMBytf7Px3cP3CHrgArhvlTigQen
         mbDlQ4LCMwDURdEtifl8v+LPhY+81bbdqhi74db1r5D14IX6c98mWVpTfDIHz4rnIpoo
         L6eBg6dKyoP2Al6ZRBGRYF/LkCNIzhdkR4vibRotd75K/Ck1cFWIOeWZ0VI8P4so4nLV
         zAmKBNCx0rag/X/Ytikj80plLAP/RFg2R3Bv3+O0CRcx3hp0JPh1+Czc53SwicmZ0hm8
         zP5PUj4iGxAUsUev+2mRsMTqfF1DJLe8RJJb5gotpVVKYLHdpWtyrE+rUvWaq8J+G/m1
         jjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723805704; x=1724410504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sr/Bjb9gFmI1Ph7TbTdrGjwvQKhvfIr9sm0jS+XptdU=;
        b=INeW/FI2cbMv2sGD7n0K1ZFgWU51+lHO1kdG70NxT3K+kKHHyPG26LionMo31Ej/40
         fMMIE2xb223akcyiXuqSiTUKw/Gln9qW5royOtk316WGJALuNWYabhAThBk50szV4Akj
         9vRX8PU7KsDLoUBgc40LTJxTg4SZepQ3PbVE98NtQwBQRyyJwK1qW6Mq8x6U7qLkgtqh
         4870A+bbRq87XqtSFVxv2sRHt/wa56SXCd7nDMs93KRGLVYoojPcbQ6HTE2hm85HNXgL
         seU6KaygcCfNJ0q0ljUHvH0utE8Dl16tpUhHRsayztL4LMvX1ktq+uMp/1RvlIiQL5av
         NAag==
X-Forwarded-Encrypted: i=1; AJvYcCV9iHFxs6reVGpsGd6x3gRtiQk//sGgmFaBk3qUCasaWvyxcr1tBY5heFzt3E95OpRLfmV1BAQdTyDOMqS8jXtFouu5NIgG/nJK8qQ=
X-Gm-Message-State: AOJu0Yy19UXixH8q42/3HazeXRTacQnAqO9T7QbGmgJC1BJlq9a8GQP2
	DhHvBr0gusWXgFtJhyh7wYandf/LQjm++fEF1Zs/NJ34re8ONxk4wG9C4VMZvOE=
X-Google-Smtp-Source: AGHT+IHb5s6ZOWiwXyP6F+jIPWHsZbVQ1dRLhQ/L4QjqU83lUzy6ofpXe6PirIt9dJ+aARfVbvTAsA==
X-Received: by 2002:a05:6000:ec4:b0:371:844f:e07 with SMTP id ffacd0b85a97d-37194315732mr1838165f8f.10.1723805703804;
        Fri, 16 Aug 2024 03:55:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 03:55:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 12:54:36 +0200
Subject: [PATCH v2 12/13] memory: ti-aemif: simplify with
 devm_clk_get_enabled()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-12-9eed0ee16b78@linaro.org>
References: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
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
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2695;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=sLKW5NlUarRy9P9QN6fIhLPqmjJ63FYokcmqbGYfWRo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/xx0XSFMIPdFQTm4JsvW1nfOTyJJMoinp2O
 kk2gGkLpXKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v8QAKCRDBN2bmhouD
 13OSD/4riPyN506VHZZ2EtdCDx+J9tg/8JMuyGK6I2fpgTQ/UApIm8QW28ZbKP6Gi4RGaYPLju2
 gsf2u14b70xcxQIsZQ0/4SaYjDmdyBfWtO7eiEPax9Ib3ezPylJMPsH0oSRv//ITyMXKC99xC/f
 LgjNORmCyfpeum/TIb+/wgJZfIsRcuscyK0xJVvf9KnipkclzhvsK+gZGCpj2HaXsBa3mRgBegY
 weZX5najE0BjcG+6o9LNJyCW8zuXfJ5jwNUSbG6zCGHFHV4nF+Hn6yGr9mhswoD/FQ6sl5WO2gi
 9wGfXT0evEkmVKRgBfEGpOS58HPNPidZ1vm7kOImjVP1URT47cFw0KKF0lm8B8Ah3YXo8k8Wsmy
 jvSOvU9NI5IL0iIcFM+tFqcpIz9oyg0M8bxPFDjgkXONJMDo/iDvq/LIyIzWELnYMKEbpKbnMpw
 PH84I+h5hz++T0WuBEKiwAYRBuXVsnJkMtJA7XHBjjaISe5K9a6xBYNDGkpleHhkaozEUcn7pQ5
 NyBlJOjDbmx4CPXuGGm6GKBwBCjPj1kslTvLNQUeDPaU84L+J9Q8nFNbrDS2bKjwrJ0YFx6n8MV
 71F+bp26PTcPmIYfGGMF+V0i4HBYaBDhYviK1uQE4rEP5Pu6mMVip5QJMvadXyXyCOyGSopSgoB
 muVoxO1VS66+nzg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use devm_clk_get_enabled() to drop clock prepare/unprepare parts and
make code simpler.

Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 drivers/memory/ti-aemif.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index 360f2705b1ff..bb9c8132d8c0 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -344,14 +344,10 @@ static int aemif_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, aemif);
 
-	aemif->clk = devm_clk_get(dev, NULL);
+	aemif->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(aemif->clk))
 		return dev_err_probe(dev, PTR_ERR(aemif->clk), "cannot get clock 'aemif'\n");
 
-	ret = clk_prepare_enable(aemif->clk);
-	if (ret)
-		return ret;
-
 	aemif->clk_rate = clk_get_rate(aemif->clk) / MSEC_PER_SEC;
 
 	if (np && of_device_is_compatible(np, "ti,da850-aemif"))
@@ -360,10 +356,8 @@ static int aemif_probe(struct platform_device *pdev)
 		aemif->cs_offset = pdata->cs_offset;
 
 	aemif->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(aemif->base)) {
-		ret = PTR_ERR(aemif->base);
-		goto error;
-	}
+	if (IS_ERR(aemif->base))
+		return PTR_ERR(aemif->base);
 
 	if (np) {
 		/*
@@ -376,7 +370,7 @@ static int aemif_probe(struct platform_device *pdev)
 			ret = of_aemif_parse_abus_config(pdev, child_np);
 			if (ret < 0) {
 				of_node_put(child_np);
-				goto error;
+				return ret;
 			}
 		}
 	} else if (pdata && pdata->num_abus_data > 0) {
@@ -391,7 +385,7 @@ static int aemif_probe(struct platform_device *pdev)
 		if (ret < 0) {
 			dev_err(dev, "Error configuring chip select %d\n",
 				aemif->cs_data[i].cs);
-			goto error;
+			return ret;
 		}
 	}
 
@@ -405,7 +399,7 @@ static int aemif_probe(struct platform_device *pdev)
 						   dev_lookup, dev);
 			if (ret < 0) {
 				of_node_put(child_np);
-				goto error;
+				return ret;
 			}
 		}
 	} else if (pdata) {
@@ -420,21 +414,10 @@ static int aemif_probe(struct platform_device *pdev)
 	}
 
 	return 0;
-error:
-	clk_disable_unprepare(aemif->clk);
-	return ret;
-}
-
-static void aemif_remove(struct platform_device *pdev)
-{
-	struct aemif_device *aemif = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(aemif->clk);
 }
 
 static struct platform_driver aemif_driver = {
 	.probe = aemif_probe,
-	.remove_new = aemif_remove,
 	.driver = {
 		.name = "ti-aemif",
 		.of_match_table = of_match_ptr(aemif_of_match),

-- 
2.43.0

