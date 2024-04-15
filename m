Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E1D1598E0
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209675; cv=none; b=RQLn6dHgowDJoKrrRuq0QrfiTjVGzyuRCdcyNOY4Nck+l7AE6cPvP7qrXO0O1Dr9joyKz2CLX5vL3qQ/TSimlX7IYTr9uhAikXq8jC1buJJtb6frj39xjmuopoBPxgB0H8m8g1eE5PyUZZJSGJbPEh8Z+cbl5qbHHakLyBpyVhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209675; c=relaxed/simple;
	bh=MbsdVQbCUWEGseggQJElQClzRok+A7X+zU8VpB5HgWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UZJGZuYwjjLmq9alUPrmWAfg578kSWRZbTdhH/oGrtoNo9iv9730LPNalQ/P97SvaWYPsfHeSo/1zr3isxBOyViiTjtjSRiq0FlLG7yVQ48E4Okelb5vhus7qjoZsAyGqBACqc69bKpMFllaqReGfZihkvohhRe3AI+fvd7w8qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KAGuS3tW; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KAGuS3tW"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6eb797e10ceso1201259a34.1
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 12:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209672; x=1713814472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30a1609TFHVDYvbsiCwVx5jyS7S7qnpRfAGqZPi3zic=;
        b=KAGuS3tWCioKwaL4Veddi+f+nmt9O+ydZxCzOVHCtWE680n4ncHcBVba6K2jJWC+8i
         c420YEitDUOvtoJyOfc+PMWsYShnlihUavtt020b8oZeST+9yHpPnKQqCORD44KhhaG8
         QOlB/BvNEV82iE7HgvghN8LqjQtVnipAwmIlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209672; x=1713814472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30a1609TFHVDYvbsiCwVx5jyS7S7qnpRfAGqZPi3zic=;
        b=OCJDy/KdB8HMkkrszTBlwUX5nm2HaEM10/qcHoDysRTYxmP4b4ZNaOnGTtvznWe/tG
         qQwLWgOv5AQlTrwG9OSoq0b/6xrvk6TJkF8GpcIIb6H7us/1k3QEbhm9+yhdEC4bsqAm
         8Od21ptronZvrbAhiLaJB8zbZV+E44KYKObJUp8/FSb1wVEbGSfHq7IjnOP93tm9DWCf
         9xCAtrOnxDwoQEKwc7DDf1r1mjiSRNMzW3f7P6+4TqQTKby76jdmWdWauy7Fbrd8ZFa3
         2m9yLWLk9xDyh9wj7gT5Oqa0YV/xpIkZKCeN77/QEXUeNzZCr8/QJ8UHXRjHFf8Bwtyb
         Ok2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/B0v60FLW51UiMiXfmpXCLHknpefbG4vFVhHLz7AoxbAB6laZQl8Us+oOXHwCIDUhlPnuMIpLrSg7TIFDCZMb20UA/pwzAQrTdkE=
X-Gm-Message-State: AOJu0Yx1/MFIsDC81U8UvZJjAiFDWAKnvJFTV+C+X10+lLB1RY+CCZyk
	XP+SbZmMGYGjt2+CNpCR+U0EfAvUVA5EyHBCfsfALMJGc7uroO+3eVu/TRsTpQ==
X-Google-Smtp-Source: AGHT+IFajy4caV38o9egD00xBm8+r7fFdvax0FnbVE1biamOQ+jag9WqCsqV4RWMv5Us6Un2NRlLiw==
X-Received: by 2002:a05:6830:14cf:b0:6eb:7a07:8746 with SMTP id t15-20020a05683014cf00b006eb7a078746mr5458830otq.31.1713209672276;
        Mon, 15 Apr 2024 12:34:32 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:22 +0000
Subject: [PATCH 05/35] media: go7007: Use min and max macros
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-5-477afb23728b@chromium.org>
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

It makes the code simpler and cocci happier:

drivers/media/usb/go7007/go7007-fw.c:1292:14-15: WARNING opportunity for max()
drivers/media/usb/go7007/go7007-fw.c:1293:14-15: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/go7007/go7007-fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/go7007/go7007-fw.c b/drivers/media/usb/go7007/go7007-fw.c
index 018019ba47d4..86ce593e0c54 100644
--- a/drivers/media/usb/go7007/go7007-fw.c
+++ b/drivers/media/usb/go7007/go7007-fw.c
@@ -1289,8 +1289,8 @@ static int avsync_to_package(struct go7007 *go, __le16 *code, int space)
 		0xbf99,		(u16)((-adjratio) >> 16),
 		0xbf92,		0,
 		0xbf93,		0,
-		0xbff4,		f1 > f2 ? f1 : f2,
-		0xbff5,		f1 < f2 ? f1 : f2,
+		0xbff4,		max(f1, f2),
+		0xbff5,		min(f1, f2),
 		0xbff6,		f1 < f2 ? ratio : ratio + 1,
 		0xbff7,		f1 > f2 ? ratio : ratio + 1,
 		0xbff8,		0,

-- 
2.44.0.683.g7961c838ac-goog

