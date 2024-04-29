Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56AB1272AB
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 15:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403104; cv=none; b=FJhFEEU5R8COR1nL3RMh3Np92rC/XWRj8CRlMm6X7mxYykTvR1UTr+CYL37cl9tu6+qcpRoVrOy8cSmI3BZGabhN744vVpAipaXLySARTdYNKka+X7GKmDzyGwhyjDPn+B3lNol/j/K8ta1JsUXE6Sqy7GK6ZFUEizeC7qynrNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403104; c=relaxed/simple;
	bh=A6XSSayOn3r1ipxe/l3oVKgkfleRFTrQcYLCuzASKa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKtOstRiw4KEKKAxc32jvCpROPbMNWvxCBaFtBXv9N+ygRx9Ee0AFlkV4PaAHjOrrtdj7ZzTXrbqCjk4e1jbtWE+N3pA7V+wcGxPeIV6Z9Sj+zmT9IY+YGnetrZHlMTtVt3ZinyuQJmbmKTZz8DC2GSMP9l5Dpqx5WOv9PQwykM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PctwOThH; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PctwOThH"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-78ebc7e1586so579685885a.1
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 08:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403099; x=1715007899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M868xcge+vjTb4vcqz3d1wlm8C5wkLs//kWdILTOdIY=;
        b=PctwOThH2Fpe2GScMwjmrfDvaJz9k5EVqVD3fJB6qJtVvxdzhcv5DDYlmJlp66KiZy
         JSJktMHYGU2XfFQ3ngMIuOy/Ack4DbFm+SIZ/uNUTLk5NJBonoD9tnOYSzDOkGhruyaB
         BE4hbzTmNrT+vICSHT9mazNuySoD/gR7UntMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403099; x=1715007899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M868xcge+vjTb4vcqz3d1wlm8C5wkLs//kWdILTOdIY=;
        b=mGn2MnmR1dWKDDxAbqKbj2l/FE/hdatqNGU509f5ZtHaJICf3R5ve9eHfhbDf8hRfS
         vZ78lFEyWWonoqnlBa0AYlGGcJFIDr0qDRTOePnreKBCSEU0lgG+N63vmgGmxihYc264
         6v9oi2ZYtM8E35Z0MENS08khV+zZx3yPdVTCHwuWowsixf5lwfF5SrvZK/06TJFPw1Tl
         auS2fiwQTeg+99VE4bHUmBMhtyzRxoqFdCN8lTCofCQp0FSM3HPv/z9mXHAkVgJwXIFR
         XCUfSoWD2cu2sbGztyvxdL4tJ7OV5Z+kFyB6AaUqqfgFYURYZT+6xjhPx8rbQ8BykRnn
         AtQA==
X-Forwarded-Encrypted: i=1; AJvYcCUnKsk7+K8dTJjRHXwYBEJRhYUScMo9Rog6LgwB/zjhHo5DoiIA29TBk0X9sFVZ89uVIeJwR3nO/AsOH9AIeXoTmMLv77HptrJuUs8=
X-Gm-Message-State: AOJu0Yz8G443Dm5CYNxB9g7Z+vkg1uQPaKCz1V23GFih/4rT+mB6FunT
	HIkSrzZz7jWIrjl7A6euRgqAFr2OZTNKAYCwzU7rwtv8W4T4HhfjH6G2ELa4Vw==
X-Google-Smtp-Source: AGHT+IFpnQ4ab2gf5wQortCnYRGRkza79tueM0GmMJw+OfK9t9OORYfudlojtT2eZzgU8317EfmzQw==
X-Received: by 2002:a05:620a:2005:b0:790:a961:373a with SMTP id c5-20020a05620a200500b00790a961373amr16658835qka.31.1714403099487;
        Mon, 29 Apr 2024 08:04:59 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:55 +0000
Subject: [PATCH v3 16/26] media: au0828: Use umin macro
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-16-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
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
2.44.0.769.g3c40516874-goog

