Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B2812838A
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403111; cv=none; b=TStdiNjHKsSKq+PwPzg0foJwh0FFCYqa876/5OEoBmZQXnelEkc8a/8FVDXrVZnya8I6hteLl1a6wArDuV+VEpnguzx8qf6vGykuv7O6K6ChMSowcLMHWkmQnE1i+j7iaqHb3bl+77FcNITYIVIc34zZbSGPW4nbGrhu8G8oHh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403111; c=relaxed/simple;
	bh=1j0StfCVwtH5LoYMUWVtbp8TzQTzEnDFIjwyMu0303U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VFYvkhh7P+fOQzLoVVpE+Y9QjMIx6d/8pgNUYChON3UrU0otsdU5Pqt9dH4NhFvr9QxKJXRIuNLDqrrrwaqYbkSbZOfbugN+fmgqzmhapRLmFvTNWoyGqpZ4+6Tl7B3q/eNe495M+Qsn3w4Utb7bQi20fhiIW5vM70DJDx3m2RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M1Y2gNmS; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M1Y2gNmS"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-790fb9d1b55so69842685a.3
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 08:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403102; x=1715007902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOR8+WeMkxm0czNaQrlO8zy4rfkYFKnx5dqFso5t3cA=;
        b=M1Y2gNmSxFcSBHj5qZqDfTBtcsV4hTtOgHQ9gLfb603zu8DhUXOqKrtZa9F7t8Y/AH
         NcfCZfogUROpsZVGTnOaHjBgTFwhXNlqDSgxXBdnw5YG896bEScn6cSNg8D9033ZBNoX
         hJBLJNTaGPYTi+4vhJp9/3vPc1Qbp0Ggx0ulc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403102; x=1715007902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOR8+WeMkxm0czNaQrlO8zy4rfkYFKnx5dqFso5t3cA=;
        b=QsBhbASm9F0zdx+08Nyei9b3JGHlz+Q6Ikg4LjHfvg6OM8Uu9YfQt/U5i4W/P/t+D1
         /yO7AKpuzmB0WkhrQA00VizT9pDugo7nuIsmgNjgNo2m+JEgM4zQs/58vShG5SNdEXXb
         vKFqezwbHxBoHUBpQgpXfxZMfbOSIApTqcllmEhG9Ct97sUHMCtJbMuo17F5qIpyRYQJ
         6cWl3ph0aPasm8STirDIv5grrx+1+/EW004/b70ARNQ+N4XqhGhoRkMlhErLEBwqRZ4X
         tBuw9Ko3dtqAmOpNbK62fRNgMDmNPVg1js+a2SQUsYcQjDZwt2kt8sRhvlCorLPtmbPV
         JhBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU84FKMj9SzzKA6DAtUP7yRZDoqBsFqJSG7jlUIaRSWI6iGdBe2Uicr4f6SpieJtQ5y23pRpAjX5sjgwxyoH48hqzMFcD/1lkRpy+4=
X-Gm-Message-State: AOJu0YylXVwQ9uKa16pl5X3NwHACyxwnNz8TxPYvgrO0HZRvzT09KEJs
	dQThc6uBkj8EDpuQtffg5EWYgHRMpmvzG6kJb5BuWMLbKYE3Wn0g+vSYmONPcQ==
X-Google-Smtp-Source: AGHT+IFvqATO8BLnIi9vdu5lMT65HlpTVBjzYUMzQ45Qpvw3JFM44+jkXB+KR4H073WWP4wnEfgBGQ==
X-Received: by 2002:a05:620a:70d9:b0:790:ac08:8d4d with SMTP id vk25-20020a05620a70d900b00790ac088d4dmr11390058qkn.57.1714403102367;
        Mon, 29 Apr 2024 08:05:02 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:58 +0000
Subject: [PATCH v3 19/26] media: stk1160: Use min macro
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-19-3c4865f5a4b0@chromium.org>
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

Instead of a custom min() implementation, use the real macro.

Mitigates the following cocci WARNINGs:
drivers/media/usb/stk1160/stk1160-video.c:133:12-13: WARNING opportunity for min()
drivers/media/usb/stk1160/stk1160-video.c:176:13-14: WARNING opportunity for min()

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/stk1160/stk1160-video.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index e79c45db60ab..9cbd957ecc90 100644
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
@@ -178,10 +175,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
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
2.44.0.769.g3c40516874-goog

