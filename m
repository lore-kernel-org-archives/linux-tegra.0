Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC463859DB
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777414; cv=none; b=dBCV6/HQs9gDHOEYpUfFONwp0KMoWFfVq6vcEd6Gi8LeXAq3pCYayt0Eqly6eJc2FmEBcsm0i0d1hXANgndCTDHc7x9/Z8U78/qRWuzpJ5YGFtCMoX5qTdQOpKesC+buQj2jFgifYyeFOXaZwyt2lS58QFytL83eujrqdBKwVIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777414; c=relaxed/simple;
	bh=1gog1afMORIsIGPfEuVIVFQI1bsAxNOV2bdjIS1D/tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFAebFRmQdIZH9hZOExxtaINnchDEETFlsgY40LfMnQnZd53ycSIZf0m3URcUKPuJMj/zSB0UCq86elPH1l8pyNMFirSl2v4xRxsaLaRwvntLyCcrf1n14NR5Ml9xfku49JHDK1+3ZWTTc7klAnt25Xf/aKqMlLgl8zsv/HTKcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJSIV50Y; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJSIV50Y"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so23434575e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 04:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777410; x=1770382210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xr+OjmRQzkV1Pp7uXV6oto+bq13Pjg/MusGbR6wa4s0=;
        b=nJSIV50YbkuFpXi+g+3OXtnq2hPRyfSERimjnpur2xcfIISwt08vGgIkBjD7ofwkdr
         u9u1Ijz9WQF8M7w0n9d+YA2OQqOIX/HnFW7v5LBwbYyqOH+A+PfgK3cuEA4+kDYFUHj9
         loHZW2v0YmuhI/bFIZ0uC0P9Nh4ZkbGzqiVO50C3ZG6iXRcndkoHnVHY17dWW0/hZ32y
         +ko3oxLmgvCYaGrFXdip7mSRgcMFl082BoLTW6khbE8aX1+54M39VvSULTntUdELfTga
         4E2XbjgVgDPI0Ar4khzRpq17AfJBIY48X+GK9LWj3PzCopqY/sth9TDWpBAiLoEGY+9n
         O4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777410; x=1770382210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xr+OjmRQzkV1Pp7uXV6oto+bq13Pjg/MusGbR6wa4s0=;
        b=FgrMlsqByycRHYuuJ/PAejFzpChXhM431k+T5TiHRhBpKYoJGSUrzjxtP2+IEZjYSQ
         0JadKZ8i8frrG6Rr3SulRZ8J8owuInm/VbHTLYRNxDBlOtlkPD1AJfcTo/fvqzN74rsA
         3OcqM9tKNyDEazU9n+aGoivJ0+1/iuglxFyhlAn07qirFDLavqGNi6mQSTP0dw4XtoUl
         tgXguKBg5lp6mhSAK/c0zCzrerKZnd8joiCnO6zcEdrToyFl738ZbufUt7yatuVJ5vaX
         hUouI4F42WP+99+79sR5Su6niFz5S2e6ahcWb9uhQMx2jGQOPvQqUNY3qPy6fkwhsk/Q
         86Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUlR8c7kYFx+z07MjbQeXL14CpMl5oY5E+xDQVXvs4BGSDinizgAwQXvB+qAaenRhhU3VsEJisWzxDCeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKKfErUnrzUri3UauRtIo9zzMUiuLi1MGQxuAubGVY+VWVRvPl
	z1QyRrtFVr7tJY1i4Odzt/RniS1YgHsBTCV6McC2had718/kTQeSyu2H
X-Gm-Gg: AZuq6aK9U3jyUNH4C+IFQrS2UVjOjj9zaSVyVBzeB+B5q/1EqV4HTqX22UgNCOSMhHP
	CFWsazDfRD+bGz2qr3ZO6pJJxTDcB3bemlTtaRIpRn8jVKLCSuSQd1wrYy7ozWQ/vlMoHW12Hcy
	GV2Dpafmo3nHJAhPp0FsHDjTddbJd7998xJiZRXKTaaEEQwM87qt+MfN802MlUs/M9I4xnTCf9D
	4iE0Ir32U6WSDECFcMQa+jzZA7ppG23shPwCJ64PmUI4qkJ48mWxtfisy97g7/k1WQwYGACMKTe
	W1I3T8BY3MBxK39Nx6T/Xnj5v8hN5YG1aXffz7qpfC3Xfr8aa67trgB55WrR2IlS1xWc9hi5HFl
	UUqc8jaB6c1wxeyu+f029uCqUdyUQqQ1R8XOtGajVVmURRnVGIvsvxYw3rEL3VmVqc1Q+C2+3EZ
	KrNvC4hu3HGso=
X-Received: by 2002:a05:600c:a4c:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-482db45770cmr35972115e9.6.1769777409790;
        Fri, 30 Jan 2026 04:50:09 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:09 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 14/15] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Fri, 30 Jan 2026 14:49:31 +0200
Message-ID: <20260130124932.351328-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 36a57078d539..1b8f2a2213f2 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -504,7 +504,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.51.0

