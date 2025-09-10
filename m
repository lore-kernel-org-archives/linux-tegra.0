Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332A43164B5
	for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 10:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501065; cv=none; b=bvGQvM8vvIMi8TKLGNPmnr65+B2Y+t6WTCP4GOSctDobnZO2lrprE4xGew+2dVVKcKROp2keHGPWElpxXIcDn91h2xeMwv05zEYoWEbCojzpotkE9W/87Wj4yNvoG/gV9AJ1hOf2kwxeNKZ1mVwzS5xlAe18FDI94NumMfB/cHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501065; c=relaxed/simple;
	bh=M1UcDlfXbj/5vPqirllwe6Mt+pNopstDQ9HKCl8tOeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iIRgM5TvLPqLRRqBiki1AigHfVzVzdSRtmjeIL544PosrJ+YjYkMiOw/PC536b2WC0Uo8ibzYnec/rYtxL4cl4b3/UjXN1iFCnQSnSC3bQaswEkOxMTB7E4lLbCu8XsnpTrmFqN/vS+xxgRZwD3rHieJBzGTvnIT8f98k06REzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g/M2mrch; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g/M2mrch"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-629f06935e6so684427a12.1
        for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 03:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757501061; x=1758105861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnBsMIetOHLgxvRafB9XZsD33miPY9fW8C/xMa98MG0=;
        b=g/M2mrchhOJWWaLk51lksJeDaFxJBaDowFb//By3kF7GJtlNlFe8k4CBd+GBPq72YM
         Ugw2IjQw8ZmGphzV4r0yo3ToLqzikF5X23LLU7TvPrp3VIkwxPMsqqDyDAQztYmq2p9C
         G5LI0GXx1G3YuXeQS4jj6FZhk8pie4JaGkvlNKxJJow3Ivt5wvw0XBI52CgzMDB8fxn2
         pncn1SkAcUdpdaYVwXVq/OL0kdDVpTOWhXuDWsAU3PH2my+LK+WUWkX0cGX3hxZzuP/1
         aTcvzBKoYNoWrTAt83eLSmWRbgTvXMjZiZzhBw66uaF88seIJbv4HofRJB5ueHcCxovR
         klug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501061; x=1758105861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnBsMIetOHLgxvRafB9XZsD33miPY9fW8C/xMa98MG0=;
        b=gPkB+GJYlMaRuRumA98mvRN36Rjy7JrVW7jK/8wDvpQVCs4rnoa15yt2r2vTWK8HDV
         UGDcKEHtEluNfrubA158pGypBxJzFDd5ahO/PlVdXFY3YQa2RaGvh/lnqD460wSaxs2C
         sUzoETux1xVGEUK01zxiF5LWxOQvrIoqztLY+1t5+uILPuPIAQ+TBn0R2XJrrakRfGAX
         Qd+BSJRpWjjsMCviBE61ulX2fzPvwPn0Hh0v8tsk5wxyxOCt7h2CWn2+ZbSAJTSK2Q5B
         l2Srjj29j4iYSM9IbL8jqIBHv/u1MMjLL3N7tpzIa8S/7u5E2cUawPcXc6nniXRt5UKq
         Mr4A==
X-Forwarded-Encrypted: i=1; AJvYcCX4fQoJtlU/2VA5+k7hNFwosOm4gW/YL4Rn/jC0m2leIXvK7QILK6Ab0xWTzH0+azXSEju2p9z5+Tk8YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymBZVtRzvSw2m3wZL51co166FL+hX56S8gPzsK+Tz7vdeIsjY7
	xDhJ/Yud9SU+QatuTuM0UtUpjPaqfLfzGZxiB/uYhnXy8kxK9j/uQKa8WIsRE6hxqyE=
X-Gm-Gg: ASbGncsdN06cGEFoEtO9vHRHlyFMkVP9LOaEA5EDFefAKwxvC/Y5o9E3LEe7thxFxN7
	MQHtK+wUppYVYLxcmvAN7LjBNpU6oPN3PyQmzzjLZlE6lS/MUKbYq65ZDHLvrU4r6k4fFR3yNco
	iqN3AlSBsPlrgeOtHX4qwYwMnruxRdm0WyOZE6Pt3ACNt7AMCGtCoZ64/21FciQKONGGR7OdXhk
	VLvhklGtTVy2Evyx8aV7szdHtE8cahYG1yZR7G1NexceMFzu6l1g3i8T7bEMny79g93I+SjJ6hS
	hqv2ZOwD4Use4CTBb5j/7znZ3Yfw+4tSLJMpTrKag6VL6HgegEKZzMash+8gIfRtc6yqh/J/1WD
	ssomAbKCfhTtlGfPZveIIJZo5G0BRlD+n2rQiuXY=
