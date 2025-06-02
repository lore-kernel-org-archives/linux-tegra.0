Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B1022D9E7
	for <linux-tegra@vger.kernel.org>; Mon,  2 Jun 2025 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877546; cv=none; b=hjNCXGDERgyLoTkJ6iNMUXGKm0cUOKPo+zzt+8BRrCXoIKxl7xrAHgbZrhJ4lR+g4nsyo77a2s94gg652NJj9BkhNLa5vM++nZojUsyCaa94Nht4icVPLy9+ZVRORkFt5lcutKBYUmi4EgByKvzC5vp7qy7waEQqNgHyiT7CQAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877546; c=relaxed/simple;
	bh=fAaZ3L9vEbtazUSHdMUtxxloxioTW1ggL5LaUshczj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taEVepJ3OHC2p88V6hv1nrVmMkYfQMrIFiA8A4S4UQBnmp8+BMYdb1w6heq7JAxAOcnQQvolJGFsUfWHTozTQBg8lPTOAAj/3xvSE1B5qEiocKlVcLQLSMgiCQb39nPhicNU/uD5XOSE58NDG26bHdAN12MZ1FP7u8soiSecMys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F91URjb/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F91URjb/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d6ade159so12866135e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 02 Jun 2025 08:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877541; x=1749482341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2bXZElBrRwneMKewEI3S9wHUbgph+s2MD8uEMc202U=;
        b=F91URjb/WGSoAqAcBC8zFjUfDp1lz/YszN3KYCr6bGO0Tp8Rga+s+biUpF0AE/DMqQ
         7KAny3x/t60b65aHrC1KflTYMQG6Dh+ECjxWv4dNSQDeuz6WRSdEoFbsWdgY8BuASXrm
         FrSg82I2BQyGnCx6i29qgDNZA/9AquaSKRlR4AHcNndnd3iasRf3G49QgWunnFqN63h0
         q8RA0zbRyPQPtau6MCMrSxJ2znqryoKBFe5n8y1aPh5WN8Q6QH5WGfNcHdZoZYJMDUS7
         CAcMEVGskAO3EnDB1GEtLzbGMlHGH3BRfhPWxuXtEaLgork/ASe0y1fUIg9ndRzzbvit
         Vwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877541; x=1749482341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2bXZElBrRwneMKewEI3S9wHUbgph+s2MD8uEMc202U=;
        b=rKTHQ1ME37kIAH4ISzLgA3jetG4FG+OGI/0/FudCNJ5uU8yuZ+JA7y4BvU+nOW5RpH
         RCNOz2OLOttTJcnlHDEUrzJPizN65Oyl9CE++7recq27pngwLtLoObgi9n1WtaFXG7GA
         D4ETZjdVJA3rfCcAk2gh/0YvPD6vhsAc82eKAL06WdUwt3H845WG72IQHpdO231fnLTw
         Oh3795G17jtxiESi/PArLZVM0gWsrpndPvPz8iGHGqN1bwoSMy2hXgD7EmLLwVEq6Sh3
         REgt91bluKD1llmG+ZeumAi0SDcbo8JepGQkgHS3y7tubLdB9OtAJdGleizdMhtIaWy9
         B+yw==
X-Forwarded-Encrypted: i=1; AJvYcCW09zwxRJiiVuiqCPRkb8MXNfbEMbEB+WHW/nzoGIaNKCcN8nbc6qEOwhBdwMNEJOiGxg2ioRuzfYe/Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEihOPaa21Mgmf0lcHx8zQuq3tyZy5fi9OatHGvsL8u+nM5U/2
	wAQLZ6DGIADw6gPWOj4ea5x5LPtV+K2uY5jh+WKGxz73TTgbGtZ7PhktU9sqWrHwCv0=
X-Gm-Gg: ASbGncuJ0Y1rAp5rgaGycsIyQ1WgrD2NEacj0qr3l1GDeAkteq3U4cXH7+w+8LLlYcn
	Nmt2A17U1kQmIMUWkCef7M/npt8Sfz6ulI7ExGsflVqhLXuBdsK9RM1qi6MZWJobSVTRlyIhRGS
	CAk+Wp7oehZbACNud89H7qdktKyytjl+bG0ANQ0Xg7f9WsLNRqhZl+HHa/o42ZPE91RQfkCxom2
	v8iN3px0G1xgV6+VCfppGvGN8+p/qCsLPv7KTxTZwxlXQH3OVBtNeKdJ2E9UWBh4uf0AYWWII0G
	8wrAD+R5xDBDXRhR6LsQun0y09soL7drf/huMo6HJShrD/3hWZLAuxyDHCFEXrgrTmf3FSctNNp
	rz8FzcLQ5cSCO
X-Google-Smtp-Source: AGHT+IGm8o6nqRRjiZlM8OEtcH7Giz5iqVqvOKIqNhMfKW6+DVKKTld7vkKIltD7iNqNITzYzwGGxA==
X-Received: by 2002:a5d:5c84:0:b0:3a3:7ba5:960e with SMTP id ffacd0b85a97d-3a4fe3a8214mr6931603f8f.59.1748877541180;
        Mon, 02 Jun 2025 08:19:01 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:19:00 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	John Stulz <jstultz@google.com>,
	Will McVicker <willmcvicker@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: [PATCH v1 3/7] clocksource/drivers/sun5i: Add module owner
Date: Mon,  2 Jun 2025 17:18:47 +0200
Message-ID: <20250602151853.1942521-4-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The conversion to modules requires a correct handling of the module
refcount in order to prevent to unload it if it is in use. That is
especially true with the clockevents where there is no function to
unregister them.

The core time framework correctly handles the module refcount with the
different clocksource and clockevents if the module owner is set.

Add the module owner to make sure the core framework will prevent
stupid things happening when the driver will be converted into a
module.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-sun5i.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
index 6b48a9006444..f827d3f98f60 100644
--- a/drivers/clocksource/timer-sun5i.c
+++ b/drivers/clocksource/timer-sun5i.c
@@ -185,6 +185,7 @@ static int sun5i_setup_clocksource(struct platform_device *pdev,
 	cs->clksrc.read = sun5i_clksrc_read;
 	cs->clksrc.mask = CLOCKSOURCE_MASK(32);
 	cs->clksrc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	cs->clksrc.owner = THIS_MODULE;
 
 	ret = clocksource_register_hz(&cs->clksrc, rate);
 	if (ret) {
@@ -214,6 +215,7 @@ static int sun5i_setup_clockevent(struct platform_device *pdev,
 	ce->clkevt.rating = 340;
 	ce->clkevt.irq = irq;
 	ce->clkevt.cpumask = cpu_possible_mask;
+	ce->clkevt.owner = THIS_MODULE;
 
 	/* Enable timer0 interrupt */
 	val = readl(base + TIMER_IRQ_EN_REG);
-- 
2.43.0

