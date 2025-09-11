Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2892EC095
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 09:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757583816; cv=none; b=HkhCs+Yvg/xc+MckIx3Cb6tVvLsBVUs0aAXjI6BsVbHyQPkF6l4qRhOQklnEggKMdBll4/9pcP0BM3bsls1jbrZNf1i05ARQ/cJTPY0Un5uzOS9pGCMOZsZl+WhpcnOZm9KaOwxUQaW6RIVpMxsR4aPeN+Zauvtnpq7O6zxK5ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757583816; c=relaxed/simple;
	bh=56WhvEjp/PteZn0tyO9c/SCroF1xJwxk2BOxQgVeGvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lKy40DNyX58J1OuSVWiM6szd8iwuSgPdHUEnDjXxAkVakjVrotVgiO5FX18NR/d9HhqDRUHCSeJUQMKmZakYgra8Ieh4KPXWLJnn3zYPuVvbsMd9em1lvV8lLKqWxc6I9aa8x3tN8BpWPfhaHq2NV4QSE2wvXxmjXAz9TnzEcU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bt5R3C4N; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bt5R3C4N"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45de4ebe79eso675825e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757583813; x=1758188613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WpkGEUpfxQBkF0AFg2VeVRpKBfctEX+Z1irkwx05L8=;
        b=bt5R3C4N/krEXlprt3p+xl409XPbHQTiFkjxok0unzjv8pQ+zTFV/bIq+abB+IW2FY
         6ASEIjKwf1B94yQOhpmIVGkTP9cgD8z+0A2kHGl5sYeRHWJlHC6XJoZIdSu5U8kWdpoc
         IuGBbhwQxQ+LwiKhWtYQofMES5++yYld0GdQLZnVUGf2ky0Eua8VhQ9elaR8k2s/9yGz
         NrH4aLYQVp32ntcWGOVEq7dAy/ARup63fWc9UNKaGgYBjQPghgWDioeCa+N282r4EtXY
         xdmnEPG/MlAbdPB/1TlrU7znbDjQu7loxl9161c100S+7x8RM2ihkUX+kmzYM6Sg3Wov
         9H/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583813; x=1758188613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3WpkGEUpfxQBkF0AFg2VeVRpKBfctEX+Z1irkwx05L8=;
        b=kWJ4F/Ed0WWzwzEhn9up+6deECjm7SUO9SSbJER3uy6XkvSRbPyxYic74KFixK2NmH
         YKwRDaZgM5Oub1rSYTDMHFNDZba4Acoi+rsBiyYtvO03vzRTRA9wuz/61Txp4clbKy27
         76IxhExQXjTiHaWYMzl4rSo5Ys7eYqtZk3qodZ/pMqvIltQfE0Zm+2Yjj9N5v0//k1XL
         o1L2MzbP0RyfN5gGLusT6Q3OBpCvV9mYlMizughMsz/Qk2LgEeycYUghP71MxvhwOUTq
         advj7u2kl0KFAFXt6gKZ5qpxbwU04U8Sgtbe4CYc75LOmiCWxqvjraK/YUrbEeAk9TBl
         R1Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWbrtUlOAwObW7zHBYCjtUhVEYFrW0vQtEjnKGDhVssLMZgek+2dbTn9ovCQUSwbR+YRFnXoCO/K9DvGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxeHo8EL5xsdHF4MahaX2YBGwU1fVwzuzwikSHlwqLhHTCyoKj
	utXSlMm1Sqe4/jWCrp8QeFZbij4On4EpuwfVKfoDqI2jeCQ+MOsmmpYAiQv/I2tm6b2qo+mh5dT
	qecno
