Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E77334C22
	for <linux-tegra@vger.kernel.org>; Wed,  5 Nov 2025 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762358726; cv=none; b=EGgzK11pmDHJ4Ti6WPnnVAZmmupaU24fEzIUWCvZBNtZH9alojNYm9cQvQIMWAoJinuw/Kdtr9K8nswmMR/8mn3tFBzPf3o7rob0zhGc3OZQIaXPJHX/5Iu49vZdlMF73I6nk3TGiETV7Z8x9s5V0L7AxMbmujnU30/AxRlRnNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762358726; c=relaxed/simple;
	bh=aFlIqj8cX1NQ0lCzxiSyrrlu00dbSVu+NizVPVqZ+Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPG0V0cMVE7s1Bsv7PgougcpSKL0mIZ7s4cpYYBqd1JIzBesFtTFhxKofwp0ZLTSFbOauWdXS1agAbyUx9yPFpC/w4nBuGd4rdn28FjO0NmXLGy4cG/knD+RK9xKWPU/OWD7mt0Vu8nXuph7K5WZDSPK8rWaC5zd/40+KBB3vG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXz+q+n0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXz+q+n0"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so6028905f8f.3
        for <linux-tegra@vger.kernel.org>; Wed, 05 Nov 2025 08:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762358724; x=1762963524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pg1s0jiPxmjQzUA2OkWwvLk1yS9N8UGQ6BwkSG5FxaE=;
        b=dXz+q+n0DxOPhgM/XkuYZB3w8sJ4DA/fN3Cnti4cCIrUxqGofaR29kvvIwJxNv1gJe
         IJLr3zS0iQhBZO1/MpwNj5eBe9yWPVd9ZmC48uKccJWEFRwoFXlcJWJUKqodxjP6MrBX
         7NCUZmVp+rYY4to0DT39er3Xr4pJ5rdKldYzj0O2SuJlz9eemAD93JPS6WR2Z1xFXbOc
         Pvg1wM6lgjc2J2AhFK8Vy0nuOA8it79K0JPcdWpbLwi1kU87p15YiqFfouHJgfbVlDc/
         qm717sSMshmQ9/DGe5KMqJLRSzPiWV5WC9ULMQiLCwWbNIM563Y48EtiPlO+5ng892K9
         KyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358724; x=1762963524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pg1s0jiPxmjQzUA2OkWwvLk1yS9N8UGQ6BwkSG5FxaE=;
        b=T5e+WtTbMIO/mn62zgeKHGQlyphLCAkp/06Z/tXgYjiCXhTr2l5cVPV/NsCpqssK01
         jhGcopQkUJHVSYOK3iPf8ukzwA22M9MnIEO8S/q5zFuchIR35ezhTX1i6u6Ik3ajs3sN
         xpkufiGFa9kkCnMiJO9VundStm46ec5QtoLGeL3FDz0jEJ5s+rQhG5lEVuyjQBzLOffp
         a0FtoaK2iljStLunajw5CsAyiMdAqRMcrXPdQX0KwYp3g50E28Yd1RjYeW9Yxpf9d/vY
         AG6std9u63Hajeq+zAQqT0iOnX8MUIQr74SK/xBIcc1k7xmz0m9xpO4kzC2Qu2dVeKS7
         GAMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFvT5mz4/T0wqzjEbwNEMbTTPljuL707qJWvoA6GUIYmZY1EiQkK0Vwsc2lus8pRkIf/FkA4fI10vm2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy18gpNqt56gHutExO+mKvOEyFhaYXYrmpPjYij4M6Mhk3P7IwP
	Xo4rdVqRzhRx3U5r7aRslR92r7ZU5uLTq4YobJClQkw5HE7E3EQWnNgI
X-Gm-Gg: ASbGncvsphEq+pih+6UbDWxHM15tModyAURK32OHvY+Xpd5oVCXOKem5R7KwofZrA+T
	kJBq26v+aZeTWg+ypYXU2Og2y78exiwxlRm8m685t+cqT6PA0FpQGQPY60g5EeX+VrHrpezBozF
	B1ujuVhnJ98fv7WwN8fvwOpDq9JNoYfyqK1EZdcBt5zMTo04cLcnI93R+SMWKphzGMNDHITRUKM
	B/dCrUJikgV9JVZWQYaScPdq11ZynCTbQsybWrs8gAwlujd1aWu/Dbob6RzyG52MzlK62sLXWSd
	AbJICU16+iodXVX8lPrFZgFA+vFC4PI92BKA673kPUfzBg9q18MoBH2tH0ehe0XfKlb/IzdfBrc
	6W2Sm/iohWQEdEQzzoKxIR7/czu3HcvPccMjeKkqpZkTlPWvdNAtNhmWlapV8mftzpL/H+Un/c6
	VReWkRKLl1LNMTOhTyegOPYweOwwdKc2xkrZX5RdQRQpUcXac7ACIyJu6Dnsb3WVTQehDE
X-Google-Smtp-Source: AGHT+IGRfnGJjlSWk/FWsJUYLJaIiQePxFopFGsacT+cjTxMYpRK3/QdhNesPFcIhQfYEBrJSv7gug==
X-Received: by 2002:a05:6000:2387:b0:427:151:3db6 with SMTP id ffacd0b85a97d-429e32f48bcmr3510510f8f.24.1762358723585;
        Wed, 05 Nov 2025 08:05:23 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1fbd1csm11372505f8f.38.2025.11.05.08.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:05:22 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] memory: tegra: Add support for DBB clock on Tegra264
Date: Wed,  5 Nov 2025 17:05:12 +0100
Message-ID: <20251105160513.2638408-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105160513.2638408-1-thierry.reding@gmail.com>
References: <20251105160513.2638408-1-thierry.reding@gmail.com>
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

