Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85207318149
	for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501066; cv=none; b=RVe7qFwEnh9nj91tpJZ9ZEXycmzoqd+TN6PU6GqvlKbefQEaCCpL2RqPKODW0nhkw4PXXtVeLsyJr7ElJnrgilDj9kYlnN82qf31fkf0aIsrwiIWtotKbfJGuGzc8aP4jGoQBZnM2g6g1t+Nm3h00PUkW6AL/kkkQvKhpXOFVyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501066; c=relaxed/simple;
	bh=RkEbb4vtXH/1xa3ZAFyhmneUOFAU8k6zYcos8ICuhT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gd5tHW/r4LAi1OnXAw6HjFUaIqevAQ2BlWTokxfx7is1ncY4yVBkbqvkZBDMXsRTTGgjBcoawSLUG/vb3EoNn5mHdgMneWbMZfldYSKe86M2ZaFKghHPBgNJFSTEwjkipDBWBbE5XR5VPO3uKS7ukAsNe3UE9LLNUlXyd4qCSag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a8yDwjRU; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a8yDwjRU"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6217798e8acso992507a12.2
        for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 03:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757501063; x=1758105863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5m3ByHgnOeEhXsQQzbVD5zJSTnURIXU/8oB9ElOads=;
        b=a8yDwjRU3tHH8QstS29htT+J5qYHaWQSu1L0jVovzunnorBfugwofBQb6B4wbkNDQR
         sMJrjBPA9YE0j5B5NdqEKDhfLHIj5hyz/pFIOWlM8ChZwF2Qz9JdMABzCHETQ5jBTIU9
         Wfo/h/HjENg3KOQoULdfSvsw3ZK+0M2AtAyYGQo8uFUwibEY5JsU7C4jR+Xredr/uAAw
         IVBdQPstdSKQ8s40zdhu1RK/zhxSUx581g/JrGKIsiwe7vOqjO+TTakngUfKGOvE4YsN
         NycdIxw8ISr7OD9yxLz6Ry8/CleIgsF232dSYMrKXrdBUxnTTlkq7NICMQ0IXm2S8+lI
         GTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501063; x=1758105863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5m3ByHgnOeEhXsQQzbVD5zJSTnURIXU/8oB9ElOads=;
        b=aYWOr7RQ3VxNkV4YSEyVEkCBqhgAb4vjhjIKbGMxOgXstTK9tXL9pFtuNg853JPg7I
         R/D1T2I6dPhEkPbhSB6e2IlbiNzxbOiGEtd28UHtrZG9PRLpglBJTkhu9gchaQEsuJcq
         AYarrVSCbpXh/truc0TA+lH4SiJSxPC9oYLLWAds2jYtYU1aHn2SWQK2eHqwJSC7jary
         yKXxVWQ4YPebZoX0tO5RVcjLClLVr8lI+96cXMTOYr/XzixpEjYZLg/GOLul68AahBmo
         iqGUn3rZukMQ1HePblpMzuNCwKBlMNVSerEIBPxDwg/Ja2YsZoqFZQqiklt8U/fBp583
         dX2g==
X-Forwarded-Encrypted: i=1; AJvYcCX4OLRD5Y7FSGA06QvTaO/gbRJJ6SbNQqdMU50XKa+rznf5gVjp05gIA1j43psuE5hL+SSA/zjJpo8EzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFYNrKU0SsVF53C2QBeZ0YKBQ6THV+P04doXgvZn9ItMkPw1Jc
	OskF/FAX03fmvCGj9cN0E6Ki9FI5f4CyhlBula3VtmmWEN99saum0af9/5bZA+a+E84=
X-Gm-Gg: ASbGnct48nGtFbz6LqtKGPSmCM7zv0XjeHprLoyLj68fyIqRc1x2J0njtJWGfDJ7SJ+
	14+qchDlPlDxaAQBDS8wt7cvLJF//3q0uJxqGZnrlEkmIrgNDM/Cg/W5m6MzwEDUxmMQXPEjuj1
	QgNHndPcLmsKuAjxmHG4A6Xe4XcDHpTdwmJTm9WZnEaZG/Af3PVwRSogQHjX2w66F6XwII1qa6e
	iTY5GUYlpocgAFUVrXYKdbCrkJJpihclZXOLj5A2qnOULFqh4+cqmX5nmoFZ6DXPDBhpqEKfzpM
	JIhVFwoc5nb0x3udx+M8AlCXUb7g0+sjMooRhGyOzu1fAsEH4VbbtUkrQgnK2LaHBTOtbz8qCLk
	Y302IxVG9g7ySnB7rif8knLEVlNbl5h21NgOSEkBbVptl/d0jQQ==
X-Google-Smtp-Source: AGHT+IG0D3sNuTN2XrXIMBjhp8TqIXYO7K0+75E+g9ycjhnJbYIXoO/VzW9HiOeprs/pFGz/fFNgKg==
X-Received: by 2002:a05:6402:34cd:b0:62d:a9f8:c265 with SMTP id 4fb4d7f45d1cf-62daa0807f5mr696455a12.7.1757501062702;
        Wed, 10 Sep 2025 03:44:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c01ae5f75sm3144890a12.46.2025.09.10.03.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:44:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Sep 2025 12:44:04 +0200
Subject: [PATCH 08/13] memory: tegra186-emc: Simplify and handle deferred
 probe with dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-memory-tegra-cleanup-v1-8-023c33a2d997@linaro.org>
References: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
In-Reply-To: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowVZ1wVFFeg3BI4yDnSEfM6+mfV3RcN+tYFqHQ
 SOlXwuQ21+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMFWdQAKCRDBN2bmhouD
 18H2D/0a+Ih6P/4NMskZ/xUL4kgKb2F8UkzIIHo5N3MyJhugxrIuY7leHX+K49FdG9AXpcpdcwi
 GDcPMENGlgGmheJDuhdDC0KfUiexIwWva3FRmraVsYO0UZUUB+Ge9LgM1tBxB8TRkMcrva2Y/zG
 +L4cfx3GiN9rDuLJVyijiEyOyBHutOSkOAUHINh6k01JW3beEIK6UDXMea0Bv2FflTWWsDyY3nV
 nrJnYiL7QPBtgsEDGCzU6BfwhetNJtiEHczXfq1Lwh/jDlYBvRkrO6YuWxPFZDoN73xSjh4hS+7
 9RDMTHUUQAA76D3MSnXhPzwndPiQuhuQUE7aIyfqcDkU2ey+rc03pBP+27Am9YX35fG6+64VREi
 0oUmvXZ2q24uoZ5hLvfppEyJFV6V/YV4bKzXrH+i3BmwRw1CQmM5JA3mccQWchXajIdOnmlG/8g
 yAtPSFhPaZux9y+lMElh997TsUKu7jTedrVUvZFKNvDOz0G6Oe7J3FwUYdz4t3BxzzKbxqvHpau
 /nRlDMhR6yMEG0J+oWYyF+EnsSpklVFvhCRd1z0qTEydePYfv9YBnLsA4GLJCBDwhAeGUP7lUm9
 Wuf4vKGQcL8LX/EqoWJgAnhCW06ybU6rsoH0ystsba8g6ctrRGgfkI2Wcl4OOMSrNSCxrvUzJvv
 XoSpbpfwauiVcRw==
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

