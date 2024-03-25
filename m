Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820C54DA1C
	for <linux-tegra@vger.kernel.org>; Mon, 25 Mar 2024 14:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711376400; cv=none; b=MrxoydO5LW9WXqMd9kyTNjFIoxPdSqPM+Dg5Oq4BSu4xXXubPK6MW9lywKi3z2UN27an27qQT3K6U5Wl5smnzU/2ucIRDh15KfZ7zvl4HUSyRNstYA31n26j2BkvxEEXwUNmJgaFz/fqvYtmmnKnRp2aiYN0Xgjamj8yUg2UerY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711376400; c=relaxed/simple;
	bh=SydhYBUNZqt6seDV8GSPes7otcagbCoXjH+x0l9PSis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=opWWA0IUFW8SL1sahR026YDHtuyFRfmKVcyMU2oduUrThOgwkmUlwZF75s/cYlHZWySQ02qz0roML1s6hW2ZQCNjg+qZDwgJXNXTTv8TcWHblzCDtSYfvtFfk1W0B8wFBaJj6gtz7HbW4Wx5pC9NBxoytRPT5zReYpxp8KBRSAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nMg/uVE/; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nMg/uVE/"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-430a65e973bso28557561cf.3
        for <linux-tegra@vger.kernel.org>; Mon, 25 Mar 2024 07:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711376396; x=1711981196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3XV/BFRORhDDlgNHHmWyRWqMIVOw6WvWWLzRQu/wIQ=;
        b=nMg/uVE/TL6u6fL6AzDxSZwnQzAjadgsZTZT8E2sZqodgHh4JMh+NnIqUAKBF2KiPp
         Uhf8FeXRjkfRHwBoEN+9HafE25od3khaHWe5KwP3QD11kTwsR0mlAy/E1Qq05birEqIs
         5DX2ztrA4a8YaATMC+x3ToK3CmHhMWnbJaD8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376396; x=1711981196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3XV/BFRORhDDlgNHHmWyRWqMIVOw6WvWWLzRQu/wIQ=;
        b=N4yg092GmFfc509FNtPuI0GabRrv1UvO8YAyHS61Bh1RIsF40RG4/qE70tBsGq/2Cw
         9gMehN1RlxhVzRnk1pCftnZoH33MFvm8Efvi3EIT4umoljBuj5DK4XAqvvuxiyAlfraj
         Kh7AN+5AAuPJ/CzdCXi7iS3Z1UXushtz148lBhIacKJNR4pLoP+eccjMs8SQUitW8uBa
         xHbaY1uHpKFLxOXgkoAn6jiF0K/jWSsS3qX0DTUEGj4s/QKZk1O1lZch2ljKhOoj2Wk6
         BWZ8sPrpGvpn5pjARvA0O5BSneGXr83PQZaoTtGDeosPdru1iQBMZB+D6sVgGyl7f4ep
         tDIg==
X-Forwarded-Encrypted: i=1; AJvYcCXq+Sghvx7zO3mX4ly5bITTsJrhlm/20SLfUd3nuEOP7h6Q1Ip7q2xYRBvhLDpD+AkoU1CB6vJxzMumjc4lya2sGSFSxHq/5qJy42s=
X-Gm-Message-State: AOJu0YzXC+n1iLo5nYRZEiA3KsSgFfHsZSvPAGqi7hyQfPLz5aetXlm8
	L4PPPiIlDCebLpW4t59UjLMDe/hBjCzK/4Tr3sGPaSZNScxfHQzqdYlSMMBKTA==
X-Google-Smtp-Source: AGHT+IFEBffHombxu9VAZkjJQI0jb6jvl5jRk9TPO0Fy0y3nb6ZId/qWKdNbjlbDsQjikKxzHMWPyw==
X-Received: by 2002:ac8:5a09:0:b0:431:5c20:f0d2 with SMTP id n9-20020ac85a09000000b004315c20f0d2mr2279132qta.22.1711376396512;
        Mon, 25 Mar 2024 07:19:56 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id br11-20020a05622a1e0b00b00430a9b20a55sm2618759qtb.69.2024.03.25.07.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:19:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 14:19:53 +0000
Subject: [PATCH v2 1/3] staging: media: tegra-video: Fix
 -Wmaybe-unitialized warn in gcc
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240325-gcc-arm-warnings-v2-1-47523cf5c8ca@chromium.org>
References: <20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org>
In-Reply-To: <20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org>
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

Make sure that tegra20_vi_get_input_formats always assign a value for
yuv_input_format.

Fix:
drivers/staging/media/tegra-video/tegra20.c:624:72: warning: ‘yuv_input_format’ may be used uninitialized [-Wmaybe-uninitialized]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index c25286772603c..c39b52d0e4447 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -176,6 +176,7 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YUYV;
 		break;
 	case MEDIA_BUS_FMT_YVYU8_2X8:
+	default:
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YVYU;
 		break;
 	}

-- 
2.44.0.396.g6e790dbe36-goog

