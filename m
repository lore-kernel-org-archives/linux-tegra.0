Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EF412E1DA
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 09:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520183; cv=none; b=ao1CjtnNDb7ZdEABNZTfMf9CGW89EWGEopmBPYtlnHOIXTJhhaRGCGAyjENWpM+zjDZ7h1nUB7fExhQbQQ3Cp1dP1fifm9XSjt8PU2FP12WMXm+z+4Z08F24/2WdsjvqNOVfoAR0O/j5vkiIoVr5jjMeJHZ8DmFClCNjAHeNqcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520183; c=relaxed/simple;
	bh=NKspkx+WjefJTC0T9GdQgMYdznykMk+osWwLYrp0b/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPTESX/wm82+DDM2pMm8aGF1A8nZTnwgBA/Sr0OkxPeT2M7WrEXsthyZcsYbq9QTbaWUq89xmVj3a7GwePhTVAxLgqCUeIXbBpgbX4PMGlUeLghCp6aV2D8PE+CMjjCK2tvAys36edwQMIpCWucq05/04BzW42d2FJ8NnabqRTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WNLJHerg; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WNLJHerg"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c7165170eeso669049b6e.1
        for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 02:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520180; x=1714124980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyue/FRqn/p1WnqrFE53P+Zy+G2t8IVLierFxkwHoc8=;
        b=WNLJHergG4jf5eqFh2rWx6jI+rOt1DtUSc/ISRveU90rSBnKD7jyuXakScfJtX+TDZ
         Mo0BmIlt7llvLo2v77rfTRutXwzfd4/O4qx0XnBGG/R5KwUaRUVCJxKdPrMo+exznR09
         6uVJOW1XejP2LW+oj7or293teBXtnRU0XUypo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520180; x=1714124980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyue/FRqn/p1WnqrFE53P+Zy+G2t8IVLierFxkwHoc8=;
        b=p4cwyhbDJ/Vl6nNf+arrrIxU9lC7QIKkDGhRBdKx4AsgcfFO64WvacG55KriG+mpPA
         9f154RkFfILgQjSG9f6G62MkGC0eUTRML2ktb2YBzrGcjSi5I6Hx7Oq/ZdHjiEjiz5gV
         AqoFfcHGAS/7C0hKf26PNHMGbvVftUlb1j4GxJEF6bUTQ3fwZPQd7dTspgwinD1Voabb
         ojdOInefGbFVxIcUZ446OOOoJwu2GqywUnkrk/niVgGfSXIcT0xNpbkMbQZX6gOLu07c
         iNxuEC2enG7M4iDZcOXwVro8lfuj0dUNS97rhChZhKG4Ok2qUcKIAv5quLIEK/OWDI38
         FEAw==
X-Forwarded-Encrypted: i=1; AJvYcCXJ24NWmAAU+ZxgHkCSUJ0N9F14S33OYp/AFdIDjxWvf/+/GKmjJzspRzkYlQIdOldjaFEHEV/EqHZfDmcNDPz0UGSxknlQFr92fMw=
X-Gm-Message-State: AOJu0Yw4tJlbsNyQqhdPl5PwZLRYTGrNZc/HciOhldSsWNLraY3jZJ7X
	S6sLXUy19RSwzuXphWmWZ4kBfok9QkaOIFjNj4cYzNEoi6Tbwq+3gIqCOdqUkVno6G/8rz8Dzhq
	bDg==
X-Google-Smtp-Source: AGHT+IF05pxTJqI8q4Gija+5b/6oIu70NmHvysRWeLZw4zGGPxVTDlI+xOCyxI7lSqjlpj1TWOe/3w==
X-Received: by 2002:a05:6808:60c:b0:3c6:f6c9:6bb6 with SMTP id y12-20020a056808060c00b003c6f6c96bb6mr1556563oih.41.1713520180310;
        Fri, 19 Apr 2024 02:49:40 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:39 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:04 +0000
Subject: [PATCH v2 18/26] media: gspca: cpia1: Use min macro
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-18-2119e692309c@chromium.org>
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

Simplifies the code.

Found by cocci:
drivers/media/usb/gspca/cpia1.c:607:30-31: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/gspca/cpia1.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia1.c
index 5f5fa851ca64..14aaf36cde6e 100644
--- a/drivers/media/usb/gspca/cpia1.c
+++ b/drivers/media/usb/gspca/cpia1.c
@@ -604,10 +604,8 @@ static int find_over_exposure(int brightness)
 	MaxAllowableOverExposure = FLICKER_MAX_EXPOSURE - brightness -
 				   FLICKER_BRIGHTNESS_CONSTANT;
 
-	if (MaxAllowableOverExposure < FLICKER_ALLOWABLE_OVER_EXPOSURE)
-		OverExposure = MaxAllowableOverExposure;
-	else
-		OverExposure = FLICKER_ALLOWABLE_OVER_EXPOSURE;
+	OverExposure = min(MaxAllowableOverExposure,
+			   FLICKER_ALLOWABLE_OVER_EXPOSURE);
 
 	return OverExposure;
 }

-- 
2.44.0.769.g3c40516874-goog

