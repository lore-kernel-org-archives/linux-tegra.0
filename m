Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC452EC0B9
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 09:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757583817; cv=none; b=Wwr/jwxBOzvC+FfNY2H0lyS+g3pg2K63ShneCKWSTXh02uX0GuujeT1H40XW9tnQowEOD3R+F+AAf/s+f8w4AqsMh0piAu6nc1Vg6rRYgkAncgoNTYlL3kmocl/JKOTHaYNbyPrwtWTxNRMaodYak8FD/MzX3xNR+Xx+SFsp0ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757583817; c=relaxed/simple;
	bh=9uLbL4CfehXgK0FgR1jl+4z97FyCLswBjlNfgLA3G44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnJGwPgfghRqHF9OQe1vk3/SPYIk5HECzW8exY4pBh8Rna5b7XoE01h50e7eaX/3LqhkEoULb9VfqhoqZkHQqpRZtl2+IQtQVtrnpQwYIjN7MCYbsvbcF2DvT8KMeZJZBJ1OCqtjszESD/vHQaikH2/hTCMwziEOPiG75OvbEnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tdTOju7G; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tdTOju7G"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45de4ebe79eso675845e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 02:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757583814; x=1758188614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cqRItD2bt3js5TTmQrynwO8hQqUf0mH+3ap8vOPgmc0=;
        b=tdTOju7GIecgXuPKmodd/ZazcvvbehnWM6hZV88ooWbZTHNJwEBUKy6VM9BzhG9MEL
         k+IFdrL7lwci9Ks/WmDJc0zApCdQl2T0gog+sM+9eOdGlkcTRu4ekz+W3u+1A8W/MVdw
         XWDdXzJG4iXms+30531xxllCg1uXCzeyCu5HE6yo4SVnjc0bPw4ZGFsHq3Ti3ejqoCd2
         OsjjPCEEWFZvEPAfOiQT3oY411L3nq4ut+YVyUhX5bZ4cuPwT50mzLR6zzVpnFZrEjfO
         PlV3+jRwAw42fDaU+0j0JI7saHI6fwaOIzcaHWIGyl3fJpLJHJpgl5TsseFZWDNLgZVf
         4lNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583814; x=1758188614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqRItD2bt3js5TTmQrynwO8hQqUf0mH+3ap8vOPgmc0=;
        b=Lo0ZLiFr9yIc9xY/mhlZhBIUUPIb4FbLjwS3Bkn71zOYPgw5zHCTgTki/6x1XmkrUy
         klMH5XTjf8r5IY3KI6BQwS/xZv2ej+hSTFd887mSdxPx1URm5ZGKjHif3l7P/J+hYDLR
         owU5sW4hbwcZreHwzO63yF1WR9q8iBVBS3kR3XaSM+weZ98U/A5r2bSDXMWV45YxNfDO
         U0IvjKMxqiayZ8i5T0HlUPPLLDNfOT9tns+saE1JxVqJfqUEwxu1ynxo6+8JSA0vTfD9
         8Udx8cLhSa6HfOCWRhIghKXrI4FmpFMp1SZQbRCYbopAGLcDQmqt0KHa7W/sTZ7kGT0W
         8Tvg==
X-Forwarded-Encrypted: i=1; AJvYcCU21JHIcRAzeHSBxhKe3XXsRMyou4Q7VY6Rdx4CKZ6yGdkEgM/tgkJjZnOxElxymIjqpMgUzQqOwVEd1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3o7MZL7nuTBxaeXWNTGOr4gXRDVj91uK4ADcM2icLtaHF+w7U
	0UgvfjGmzZOaRXFxVUuK+o0cYa3rnbMlgu3Cy9FEG9cQ6z/Cgsis9CbvjlHYnJglDtkfC4usKoe
	tqaIE
X-Gm-Gg: ASbGncuRHqkzMk4roBp8AqzFrxS+QEv3YB6XH2HrgfCZzwvLayxx8CykT0ae3O6sll5
	W4VT66E8W0EkVAjew27p5P0hHEKlArN8G1zqm7II/xxMLRLea1buUv/Y/uyZpRkPI4HgoM91Eu6
	F4ivWFMJRig+oZa974vtLfB8+n1jPQzj9kmotNqhmn60Kvumt2fTa3afM6mI/rWBuP8sFCO/S2x
	TBIiP8YrBczrCw57DWUh8he02lwU6gELDINFvx2Al9rTJj+3fyr6kXWEbpfkmBJ3SkC4AT/5fQO
	Uc5q85//S/2Kq4RZ+WWF4YCeHeXkfuJmsUdPef2nwaCdQBuyHV0t7Lj0RGA38QedGxkho3iDfwH
	NbtzT3vigGs7MQtdBAtGiY3TwSvnw121CzROKqHmrfZTOeyoHXg==
