Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9805A2F5316
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 07:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908689; cv=none; b=DOnBTyMm51Vf+lUD3pX7wHrj8slORZuULCtC6DqwfLFweCkjNaaoXJSQrGFCpC2C1PihnD1JS37qRm+5HrrEBIYi+RYGSVO7H5BVmTrKrjYxS2b2VWeYzmzzaFqt2sZaJz9lkvPZlMOrTpouVsT1P//swD3n5oj4jMelFi1mH7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908689; c=relaxed/simple;
	bh=u+qJVWyapenrodgmMyyh5sdeoJQIHo+UHZurPNrBBEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSNojWAaxyeXTSyazYgaNePnFdk/HQRFYVZEzCG/ywiJ4zACTYXm5tj1p9nxTKfYI3axq5lOAP5H+nc974Ei35U+S5ShvP1vaTIXyJRlT4j2KVwfz/0TBM52G/yl1wJDbuwFRAp0juyQv4PLDt3uncdl6VJ+o0uuA9Z0qFfDnbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZp4dH0J; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZp4dH0J"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so7960859e87.1
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 00:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908686; x=1760513486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=XZp4dH0JeMzACxra9xMEXeith1ww6pTvU/algkbvi55/gYT25Cxm7hd3I0bsxnmEXU
         Meiu5CSJo1pxv4Mqg5LKKIvzv/QALv3GosKzBSaBxex7sGtODHMNuW7qzKs1LeLli+Gi
         BYu3Ymjw/8EljTKVskvvRx3Tma+D17ZEg6gtv8IXmdPmj+JjZ9k0/Vc6dZkbQF98amB0
         Y04yB200yXmG3mlHxDCYd6pLvpIoqsFCupUepTl1Vr+meTKT0VxEtcTc0ARxfJtxirOI
         xlz6XrNy0yQK05IGyJDm7vHLcGqRMHYuX97ly+cVGW6lW+o3HI6Sa9eIi71pBCc+ViEP
         KdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908686; x=1760513486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=bN0PEafJJ81DdA3Imp55NX6XRhO29iEErgPFyIiS/ENm23nx+OMqk0DnVZGhHNg87a
         gxE9zPkQj9fXpucihJiiqWjWxhNF2HcCwYB61fo5EyFg5Bdty0IbWG0dsUiviVZBTH8g
         Goi/BjvcbrOdBBzCFkQDDWznEDd7AcT3bFwZC4Jo4ksQgRVbOiwVYtGmrtdY62mhCeYz
         7sVk0MZ7unyYevmrJi6BISXrXaHDFmlZhzbmadiJNQhlofmDFH4MYKMm3h0YQRvSykMY
         06Oly9l0JfdveewpFDeP0qFG59swKNyP5AUoB0ExTpRd+ZF3cVs698AzilT/a9Wi5hdK
         L5uw==
X-Forwarded-Encrypted: i=1; AJvYcCXoGOFzw4IHUxCkwsUpZ/OcXpAVzAaI8TEbiYjHZ2y66Qbd4VqPFW5YjytOmAEvbqW98SKRo7slIoeUvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYvOuYT8ZGgnNXJ/VJKeUBj3m1YxFRgG0aQ28C3sgbLYV3UltM
	QnEt67aSiWRhL4fOz+w3YNmNbKo3j7Fibl+AAY5Hd0pY7zNjLHGf4pN8
X-Gm-Gg: ASbGnct6oBdpc0IqYUEFK5QZPxFP+rMAdjOUuTqhGEl1/GwBWCv3XM01bc/U2MOPUZs
	6tjsTSG7OKvLTYfdz3Sijk8XgBltVaERXs1DuTedm7ntiYQ5L2XM/nRieqwTYLme17+AGiX1i9C
	qlf+pGaEtl0zycXRWMlGZAk+feR+i+f8G4E8VxHQLCXWSOTND1hX+jEFuwm7rnG6rUkg9wSKEce
	aYf/6ix0AvHw4Fau3G3r+NSkkYCtDb5Xb5Zu0S+ef8xVaQFpPZSPC9vWOJjVicOZQzFC3Zs+Bww
	DIF9kdwWCPU24VRDF7HMRhE6NO5gZPP2+OJk2mZN9oUr/m0An1LyKL1Knhc+QnnuT5D986drXKt
	vbdDv1Flg7tD7EYPGA/tCXy99CQZdCRuQx/QI7A==
X-Google-Smtp-Source: AGHT+IFR32lh8FtdUEL6SphWqMKGIHQLehIZkE6OfQDikiDPLeDxw8CjYdXaviYneZ6ag7JJ8WYzTQ==
X-Received: by 2002:a05:6512:ad0:b0:57b:1ca2:ab60 with SMTP id 2adb3069b0e04-5906de89076mr686708e87.52.1759908685358;
        Wed, 08 Oct 2025 00:31:25 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 07/24] staging: media: tegra-video: vi: adjust get_selection op check
Date: Wed,  8 Oct 2025 10:30:29 +0300
Message-ID: <20251008073046.23231-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get_selection operation may be implemented only for sink pad and may
return error code. Set try_crop to 0 instead of returning error.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7c44a3448588..856b7c18b551 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret)
-				return -EINVAL;
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.48.1

