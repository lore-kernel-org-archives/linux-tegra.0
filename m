Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D3C1E534
	for <linux-tegra@vger.kernel.org>; Mon, 25 Mar 2024 14:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711378228; cv=none; b=S2vCIOIC4A+Up205hHfV1kir6uFvpEA65xmrWObYTsvvNr8pCwhDuDZ4gxmRcs09jNKUI/049rXAukVD/pKKJkrCPJvxb5ZjtitQt76OioSKJEjyD6CCa8UtB54m/VknbryMwaggofh/dQkllprhD792Z62piEX8GzlszleH3zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711378228; c=relaxed/simple;
	bh=bzGkhh3857LfO//R8Cc3xM+Sm0Pu0LcZVZpGpS79/9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LDpvwccsWzcTJJ2Pfm1X0rCOFAqikXWbKHpsVrTsIG/NHFjdkF2R3bLnRqLgnvqH3LOWWEjMYdzn/gXBYgYnMrzuoTRhg6yK++ahBBeNJzovOzAfQ+bK4yv89WKxNghuQvZcdXDOSa2/2n+2dXrOzCpZdJDDHz4mjqMg279HJNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W2gaYCIG; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W2gaYCIG"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2228c3ffcbdso1852491fac.2
        for <linux-tegra@vger.kernel.org>; Mon, 25 Mar 2024 07:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711378225; x=1711983025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HiJIJJs/fXvTyCDSSNBDGHDw2J3EG4BtX2teiiFjae0=;
        b=W2gaYCIGNnCQvWLmUv7VdKQ4w9GjZaQ4/4apOsJMbIWRsmtzRHCNVLCerGfSc53Q7W
         dWZJJQukVWNVYlNTbiuXBMgDKsAzi801kDG79DRg4StubaWNySl1aquooJVwppQwGISr
         V5XU5gripwuSe4PpeD52JJk++ZjMY4NAvYcHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711378225; x=1711983025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiJIJJs/fXvTyCDSSNBDGHDw2J3EG4BtX2teiiFjae0=;
        b=c7JCHxRYrM+ST3cU+pvjOq5FiLs17tFWcmc9AptgtIHgdisockbTnr0YWvSqTIJuMR
         zT6QKWOA2YJpHm6JjSJQsdST/1N2avmFF0jP+peVdHUgzr+E/0qzOmT11v1JPmNP14WE
         nuEc1A0o+7lefcMbrOd5oVm7y/EFXksv6U7K8x45QryKfm1RN/8Z8HlYss+KNZzfjmEN
         wYvvYk9kAPyZlSOLNRTwTIoCc1BQe/VIUykaI5gfNHyY6c1pBSxN2rMiaC/QSva7+g6t
         lIr9kAVZ1VCCxumlNsySF17iC3IkQDwxYxEmvkpcKCpThfhfawABVPiHbGbh9HTfdQw7
         WRhw==
X-Forwarded-Encrypted: i=1; AJvYcCUKm/FX2zqzlS+mvifD/Gm5Uwypa4wI/jXk2AZEWUD916ZlPYqUC/8D2kuBBC44iL0Ptjs4oxmkxiqy6vWTF/cXEP7bmaH3OFs9i6Q=
X-Gm-Message-State: AOJu0YymJebwBFk1mYBRXDlzkiDy3OxH6XLbub3UKRhZCpqVPFzefKbR
	HJrqwJBMUY9LpO4iSkxDgu2AZC82aJy/r8+BFUH9f8/leo87ZkpQCMd/NkLTrw==
X-Google-Smtp-Source: AGHT+IFi6H6aHLQfI8VFi0WO8ICSYFmiwIeOfLPtxErl0UIG07TzmLmgVZ3n0y6H5EShjbVyMwmPSQ==
X-Received: by 2002:a05:6870:1641:b0:229:e41e:a6b0 with SMTP id c1-20020a056870164100b00229e41ea6b0mr7401259oae.47.1711378225403;
        Mon, 25 Mar 2024 07:50:25 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id eq17-20020a05622a5e1100b004313f54aaa9sm2491449qtb.5.2024.03.25.07.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:50:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 14:50:23 +0000
Subject: [PATCH v3 1/3] staging: media: tegra-video: Fix
 -Wmaybe-unitialized warn in gcc
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240325-gcc-arm-warnings-v3-1-81b8c10dc18a@chromium.org>
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

Make sure that tegra20_vi_get_input_formats always assign a value for
yuv_input_format.

Fix:
drivers/staging/media/tegra-video/tegra20.c:624:72: warning: ‘yuv_input_format’ may be used uninitialized [-Wmaybe-uninitialized]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index c25286772603c..630e2ff987a37 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -164,6 +164,7 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
 	unsigned int input_mbus_code = chan->fmtinfo->code;
 
 	(*main_input_format) = VI_INPUT_INPUT_FORMAT_YUV422;
+	(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_UYVY;
 
 	switch (input_mbus_code) {
 	case MEDIA_BUS_FMT_UYVY8_2X8:

-- 
2.44.0.396.g6e790dbe36-goog

