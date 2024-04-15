Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935E51635C4
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 19:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209705; cv=none; b=VdamXXGXjzhr9dpNxTrsWuYOib+pD0PQx3Xzgiu3+8gZYwimVJCHMRbjqw6r3SIBy63jT6yx+Dfj8EyhyvimZ8eldEDPmHRBWPOLdodWdMQwg2yVOK/bUukhVO5pczvr7pkiYglnmmPAgjeyNuRCs+4/dnhWZ+tc+DQxJcCfpfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209705; c=relaxed/simple;
	bh=VhbJFqc8QmLlbHWJnEENrvmuq+ozcGe5o6fFyH1YYQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E5gnjfO1hjAcyqAbLqVBgcPzDW0/n/6mV1l2TfFMhg8zbeu8M8SR2tpLDjST0/QQXYbKg55BIKPImM4RkivkPZmrLh5C50v3eWLjPmbBCjTiYwZj5SDPNq9rHUIS7Lqf/q0aJJTCQMEktrkXt7FO1GAkhbRkG4eyq1Z5z3sC8jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LfHIP3YS; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LfHIP3YS"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-78d77b309f2so322302585a.2
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 12:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209700; x=1713814500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhmQYYxWMuudLBjdJjOGHKHYUzO1QQEhFUDY1X02X9Q=;
        b=LfHIP3YS/F+mTAzygDVHslx5fAuRJQnA2sSJ5ftryYm2qeaCsuA7qFlI+6p9qUxdkL
         GuJ9mP67JlIOKKIPlIcpEvUvKrahgJfXZ2/yGY/pppGNfmjI/IW5WlCChJSzsdgMAgwb
         oMUzsZcPcHH5obx5uHQ2Eq2tJlkHdq4Lai9No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209700; x=1713814500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhmQYYxWMuudLBjdJjOGHKHYUzO1QQEhFUDY1X02X9Q=;
        b=Y9YRL7jrr/Tfvj7oWAqPKfzkZCB4cXS3ewuDH9rBiEMK7Jpjrl+dOHTK7r9RQFs4Do
         FNS9BnuiFFcFdIKu224ZRakS6X4kj4QJ8gQcBNnRhrjTA1OjdBnQDvJXLYYcFU6CfrIu
         aQ4w6/g0Yg3Ye1/VfsxSSEsgKtArBBnckY7kQnhycc/p2/jfzqgzAvsVXY3M5mE8DrH9
         HGdd+e0wxyGiwNaFjd3jSII4J8RGJXGdFLqqRRddQRTNG3l/KIha4iCtcoYC52PyyF3c
         TheAR+FMeqPcEtkUKj6R3lN+8qQVt8vvXcZ6iRPWJZoB7JErIGJe6Ingxj4cu0RY98WP
         dqww==
X-Forwarded-Encrypted: i=1; AJvYcCXCmqLM4bexkvemyVNDpxRJHM2jAPQmYuF+cXgm13xHTXxYLAgHmqjaBoWibFwZyke7kw6Hjy6bKI8meb10VxZwm3sPEr8ES8+keis=
X-Gm-Message-State: AOJu0YxW4rAk3z7eoYdpXIXtjetcxMxTJVj/iAJ7FgTwhJlfDxzaf0jk
	k6ExeqJAQ8dSfZf6wf+ZjQEvZpuEyrcf+kLv/8BI/QYrv9OJ68/PpcMbq1rmJw==
X-Google-Smtp-Source: AGHT+IExc3kiGm+hEFRw+kQDfViul4woHzF6WRs96subTZ4c8qoJuWqvczLaOhJGq/Hyw06BNYyVfg==
X-Received: by 2002:a05:620a:3182:b0:78e:dcc4:339e with SMTP id bi2-20020a05620a318200b0078edcc4339emr7592795qkb.11.1713209700585;
        Mon, 15 Apr 2024 12:35:00 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:35:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:46 +0000
Subject: [PATCH 29/35] media: i2c: rdacm20: Refator return path
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-29-477afb23728b@chromium.org>
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

This is a nop, but let cocci now that this is not a good candidate for
min()

drivers/media/i2c/rdacm20.c:363:12-13: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/rdacm20.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index b4647bda8c21..b40d40b0cdd4 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -360,7 +360,10 @@ static int __ov10635_write(struct rdacm20_device *dev, u16 reg, u8 val)
 	dev_dbg(dev->dev, "%s(0x%04x, 0x%02x)\n", __func__, reg, val);
 
 	ret = i2c_master_send(dev->sensor, buf, 3);
-	return ret < 0 ? ret : 0;
+
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static int ov10635_write(struct rdacm20_device *dev, u16 reg, u8 val)

-- 
2.44.0.683.g7961c838ac-goog

