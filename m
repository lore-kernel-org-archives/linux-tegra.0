Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2117215E804
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 19:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209692; cv=none; b=A2WfCS6KgW21EJbHI5VNTW0xwNhKoCvSoaXZnNtK1zwW/sKYFRZGpyS2Ndw9Pyhx+UUkoBJNLe2hnVJxu9cucyNX/STl2nOMl3Q70KoBpLtDXSvVmUw/C2RkhBKcg8p7D7R2MRdYz5zraohq2QLZE4Cbd1G/7IOzvcmi/iBuVUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209692; c=relaxed/simple;
	bh=CPsjhfr0ipRuyWvLekJtBUPBvfW5sC455CD/yQi18EY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jb3AdLK9EMLNx3TMTx6vA16Vg4gpaVn6cPIdbB2cNykHq11UOyVbfzhLhFhHMgJa9kiLRPjgccX1w50f1Mk+QnX2UXfUceGSi3FS8EujWEyewSEVNOrLN1LhK2uewvVY1pa+LEj4IyJCzq/biB/74Bb/eHXFMp79jteA1zizkjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YKYOL459; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YKYOL459"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-61ae4743d36so7754387b3.2
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 12:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209688; x=1713814488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYb6g5i4FA16yMs6Dul0lviXONeB+8pR0V9zyRVb51o=;
        b=YKYOL459xPZhH4tkkQ7nCmxndqC2eNMd7Xk9q21LWkDq6nsrYiHPN1zik0CqpeEEsI
         pqlmtl6EueL36+N47JvXqAIhYaNM8evVxHhcSE6m6rQE9M/e9784zeouG/C1/Rlqr5LS
         9nbuIa+oZkVT/qEJiUDrSI5XxG8wOpUGZT0/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209688; x=1713814488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYb6g5i4FA16yMs6Dul0lviXONeB+8pR0V9zyRVb51o=;
        b=EtsVY1Y6OqGkhugPihbMwsZeO9VguRJAO9NJexw1v0G4qZlH7Yf3JwDrNw1/OIgRpm
         oxtk8mVcNmqCzU+/h6P63FyDSyM25JwzWg0X4GJTw/V2tURuOaCD4PTl4FWZnfymzmIF
         JlYekCMabb3Wd/oa9F2/qA7tLt24M0TOFk9rTRIz+iI0O1kN/RBZDJX+qp/kmzZDTG35
         q0DXUaTNT6WxDEI2hW1kNTTXwERzgRHS7eOfh+ZtQrsMIH8Ig+tqjRYw36NmV4WYgoQP
         d8ZEawDN9KzO7o3RbVoG1QirKlTHbFCE0aIjGv4ZTzoUk0zZTF2CJ2ievxjYiQCSnz14
         MiqA==
X-Forwarded-Encrypted: i=1; AJvYcCX7JXZKqPWmq7KVqSL8pQpXnz/4pXA5HnX8gI2+RWCpMntvajZ5LqIErJ1LgCi3ktWoUIuJC/cnxf/LvZmLaPqepMVJQ30+ECzzEVw=
X-Gm-Message-State: AOJu0YyRIIMO6iai7LVqySDFGbEnou+h62YQAP7zgmXDYFz4BlrhBJqx
	AzRDCHAbMyoibnv7o0/+QBJ7ipdLYLo2J+5VDTrtU7wh0fG2Iuh2AvRGnhNFoQ==
X-Google-Smtp-Source: AGHT+IHXF7TrtarHgpunekvNDs6nvd1JJs+Lc0bh8dwb/yJrFpFk4KNuzD4FvIVwGteAAQA7ZBlIRw==
X-Received: by 2002:a0d:cd01:0:b0:618:875e:2bc1 with SMTP id p1-20020a0dcd01000000b00618875e2bc1mr8806798ywd.21.1713209686523;
        Mon, 15 Apr 2024 12:34:46 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:46 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:33 +0000
Subject: [PATCH 16/35] media: au0828: Use min macro
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-16-477afb23728b@chromium.org>
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
drivers/media/usb/au0828/au0828-video.c:605:11-12: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/au0828/au0828-video.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index fd9fc43d47e0..2ec49ea479d5 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -602,10 +602,7 @@ static inline int au0828_isoc_copy(struct au0828_dev *dev, struct urb *urb)
 		vbi_field_size = dev->vbi_width * dev->vbi_height * 2;
 		if (dev->vbi_read < vbi_field_size) {
 			remain  = vbi_field_size - dev->vbi_read;
-			if (len < remain)
-				lencopy = len;
-			else
-				lencopy = remain;
+			lencopy = umin(len, remain);
 
 			if (vbi_buf != NULL)
 				au0828_copy_vbi(dev, vbi_dma_q, vbi_buf, p,

-- 
2.44.0.683.g7961c838ac-goog