X-Google-Smtp-Source: AGHT+IF/UhrqWprkaN640qed/DfCGwg7Vw72qdq8PFaV5rt/q6nx97cRxngQECQXshfiBlN0JgRgdQ==
X-Received: by 2002:a05:600c:1993:b0:45d:da49:c475 with SMTP id 5b1f17b1804b1-45ddde0a13cmr81741435e9.0.1757583813832;
        Thu, 11 Sep 2025 02:43:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e76078fe3bsm1759218f8f.28.2025.09.11.02.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:43:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 11 Sep 2025 11:43:17 +0200
Subject: [PATCH v2 06/13] memory: tegra30-emc: Simplify and handle deferred
 probe with dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-memory-tegra-cleanup-v2-6-d08022ff2f85@linaro.org>
References: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
In-Reply-To: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2183;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9uLbL4CfehXgK0FgR1jl+4z97FyCLswBjlNfgLA3G44=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowpm24oqvTHVAOF9Rq8i0mjZwTtnJuKFFxYt2j
 opJqGjF5B+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMKZtgAKCRDBN2bmhouD
 1+woEACLJwCCvryDUj6nedFa7ciRAt6z6uMVkga16E5DH6vokdSkj3K86WCISjS03oAvZp/5a9f
 Ap0GaKgfndRG95e2VKczvWjGEO8dZdvYtOsammc3FveGGjIGsYfnEKYbM3TNRhfmERsUOvKmuWU
 VKX6OhUzm7xLG6jI8XaMAsd26YkO8O0UN3I1N7BN2aXAww5G4NZM1f2FO4sh84jwbqdS87++/Ps
 AxlpDqfcCurrriA3E4lTXS5vvZALjejUkCrOkO0nJQbTeqoF/PPtTg2gP5yeigoaFIwh9vP0A/Q
 /2IFKwJj8R9VDU3Ge0WF4dG/oxk5gtDqQctP6Qlem6cMN8OLUAS5+t7QwqM4gDZGaE3eZrapRYq
 HkWWuxhRlZH9lkla2J4xXTPY75Q6kd16mVP4PGwPBTILzlBsr6VjSjAIhHgPkjlRzcl/SyTqELd
 rzLL9fwRDMTGr/PsQWfmgzvm2YjVcZGJG4c+0a5rBecKAWQ54IZSeDRvKhfNUwwAEuT3eJ0gqnS
 igyDVhYPTaAlxU3hwIK7YcLNIXBmz8Kk/s7+ijo5xI7S3NdkAFKZB8bGn1eznbQPfjkfNH8KjdX
 YfF2TpqFp8yDhFvyPqPU0Tx/3pQmkkgCwnMBxlrFa3afHU4gJkUf9gaDQSdHckwr6uQPvifODBz
 x4JgGde4f959Wng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Certain calls, like clk_get, can cause probe deferral and driver should
handle it.  Use dev_err_probe() to fix that and also change other
non-deferred errors cases to make the code simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra30-emc.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index c96aa63a5aa085a409ae7ec901d2a210748f5bcb..cca386af423e9647266878ce6cd1bcec09c8eba4 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1563,9 +1563,8 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 
 remove_nodes:
 	icc_nodes_remove(&emc->provider);
-	dev_err(emc->dev, "failed to initialize ICC: %d\n", err);
 
-	return err;
+	return dev_err_probe(emc->dev, err, "failed to initialize ICC\n");
 }
 
 static void devm_tegra_emc_unset_callback(void *data)
@@ -1592,16 +1591,13 @@ static int tegra_emc_init_clk(struct tegra_emc *emc)
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
@@ -1654,10 +1650,8 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	err = devm_request_irq(&pdev->dev, emc->irq, tegra_emc_isr, 0,
 			       dev_name(&pdev->dev), emc);
-	if (err) {
-		dev_err(&pdev->dev, "failed to request irq: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err, "failed to request irq\n");
 
 	err = tegra_emc_init_clk(emc);
 	if (err)

-- 
2.48.1

