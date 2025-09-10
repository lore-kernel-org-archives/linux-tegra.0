Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0045F2C0F8A
	for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 10:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501057; cv=none; b=mf5J9XozfDk3xjoRCD8nEqExxPR3p8qs+hwBRnhjn4RIRBNrPTyer5Y3CY3ejoBUcPoBreIocmRDEaCclVje/MUC3jRYdMQBvF/Ja5z6HBKoQcmHY4DvUkO/xSSXwXYcM34BoNqgDZ/IayLhs6u4gALo9Agzx5joAySt5rB390Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501057; c=relaxed/simple;
	bh=LQehtAx2kmaY57h5u012j/ttcRk/Yy2y8c0kuDacy/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tWwfUdL8wX0ifSxh4P/iUH3V/ZUK5l1+Ubdnb84uFuU5Z2Q9syUms28Mw0Sm5JHlcbgUj2dUcwMNj3b8GPXMQvriphpdOmn97/h5XLBlnQ4VrcvumwCwkVqjEFxBaWeaTd76C1wJ9E9OA/fCpGrf4VfIHJwbw5zDo8tgjGMC+Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G2FtIkHj; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G2FtIkHj"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-629f06935e6so684370a12.1
        for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 03:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757501054; x=1758105854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJlYrA2HvnrAW5ag27Ypg8qPNoGajHDP94gxoPy/A6E=;
        b=G2FtIkHjjtRKCRMkNT58GH6FogHxVjMZyFAabf44v3PwhXwbxnOzrwo983oaip5TDf
         DFMjCYbXYcOz4gKTIV3U3TuzWaLX61jwXUfRDthw1oFR22bbBNHz0WrXnUjDociz/5jm
         O0pRH0OadGy8QzhpNA7blGgEHYfFZUgm1ZJB1GBpet+Lw0KtbUynicGehnFS/SvXUGF/
         Sa71EHx+IkHP/V9dJBXHx467D//qfOrHsZai4JeGxNNOwJx28EXFpdYbXf1P5PwU+uJO
         xspn50EFaGe7L95VC4tDZFtDI5EtN7w6FdmP9cIxmhpUag9yk3reBS9+QZA/Vm15aOI3
         9ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501054; x=1758105854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJlYrA2HvnrAW5ag27Ypg8qPNoGajHDP94gxoPy/A6E=;
        b=PrFu5gONUcfe0xZLAsuEW6KLn51b/sk/+RD6UBuUmeh01o43V6X2WoqRUIFNdTRkiy
         pFAc+vplISH9AuMTVVbg6O7f1igFVZEp3ASm4vyKUVSejBnINq/lakVPVa/P2XiZWmkU
         vmqxe1Ks+3VWF6pJdZqlpgdKNqgKJRHShhLXV4S89Nm59V5mMw8Mm8XuEwd2eO+FQpp5
         utSCC9/W3g+gP+8043327rA53d1HGnpdmC8OTpaZAvEkJIFqnoSmL3o7a2yoy2fg4nqD
         CUy19qoW4ZH0jRS/ijUMn6x+Gsi3+f4n0H3H8e6kWBVoVEddXEJ4/wbJwYdIqraZr0Om
         +QDA==
X-Forwarded-Encrypted: i=1; AJvYcCVH/pYrilxGIwIsNbhYFJ40j1Vskzi+4FC7OH3t/5q7xPvyoFQyBZ06/FG1PAXLKbGDLgacLtwDM32+mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBGXYHZ2sCsYw5oQnCHUi6TbBukX0I9k3pTJbqYAe+NNWYb6xR
	wTBqx9Z/9zUhTu7vKviGJuW0JFR8DqyTXe4yi9blj+lSzUFLhIeNCZYOTy7Dt/pJ3psRJAjYaFk
	Dg/uO
X-Gm-Gg: ASbGnctU6x/jIJq09iaC+QftUD+YFtynye4AuQCFoIKaqRyHtNUTBHpdEdPs19UqYHr
	ghWbFpesWz4t7RMfvZYRny0iM91Xg5FjmyCAViJyHbZacovs7qyb5dGweG2my9m5z2uiKd1jiM/
	fNQYi/teybyalCv8Upfzh0qv0nAGHRSG26ifdsivfYTTs3//Khaz9RhZJcUYa8yXIMW9fLj6Wyf
	eGnWwo+U6NA9TRl4hPuBZUQ0bRS9Tc+4gzWexOqilEGkwg8fUKQblntrB5zBEcZJ7+Hmtx4P++D
	9CbWcgJub3OO1OMcIpwh6iMTu5/PdS8UdKiLka9au2kVw4StDEvsTUqBsj78pOtM7LbUQlEi0u6
	MEqe+Q1cwKAWHOWWyCVBhcksQPJjYwLdNTrgYCE3qyvvleGG6AA==
X-Google-Smtp-Source: AGHT+IEsbT70WA0co9xUhwpaWZsgJv5uTtdJ6Nltro31AURb0/cmiR5p357gd13wnuViD2P0JC7AOw==
X-Received: by 2002:a05:6402:520e:b0:620:bf3a:f6dc with SMTP id 4fb4d7f45d1cf-6237f37d626mr6201259a12.4.1757501054167;
        Wed, 10 Sep 2025 03:44:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c01ae5f75sm3144890a12.46.2025.09.10.03.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:44:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Sep 2025 12:43:57 +0200
Subject: [PATCH 01/13] memory: tegra124-emc: Simplify return of emc_init()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-memory-tegra-cleanup-v1-1-023c33a2d997@linaro.org>
References: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
In-Reply-To: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowVZvbVtQiBWq7kKL7wqwIdyXaSh4vUFKxi4Nu
 jPvYcek1pyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMFWbwAKCRDBN2bmhouD
 1zOTD/93fxj5wirNSqO33U7YLJCBdMWpkWuctswCzYdN4zvpPNv3NXROTZXaO1B0awkxqvMO4TO
 40hvcqsVr/pBxZ4ybn14FSQcapT/JHGp9T8kp7e4WLnVqsVATxWj7BFBwSUfjigEcNoqIAdthJl
 iw/Rsj1/pzWe/JEHqvWmtRhiYNTw/EA/rD49G+V4M03XYhrSQeYgaO4nRSpQJ8spNp8Ta7vE+qn
 1J61Z7r+VO+LSH5LlBFHgvyRGAuApcSoPPVNms1eYy3ksm9yuDeuM73OIrW5EVYvT4XQFIovVKX
 OM3wp8gsU/sNfD52eyMpLP/mgB5YWUjccPQGB//9Lu7hYObSiu9Fh9heNMWO/Dkw7A6VXllJDB/
 rNWXGn1uc4zgKBaC3flbmJUhu4cXdbdtMSRrQrb0E24zDbT91PX/YZAs4HJzvFFiH7AXOp+T7Cj
 Q/+8dPe8awgtS2uuI8fOUlN4nHYjog+Yut77a+rKtlgcOQScZXgLfWESDpi/n55sp3N/J94aNRh
 NuqmrBpT64MhwtHd7S/qLHvcoK9m2pDn7dEZ/ub9GqCZlCBYE4DHrEDEJMJbA5LjxleDFvde0N9
 h3bQHqFQ6n1BjmeHbLInd3wzLgo5VIygdKWV+u0lksA/8WMR1+WpC9zGDbKr9xhRqqwurOicB88
 8kZElxNvKFoOSTQ==
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

