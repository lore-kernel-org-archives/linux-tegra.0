Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5857FBC2
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520170; cv=none; b=ZduMq8k+1MWU3q0NlhuKLaT0qBJCd8pBd1OG2UnrfSEDPMZ+csI9RDEwNmqXBdHff5BYDBcmsFgDeLIbMT6Ha2pci/d8lQ6XEunpVqA0uaVDeAVP3wJGWOU679N+V5fLrJlyGcqYQUFTjuSmrkUV0vHgvQkHNd+jn9eHvitOIqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520170; c=relaxed/simple;
	bh=RuxkwHpE4T4+RDbLbxVJFmdg2Ym7s4wlcnprbuxc08U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lb58XvJqERDSRTV7/odhYwEd4qVGeist4thHiCG9AgTuV/DvMit3BeKqA7omrnG431D0q55yGn2OTAeuajD26RgKWg2f34/tQX91LtAXVopTLSaouNEis/u5JM8l2+R+uOExMWQ5SMHsiJRTUZFwEjns2rJjHlglLCpK3YwrTX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JRKywdq7; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JRKywdq7"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78f103d9f64so86936385a.0
        for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 02:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520167; x=1714124967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtYl9w0rOEhkj26cvWhCGa7iaXgSAClc12fCrbixCRY=;
        b=JRKywdq7DzysSXFI7V2I7JJrLuiZesSiHSA3gjLktvZIiKo42ctcyf4xq+6s7JDwKP
         buvUd6z7FBGsRGgmIG4h0LJlukks1duyv+EeCZXErvV/ygzkxyznu9edQFMSZpyY5dhz
         uJmtRb1BQihl89Vct1lKVeoOmnotilqpT9GNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520167; x=1714124967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtYl9w0rOEhkj26cvWhCGa7iaXgSAClc12fCrbixCRY=;
        b=PWo1w8Ngb5nI5hij05/VRXLmqRzJsn4tkfww1KYUSi2g62a7fYCTNmjMGRoEeAd9c5
         rewAUeMcplvArqe1+jrt/sPunlLdkP/cr1UzSmBTe96VrISiwPZleln98IjCSwsjv3P3
         ulNlgQwbc+MF7W1nJ+IEhFUzIVGvwkxZssCNKAguLMIKVD2HOQ/YhKTThgh/p2NONfws
         lZ8p6jeYTJ7ZowGKCDUyeIwIzFLEMG3nj6+MEjb8ZD3+NHQjWFrX7Dp/KtxoIdg9j9EQ
         hiYA28YhFiQQDUeM+0GAKLNGMQgPvfGoS0ayeHThp9wehd8Bg8hMoZfdfJZTyVtjwVBy
         M+bw==
X-Forwarded-Encrypted: i=1; AJvYcCXUHbXkU41n+YwfLT/EMaDjJ3XI++SqqrZ3U665EBifemxVzKdEhl55HDwWs0OrCNnVsRFM9Pagw77k5d5+Uzg4oTTEttJYn2GjyL4=
X-Gm-Message-State: AOJu0Yx53OVBwONHMJHv26u/Ub2ub11Ig+aKbYtjU0VRUjVD8rJNgPgz
	ki4eIJDoOVLdt3A6IQFVEUQtS7437RwnuNQ8/J7+tn6qK196FymhZarfMwJCRQ==
X-Google-Smtp-Source: AGHT+IHJxWxlXkvVgayg/8KmEPlEYrjGm6s2oAW8VlNrxH8CHO+X8RZjNxTD6ZWD86mZ22X+MElfTw==
X-Received: by 2002:a37:de0e:0:b0:78e:eb64:d91 with SMTP id h14-20020a37de0e000000b0078eeb640d91mr2763665qkj.1.1713520167230;
        Fri, 19 Apr 2024 02:49:27 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:52 +0000
Subject: [PATCH v2 06/26] media: stm32-dcmipp: Remove redundant printk
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-6-2119e692309c@chromium.org>
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

platform_get_irq() already prints an error message.

Found by cocci:
drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:444:3-10: line 444 is redundant because platform_get_irq() already prints an error

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index bce821eb71ce..4acc3b90d03a 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -439,11 +439,8 @@ static int dcmipp_probe(struct platform_device *pdev)
 				     "Could not get reset control\n");
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		if (irq != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Could not get irq\n");
-		return irq ? irq : -ENXIO;
-	}
+	if (irq < 0)
+		return irq;
 
 	dcmipp->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(dcmipp->regs)) {

-- 
2.44.0.769.g3c40516874-goog

