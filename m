Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725B93128AB
	for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501061; cv=none; b=bmElqi4LaE78QN+BSgqRHkKkA0WLnnrfOjYH9IjTGxuul9XHUQLlOlc0l22EgxWRKAklmHsz29ymiL5WnQRCx5KhD7YIFOphCVbkiw086QCPbCgDuVRBcrqur3zTCC4/7A1gfkEMdIn/Au2X0GZNDTq7z9m+diQZ4wE2V+3s8/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501061; c=relaxed/simple;
	bh=cFuDo5Z2uP1vNw3Fz9+yS4AQ1ai8HrNLm9qBQebCrJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=INDu/7c5RNsoN8znpb/lvdVGOGLAhvIWl/40BJhl1RC3ZrY6SHt59kMGiHryteJe6EcwKkPSQ8fLZyDEXanGjjMdmz8gRqKjkkYM/BzO9asJsSjIhO2vb7CDoB516ONCWeJMY4im/+uqrhcERG4yAoxXkm7lk2d0xCqkCE3sj/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tFoYX3Nr; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tFoYX3Nr"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61ea08e565bso737760a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757501058; x=1758105858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZV4GDPvDgh6nloAqz+zBTonlpmiF4OqD5ra6XGnPRtI=;
        b=tFoYX3NrDgeaIVYD9fc+qmBtOu4hxqDEoRvjQ1jk+I39/3GNG7MJw05Zys2PRhQbFZ
         iD2HxfmYNabTF8Dx1GedgGPawqLp1v5TR+g2cCardZy8hQ/tTdCHjQp9iAZwZKY/TrpB
         29pZW9V+IxF3nWdxDbAGx/al+xQoewlctg1DRZ5HKz+Ty9cvO7iE1D2y/ve2mkV1lnYY
         xWiGQBdN9b2f11Cb0MJKBy/SRZTN11ABV9m6bMkPJIsx13yns8Wv9bC2FDkOJ79EnusQ
         qA1C9kVb/Y56U2UKGAJac/dgJUXGBBBjb4JV6blUs2Zpgbe07AeKWw/ycS5BeKewrDyQ
         meLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501058; x=1758105858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZV4GDPvDgh6nloAqz+zBTonlpmiF4OqD5ra6XGnPRtI=;
        b=ddlMaecfnN6vfv5bUjGJHBGl+0sjYnI5NMlES96I7i+yaC3OfkwVg9qczFk9GKUjRK
         zpVLq8sAFjrFR167GqBYT0F+Sbg5EO9hAjQkL4kjBcwpeSWdegGjxamMX/6gs8r3yCtu
         JmspEskUoALy8VQgJLnd3bI9EYmPGFoRDf4LN/CyZnGdQ4gVU7GJCW5X0WjwtUw3LCFK
         zSTQA3HAJ9cXfZYfxEtCq+Kjr7SqhfRskANiglY4uwgd+alc/KKWLObzKO/a1NuZyHKk
         FngdflW7suC1jiJWwTkkpuOsZtC5zUx3I8AIGmezLR1DPR34ahTC4chYhaSHFIj8JSHT
         okCA==
X-Forwarded-Encrypted: i=1; AJvYcCWEeelc9oBKP2waNnLz5WgoheT/yXxxXqbF4JvVXL69B8spMr9U/s/pSeoo9slFkskeXipU/tnEDR82iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw8wgfPaKgK9nwA7M2bb9ezCdxZaih6odURax1EO/y+FipCJXY
	x0xWm0nKkCYVDmG09ZGy21anDgjxIN0IFwWhsF8U7LxLk63CxRSrTZTJ/yD2sf/LrcM=
X-Gm-Gg: ASbGncu9a8gMEXmXbLynvG2p/kvd0jJi7bcBnnj6YGLUXdLL/WbppgwB3Auj+EQ3VBL
	hLP0C2HS8ciNfSH3DPAmsC9zry/ShXlMt92T9c1JGLw39agGMj8WMLZ253P87Yb3IzKJFFgsGTO
	YfEECYvwk3xUacskVZBsZBwOIOKZos4mTOIyEBdGniptPGYvLyt8a0rzohsa/FR5shsNoV2vV5w
	ukAfEQ0F7g55tBR5BOGSjuOEfm5X5an930g/s4/ZMQ4FIfkdt9ehCmNndEdwFDT5St1jdIginA+
	02ILLPBf9aSutauJgI+wt0xNHnRBdfEAJ50jC39TJTG2beIIyr8n1Yjof7qabgCj6zLI3nwz9fM
	xg+We4Xp03KInaBMY7ue/GI82UJJPyXNg59kl05YrXdo212pCrA==
X-Google-Smtp-Source: AGHT+IE2z50n1Y+fVrBJbhvZ+Yu6Q6txu5Ue5AaOkSpz4PTL64znjFvDGWeAFtGSGm/CP5wy6EA9fA==
X-Received: by 2002:a05:6402:27d1:b0:620:1c6d:e6dd with SMTP id 4fb4d7f45d1cf-62374d5900dmr6651661a12.0.1757501057775;
        Wed, 10 Sep 2025 03:44:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c01ae5f75sm3144890a12.46.2025.09.10.03.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:44:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Sep 2025 12:44:00 +0200
Subject: [PATCH 04/13] memory: tegra20-emc: Do not print error on
 icc_node_create() failure
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250910-memory-tegra-cleanup-v1-4-023c33a2d997@linaro.org>
References: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
In-Reply-To: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowVZyOnCDYUh2ezqW6uqiofQ9nmLxoCR8QObZj
 ZbqsoKFx1aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMFWcgAKCRDBN2bmhouD
 1x4GD/4yLEW8npjhNAxrrFsl8kxcpgOPy96ceACrngB37Ooxm34M7vDlPKMjw4wPxepJLm9FCMs
 QUhi3Ap/9kW3BYyvc3RVrO6QM30JUIuiZrjmBIgkrFL8Ai3uSYvAQXAI3kug4o9c3PkObldEQ1+
 wngIaWUNRpXy2p60s0x6kFacyq3h+KFq7er9vpsorP3RIgqvPwoIW3W5TSHHZZaEwcHa0oYEo/8
 4INQT6FcvRXyVOisa6nbvKOIED5fvOAt5fbZTiS3QJrr5J0MoXpRstcWg+7njO4pdYQtfqi5ief
 CsjwR38kU9ldHQhrRlNcqAPanV5Ym9Kpib0ku2oJ78Gd/w/ftd8oRqF9RB9gQvsUfwUmgGCgnD2
 x3+MtiewRafEmUKyZxtJTwmJe31hP6/hDm3TO5t2zjFBfy9wxyGsrVRlEx3nhD5kYyr5uou3bUb
 Ln2QBdq+qZbHbXVDR81JcmmFV5UEPhHKkt0yexYCI9SbNcYR3yuIRFWomtZ/dMpwm/Zrb8Txw6u
 OTt9t+zzjCffjej7os33yHBWlQ5NE8Oa2+LJEnAs2Mf8AcQ+71fjiSLsOtBupMC8raV13e5HlZT
 KgqwQTqDjlJTPIFyGNduvOJ3Opnop6AhKrE+CEZvLcVVhuNnnDkwq/tdpXpxdVI90Vdck9KlB5/
 +5Nq0n+8umFn1kA==
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

