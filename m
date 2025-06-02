Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8585A22D4DE
	for <linux-tegra@vger.kernel.org>; Mon,  2 Jun 2025 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877543; cv=none; b=JI2gBK3yg+fj43LR3USY5e1qKKaMUHb7FeZNpCjD3jg6lcwWlwM3iTtVj8s+RL3puyk5B3Zj1RbSNG+EjeRUuRVIdXbwcu7aEQyCqhe1kmO8D3cvA6WLWxR7nW4IJTaylgj0D68EVsrEA9fd6x+njPdXDw/OMx0GmA5G4c/ddPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877543; c=relaxed/simple;
	bh=e1Jb8L4233LQhQU2TG7JzzCgR61N68NgK8m31ehsPJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ak8kqsMaZ6X1P12V68Fo1d7Yi53oo2CIamidHB4gf8GfvVWUuitRhyjNBNqvRME6pEshmSWbR497MjaxF5Plx51IB+hSlcJLCkpFEB4ye8hsrKIFfSbR1bGq7Ml4KxPlTx3VvkKZ4v+j2eOSEjRwQ9yPHNTxmYm5SJbaxeRucSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qJfiOSAn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qJfiOSAn"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so49423425e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 02 Jun 2025 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877539; x=1749482339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYI0Df/Q5zXhStAf9TQ+dtCVBtZRyAW6V2IwV5wSjV8=;
        b=qJfiOSAnKdobH/LAGLrhqRq+uoIqkUauZZ3Z53pXpgxg83HFmehv9TGx5SA8eDN2DD
         gDxb1CTS0DjLO7cU4cVt3bkVvWdJ54ENbNHO7n2DULAtpn+FnmFYhsN9d0M/L62RZpxC
         UJf6RijOtUHxqrbgjoDUxlXIu5H+t5ukVqF+mxP3jtrAYIzSdQSIEYfP8sWW5BAPAHiX
         G/4+I+pwPvUExPQpwsbSGqx5SnbyZpq4LQ/RcvYeybmMrYShz97Da0A3bFhBRXqfEGJU
         9jwI0NKX9S6+f+6wFnJne4Z3M82Rxq7aQF4LxmUD15Scg2YLNRl/WMj2B3bAeXu4P9Kx
         dgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877539; x=1749482339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYI0Df/Q5zXhStAf9TQ+dtCVBtZRyAW6V2IwV5wSjV8=;
        b=Dy+ghkZYKVdQfD9ahic3Qo6mdRT0vXvpq/7sZB2QnnrJIe+0WAfuD1btMzN9uGBgKl
         qAQiFNRAW2mjx5MryzmW9Q0WpYcGkreTqlDokCJphNg0nwseGg7wKPSvuArRBt1PdLRG
         zgV4LkARqMkvHUH1SiQIL84iEiapRVibNDI4d9gx8gxpTfO5zbgrSAJD3bXEXUmRimD2
         wsQ6njO4y82cARZlU+j8hGocAozHmmC+Gq4tgTDIE6QYwetVms8jpJqDeTUUfzaeVR0x
         OBnLeuCVnixntQ5HOtoHDRNN+RBW7NSsJzQYHfzduxJD6UjEqRgibOxtgibXeQDmRQlS
         3fxg==
X-Forwarded-Encrypted: i=1; AJvYcCWPP8yTVI+Irz9vxzb+DjW6UoLXj4qiv44dYJh7LQSBH7TAoB/QLWB1bDwcXJSVBiYavOaYhSd3lCNaLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlqqRptx+nXFCmjXApZ5DAv0zBh9KGaEafz4NrX3YljjnfYTA3
	OnkR8yP0jb3bcQOs2ZLyEbZyw5gXL80qaHZk8D1h0lQxsm45gARHKfSAsk/H0XxHehE=
X-Gm-Gg: ASbGncsXrI5hFY6KcRXPqut9ApGB+M4kUGICbNcJh7jlWAkrZyLmlhwPHykofW1pK7m
	xZWLKJCtPTVjM42RTz4D61D4opZU8v0qMargyJlHiVIh8MPLHTLJi/eBY17PMY6WlC8vQe6nkEc
	wSY1FSOM5IYVmow6mQf7yYTimC8Qbz7OKSRB9So4BddbKpeCPwgidO2samr2IqqfbtBibcnogSc
	RN9CV5YmoPf8Me5r6slfqFBwMuFNgwJE1K7m6slTstyI+MKr3SY3IoiMkJw0TPZG/mQG2Qktqsg
	J8c+PGNaVkGWSKLNws9fHLSJ6R/rjPr2aUtCCwvxGfYUU38llunp3j6QnHNiTGf9sJa9WX5nVoj
	L6HkLqVfmjMAh
X-Google-Smtp-Source: AGHT+IG1GHyy8b8GYVbfzlnN8+J2RSq7hqEKi6/Yl/QaRXVbKZmvYaubZ7QAl5jOTOJVDXQoWBizUA==
X-Received: by 2002:a05:6000:381:b0:3a4:f893:3eff with SMTP id ffacd0b85a97d-3a4fe39a982mr7159013f8f.57.1748877538797;
        Mon, 02 Jun 2025 08:18:58 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:18:58 -0700 (PDT)
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
Subject: [PATCH v1 1/7] clocksource/drivers/scx200: Add module owner
Date: Mon,  2 Jun 2025 17:18:45 +0200
Message-ID: <20250602151853.1942521-2-daniel.lezcano@linaro.org>
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
 drivers/clocksource/scx200_hrt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/scx200_hrt.c b/drivers/clocksource/scx200_hrt.c
index c3536fffbe9a..5a99801a1657 100644
--- a/drivers/clocksource/scx200_hrt.c
+++ b/drivers/clocksource/scx200_hrt.c
@@ -52,6 +52,7 @@ static struct clocksource cs_hrt = {
 	.mask		= CLOCKSOURCE_MASK(32),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	/* mult, shift are set based on mhz27 flag */
+	.owner		= THIS_MODULE,
 };
 
 static int __init init_hrt_clocksource(void)
-- 
2.43.0

