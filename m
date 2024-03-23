Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C128F199A1
	for <linux-tegra@vger.kernel.org>; Sat, 23 Mar 2024 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711190515; cv=none; b=UbES+bU2Wl7QNEaO8uyS4pyLEZagQzuwZuIFghsxkaBqxvNgBIxtGS88eFMlOohDlxXS3rXIwwtqqH+yOVtdwvbJF9SLYPz7fxw0n/cuIBxgPSyaZVAoo7FiQUCApjRwWO3BNUOQ65OZUTM5PtaiP+xX1v/233PFyKoBiONLoZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711190515; c=relaxed/simple;
	bh=GEI/ooPR1uxzhyNgwywp7m8zeQWCBAmFv9ShGuGC3WM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vh7UMoLvCFLoLVgQpX/CkIe/SFwZN/7nEonA7ONFVgxBK/oqOQSQjoxUw9TZ/pUtvwPBMK20kvNhorv/yZrK3fEDVffe1WhO2i1S95budhT3MrNTOVyUB15Y/tuPrtxl6NFLL8h9R6Kda3GINT1CJipN9TZ7rXSWhpjuShXfgfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tv2f5+uB; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tv2f5+uB"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6964b1c529cso28114526d6.0
        for <linux-tegra@vger.kernel.org>; Sat, 23 Mar 2024 03:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711190512; x=1711795312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqD8wzexo6xit6zjT25NUCdriPsphWfFfa0tlNyYYks=;
        b=Tv2f5+uBv93MVvRfoVm2O8kRG3mojEdZIlp7HnN6hdomSBgI5qeTE6TyG4kC/jfqBU
         2Sw7By4TEqxXtjDSv1l3JagA9pvPfZw2BZkEyT1AqkwPtYojstR/N63qiDXbCm7SsPSr
         SD3r57QbWIjksbhZEnhEW4sL3nziVVZ41ZPVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711190512; x=1711795312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqD8wzexo6xit6zjT25NUCdriPsphWfFfa0tlNyYYks=;
        b=BSfygYc8sHyp2KSVK7IaZFe3Wh5s9Q9C+q9zS+f1bTQ0kzFADn2hCftrnlprCAr0MB
         NM1w/YA5lA9JTUilTQaWqJ3yVsuVsimgwJGa/46Toz7N7IWSBjlV3sh3gdx8HDkX0Tlf
         Vom9Xp2o9G2CnmuQevURsaAA1stCNlDqeIAdHECmUKY0EspK4Nu71Aofre+9ZVSC9WGX
         ygoMiWA2oln4qeAJFq9hHvkZ/+sQPpM7RE/6DqesXQmsAxF5huBRA5o3lQfzjCgwxoHX
         BlacSJC1J9PoyW1dpWFpIKavfpJAXssl9kYt+9pW9Tf20AhGFGEwwD99amk+Pk3E0sA5
         SkTw==
X-Forwarded-Encrypted: i=1; AJvYcCXEdAvcHzoC5rU2sZsEKhp/w1fPPzJZLuQtTWM24R306ComRs+IcP34K+KlXZmAi3nrXbeDI+igkofxu/ZwErKJjfBIKyx3fCcycUc=
X-Gm-Message-State: AOJu0YwI6ARYJST0J+Y1kXh2TPe+8DBbwnaAdeidmgG7mbr+7T3i1tuJ
	8+25N5yZ1MyLO4iLU0ICYJ0WxTjTWu01tK4FSU7BamJ5h3ouFQRtqTgM9RkEIV9QJCs5lqXrFA8
	=
X-Google-Smtp-Source: AGHT+IFqiP6PxKrx0iNYkypU5fRxQ2Tg1JQsARpN7FhxoFv5VhxvCeHLgOCqbXVBG5RX/NkfTi463g==
X-Received: by 2002:a05:6214:2249:b0:690:c093:d833 with SMTP id c9-20020a056214224900b00690c093d833mr2314782qvc.0.1711190511851;
        Sat, 23 Mar 2024 03:41:51 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id 6-20020a0562140d4600b0068f75622543sm1998523qvr.1.2024.03.23.03.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 03:41:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 23 Mar 2024 10:41:47 +0000
Subject: [PATCH 3/3] media: dvbdev: Initialize sbuf
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240323-gcc-arm-warnings-v1-3-0b45cc52f39e@chromium.org>
References: <20240323-gcc-arm-warnings-v1-0-0b45cc52f39e@chromium.org>
In-Reply-To: <20240323-gcc-arm-warnings-v1-0-0b45cc52f39e@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Because the size passed to copy_from_user() cannot be known beforehand,
it needs to be checked during runtime with check_object_size. That makes
gcc believe that the content of sbuf can be used before init.

Fix:
./include/linux/thread_info.h:215:17: warning: ‘sbuf’ may be used uninitialized [-Wmaybe-uninitialized]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 733d0bc4b4cc3..b43695bc51e75 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -956,7 +956,7 @@ int dvb_usercopy(struct file *file,
 		 int (*func)(struct file *file,
 			     unsigned int cmd, void *arg))
 {
-	char    sbuf[128];
+	char    sbuf[128] = {};
 	void    *mbuf = NULL;
 	void    *parg = NULL;
 	int     err  = -EINVAL;

-- 
2.44.0.396.g6e790dbe36-goog

