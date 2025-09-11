Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030362EA74C
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757583811; cv=none; b=es4t7ZqVj8TNpJfExqkuqoeK5+4Ge5Kv0faqB5xHdKo42HR/4262Q0ruqHFJogpQR7wH6d1PLUiQpHP3xkrQ2lx+U1uiNlQ9X0NnEqLs/xRSpB+2QLpLDKGzmTdKGWdiT2QBemTTZALC5xOzyckQ+0CAGxhAIbUiOCTlNizyTTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757583811; c=relaxed/simple;
	bh=LQehtAx2kmaY57h5u012j/ttcRk/Yy2y8c0kuDacy/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfGQeHWTLybHD1wsiSYFbVviGRFGrzwsOYuHggdA+OsaFiPzX7f8NUvI610bkLV9whBXorPDotHeRHdLjor72JAgAZ1HnzOEM10otaVqwGGSJZ9XVXtK002AMwoFt2M9pD/RVHaHAaNJUmyH3zWUvezJpEN81/xZFmK2DSfce4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cXOB0Zoj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cXOB0Zoj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3e2f33677efso7559f8f.3
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 02:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757583808; x=1758188608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJlYrA2HvnrAW5ag27Ypg8qPNoGajHDP94gxoPy/A6E=;
        b=cXOB0ZojmqUw30QW4No26lk8/jA9q+r+E90cCj7IYs49jMK+Pu7K38t9DNpfDhUtOD
         XIO0k4OpW0xIxlSoZ3Iakjyh2Xtfgsa4Faa2wOja5vZTgO/P0FCx8oCzBWtD1Fm5asgm
         tbhMuV1ok/uq2kGUM4Haf2qCSsL1jaTYssJg9QwIQrQu5Tawr8vdoYd2TKYkQdjeFMOT
         FvTdRcOz3Ue49No26BFtlxYtKFJpmR5WFQQ8YOAMAahKDdYP689Hz56dEuI3AyAkdX5Y
         Y35F6SWd4QxK6xk5/KQksCwIvCjO2WNHEEWOty5e54ts0OJ9/7kMxZVRo6i4W0Bd8B7H
         76Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583808; x=1758188608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJlYrA2HvnrAW5ag27Ypg8qPNoGajHDP94gxoPy/A6E=;
        b=de6qX26fqrJlFLqFRx/uegN6lCrtffhgmkHhlJMPhA0Xbi3TmSQ1WVoEYapLwfwru6
         u7BHzpB43jRT9az2UFbchfYtUth3AOI/sifszHyVWf2lGcJ+s59UK+K0ftxoCkEd2Agf
         wXaJ2/JC2VxvAWLCcQ377BZaK6PMDnSg8bbN0kxYijnxoNA20O5LVNmUUNGV5LoFOjrt
         oF8pGnLHW+AuS0BLonXXhvj6CkNxa7CeN6i6stQNv+pP6cDP+3Caf9mbRCk/cIApm6wX
         PtNfQIL16M/k7NOG49rixVhD50dU0m5cOahKO9cQk3kb3OQoaf1M/F/AivRSvCbQ+tBS
         h3dg==
X-Forwarded-Encrypted: i=1; AJvYcCXgkH/NCES6o6//n0xhjTf8EFMLC3cnexOe5qnY31+0bRI+3TOdcReIeH5Lz3wAXKo87D+6eMRAV3KDTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzqtWZ6Sr8ECiut7SKf/j5ZlkAp5U1xdfjHp/e9zT8Zt1WzUOV
	pdMzRrP7daC4qV2q5dUUK4gDVMbNwAP0zeh+fzlst5nEnJNFhSKSsf82E6hR1vjaIBhFNkYNnAO
	Jlu+H
X-Gm-Gg: ASbGncu8xskNPxwvDAyzxmBi9len4H+n/F8f/i5BWnuR/xdT4Bo1h7qEuzc6TgIjjCn
	AP+kDJlOgMlXduGyj6QVyi1hTRHbEoUgruNirSWdV2gSS79ehBRqu5LZRi4+CBcqG6wgAMaz/LA
	srPxf132M7NYtzVbd2LKOLMqVgOK/R1vyiGs5KrJ31tVjf7T98LGGtJ8QqqQRcrhYDYWybjjbr+
	qochEte3e25RLPmIC/ZUlDf0sgUC4tCBl5KsXMtiKkgV3t9B9lBeNTmAjcUHYiqQhBPQb2NDvh7
	lD2BjFJtWOrcrIIrwBUDlyOhpxcCaIqXb6DGDX0IKCuqzt/U7LZkopgz9HDWRjpMNX0tII9TP3O
	a209rQi8AtHvI9vAzMDTqJdns1NpyaMwWEhfnO7v5EltmJdW2i09+wx4U+EEz
