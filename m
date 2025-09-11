Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26382EB87F
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757583815; cv=none; b=dw7yFfLgQilV80qU/nenVcqHI7FX+VG+03/ltxUhSf1rijXjTPpepAT2inU8iyTQAFq4khRxIWt0h2w8m6nw8EHjg2RK8Mce/cJcpkhqQL8DM8DjTElP7rdUz9ObEzeHTmFPonCwc1ZhUbikvLgP/A1Qd1q/M5yXLoKwFoAgN3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757583815; c=relaxed/simple;
	bh=cFuDo5Z2uP1vNw3Fz9+yS4AQ1ai8HrNLm9qBQebCrJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4f0P6/Mdh7/NNbU52H56cwO7o7sZvNka5VtoMxFKmfOAaZmLNRQxxqX2qIA0MR7TAEsM/WEy9HJF0KF+GzIZbfOYr7M6n4o8bLiJ0qi4BbpvAwV/QUGW7J7pXYT3LUjsqLs7Nr3WqqA26BvrRAQ55brzs7Q41yxnBBR9SVo7Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=icRsZ7Ty; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="icRsZ7Ty"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ce208c7505so78506f8f.2
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 02:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757583811; x=1758188611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZV4GDPvDgh6nloAqz+zBTonlpmiF4OqD5ra6XGnPRtI=;
        b=icRsZ7Tywg4DHrqE2CMVaIIliy1uN13NdpCs7HE4043f7SvRfcZ3Lsbtxe5nbz+u4N
         fprnk/eWYh8RMUsT66im6dK4tIVIS+c4t65KJm3GIs5BYqhOB/C/wPclZcIK0R3oeF+O
         l+MW0e5nrjH/M32NzW97Bg0vujgCfHyb37WQWTUKNfjzLU40qGmTJ1KItdY0Hj+u2QzN
         mbHzP465q9cgIBfnIdxHhOh2HzCs/IUx1Ht+3NQisLbL5VZdnwacHyj43so7QKlZnxHw
         pUMU3ywTSFieHFck/sinD9lLGILAxDjW17k1Bi50Guesu3kekm7EJwl1M8j3wMe+jNwR
         K0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583811; x=1758188611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZV4GDPvDgh6nloAqz+zBTonlpmiF4OqD5ra6XGnPRtI=;
        b=JbPB2cnJX/HaQTXVNC5hyF+KontQj3yjQsrkYcCBBozjzn4NGz9fvFIMPphNqnI1/a
         QGYsfIweh57DdW6Atp4QJP5cN41ozkLOhldHURYPoAwpmTNaFK1dW7//If4q4Qy6AQiB
         4aXvSGp6ECbYEB5vkg+WnDdkmuGcGMEtj10Wb+3rJKc3XGQ60oySRZ/5GTpJwGZAh6mu
         ufZwyC7gjtKXObgtXShIJQBBM0nHrBRnratyKFy6uSmYhXXDp+VaTlaQOtk4Xer9HT60
         /iYA8icNgvokiKkaw9WPG87p8weYUqlwKuJmW9dPqgpzlR19rwuF40XkWTVN2ow7P+LQ
         hIJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDWNFpdIBsxT2gxi6fTTuM0f5V+VSiNW4vk6ew6/EtP0ebXSFPUqVLCA0/h66hBY+tvsNU7juDO9BYnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+zmLfUQVAc/lUFa+FTGrB1mHojg5vkppl7wYJVXrfXPptj1So
	2zDA8on8XxcNuRI9YWYgIN1bF/Dw3pPkOhh9IkJxQfwFJjLZR6NDNtGMi1WPrVkz6ejEBHh96t5
	ys7+K
X-Gm-Gg: ASbGncumo7qfHMg24U14siSk2R43EuByohtLtRkjtniT448DQBbZbzYx21D57dyoLuN
	8d5LBdNsLKI7odsWPUpCnZhwtV+r1FnDKJ8z6KGpSjIDASXzmJnSzxpGPJ3viXNoV5aLTnKPpWd
	urj9RqEoZty2JyDg2t9ZjbfWNTlMJFzF8xUwFgxzc2aZCT/1PfzWS/yfMCiQ8Ok2Yw1T/9tbLfm
	1TqVyjRi9JTGnTnqkSsX/MeoHJm5nWO4qRxr6BmQlO7BEQmlFq+Pp7DsumhsY0MQqmFDs23JziE
	8aLR09SjmMV1z9d6Rnz2mat2bPyWsjTHO3Rx7HgrQca3833d2K1Xqa1iPJ+rrFs143XVubETUPM
	KX67sNHjKowgambZYN8Npq86NW4pExuwFJ25CM2U=
