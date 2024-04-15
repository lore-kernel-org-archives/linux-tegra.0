Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EF515FA8B
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 19:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209696; cv=none; b=WPISDdRiTYeb1VzTHsyOZS/v15VXB5DMy35u388MLvs625E9Ilg82ksujFszz2gvh73ySdYDpKiOqs5LSzaw7nHlI9Dl0CWHSd+wsrhP4ZML0ojcDorM2EjzpVo7jmgEFqV11Z1t8W2DmCnasEdBZCTXWJuM2RrTJFx6Ax67CPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209696; c=relaxed/simple;
	bh=qucjJRatI3PfJXMFAbwTvimzuU4TaNNx4LV+bRg/m9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7WjWiKcPoAvTv0FcmIV06b6n+592TN4HUsc+kUHWJceBIgKe/130Va4RIbE2cROeu5OTtxGlOXqHNERHa4MVFNC0iuGBvudkSXjz/D6xo4MJlozOUmD8t6yq08Pf8hPKKm0+f6mfjoPXG1bD8YQn+l1c8ZfE+IfsQ0K72+01Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SJfEEZRo; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SJfEEZRo"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-78d57bd5781so264773485a.3
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 12:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209693; x=1713814493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qWsKtiTtM68cPujZgkDbgLJScEQ/KU6IejvF8XzFy8=;
        b=SJfEEZRosqeBrY6kbDJCIviJYUZnRFBODKWFVABQv0Hj9roXmM1Cy+EJdXFatneMG1
         WwV/Eba5DMX0Y2rrfRWGyfJ4E/2CQNf4uKuDDK3rie3CM0y0uzx/UgPwY+u5bupGZynh
         VhUCc9xWHZmYcyI/p+b9jNM0UhxOd04CrfW8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209693; x=1713814493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qWsKtiTtM68cPujZgkDbgLJScEQ/KU6IejvF8XzFy8=;
        b=qaCopQRQ0lg+Ep6y/PdW/3J5HvEO1MCuO+rqlRmcXT3uArzrJrGRl/hZicNsaLtbRS
         HsiNPJ67xMh6n9pUi4vhzMgBMdkKBTP+P1S4IZ5SFjsGI+o0kkxOA9ZFC3huNmYa4U59
         pz/Y/vG1sq+kXRNWsscjsoldfHB5dUfD6EVcNYaFW6jm37eX7cC2kjsRM1XAE2H6IHLC
         KiKl2B1fQ56iNGBF2RHvJ412d+ROZ0lupf6ZD6H2sGxezMhK4vx7dTBU+rq02tNNkMNM
         6tqgHyJzAzbOIgKP9kJ7ULMy12oHpL/37sOGupUDl5JM/VE8NVLX2Z0mdTRGm31Z5Sn4
         8CEg==
X-Forwarded-Encrypted: i=1; AJvYcCXLhZmj5KeKUlaL5kDbGqxwrA0ZZdSqI3zds/82qjH1xgENJ3EI4G1hhLkrHxJKNovTn7Xei+osbep8TQ+nS+DzY4wU60YEiE9Rm8U=
X-Gm-Message-State: AOJu0YzamgaeIKti1EJxXxYpPdn41Uu8MP9PNqKb2bd2xgXSHmPSiEz4
	78nMi1Vtcqs3Y1seOz6bwtj6wijeb8EMeECwm9mXYuKw7CZml8iqy2CWoP2h7Q==
X-Google-Smtp-Source: AGHT+IE7tE6n2LOOWlxUIvgFNmo/Vr0dYpoxwwqjlaXwS/vDwhHd4c5esyFK2/v/y9hDaMP9p/kqqQ==
X-Received: by 2002:a05:620a:410a:b0:78e:f439:64ee with SMTP id j10-20020a05620a410a00b0078ef43964eemr19862qko.72.1713209693277;
        Mon, 15 Apr 2024 12:34:53 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:39 +0000
Subject: [PATCH 22/35] media: i2c: st-mipid02: Use the correct div function
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-22-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

link_freq does not fit in 32 bits.

Found by cocci:
drivers/media/i2c/st-mipid02.c:329:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_s64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/st-mipid02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index f250640729ca..93a40bfda1af 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -326,7 +326,7 @@ static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge,
 	}
 
 	dev_dbg(&client->dev, "detect link_freq = %lld Hz", link_freq);
-	do_div(ui_4, link_freq);
+	ui_4 = div64_s64(ui_4, link_freq);
 	bridge->r.clk_lane_reg1 |= ui_4 << 2;
 
 	return 0;

-- 
2.44.0.683.g7961c838ac-goog