X-Gm-Gg: ASbGncu84s4yKYvIw45jOfDTqhBIMy/4fKCUqqMMX+/imFN0SGgnXAn5gqxW2b8udTA
	af5Av+OfsnQw5In+SzA44nvxRPnNhcXGEN7eUmmu9Z94SU4QQ5Ty8KCgpVxocp+Orfm5FUKrAMW
	CMLkFtehtMMqtL6WzQ1mX7ZBuVys6eFnU9quaT8ibJgXYULEzBDemHtfLaZHfeSqXPcyTtM+0vP
	bRpfx9OTPZbS36AcXTD4/C6MeLHvXDNiIHsfjZFunYPZ1xRdecj1X+aGeG3a7OG/kbKVvpvz8aW
	2GTPkOafUGCh/dzbC5fXraE54a+fXAyvFHk6nn+Z488B5dPPRBgxsOggahZnX7hI6RStQm272Q6
	RcimC5hFAT9TTGiDD64XR3LDiTRNtGgSNTqgyGr8=
X-Google-Smtp-Source: AGHT+IGOi8yePNpjL9Di2sL2vnUH2TM8QtjY6K907W0jyRKbUhHFCvXr5nWkzRUEpbuxYpHNK796lQ==
X-Received: by 2002:a05:600c:3508:b0:45d:ec41:e0d2 with SMTP id 5b1f17b1804b1-45ded9275a2mr42386125e9.3.1757583812634;
        Thu, 11 Sep 2025 02:43:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e76078fe3bsm1759218f8f.28.2025.09.11.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:43:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 11 Sep 2025 11:43:16 +0200
Subject: [PATCH v2 05/13] memory: tegra30-emc: Do not print error on
 icc_node_create() failure
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250911-memory-tegra-cleanup-v2-5-d08022ff2f85@linaro.org>
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
 bh=56WhvEjp/PteZn0tyO9c/SCroF1xJwxk2BOxQgVeGvo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowpm1xGat8rkZCvILMqUYbZN3jt3PPw6hxPAdh
 THBB4Skd8mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMKZtQAKCRDBN2bmhouD
 1z1sEACZH4T1RNX6pSPNQRXKPTNegmtWwifR0vG5bf/r8FnbJ0aZzbDlYHhXhk0GDlP8YrVDiKz
 dA51H3u/TRAaOWIMEQAXVVEbOOuwPwDYzpIw/TUawL3xT8pvO/NjwKvO4CkBAZMy2OGbSYaZUyc
 ICG2I5hG3f7f8MwGtkt6ndD0A2EHcPSt6BOEyTgu975w9jQrHLzKQrwy2lOYtlEJYhLJ4eFPQ7I
 J1e2g3/efiL0FNZcRHmX9akTZGR3cAE1h9fuea/1uah2fpRl11kHF0JVV9rXodfWG3D4yWdBFkQ
 /iA+IrIAm7U0rM7SEykgTpb7bTpvTPabITxGxQD6UyPzR2CTXwKY0umkhyRFJ+3PCwNY8MvBBTx
 wjtTjk8W7/M9Bra8bSMmHaz6QvyKEoP16cRVA7klBrrTs9QBP2hLGDeZ5413Sj1+g+EfVnP6uYF
 aTq7tTKDTMICV/Ks1XdlOTkVqGCaDgJVxGQi6yUmpg2BvUbqm49+3mXojxTqv5jwt7qrPBqj0iM
 /KPg7h/nvvB2lr0no04+2GOxDjegZED3q6IG9xKR4HHJSqEuVY2g+gpwUGi1ScETcNFegbwyRjo
 rxbyR/pqPV/HMG/wSqMYq+6LNQDtzPAV7dx58sgryXqU/M3M9bFJ7TugjyMLWvRLMLGkgcEQDZy
 FV6QJn/vu77kGLA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

icc_node_create() is alloc-like function, so no need to print error
messages on its failure.  Dropping one label makes the code a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra30-emc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 921dce1b8bc6382ea66d70ad0f2a12283316ad90..c96aa63a5aa085a409ae7ec901d2a210748f5bcb 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1534,10 +1534,8 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 
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
@@ -1565,7 +1563,6 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 
 remove_nodes:
 	icc_nodes_remove(&emc->provider);
-err_msg:
 	dev_err(emc->dev, "failed to initialize ICC: %d\n", err);
 
 	return err;

-- 
2.48.1