X-Google-Smtp-Source: AGHT+IHndwPgiFalUI0Osr1mhVatUVBRlt9rqFbB1yf+l748O6YjoHNTTNyX3DiefIzkA9XLIxL87g==
X-Received: by 2002:a05:6402:2345:b0:628:3c12:8732 with SMTP id 4fb4d7f45d1cf-6283c1294c9mr5449146a12.8.1757501061401;
        Wed, 10 Sep 2025 03:44:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c01ae5f75sm3144890a12.46.2025.09.10.03.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:44:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Sep 2025 12:44:03 +0200
Subject: [PATCH 07/13] memory: tegra20-emc: Simplify and handle deferred
 probe with dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-memory-tegra-cleanup-v1-7-023c33a2d997@linaro.org>
References: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
In-Reply-To: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2340;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=M1UcDlfXbj/5vPqirllwe6Mt+pNopstDQ9HKCl8tOeY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowVZ0vbHbIrfCHEW8zwOekb7DVpj0wPZ/QUTL8
 BZn64ePhuqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMFWdAAKCRDBN2bmhouD
 113ED/49eVcXsqTjBbSJYlPack6vuHMauo2QQxobnfuEmbtlDWntO+UJ23Hw6/HX5diGaMdpJh0
 DRjQo+Joy/uwKhWKZQspD5kVHzV/JRuO0MPAvz+pCGYi+CYakhOUAlABQgMrGHrSLMSDncw16p1
 wnMOytfiqr0Z9hML8JYbSRWbaKqRCv9WyJ+jiz1o67hv7ROWkAYUV8YG8TFCkhK//TbmDUdPy/7
 gwvE4Q8D27+qKxMOZi3Nq2oTTPA6t78zXStaDHWdxYRNFV4wAj7x7pnj9jRNhsLPo0Mszg2aUeO
 OBQtCfmpqv6RKdWBGGqRq13Q/OQhUbiN1AKCLKf9SxqTGcptBU8dcRkT++a4XkaFkfHachbx00w
 IVcQGbAGOe3HCAQ7r+MKgatZgeZX739NcvuPzdVPAXgYIiB/Amotv8hFymIyRENCFVR1PsnNdPK
 XpkVfKU1CvN508lZpOe0vYb19peu+f1EkBypIPgfB2o8ONdsVuwbl8ue9xf7PpWz2s5ZdOoUYuX
 tsHbc3msA/7P2CvaUspPs/7BFJxGuoyGJ/Sh6VnpxqoVh9E7yYb+L2If0cIeHrVVH0dDqx5vxbD
 fwJuei1bCGc2+KpTKO8TsXoWIeYG/AvUedwXfQRWs/ZvM2Zb2eB92LH/t6lgY4gGLyAWktgKTFm
 9AZAZKQ32Kx4n+Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Certain calls, like clk_get, can cause probe deferral and driver should
handle it.  Use dev_err_probe() to fix that and also change other
non-deferred errors cases to make the code simpler.

Also fix missing new line in error message of devm_devfreq_add_device().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra20-emc.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index a34636a1c4c55419c323eabfe96c5f27375df344..18e266dde5d2a0fb962fadc04161b03fb79f76cb 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -1051,9 +1051,8 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 
 remove_nodes:
 	icc_nodes_remove(&emc->provider);
-	dev_err(emc->dev, "failed to initialize ICC: %d\n", err);
 
-	return err;
+	return dev_err_probe(emc->dev, err, "failed to initialize ICC\n");
 }
 
 static void devm_tegra_emc_unset_callback(void *data)
@@ -1080,16 +1079,13 @@ static int tegra_emc_init_clk(struct tegra_emc *emc)
 		return err;
 
 	emc->clk = devm_clk_get(emc->dev, NULL);
-	if (IS_ERR(emc->clk)) {
-		dev_err(emc->dev, "failed to get EMC clock: %pe\n", emc->clk);
-		return PTR_ERR(emc->clk);
-	}
+	if (IS_ERR(emc->clk))
+		return dev_err_probe(emc->dev, PTR_ERR(emc->clk),
+				     "failed to get EMC clock\n");
 
 	err = clk_notifier_register(emc->clk, &emc->clk_nb);
-	if (err) {
-		dev_err(emc->dev, "failed to register clk notifier: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(emc->dev, err, "failed to register clk notifier\n");
 
 	err = devm_add_action_or_reset(emc->dev,
 				       devm_tegra_emc_unreg_clk_notifier, emc);
@@ -1172,10 +1168,9 @@ static int tegra_emc_devfreq_init(struct tegra_emc *emc)
 	devfreq = devm_devfreq_add_device(emc->dev, &tegra_emc_devfreq_profile,
 					  DEVFREQ_GOV_SIMPLE_ONDEMAND,
 					  &emc->ondemand_data);
-	if (IS_ERR(devfreq)) {
-		dev_err(emc->dev, "failed to initialize devfreq: %pe", devfreq);
-		return PTR_ERR(devfreq);
-	}
+	if (IS_ERR(devfreq))
+		return dev_err_probe(emc->dev, PTR_ERR(devfreq),
+				     "failed to initialize devfreq\n");
 
 	return 0;
 }

-- 
2.48.1

