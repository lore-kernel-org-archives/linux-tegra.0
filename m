Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3DD2EDD60
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757583820; cv=none; b=tZmnMM/k0MWZd22X+rzMHrIHuNxaza4vZSgWsL5atB2Kn+dpkPJD+YUXynW5IpAWDmMPajGSjoPx7FmPmtiTD9I7lqh7W+l/KKwvS3frS//ZvkBN7SIVkayh7uxEyVd7sVyKOFL/Gza5UQRLEPgTHoenZ9t/0j4PvJXaU0RpmN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757583820; c=relaxed/simple;
	bh=RkEbb4vtXH/1xa3ZAFyhmneUOFAU8k6zYcos8ICuhT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TlmL2DMuh0P4fJB52auqgbUbFES05ml+MN/FXm0ws2SruzthFxf1tTL8wlxr1DHlsk3KiFrK2d3aHp88sYFkmpd7fjRIDZHCXnQfat0OhnA9Hho0qNcnJntDoi/aJlDgJ/VU0QT6LOSxTW9Sd0I/QoVNABytpRpPWrjZP/CHjgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uni7XEXv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uni7XEXv"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b9bc2df29so406045e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 02:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757583816; x=1758188616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5m3ByHgnOeEhXsQQzbVD5zJSTnURIXU/8oB9ElOads=;
        b=uni7XEXvpezQ0f9yVmHVSHkVoU4tSlBcmiwPur3oOPgfUu0G+E28TwoaSSMqGPoRkg
         4ma7e/tA2Bx5tgkNMny6SIeAHmiT27BRKAmASZi4Yjj6dsiVVp0nyuOlOsWQXA2wvH9w
         P7L5jdQpPpjnGHfVXu3oXzLmzRs+X193/QZYPjJdysLm8I4KrAIvzBxGLkLa2tie+0cE
         1K0nVfqDl8+eAENInh9jAuoItcWJ7r5IVC2sPwDdzlVuf0Gpq2GeMSVWZcEJsRChZQr8
         00HVuhzZampz8B8F0eIKFXOV+nnB+IJbFxItayyDrFvyLY66ZnP70fzuZdbGdWa+57jM
         yRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583816; x=1758188616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5m3ByHgnOeEhXsQQzbVD5zJSTnURIXU/8oB9ElOads=;
        b=GI3j+K4CGAScSAZnuhxZ9gEWWvAqGDv5/y+HtdKmnHxvr9dFX4a9KCxW1BWJ+Bx3ig
         BRWMHnCghhO+tv0vAlIuxrB1usi/be6GF47ChwyVKKGvj9hzcJ4W1rGoKv1uCtaqcytz
         zmuyt59sqBn5Q0ioi+IELVDcs6Cn0t2El2NC9OQuo3a6VJPvSc0e+PnpenpqcXsiFiDd
         0jkpp1sKw6HIjbpaVMmW8BSbfyRhmvH9sZ81wEc1QFPlwHHCvglNBz8yNCzdbtZGX0Hx
         NPBTiLGuL8Pk3FrC0ZkIm6zSQ3YPPYPVzHIHJM0lz1Z3hgikX3T446XLCqwIBopQWw8N
         uFgw==
X-Forwarded-Encrypted: i=1; AJvYcCXnY34BWrv8QHJR+Ywj2Prgzt+jtLkp22ZsHLnVCYHJPMzKFOhbMK7F0jAyhKLeR7o7k6ldq/b/c32fuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz36lZcDnypeuBQIRoZQEs5WB03pta6ewM/n6GVXRQqcBpe0/N6
	klG6rFcKMMNMaN3eBk0DDvXaGjR5ea1oV/RwHwe4n+UQEK3xaZLvhOcOWbdl+tTcZGkqh+OpmVz
	n94Kl
X-Gm-Gg: ASbGncuShVTqw11yiWpgi6YIbaJTErAcjZrAtwJcbzr2+WNHG3V7R9P7hwXemlkJ+Ay
	im2NgwyFizLjEy/QTWUN/SS7VVoFClwgm5BGbRD2FKYQrH5gMM8GhMiRFJvCkByRUFspQq3lw3J
	tXQwMcw7lL43/hEnRj5oVQlrJq+Uo1R08k6UyU0rJDlMD/txq6YxwQRGMm2x1niFn+HC8NoYGVH
	VivPJ5xZBeA5fdeTNJUrfuq1/2gVfEo6s6PBY1u+p/AStBWQvsL/QpObFf7LDE2A1PqBw0Oyn3p
	HaHxhq6h/7L7IRobj6mYI3my7cWmBSk1z39ebTEDQpNWkeFwqHBVvqdZtHdAGaKDOJ/Sqo/ZTB+
	NLsiULmGcFH597b11axSkT1S5xBkz7MDAsKES2pFACPiu6DJFPw==
