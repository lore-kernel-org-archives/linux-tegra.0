Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186647F7CC
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520168; cv=none; b=uAVqd88qyPJaBhk+rfe2R/hiqcu7uZbEkUjOwAwjmdewP2RqWrOHPARa0BlQmO/J1/adsjg2gGMkIdfvnokCIdru4MlAyLKAPe2DGNx7PUEoTtpHxA3E9RHrUNE/xQ0LqxICc5dQoGGVQ5koN0YYmA9Vewj5gYNk9ghVtjEOTBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520168; c=relaxed/simple;
	bh=8VkIhJC4qRo1P5qjabF5E6wLqOZFDXI1jx3/GEL4npI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S++5+r705tgJBK2aYBv01IpkZEQlZeD937zrUCf1nVfseKUOvq879ddiqf1lGlKG+j1I3TgCrzBw28MczAusuPAG1fW9PEdVat/coWPMbymSSufBUe4LEwBG0cYx4VGNz4fXnseKTXIoUYJXgt/QRf9NxvO/dApAW/OTwEMmTDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UXRHmwDi; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UXRHmwDi"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-78f05aec21cso124222485a.0
        for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 02:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520166; x=1714124966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6LFW19gEC+T0JWPpzdeGsrE8gqRTr2t8fOHXzLwHuc=;
        b=UXRHmwDiZgg4fnOed5vajwDM+aHJfhFByRO/x+hO/xOFotApiMrRqtor6H3d9jqYDU
         65ZB9+Z+b95gK7NLjhiDJOt5ATcvHJxFUA91gJNARKpglhCkgxj2u4c8KrTLu8e3H3uT
         3+UMJyhlriT96lByrdPSHqYOk9ikT2Nyi/QxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520166; x=1714124966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6LFW19gEC+T0JWPpzdeGsrE8gqRTr2t8fOHXzLwHuc=;
        b=vD1JEx0MuByEN7J5UC4r4NY1Q8OiTlAaQeOd6HFcX74GOPfZaxfIX1Yls58NgXHhLw
         snL75jmdyuYtaadX7ZROovzt8fL/b21Rk2nbjS82f3XeL+gqVTNxtZWYnq/m0V7K4uFP
         dIMqAPUE4pTeWOAHEFxDMLrcX7Mp29vusVadvKaRQ5hHsqladDj0D4rt/4B7JfV21xLj
         5EWWDbt4ZXBcNMEEHW6FDeZRouAH0j1du0Nsa2vOYUeL/bgP6C6iwVDjVa+CJ8ADqGZX
         J6kJk1MQWK4Wy0ppZIvL/RDywrKozV+0OVByUEfdhFnRvEn7+gzRvgYD+hcaaXR5mO7h
         dLDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz+j/kkGbAvlcxUj8f271UMEPwNbDrVhrYEHqySA5ZKm4Ib/eg2NXm2jN+/VRLWv74yfzIlby0q8kmfY1hNE2q2r1NA+9IbQPVS6k=
X-Gm-Message-State: AOJu0Ywz7RqwWp2Ua3+HbT6uOcKUpYsJ8e62k7FsOKMS874JMNS+7fnX
	x3J0XTk8k0VvG4s4ipBuILs18s5myKNbhR9FMDhKOYJkyJfU6aVT/Srchp9Ewg==
X-Google-Smtp-Source: AGHT+IHUtLmGGbi8XMjkj1WeDSrpOuo1PYSYaSFswG+8Ppa9nSbCTEFJOTOGzt08rmRjKE1fcvdYDA==
X-Received: by 2002:a05:620a:4586:b0:78d:70c7:af with SMTP id bp6-20020a05620a458600b0078d70c700afmr2461486qkb.13.1713520166155;
        Fri, 19 Apr 2024 02:49:26 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:51 +0000
Subject: [PATCH v2 05/26] media: go7007: Use min and max macros
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-5-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
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
2.44.0.769.g3c40516874-goog

