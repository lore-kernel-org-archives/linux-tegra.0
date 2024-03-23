Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79309171BA
	for <linux-tegra@vger.kernel.org>; Sat, 23 Mar 2024 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711190514; cv=none; b=cQiz/+8AvIKELHdQ0dh5O0rXgE7+QgYB/nUuONRHbJKY/StcWDYMWsORRBkg4rKoXI/CEsPD6yIqBmJnMhzbgpmm3r3h8OhjzqH4Hss+sJRsLFoWQIxiXN2BANTZRdB6+HxcGYpCK5nHfdUB2uXinrENzVllvACVtuCuBrrAjHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711190514; c=relaxed/simple;
	bh=2dAG+Jyz81+oh8AF6DeyE+UyRu22SiDEL635nHH+73Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nDq27nlDv3/WkM6TpDnM5vdknWeuXE6z9hNQINTZNnkyU2eYENVcIv6mRXexlmtunMqkcQyHzxqch5JNLOK79cNiR3XGWjWR+c1R5roTWvYhEynYUJedp+jgpvo/L5u59s3GbHXusbbIjmlLtwgVsApzALypp7Xmb4dwgixym8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OYOPYYbk; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OYOPYYbk"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-696147fb5a7so27761156d6.0
        for <linux-tegra@vger.kernel.org>; Sat, 23 Mar 2024 03:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711190511; x=1711795311; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8QTboKNFlxJkYJ1An2aW3V7umhSjhO/WM5O6LoVCcU=;
        b=OYOPYYbkeqSi2WK/juteGiXBuhKsWZjsJQeMrLF4tfeainuFP5ToghClEJRiTdi7dy
         rLZfwgvQt3hvIQbDggswBT7PsLW+G9gC9i5lsraM75IksXfarmyvWE49wwwIVjKru/qZ
         v7zRYq7neJF2QRiPZjrae+fR6ti4CZchjKOFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711190511; x=1711795311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8QTboKNFlxJkYJ1An2aW3V7umhSjhO/WM5O6LoVCcU=;
        b=m4D/H2oOH3kSo3PPRsTrVkICNtTnqfTaxtrpvHkCkBdjc7oNYH0WWku2FdtzEZdW9p
         yStcBiG+7rCsAWMJN8yEO1BDqkGy9plRxTSxV25uhsqdVqEj4euLFHoKm8IV36yoXdKi
         3qEDtE7Fmj0n9T9bSE9Xl2gnvjgjBs9BpnbIv6WBurdnd2Rcajy2UuFfk5kleX209ioG
         01tcRIZKLRor+qr7QNK94XoZdDpv+E7Mh+HD3/u6n3RStnIG3oYw9AcU/VtqnQYhJQRN
         UXg/SBaL880arlVJOPCX0NCwCqvkMaj4cnU3C1hgrcEdFpvVPmfgWeWfinhroWTafdnJ
         lEwg==
X-Forwarded-Encrypted: i=1; AJvYcCVrij3LHGwEHcjdIkHvB8YOZOiI3pq6yuGYTh7k6zd4yMo5M3B6NM+a52YJapYYlI+cQtvv+5hJFWzZu5cHJ37RAxCX7BIHjeTlgaU=
X-Gm-Message-State: AOJu0YwmH0ESZZvaxkDLfwXxHGv4fkuCIsxrMCBE3Z0mlWpAkl9kLwgI
	noC4Q1QIvXUYBx0dRnK6wJu7BiBJWGvQtOk8KxLl6O8YbQa8t7fR+iDg+bq+3Tx3x+rsiDTdR0k
	=
X-Google-Smtp-Source: AGHT+IGOP9NmNvjkaFj2nG43rNY03FVvY8JGudvMrkdWl0W6OiPHpehuLaE5+7bEg8g8j7jyhHLwOQ==
X-Received: by 2002:a05:6214:4009:b0:691:5ff2:6083 with SMTP id kd9-20020a056214400900b006915ff26083mr2009085qvb.36.1711190510703;
        Sat, 23 Mar 2024 03:41:50 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id 6-20020a0562140d4600b0068f75622543sm1998523qvr.1.2024.03.23.03.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 03:41:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 23 Mar 2024 10:41:46 +0000
Subject: [PATCH 2/3] media: radio-shark2: Avoid led_names truncations
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240323-gcc-arm-warnings-v1-2-0b45cc52f39e@chromium.org>
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

Increase the size of led_names so it can fit any valid v4l2 device name.

Fixes:
drivers/media/radio/radio-shark2.c:197:17: warning: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 32 [-Wformat-truncation=]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/radio/radio-shark2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/radio-shark2.c b/drivers/media/radio/radio-shark2.c
index f1c5c0a6a335c..e3e6aa87fe081 100644
--- a/drivers/media/radio/radio-shark2.c
+++ b/drivers/media/radio/radio-shark2.c
@@ -62,7 +62,7 @@ struct shark_device {
 #ifdef SHARK_USE_LEDS
 	struct work_struct led_work;
 	struct led_classdev leds[NO_LEDS];
-	char led_names[NO_LEDS][32];
+	char led_names[NO_LEDS][64];
 	atomic_t brightness[NO_LEDS];
 	unsigned long brightness_new;
 #endif

-- 
2.44.0.396.g6e790dbe36-goog

