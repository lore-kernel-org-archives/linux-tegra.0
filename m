Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856EE184527
	for <linux-tegra@vger.kernel.org>; Mon, 12 Aug 2024 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723469672; cv=none; b=QOigjxDRqfRROgWoIV4Gvb6sHSOXijPzbbcAxkIJPfiTriG1RVJnCN3Bcr9CHEwFg1I/24EIIBv7eFSAO9Jq69PJZk9McznIKmaA9b5lsVLkkllU80rSEgqiHY+xkKRMAot5pluaQP90k3KLR8k5gtGJx477UFFYqECHvdMjCiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723469672; c=relaxed/simple;
	bh=IlxS+D8E+Bo6nHEepn+0mTB7t42TrSmGndFVSzcMSuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B1FCQJJYo3KeDieWyIWvNw4ORdT2X6Zp+bpXtm9rDWANZ1BlWNrJYX7zujVnQ1t9k1MjgGsZsZcnlAmr3Il0rTYxwEcJBc2raQmK26K2HCgYiUX9KM2NNLI2gEdtToEGbID5FwT8e4ES3+dmr4H0fSiIr2xeqJJ+zAtoXrzmKj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OG6wDyTa; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OG6wDyTa"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso32915785e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 12 Aug 2024 06:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723469669; x=1724074469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vRtjY9RoJ4lkxTaWAaQzIhkuMec1ZzRbTb9Hn16sHA=;
        b=OG6wDyTawd/3werPYRuF9y8q0ToceWZYEzRt4u00yzLBDlZCr3Eio02O9eU8/CKnm2
         uO4MCfjSXLm2+5aBNFscI5wDkXrLAyJ1q7GaYaTDngRN5Q1iCwQc+h+PlywjD3VKRJUJ
         kec5LTmq3BRx8nCcHcu+nQGd2FBCA+XNmLiYBgd/NT7R0QRc2Wf02PnmVfLdTYtGxxC9
         vCDdztXill5VdbdqXy4h/36/agwAIDd56K1+5QjED4fkjWGcmZFPeO7uspMC3xTgJ/U2
         FjJFHw/W0U9EmD4cw1Fz4QjGepCxUkJCtq0vp0qa7lq5XdcCSM2HkUD0VEo4PsGwuQqZ
         HtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723469669; x=1724074469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vRtjY9RoJ4lkxTaWAaQzIhkuMec1ZzRbTb9Hn16sHA=;
        b=Qa78+O286mCQQZFZ7ap+wjJW0RLy2z0lubnmS6xAfrSGNCFrdEoesvTeRmCn9jZUEF
         vMD79ABuF6GKviM+oOcFr5l3l9x6IvKaaxxADslePy0afG8VUfZZB1mibscIvJCirYig
         JknzyEtV7NQNaWq3p5v3jsMGO/0g6rZ9+g8niAvbfEQe5x+nLIX0wDNplTRpqMeZS8Pu
         RTWbFkifOe2Kit9UNZywg1d7BC2sM7xzix6JXAgdP2WFhkPjG/ddG9+snWU5FJb9T0WD
         Mo1qIr03mjMu+/J7Yy1ZRWjie4A7u8VE/1hGMRahJI6OIlnBNK8Eh8ORcHr5GOgvHetC
         rtgw==
X-Forwarded-Encrypted: i=1; AJvYcCWAV6lXTwzJZ7DLo6v5dqcz9TVMPML8k/B479bhwOdnfrfIYvWdFg9rQtk84HgUxfAVUz+rwanwcvzDCRln8+H0gSDhdeHDp4T07Sc=
X-Gm-Message-State: AOJu0YyO8lqbkk75tqF4shklaUasjuPRvCjW1CcSfnVC/Ke+Tcb07uYz
	sPHDqJQXKyc75cOeD2dnnDN13rlEzs1gzCeWxXskB0gY3M5ufbq+SbkH//+4Hl4=
X-Google-Smtp-Source: AGHT+IEEUwAlG76HjxJAsyK8S8T/mYq4aEjAVVfNn3IzdOaUbHmzoELCalL3YkqLxnDddPuKFudeRg==
X-Received: by 2002:a05:600c:138b:b0:428:10ec:e5ca with SMTP id 5b1f17b1804b1-429d4801e5dmr2984845e9.14.1723469668894;
        Mon, 12 Aug 2024 06:34:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:34:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:34:00 +0200
Subject: [PATCH 6/9] memory: tegra124-emc: simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-6-5065a8f361d2@linaro.org>
References: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
In-Reply-To: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IlxS+D8E+Bo6nHEepn+0mTB7t42TrSmGndFVSzcMSuk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9WY865X4GH2lunkVHCyM14mLujFcZgf8J78
 qI8SrlTVxaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPVgAKCRDBN2bmhouD
 10aeD/41meg3/8L8q4GOxl5Jxe+3hlN0PEmllVJ2SQY0syA/bR9hZ5HnHZrvd8TUzKepy5Pr/iy
 SDdFyfaLYElBSZYUrpBIJ0eSCjbPuaUaT3FfClCW3EVZXO+OxFPD/NC6IY1HJyaiegFT0SWc68G
 z7Qa0sL2FuqN0bItr5eRrGgOAN+nscmxIw4WqKd7VgPoDTN44IskG7JMI/CPEnJuGPhY5xqzCfr
 iYjP38QLXnQz1Qh9LZdeRg8hS+5HkEwTaqNoBE0kd3JiYjkxdR/5GUQEWeit8zufS8B1DM4/Rc6
 hQSZm6PkJDv9n5P9hLBD+ufLVQKJdYdfJVEC8iraYg/e06vlLB/elPsn/+qb/yM6alFuOb8AfDd
 Fi4yVboCoRyJuvc+V7wKvfz/TcqI2iqSmJNaJmzxtFeNxbsIp7lPMD8LyxYy3l3xQXW5DHKaRvA
 z6JJ4JSxAbNYluLpGBJZCTHl+fIUhU3S0CgxZH5GNnIgvq4Rf6HgIZIL4zky6HtPopfmW9TQAvH
 M6qgaLDwO8DwsDv5Bw1IF3VS0SxwBLiWxLQV1iVKRJiXcpLhDUReB4QFLv1X7ycVnOaouhNPrdb
 eavRIJkAtuQb6YhgpqUazX1eq/fCPLnT/sCa0s59ys02ye5w9qbbg0GqzWnGenksh6pnzHYOsX7
 fBP6UmhbugpR3vw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra124-emc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 47c0c19e13fd..03f1daa2d132 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -992,7 +992,6 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 					  struct device_node *node)
 {
 	int child_count = of_get_child_count(node);
-	struct device_node *child;
 	struct emc_timing *timing;
 	unsigned int i = 0;
 	int err;
@@ -1004,14 +1003,12 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 
 	emc->num_timings = child_count;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		timing = &emc->timings[i++];
 
 		err = load_one_timing_from_dt(emc, timing, child);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
 	}
 
 	sort(emc->timings, emc->num_timings, sizeof(*timing), cmp_timings,

-- 
2.43.0

