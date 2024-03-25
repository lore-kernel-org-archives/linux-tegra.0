Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A927A1509B0
	for <linux-tegra@vger.kernel.org>; Mon, 25 Mar 2024 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711378230; cv=none; b=t/NCGr1CiEvwgN8sU06hNZknLcJhPPxv/eONv5WK+i2PJki1kUbBzzJzJWY+yHchXL9H8z2Kas0tWqFZCHkw558O6BSeJHNwgys6a35xtu2D5FwMyN3Li4FKOj9l4nCOczswWxmD7HMoZe6YQE5cMMG4sU+dqZFQO6ygFhQklRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711378230; c=relaxed/simple;
	bh=GEI/ooPR1uxzhyNgwywp7m8zeQWCBAmFv9ShGuGC3WM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cx9w/3YkZb9OQWeMMM9UaDh7fGJABRK0f/QbmNV49BLwpIQiI9ZAo/IGIDyx+H1YxtInnZngjQDEZQ8g1LDI9Whdq/ntU/vVgbTA6/6qRkHV7RqUaqgh7aGBpRl3DxEywLms5kQILRTI/S17uI0S2Fp7dA7B8gPQXRytWdkqq1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VgUCYr2k; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VgUCYr2k"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-430ca04b09bso32995491cf.1
        for <linux-tegra@vger.kernel.org>; Mon, 25 Mar 2024 07:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711378227; x=1711983027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqD8wzexo6xit6zjT25NUCdriPsphWfFfa0tlNyYYks=;
        b=VgUCYr2ktZ2ZnLPpj1w6jKHNBU0Smcz4R5UlwEf+LObLXyS5zOAiLplPSImgdBgil5
         vJw/JdVdSHt5OunlKR0Jqif4eYLGBwwAhzFekUuDVUvJ9hU3dYZ/BckA1dP3Gq/GmrAQ
         Sl0lHzJD+E1mVY074tE9f6UI/73pFdCgkxefk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711378227; x=1711983027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqD8wzexo6xit6zjT25NUCdriPsphWfFfa0tlNyYYks=;
        b=wiypLEQmAehtZmStUa4cHDL32PZl+wlEV+OiXhcc4mCpYPxqoGOM7Eb+tA5qBiBt83
         /9hoPKiCcFpeUepXvn+fe/tGZ5uSWTX87Smign3uJMLYN25+NhmpcgiMq8NhQqsxJQVf
         g4w2Z5vSzkCJXpOES8bsTdn6nofQZwvZRwH8pBbhxNApCzCjO0oe+ovzk2z0Z2SH57GI
         uzhoJn7p/3c/6cz7RuJI4phYF4XluCaSRl9KTWEQJ3D6OQg1o1+GF6JiDAQU3rdaNM3j
         QJ88MEl2VLIuUpH0N+TZ5KFUzUon/MMa3HFrsnQxw35NS6dt+otgJpsu7C4Fjca1TeeT
         Bb2A==
X-Forwarded-Encrypted: i=1; AJvYcCXOYXH+32kSaitUFMh6U8ruNgE2OWGiNzQftqQD6KZCJUIazd8SNEniPfqZdAvVMZ5UycUGCDgPTzv4sKfyeXq0Lu0TcvFqXxWEUM4=
X-Gm-Message-State: AOJu0Yy1lulnn4mDg0jsH6HdmerpklsB/KW9OZx8ofVHvcMm0EhL8Bwi
	CC9gKTL0hWOP5LHLdgGYA/e2uWnFgZoKVrWQsxkpibp0At3k/gEkp3545yskfQ==
X-Google-Smtp-Source: AGHT+IE6yzbqY9Tnz0mf6K9GR4TUk/vQYebvk9s+XGtSDcB03p3513ghSfX16LycTxIPRRyfSLKj6Q==
X-Received: by 2002:a05:622a:15cb:b0:431:47f2:df8e with SMTP id d11-20020a05622a15cb00b0043147f2df8emr7329210qty.2.1711378227626;
        Mon, 25 Mar 2024 07:50:27 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id eq17-20020a05622a5e1100b004313f54aaa9sm2491449qtb.5.2024.03.25.07.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:50:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 14:50:25 +0000
Subject: [PATCH v3 3/3] media: dvbdev: Initialize sbuf
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240325-gcc-arm-warnings-v3-3-81b8c10dc18a@chromium.org>
References: <20240325-gcc-arm-warnings-v3-0-81b8c10dc18a@chromium.org>
In-Reply-To: <20240325-gcc-arm-warnings-v3-0-81b8c10dc18a@chromium.org>
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

