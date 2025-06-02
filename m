Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F967230D0E
	for <linux-tegra@vger.kernel.org>; Mon,  2 Jun 2025 15:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877559; cv=none; b=ceWC0AUjiE1Bn5hEOg0LnSVT6G9yqFPalCMeDlHhu/TADvKujlPGKeEpK32P6zmoB+3UnnOnRJq2yRoVr57K52h0WVK2vAIHRkjLQzgVdBW0WH37AVLhLNLUThAIQYv8r2a89i7dCQWIxfvwXy0ZaCwyhGc2lwwqAuC5ZC77PrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877559; c=relaxed/simple;
	bh=qXg36nIEaSbraDl3K9/tt/qe1tR1XHyEOkFR1xkoAXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5BwxriJ+8cNSx5cCQXe7yGSDFwc9I19Nfo90B9W3yEFL1eqUlj8wWRQYSR+aInVEHkQ61g+vHLPXgsq91psVPxPCevmtb9rRmRgyczAqVB151M7BeMszra9v8gNuV0FV4683sEX4LmzUzJBcAWoa8tGh6egQTvDHpaLs4LUy0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wzIbW7uq; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wzIbW7uq"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32934448e8bso44307891fa.3
        for <linux-tegra@vger.kernel.org>; Mon, 02 Jun 2025 08:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877554; x=1749482354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7FRnrLBkBYHmFUuH4KGx1nHshhZCeSgrXIZ5dzYfvU=;
        b=wzIbW7uqxUZcfsXCm9lwIDZ9sQuUYxhnkZ60Ketzv9pRHflF5dgidGZ0Kb0lYeAPAh
         x3zLeHlel0RzVIM7Oi3awlGDk0kBx/XVh5ZI6L46AEsYSYHh/NChzq3kkI7mS16uizeH
         NBrcGokad/Jd36vsOLDiyK/Guga/b2ms4L1AQ0o7XoLl9ZuUnaxDAH6ILRd0j74Wc5XQ
         jSh4Or5Zjf1nbaJ1THS/7R7vwDOfXklAAmCVfyrGViuxtCFBgfACgViUqeCI0VAvjw+D
         Q8O9KOa8qU+lBqw/sn1s0dZVPOfrVdQ48oQJrsxPiqIK92hmg95P0hHgklMgtO/YSjFc
         wuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877554; x=1749482354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7FRnrLBkBYHmFUuH4KGx1nHshhZCeSgrXIZ5dzYfvU=;
        b=cPD4Fsd4VvPfoWdyKHCyeoZwwk7OhZ9+zRUqVXdJtHej8cW9EgllX/bFMrzo8P9UMX
         4mR+KhsDqot0msidX5sycq3yspzKpT8b69ALUBYDFPmv2eofO9t2l0QopJ+kLYSphkE5
         MsNOO4sBxt23qnLOpvoeiCZ06SD8r659EDZTmvCmsijW6JIiyvTULY6cgdy2rhcpQFUR
         KrQvjRWTxAIW6FZZeltlFuazULjei3R9hezfVlyuGFmIpCvmU1AkNgLi05wSaFgbeEDY
         IUvYN8jRsYfaHqd17t/LwHJhUM0fX2IGIjWJcuuaEjUfUzgsCw4PltijGH8cgloI28Ou
         sd4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXohJZQgB7s4x1OuXNEUUoGnuROb/2IYchS8Q9OuRJO4oS9n4+kOz6qlrGFUMC7xzsFGxZbJx+thS5yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQyo5NFkClcEpKHFwihyb15DXR09hI5I3LFxiaPjfNl4O5wEKy
	gKnuvyJYLdm5ILmSXgMKQrAhNuNvC5LJeaWJ7bxfjFTcqZpENmVxfBA9VzaX+KvxyPnhtAzfWPL
	F/mjE9FQ=
X-Gm-Gg: ASbGncuKfDAkD1MBspyS3mYb2KYe9AG0nct0PQ/WF1hUL2IxTTCN8AhwaXlFXHH+th0
	fWwYiiX1dKLNBD1OvmIC/XBOviPhQiEpkXM+soOpA0fCROPxEnHrUlqA4FdQ0Yp9YmaHZyM1vSz
	nHnr7TjV984W2+IZU04NCNB8umbbhjTLLzsFuS9BKLCoBRZ+Lq9/jZjZyW1fia2Zxj3JWtzB8X/
	OHqsYCXk9+bb9qqmPiEYm09ziSgv1l2iy+BKf3Yebh5IZLa1Yuxx/LKNYYPV+wQ5USn1+VAk8UO
	4gjZ5iyi0n7hRlswpGGVRUP+jaWEoi2jn//3IGdlL5tC4rbPUevUS7a+qTya0NCGZU6l+4upzYH
	VQg==
X-Google-Smtp-Source: AGHT+IE+SpRjISuBJ+0qyPRe6UZcsVpz/N5qpzBFRSza5rkSFVM1NCoj9ElY/SVHO3bb6cTtRiaJ4w==
X-Received: by 2002:a05:6000:26ca:b0:3a4:f787:9b58 with SMTP id ffacd0b85a97d-3a4f7ab515fmr11075338f8f.58.1748877543609;
        Mon, 02 Jun 2025 08:19:03 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:19:03 -0700 (PDT)
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
Subject: [PATCH v1 5/7] clocksource/drivers/stm: Add module owner
Date: Mon,  2 Jun 2025 17:18:49 +0200
Message-ID: <20250602151853.1942521-6-daniel.lezcano@linaro.org>
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
 drivers/clocksource/timer-nxp-stm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index d7ccf9001729..bbc40623728f 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -201,6 +201,7 @@ static int __init nxp_stm_clocksource_init(struct device *dev, struct stm_timer
 	stm_timer->cs.resume = nxp_stm_clocksource_resume;
 	stm_timer->cs.mask = CLOCKSOURCE_MASK(32);
 	stm_timer->cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	stm_timer->cs.owner = THIS_MODULE;
 
 	ret = clocksource_register_hz(&stm_timer->cs, stm_timer->rate);
 	if (ret)
@@ -314,6 +315,7 @@ static int __init nxp_stm_clockevent_per_cpu_init(struct device *dev, struct stm
 	stm_timer->ced.cpumask = cpumask_of(cpu);
 	stm_timer->ced.rating = 460;
 	stm_timer->ced.irq = irq;
+	stm_timer->ced.owner = THIS_MODULE;
 
 	per_cpu(stm_timers, cpu) = stm_timer;
 
-- 
2.43.0

