Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC7717165E
	for <linux-tegra@vger.kernel.org>; Wed, 17 Apr 2024 18:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713377560; cv=none; b=UYX8DybIAnebPDldUtId5U2fXUR8NtZhKcfQ2xs5AAg6vMA8PnAT0BJtERVFcOsJlvpvsvzmvKqYekvA+RoQYrIrqz8HvnBYI4MA7LZzbRIY2TVUgt42nFmq9W8BP8+JTPpzDFc0pEmmDfrmo5LO+LYYw8ukqP3BcsP4hZ2Qh04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713377560; c=relaxed/simple;
	bh=qiutvoq8Ltxn394+I+p61Cd7EDaVCd1CAoVuzEOOhRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nZ5GcT9Tbc2q3IHZyjR+/3XAosaYeEv0qW9Dzxji0T/Dh8XSbsMv19itVkc+XqUPRUWx/Z6tiokit0cndhHPG8J7kyIuY6SSiP3c6o1QmH91AZI/FFGghQ7ubymAke5++scCqswB19Q62nf1ayJ30m44H2VAHNCeHvd91IvAZXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S9W+R3jO; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S9W+R3jO"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a526d381d2fso201892266b.0
        for <linux-tegra@vger.kernel.org>; Wed, 17 Apr 2024 11:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713377557; x=1713982357; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+mCCarDxXlgu4hyBynvT4TbhwQR+Bl+Atlkmkkj0byY=;
        b=S9W+R3jOYSxYY2TTLBmfuuGaRbNB6lhAl5k7z3L0JpAsJ910zAG2EsQ8Y4nCNaDkwK
         6bdS21SQm5xcpf+IZffAMMudEetDDTsrt4/KHcUXFgEzl+q/aEAQBbt3ajrPP0BtqVuo
         Tt0Sp1xzh4EblTLKTcBonJ9oxSUlSJ4sDbxPyMvBWnzEpPhCe9mTz3UuxirtG397HI5V
         kUZ8GpjfsUVNLfiEi+0hExNQzXHhQTiHoAIJjt4OLpzq+zBq75QJp4mNy8XxV2oioh/Z
         Er8VUbilwU66RfVREzXEYvBKu6Nnt3UGWUnEouAgHEO3rKztn3ieXOk8wLAwQ5awgnhb
         uc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713377557; x=1713982357;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+mCCarDxXlgu4hyBynvT4TbhwQR+Bl+Atlkmkkj0byY=;
        b=PzB9rXAT7RfbPD7JuUhfzf0O0MPLiFMKdHN94fLBMT4aai18me9iftcM5mfjeZT9Fx
         ifaIaqEcAuFq4MVB4b59eldEk/6JwA34Q9a1QN+P+D63x+E3nxdIU31hj6gnC0Tj91zg
         2Pvm8Uk0xhggVb2xsWE6O/29/RuJh0lPmNIcQI3luE8qV1X1w04ILPus1i+acfHkFNGF
         MlgP+SblGuAFQz1wKpZZsHkfVaecQw8movcvNUVZzrvQhHng4mJjDFMgrzrU8Y5rs4P7
         b3LSIyjsTII3oDSrRICeIpF3T1h3UUPPXEj6DhxGqImA3gLCO0NTmb0UXmkDhCELpKEi
         rkQA==
X-Forwarded-Encrypted: i=1; AJvYcCWLoO64Z+AU5+t/wYIRWv/gRf/Vr0OFD7kB10FdMW9AUAk7mprINhYqni45InfP/nGGQDEJiWZGRo7jF+WXA9GbqoC35HFB088qXws=
X-Gm-Message-State: AOJu0Yyv5yT4k43ghZGg3lrkX8gt5VoUrisBru7tMBdw76yqm8XUCCHK
	btWBX0277Cni0nn5spJruSqqlyGP+fdg0Wvl+56gsBe4nvmlyHcex/zh5p4jKUg=
X-Google-Smtp-Source: AGHT+IHv0jRbjLrIABccBN72sxjNaWnPPUoHMRHdg7slFRmzcEJuQtNDuZyQ2IRZDV36Re1YyRPGJQ==
X-Received: by 2002:a17:906:e0d:b0:a52:30d4:20e6 with SMTP id l13-20020a1709060e0d00b00a5230d420e6mr131587eji.10.1713377557101;
        Wed, 17 Apr 2024 11:12:37 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906310b00b00a51dcdca6cfsm8413553ejx.71.2024.04.17.11.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 11:12:36 -0700 (PDT)
Date: Wed, 17 Apr 2024 21:12:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] crypto: tegra - Fix some error codes
Message-ID: <ec425896-49eb-4099-9898-ac9509f6ab8f@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return negative -ENOMEM, instead of positive ENOMEM.

Fixes: 0880bb3b00c8 ("crypto: tegra - Add Tegra Security Engine driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/crypto/tegra/tegra-se-aes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/tegra/tegra-se-aes.c b/drivers/crypto/tegra/tegra-se-aes.c
index adc6cdab389e..ae7a0f8435fc 100644
--- a/drivers/crypto/tegra/tegra-se-aes.c
+++ b/drivers/crypto/tegra/tegra-se-aes.c
@@ -1156,7 +1156,7 @@ static int tegra_ccm_do_one_req(struct crypto_engine *engine, void *areq)
 	rctx->outbuf.buf = dma_alloc_coherent(ctx->se->dev, SE_AES_BUFLEN,
 					      &rctx->outbuf.addr, GFP_KERNEL);
 	if (!rctx->outbuf.buf) {
-		ret = ENOMEM;
+		ret = -ENOMEM;
 		goto outbuf_err;
 	}
 
@@ -1226,7 +1226,7 @@ static int tegra_gcm_do_one_req(struct crypto_engine *engine, void *areq)
 	rctx->outbuf.buf = dma_alloc_coherent(ctx->se->dev, SE_AES_BUFLEN,
 					      &rctx->outbuf.addr, GFP_KERNEL);
 	if (!rctx->outbuf.buf) {
-		ret = ENOMEM;
+		ret = -ENOMEM;
 		goto outbuf_err;
 	}
 
-- 
2.43.0