X-Google-Smtp-Source: AGHT+IEvVJCpB1MRFgEyQoHhDJU3qcuvnYQYpEAAmmKNlgqJfObCwFZIxiKKPOjmlp65QpOlOzuVxw==
X-Received: by 2002:a05:6000:b88:b0:3e7:5f26:f1d4 with SMTP id ffacd0b85a97d-3e75f26f5a4mr763480f8f.4.1757583808018;
        Thu, 11 Sep 2025 02:43:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e76078fe3bsm1759218f8f.28.2025.09.11.02.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:43:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 11 Sep 2025 11:43:12 +0200
Subject: [PATCH v2 01/13] memory: tegra124-emc: Simplify return of
 emc_init()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-memory-tegra-cleanup-v2-1-d08022ff2f85@linaro.org>
References: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
In-Reply-To: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LQehtAx2kmaY57h5u012j/ttcRk/Yy2y8c0kuDacy/Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowpmyBpG/amnIUnmiIQAQJ6yjT1bf6cHeegd+F
 MVQof7FXTSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMKZsgAKCRDBN2bmhouD
 150lD/9bg+z24kDozvRzCdyxq7TeVnHoBKzlv01ObNT7OaKniUoT4DnrpBmddv0Tjs7vf9HZF7p
 f2t//1VsXSVzVEZ/1Dsfe1ug/9/fZSWI4qq88yqxDIfN3hOqj+vLQFSfs1lMJqFL1lmQOzglY8Z
 UmDobTyKBwP5JZJKPblbeLzJ5RKm+n9a3drhgNJUo2Pc/JI02K6eUubyNDp24Bz5JeOA79LAVfy
 A1IZcrlSoc/ZBIV3cwNpaeHp9MRY4qCW3If7RXU4niLN5vZNYX4GJoFfhLHPxy2I9RKMPvdMhg/
 dPUJkHQttAStUYwAXCm139BgJQ73QGhe7PBTUkEfFxK1TpK5IK3rIpO+j5UgPbZ5iK6lxnw8GMU
 +Y5tVnrlZ9D1nAkwVmdvDvEvk47YUP0bQcFHXW6T//iJdUKyty3g860stoA9RnSEML6a2nhhg2e
 /m2H139QbqjsIEspk2yFbTg3mKQp/zC3DqqDtziYzYv5SLb0qg1oQFeap+DZaYdcIWtlBZ2XWmJ
 63gp3A6+UFtXqxXhPDxpedQgXZu1528pYo05FO0Jah/iqHOgrkUvMZwrNxRFtlA3YyPmS1GjLE8
 /QnC9lYaPY/47onxbmti5SfeWOAE+CzRm7Hs9ljoiZyXaVyfe0uTGizcb1kmTg24Rb14ladzqXQ
 Ncfe9OlXrdraCfg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

emc_init() returns always success, so just drop return valye to simplify
it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra124-emc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 03f1daa2d132a81d28705ec7c62d640d7d25a894..9aad02901613f1b2ed855c11bcd76fef153034af 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -896,7 +896,7 @@ static void emc_read_current_timing(struct tegra_emc *emc,
 	timing->emc_mode_reset = 0;
 }
 
-static int emc_init(struct tegra_emc *emc)
+static void emc_init(struct tegra_emc *emc)
 {
 	emc->dram_type = readl(emc->regs + EMC_FBIO_CFG5);
 
@@ -913,8 +913,6 @@ static int emc_init(struct tegra_emc *emc)
 	emc->dram_num = tegra_mc_get_emem_device_count(emc->mc);
 
 	emc_read_current_timing(emc, &emc->last_timing);
-
-	return 0;
 }
 
 static int load_one_timing_from_dt(struct tegra_emc *emc,
@@ -1472,11 +1470,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 			      ram_code);
 	}
 
-	err = emc_init(emc);
-	if (err) {
-		dev_err(&pdev->dev, "EMC initialization failed: %d\n", err);
-		return err;
-	}
+	emc_init(emc);
 
 	platform_set_drvdata(pdev, emc);
 

-- 
2.48.1

