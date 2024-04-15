Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4351C15F319
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209693; cv=none; b=lPz86i13fV8B208AcAP/OfZodc6bR35+yZE01okc8jQ/6lV3Pdkz0cVKytHbsuWfO10VOkc6HJHndlPVRtVHBRXUx0rAL5K9frTi4HpcTaw7oF0nkuwB7ZLKEw2v81Y3tNdQEcusQiGWnw1i1RcCGqE+1yH4JAqzydr+sOE3970=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209693; c=relaxed/simple;
	bh=uneKQTx7g7YpgV1qfns0GCADDeBeNkX9SjOTc7QrTqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gmla+xL+qhNhZ7rjHWo/sTt4RTNhLwg87xqM/bhtK9sErHGWHrP2FhbK1zsKfgJ889+Cr765iUlcPCUOC9u9ouKwmKb/bWlUPiUf8PTLvQTQQ+pkzwlMC51w3MTO6pYzfqg9kZ/sDXG3VSL+CDtfMeBQtpvg302vHLdYHNctPTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bm+x/cvY; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bm+x/cvY"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78d543db3a4so272579585a.0
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 12:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209690; x=1713814490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKMvbnJBvce6w6rhgAtTaziLR0gQM5TDA935faRghdc=;
        b=Bm+x/cvYDDS35S+SV5eBbryfuSZp1I06tJ0xORnrS0HU7AASYib40HiF0xymOtavtD
         mJsqVTdjeYfTb0YncAMLOHRE9APXiCNeZl60oECKbgCjFouzYNB4e39qb0ryFG2VZx1v
         MLMlscL8vIsHRblFexsICkstJd0UkJkp5Bj08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209690; x=1713814490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKMvbnJBvce6w6rhgAtTaziLR0gQM5TDA935faRghdc=;
        b=eiTys7KV2A75DvkBxhRK2zRL505ZZybLA1WdQyqDizY/bcZgr5oP8Y9UjSAF2W2pY2
         a78Lw2m5o6w9wdgwLIYtGO46fwcM1yQc9Nu5aRszAjzdeObx5cc+HV2IgcBqRhzORMRh
         5N8M/hDpJTVtFVHW72vhdd67EO4FoCHcBNE1I5X1LzCxwa/NwCQOt3zn+Mlr5umwZDz5
         S4f9VlcvmSHI3kkv2VfAW0yiv4n0nFPhqSqeA5KZKn9ol0W2we0qwH6ujRgcw5ARhe6S
         /XLatgQ5mBZ3Ay9LQk7VyHrkfZq2UTQsCecJN530iDLf1J465dvTc1wNDgqx5bAE2smd
         qu0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXP0jqK3SwUE0ta6Xnz5pDWi6jgjl4kSAvji5HMrGqs/bbsAoLUatacuEKU1OyWAWdN65IkCRo0o1o7Om4xUBLdzrxIKw+BT4vMFT0=
X-Gm-Message-State: AOJu0YxBcOPjSPC3YIEV7CvaxUZIkQuSBy+YtEs/Uln7oX7bgqeQwKha
	2Yf1Xc+wdwk2VpnziCEdqQxi6JRD2ppT/ph+QIC75XL1kd5MZw0tsnUl/AsHuw==
X-Google-Smtp-Source: AGHT+IEuVGO99fF8WY6cFUn2TeptksBJEwdpaYOr7CSPDLRmva6Ltt+et0Zcs6jy4zj82KXO8YnR2A==
X-Received: by 2002:a05:620a:4486:b0:78d:65e0:3100 with SMTP id x6-20020a05620a448600b0078d65e03100mr15166755qkp.60.1713209690125;
        Mon, 15 Apr 2024 12:34:50 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:36 +0000
Subject: [PATCH 19/35] media: stk1160: Use min macro
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-19-477afb23728b@chromium.org>
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

Simplifies the code.

Found by cocci:
drivers/media/usb/stk1160/stk1160-video.c:133:12-13: WARNING opportunity for min()
drivers/media/usb/stk1160/stk1160-video.c:176:13-14: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/stk1160/stk1160-video.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 366f0e4a5dc0..0ba0f41fe3f4 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -130,10 +130,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 	dst += linesdone * bytesperline * 2 + lineoff;
 
 	/* Copy the remaining of current line */
-	if (remain < (bytesperline - lineoff))
-		lencopy = remain;
-	else
-		lencopy = bytesperline - lineoff;
+	lencopy = min(remain, bytesperline - lineoff);
 
 	/*
 	 * Check if we have enough space left in the buffer.
@@ -173,10 +170,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 		src += lencopy;
 
 		/* Copy one line at a time */
-		if (remain < bytesperline)
-			lencopy = remain;
-		else
-			lencopy = bytesperline;
+		lencopy = min(remain, bytesperline);
 
 		/*
 		 * Check if we have enough space left in the buffer.

-- 
2.44.0.683.g7961c838ac-goog

