Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841386;
	b=HzLdTBJLwryWDfbK7Sms77CDg0ddmEyh9KZncD0kPGq7qKiFXqcRyX00A0cGQ8js6Byr
	 kqQT3yxbdN4eSW0p7zwnWVDzxokDGJeTp7maESrcGyv2jAMm+926aMEcfIkty6TgxXfNV
	 0ZiFY9mNQE17RTCNPTr0FGTxJFDBdYiqjPOwjvoI8PholqQgZGAIxP/HFbk64JzVc5nds
	 fIo90+HkYqmwng2Zy4uaMCSJP0SJFUjNxUNilb1G7DStzb3tk53yvQqBCm+I6Lz0/R5+O
	 cRb3Fv05gJv5a1zA/hht5XRxmVXhj/3Io6KlSYDo7rwbnz+QhU/jqxpZNYXbxJTa05Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ewge0PkS7pbG0buR4c5qezG5oGsIFlwiB6+b/jAg7+c=;
	b=kWU/CVs54Q2l5nJSH1zMniWYBdXAvbwekay8FoiQbma7ecIvwkSZ1jLqJr9CRxAkQeQO
	 8LgQBzzBjjNYxQxV7SZaBEKGrCjn2OaoC7UkL9C9/xQjiL6EyZJ8wky4mIY0/ViZrXM0w
	 HO55WLYd6T4YxdekoLBRmC4LpefqaDSSTtsBnG1EihAoISs78e909xyiT46t6/WZdCBoY
	 Zt9mGUqntzl4pi808Vmf6sAD71fxalbMF965T3yL2zswkkRyNILRm+/vANuTEw3AIUeae
	 JjUz+o6LRDZm2VwivaTe3F5oMWrdQZxK74/Ka10ANXA8GRYOXczSRO9KQCu54tG0k8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AP/7tzAB";
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC5B606A8B6
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 15:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAC5B606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AP/7tzAB
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c468bd799ecso523018466b.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 07:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841384; x=1795446184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ewge0PkS7pbG0buR4c5qezG5oGsIFlwiB6+b/jAg7+c=;
        b=AP/7tzABd22mCHY4s/2PcdgvIfVTgRSXHQfn/bR/H134UTLYEiJlsFj5hUlwWsjVl4
         pbJWImgPIjl7qHZ7nbb8WVG2zwkVzq7hMec29IUIZpCX7Vgg11gEaiBvwkAfUsy8bXv0
         zc6ySKUbnVIkvlR4t8xa1vx6UtpTXbaWuV2WtgAaTYHXlii3hBSDu3vZh23HYpYKgHkS
         3edceBcxs8bCjUBmMIqcWYSD3VhEc8XjyApJD3M7VcnmKkbgCaM560iUATqChth+lnu/
         tOOwB4rIIoacqxa5IfVno8RJGGE4lxG5SxAn8qdpyVv6983sAp5Q8zaCvZeoDJYRD5sz
         R9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841384; x=1795446184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ewge0PkS7pbG0buR4c5qezG5oGsIFlwiB6+b/jAg7+c=;
        b=HXnlO5bWzAt0Gae/WYVg1K9Ckh7ODjU8JovjGscGPunZgaiVBvSi+a19KzX0pDKANX
         4TaekNMVPdyn9sNEISq2FnvSFaKlxzf4XqZ9BR9yE7A43TsI+fOzMljKnpFqmFBR9slz
         3cjnZ8t8lZwMwC3bcH3hcrfww4vXaa1qV6Je7Z+mE4mogmM9k0BeV34XGQgQeLPiWsJi
         WujaNXcVQjMHelwATqb9JVsq1F69e4IosLe0HQ+eveAz+e9Ghav/7lQwwzpYQaoPL7/C
         vW5dx4RKQaZqZQXgF6gioTuVUZJ/FQzMIsBTG6B8fx4QBX3e+Kuuz7+DYx+M8plZnQar
         z2Yg==
X-Forwarded-Encrypted: i=1; AL+hErG/wBPnG3VV0bihpvUVhmuMsnZacljBaeRkTiJzJjh4wOx3ZCDkn3ihfhvXwnsKuvl+vUnf7QxYgDf7Gw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ThGsx4m2focaK+fNi2ewPMSlCWU9u/Jjsc14+7N5C3AWDJ0Un
	zzolHgk00rguPqM27yEE6IrSYNvqI0k+QWfS775aHe7Kw6UMz+17jZrd
X-Gm-Gg: AYBFou0WMD24PhWzq+hMco+V/BqJ2SJ7TPeQtLYj7FQu7svuLabRT5IE7Opz52Faa02
	t9+a3pT1lRRUwVElEFe34pjLLuIHgqxFY7Wm7I0/ysDSOJk+7KlSuTJsvpBaKOk4NXQ1kn9y/bF
	uJI8Q31uXO7jLkPM6VEvdMpcRAklEl2eSqmzExQ2w9oWTp/ZCIUZewBOmwJFC3qVXUFHbF1FFbL
	qHpkuxu0n4Z/drBcjxvklpphqp76iWTQzsQyJCn/se1g+22wOEFSVfhr5Bltj3bOAhbesaHc9rC
	UB+JQHja1Nbd/G3l2MfvFgPP7H+7RV/qbWCh2AtE9ZWdL6VWji0P8fb2Txzu+QjmCN9D9UvFNBo
	+8erE36S6cslxnHef+FvbiP9uE9PVY/SRF9KfPmFYdSiBzB88alMGI9BcQ4r96J2tr4EaZ0VCTH
	QfVwtuays8kJN2Q9f5dgFLBPOFrVAz59Urh8ix+f5Ok2Z9o9TTbZ/+AuEs2Ky63OBOq2FQF2Eno
	Krzn6zW1C3CYo0KARrlWwDi1AFcmFboiEo5RY/fEC5z3pjkxVyqqVaqDzpmzUu47u9QITv9Nc3x
	7lW8D4Qh0H5Z6Bu+Ip/+ATt5IFNm8JaaEXehBZd8h+fQLs1tLvlOcEoHmVcpVZwh5wN+wFE3qM6
	NU1DB0HkNMAI=
X-Received: by 2002:a17:907:9622:b0:c3f:dce3:20c5 with SMTP id a640c23a62f3a-c50968394b6mr992587866b.44.1794841384189;
        Mon, 16 Nov 2026 07:03:04 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm439306966b.75.2026.11.16.07.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:03:03 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] clk: tegra30: Remove CLK_SET_RATE_PARENT from CSI pad clock gates
Date: Mon, 16 Nov 2026 17:02:39 +0200
Message-ID: <20261116150239.264139-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116150239.264139-1-clamor95@gmail.com>
References: <20261116150239.264139-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove CLK_SET_RATE_PARENT from CSI pad clock gates since changing the PLL
clock rate is undesirable by changing pad clocks.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra30.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 61fe527ee6c13..f427786a8ba8e 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1010,12 +1010,12 @@ static void __init tegra30_periph_clk_init(void)
 	clks[TEGRA30_CLK_DSIA] = clk;
 
 	/* csia_pad */
-	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", 0,
 				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
 	clks[TEGRA30_CLK_CSIA_PAD] = clk;
 
 	/* csib_pad */
-	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", 0,
 				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
 	clks[TEGRA30_CLK_CSIB_PAD] = clk;
 
-- 
2.53.0