X-Google-Smtp-Source: AGHT+IH77lDTY1FG+waVIQeOJyVVL9Or9NAxNar8nZmacm66v/uym9jeHrXA1F4tlBZ3X+fRq2nh2Q==
X-Received: by 2002:a05:6000:2f87:b0:3d9:9347:b303 with SMTP id ffacd0b85a97d-3e63736d448mr7526749f8f.2.1757583811512;
        Thu, 11 Sep 2025 02:43:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e76078fe3bsm1759218f8f.28.2025.09.11.02.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:43:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 11 Sep 2025 11:43:15 +0200
Subject: [PATCH v2 04/13] memory: tegra20-emc: Do not print error on
 icc_node_create() failure
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250911-memory-tegra-cleanup-v2-4-d08022ff2f85@linaro.org>
References: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
In-Reply-To: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cFuDo5Z2uP1vNw3Fz9+yS4AQ1ai8HrNLm9qBQebCrJY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowpm0yiG9Cj04MQgd2COmd7fb2PCwWZ53WboHb
 erTOHPEy12JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMKZtAAKCRDBN2bmhouD
 13iLD/4xs7F24EsokEgirdfDDqjkHbCsP1pvzcEHDuqKtBhh9tI0UdQG68DH679lLSyTxjZwjbw
 1JTSwBoTjx8mnORC5X6aYD4LxtWs2eughZPa1+ahT0wUfPFhSWzvXIFFRy/1W/Dh8ZVEGFaG05u
 iqpxaKwmzafZh1OsdZ8cjQeFiNs5nPNRg7nMs8s3vEMaAAxCuXPTo2XkEyNqpq70SY+gMox4eEE
 XB8wBqlO6+GJbqIz8kEL3Bj8G5l9kj/Fnkes4Va41KeLuOUKDOnQYG+amcqDFWSAnqwc+ot6bxA
 bBT6Jo9Zx+1/rIWxhAkuchtdMRPdOBjeMs2t7tQdQ3HJS8c3OllDPk7SwlLbn5beSv8Beluhkrq
 q2ipXGTCmw8H/GkreviP1zJl0d8Mg4oEEgKQ64q+LQKHxCIyzY0OgQ2vROmNakEv1mfsx7hx7vi
 5yur8Fc/reChCG5CxqQF1PzYOZczRaWQLtqNYUC/m1SLM00dMjIQzVLlgWw1vTQvRbGfNCM4Rgv
 SaT+icMtmmfzOw5l3WDq+3WzpWucSvMykxXN3snkBHprG8mdN3swENO+pnFf+g73ZzsvrBA9bda
 Of0r0SpJAajHUaT9U/E9+e5zDCYVtmi47O3tLUnDEqYxnV5nBwBVwvdY6of3LTqLJj55hWl0+gN
 4shsc3mcmwACJkQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

icc_node_create() is alloc-like function, so no need to print error
messages on its failure.  Dropping one label makes the code a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra20-emc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 44ac55feacd3eef0bd095271bd3dceec60c34bb7..a34636a1c4c55419c323eabfe96c5f27375df344 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -1022,10 +1022,8 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 
 	/* create External Memory Controller node */
 	node = icc_node_create(TEGRA_ICC_EMC);
-	if (IS_ERR(node)) {
-		err = PTR_ERR(node);
-		goto err_msg;
-	}
+	if (IS_ERR(node))
+		return PTR_ERR(node);
 
 	node->name = "External Memory Controller";
 	icc_node_add(node, &emc->provider);
@@ -1053,7 +1051,6 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 
 remove_nodes:
 	icc_nodes_remove(&emc->provider);
-err_msg:
 	dev_err(emc->dev, "failed to initialize ICC: %d\n", err);
 
 	return err;

-- 
2.48.1

