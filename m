Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A27181724
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 09:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520173; cv=none; b=Dh71rxK9YF/PApIMQYnsgPl69r0hNLOJYWqshpsSkTBMamfAGBjFhgdwsicEp3PcCjF6WBRZ+9rZVYr/vvEpr0QF2Z1I/bZyG4vTI/GbH+4P/YBAmW0UxOZkh+faobAG/mCHMAqUG57ijjzKTVL3FS/RxTCtUpA/eQJ1DIMX1S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520173; c=relaxed/simple;
	bh=aAxsx+GHEjYnJMiAWqwUDNgaIzi1dYkLjFRqwX4O4Cc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n03v688NotYe3fF/trXgz5GMmRE8EtjKEeuP/1po3YDmYIeiyRjzj8lHZmJ6EHNqJDsTdhtKJJXYofY1by8JggPrMe5A08lox6FareS8hbvJ18Yrq7mhzGu2AaVtey1pVdhCnsXdYwLFWLjSVJQlGx44eNOw84ALr65qRs0uq/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dwHJJPHO; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dwHJJPHO"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-78f0417b36bso122479685a.0
        for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 02:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520170; x=1714124970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtHT2dnCrKtU2tz1OyJJw1d0hzBN/YL8p+52UQFaJZo=;
        b=dwHJJPHODXiKSarwV6nm3I3I7P1+j5DULH4hERbmBQjxOW8dPVI+RDJZUUshs1f8Sx
         FnQG7TFdVgOvfTpO9qxTZ2PdFm1Zpe+LBeM8luYze/vuxxBN06/Y4hxuEaNATaVdT1aA
         DJ1hYwJj6K8xXoYGNdInHHjg5Zfcq0+/lQfNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520170; x=1714124970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtHT2dnCrKtU2tz1OyJJw1d0hzBN/YL8p+52UQFaJZo=;
        b=lY+1TnMFY00F75okYetdwVDmSeaQl3svzWCsPDUun8B57zqWwJTK32mElHfQx8eXiF
         0nnoWFOLuwhpEUy5jGTfNIi+VDlEEqEkxW6/9pEGDwF/w+G7mlmGMoyzXsGNuVNGDc/+
         CIl7ardJtOMqAoRwbNSXdP+0PlLc6j0yuUch615nEJIFqTk2MZlV+5AyN681teAQ+1ef
         BIQ9L85TbdT6wxmgLHyOronNj+AiD3Moylak5v54oIGtLY5NVhz0T+KqdseiBywmkGnD
         olLW8+c9ohdYINjS3VToXNZGiKAqA9mf6YT1O6UkPNY04duYh3o8CbSMxVWfomnF+6uO
         vI/g==
X-Forwarded-Encrypted: i=1; AJvYcCW/gJJSOd+SNNhQVORpQmr+2OF7ztzsiHPAy3Y/E7UrmnCOJMLgUPXr8foNCeUNR8hRl1HchuGn3wRDoux+f8zl5RNmbqZUVmX6Elg=
X-Gm-Message-State: AOJu0YxNWGJEOg3kLpEHOjmsuSKJ24ycVWWPYeX0xoaiAx2VRWpROsT7
	R8UEe2tDLEHHXy7RnFcM+OHmDu8Jy2AuSwY7+c7rnIkO6yQmYy3d9L/m0m+WMQ==
X-Google-Smtp-Source: AGHT+IEq5/HFwcn26nQnIIJ8VXOEY35h4vBPeSOiEtFFD1Z7vC7s7kPOFrGUrC/lVDARzsxRqq1juw==
X-Received: by 2002:a05:622a:1386:b0:437:b995:98b5 with SMTP id o6-20020a05622a138600b00437b99598b5mr1747672qtk.57.1713520170255;
        Fri, 19 Apr 2024 02:49:30 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:55 +0000
Subject: [PATCH v2 09/26] media: v4l: async: refactor
 v4l2_async_create_ancillary_links
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
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

Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
is not enabled.

This makes cocci happier:

drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-async.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 4bb073587817..915a9f3ea93c 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
 static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 					     struct v4l2_subdev *sd)
 {
-	struct media_link *link = NULL;
+	struct media_link *link;
 
-#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
+	if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
+		return 0;
 
 	if (sd->entity.function != MEDIA_ENT_F_LENS &&
 	    sd->entity.function != MEDIA_ENT_F_FLASH)
@@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 
 	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
 
-#endif
-
 	return IS_ERR(link) ? PTR_ERR(link) : 0;
 }
 

-- 
2.44.0.769.g3c40516874-goog

