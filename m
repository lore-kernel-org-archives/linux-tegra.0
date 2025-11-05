Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57283451B2
	for <linux-tegra@vger.kernel.org>; Wed,  5 Nov 2025 19:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762372431; cv=none; b=pMjcVHZZ/6Tk4we9SSjkw2eLtnMQsCotoh5/T/byevUgxQwUAsKtNFapmh50uk6Da+JFoEEbJrhVZFa5DTrhMEr6CEoWH7TmkK5nO2ErBczmHtp64GFqIOZG5HsHHQxpLCvZG22tpm/6XezkVBjdI2wMTM81MpOz2jgtLhXbVd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762372431; c=relaxed/simple;
	bh=aFlIqj8cX1NQ0lCzxiSyrrlu00dbSVu+NizVPVqZ+Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6A00ISMHeijfoiKhF6/oc3SarIkRdJo0zVvkMfUvq4RJ1Rr9yKwBTHLl6dVj2PiDv25Rlpz22gsl+XK5ItejjtWAnqEY+s+isq5xGCm5xMbT/UrWpnx07B354p4rqLBsgIW7X8RHlF49zaYZjvFDcMIaLDnsEevJeRgktNxGnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSk36Jil; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSk36Jil"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640f0f82da9so285078a12.1
        for <linux-tegra@vger.kernel.org>; Wed, 05 Nov 2025 11:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762372428; x=1762977228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pg1s0jiPxmjQzUA2OkWwvLk1yS9N8UGQ6BwkSG5FxaE=;
        b=hSk36JiltwIz7g348Zxjr5EqRfOPHeRBzOeDi6qv8R81Bt/Yw65cNuQE9hVSkejR/c
         uzvkczpjWKSnQuOyxG3DOrn87xXKldqD6r1idCyfD7y0ZP5DOYduYLVZ1e5T71mSAeWP
         0Hz5kRdnZ5/+oqn5jp4FHqjIUSlWa7jwxe7s8djFvsj98AARUlnRrhvxU3Ts8oVO7Pmr
         oQdLLXj6xLxgGMZZYuWJ7npOsNgeLueUANd7BUurV8dGUHrDb6Z//r1MRekHmWKi5xUZ
         v7OAU6rr9cU56k7zNZTsTkp2vDJi8qB5waDsZ6AZJXGiJ6H6wq+xMQfLJSI/mv4h+GAQ
         5Ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762372428; x=1762977228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pg1s0jiPxmjQzUA2OkWwvLk1yS9N8UGQ6BwkSG5FxaE=;
        b=cTzWdpSmR/1c5v4H71h372tj1P5egQvuV2PB5TqoS68Vhi5QMArcWNDQ4bDINA1IrE
         s7EVv3YiiUd0W+knznhHrTGDSafQXoVygJ/xUebJmb7DMhWGi4yQYiR22Vmo+5ZcPx0z
         SVt+sKOQ8cr03wJoV54zzUkRgyLmLh8KRO30jneud0psLiyWNNaJ5BvEQG3asvcNlIP1
         uhHQJy4HMHp0mYSs5GlaaGsnPhEonrnyx35zAH349n6a/JtayxyPlKqsAqpnDITncMvS
         0d3equRaQ6K3UrYBKSuIR9wBfYJxQTy16l6klI7Bc11uGrMHIHry+7pNVCO8blF/9v9r
         r0sw==
X-Forwarded-Encrypted: i=1; AJvYcCXiNc6ryVXp91N7eIaCxDdkGT2syJrczgkUtECFpiW5kOfKDoNLVEVFeXe7Vr1UkGK6nA2wE1KjGjJxaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz0L22RETN2unxd0yV9vnz7FDAKf5q+z+7e4JepzIuyq1Z0R0J
	s5aoCVj035riBAevaaUlh7tEANxIh+a9CvOCX3F4pa/s3xCwrQwJ6Ci8
X-Gm-Gg: ASbGncvk7diM8oyCC6O5jtvB9094V4OOZ4oQkDPXeyYDdcLZefJNlA6ma1Z1XdThrF6
	hXEsPLTGn//cJP2xnmDFwQHgDw67XzKy7VGV+mmEwBa5W+lCRp24D20BxkzLZFshuMWqcmg+3tX
	ASvKMsCxpuxn5omBEpoLNognqzxDp+7C30QG3Vsd8vo6KSR0CUAOM5JhIVLQTL9CYk6rSanT11H
	7H7zq6VZCDklbnt94Oxn+9g3wir6i+1rYrPOn+S1k1DS5VoVa77edMn0uPhsfEacZW7pgwvxUxC
	nRdWSaiDVKHs0xBGSu0nJwllVoe8WVO+A4LVl+9eJZY4fNjm7g6gyX0txJDPf49+YvExbDS1i/g
	FynrJDXlsGeHax1aNR5e2VgOTikqski25QYZGdZK+yHOoVNTR4laIrG4NpVE/xjRWdDXBZ4HQL4
	oUFvShKA49g19ewdvAQp+KkmEUm4NTEwKhIoDsgIP+6ncJsxOM5zk62DjFRXsRCJRvGSWqRpLwf
	kHYhTM=
X-Google-Smtp-Source: AGHT+IFu/BJUgqVzC+0jB97MzllQNZ57Y5RAgO/mx+gwuQJPWfhIHg5Z6D6gZvFid0rSdIKZNllB2Q==
X-Received: by 2002:a05:6402:2686:b0:640:7529:b8c7 with SMTP id 4fb4d7f45d1cf-6410588c635mr3990360a12.1.1762372428058;
        Wed, 05 Nov 2025 11:53:48 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713aa2sm21117a12.1.2025.11.05.11.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 11:53:47 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] memory: tegra: Add support for DBB clock on Tegra264
Date: Wed,  5 Nov 2025 20:53:41 +0100
Message-ID: <20251105195342.2705855-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105195342.2705855-1-thierry.reding@gmail.com>
References: <20251105195342.2705855-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The DBB clock is needed by many IP blocks in order to access system
memory via the data backbone. The memory controller and external memory
controllers are the central place where these accesses are managed, so
make sure that the clock can be controlled from the corresponding
driver.

Note that not all drivers fully register bandwidth requests, and hence
the EMC driver doesn't have enough information to know when it's safe to
switch the clock off, so for now it will be kept on permanently.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra186-emc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index 74be09968baa..7a26d8830172 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -33,6 +33,7 @@ struct tegra186_emc {
 	struct tegra_bpmp *bpmp;
 	struct device *dev;
 	struct clk *clk;
+	struct clk *clk_dbb;
 
 	struct tegra186_emc_dvfs *dvfs;
 	unsigned int num_dvfs;
@@ -452,6 +453,13 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(emc->clk),
 				     "failed to get EMC clock\n");
 
+	emc->clk_dbb = devm_clk_get_optional_enabled(&pdev->dev, "dbb");
+	if (IS_ERR(emc->clk_dbb)) {
+		err = PTR_ERR(emc->clk_dbb);
+		dev_err(&pdev->dev, "failed to get DBB clock: %d\n", err);
+		goto put_bpmp;
+	}
+
 	platform_set_drvdata(pdev, emc);
 	emc->dev = &pdev->dev;
 
-- 
2.51.2