X-Google-Smtp-Source: AGHT+IGdWCIF1BMNbE6xqBraxyICJw6etdGWZx6LlrGJw3xFOwFuyThGq1KYi3b5AvIEEioeX/sfiQ==
X-Received: by 2002:a05:600c:870f:b0:45d:c85f:5030 with SMTP id 5b1f17b1804b1-45dddea1c78mr86161325e9.2.1757583816226;
        Thu, 11 Sep 2025 02:43:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e76078fe3bsm1759218f8f.28.2025.09.11.02.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:43:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 11 Sep 2025 11:43:19 +0200
Subject: [PATCH v2 08/13] memory: tegra186-emc: Simplify and handle
 deferred probe with dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-memory-tegra-cleanup-v2-8-d08022ff2f85@linaro.org>
References: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
In-Reply-To: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RkEbb4vtXH/1xa3ZAFyhmneUOFAU8k6zYcos8ICuhT4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowpm4Aa1oUYSFXi/sOsTHz4twSK2bs9ZcZMbr6
 uho3feukkKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMKZuAAKCRDBN2bmhouD
 18y9D/9R09f1RgS8aqXPAwB5hy/F//5GLx350tJRizHtJ/kE7iuk+2uhHkNeriG3vYgy4fvQ7D4
 LmjAjJB2Jq25o/QYP18SgNiNy44O/AChi2GvJX9YU4z+O1ANxod02E/nrmUn2l/d1fZI9hkfWOp
 YkITq0xOtHRTJ7SgNs1xo5pkoSSQImG5LGtrTtD/uyRLr5tvXEWgLILfarG3nJvEpGCNyBlFhkA
 UmxWNZqknk0kfLG4vTIP8lYYpK+s/z7tAVMLU+0ng3jp0aWdbiJoLl97iwRaiMe9CSkZbAjEJQS
 DgAalqcJKKTehusrhtilyTMKXNjH2I+/9dOG3B4e/FeoNy6Q43DbckzvbV0aYE6r9gytL9fx+gd
 Fdm8SYsuOoVADpS5Ve7SvNYjyIyrEKsncm4LC3p1jfPZrmAD/sg5ys+O6woBGfUs1hdI5jiIt5g
 nZwuV3tlh/OxFUfqY46kroJkHv6pZuAX55mSp7lOtUYRmMgMEaY7HocODHohsN+Zao/Wd+RRc1w
 CqIcnSIRZ3tFXLx6fTGfg1D3vM46eSWAgF5ct1z+Ema+CQRVPlTtDjPUwUFrCqJ9HBdozW7sfkU
 MbnGSbmM0Q9zL1aARXYE9W3bCNumVwxcAR/aHLCH+KfXdXLKpyvGIqovpTUuXd9Xi3/E9OFYefR
 yshHh3nnHKbKA4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Certain calls, like clk_get, can cause probe deferral and driver should
handle it.  Use dev_err_probe() to fix that and also change other
non-deferred errors cases to make the code simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra186-emc.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index 00baa7ab89214b1a151ab0c0a9ab76f90f922478..a0de80afe3e90531fcfb29d20773aed0d04478c5 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -302,9 +302,8 @@ static int tegra_emc_interconnect_init(struct tegra186_emc *emc)
 
 remove_nodes:
 	icc_nodes_remove(&emc->provider);
-	dev_err(emc->dev, "failed to initialize ICC: %d\n", err);
 
-	return err;
+	return dev_err_probe(emc->dev, err, "failed to initialize ICC\n");
 }
 
 static int tegra186_emc_probe(struct platform_device *pdev)
@@ -319,14 +318,13 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 
 	emc->bpmp = tegra_bpmp_get(&pdev->dev);
 	if (IS_ERR(emc->bpmp))
-		return dev_err_probe(&pdev->dev, PTR_ERR(emc->bpmp), "failed to get BPMP\n");
+		return dev_err_probe(&pdev->dev, PTR_ERR(emc->bpmp),
+				     "failed to get BPMP\n");
 
 	emc->clk = devm_clk_get(&pdev->dev, "emc");
-	if (IS_ERR(emc->clk)) {
-		err = PTR_ERR(emc->clk);
-		dev_err(&pdev->dev, "failed to get EMC clock: %d\n", err);
-		goto put_bpmp;
-	}
+	if (IS_ERR(emc->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(emc->clk),
+				     "failed to get EMC clock\n");
 
 	platform_set_drvdata(pdev, emc);
 	emc->dev = &pdev->dev;

-- 
2.48.1

