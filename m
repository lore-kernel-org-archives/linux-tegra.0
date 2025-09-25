Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672693009F6
	for <linux-tegra@vger.kernel.org>; Thu, 25 Sep 2025 15:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813447; cv=none; b=c5pbBDziOxdYqOrdyM6a+rbd81MlJoHRveuw8VBSwzFk/WCpWUVW8EJ4ogz2yI38nM9SJvuLnxS9g2caL4r8+4Mz3gKsRmr+4NQJJ7MfQQGdng0NAu8SUyOLkcmCY3tx+h9V48vJ3oMy8nefxYre+VveErPuQ4iddF63B+2bCV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813447; c=relaxed/simple;
	bh=u+qJVWyapenrodgmMyyh5sdeoJQIHo+UHZurPNrBBEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQizSAPPONvTIYJ7WRf7CPXYQBMtMOjSk2NS6lujYwfKHGxEdb0EXciCSTJdrGbS595TYQetPJlQexQeDilcC+d9AG+BVwGTflCXHlqjqCHQvNVz0FremHSESqIAt3+1UnPxwStQ3Oqag8ctAaFqRosRjc2HHDozF+sIQi/9+OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASxPoWgg; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASxPoWgg"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5818de29d15so1400832e87.2
        for <linux-tegra@vger.kernel.org>; Thu, 25 Sep 2025 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813442; x=1759418242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=ASxPoWggU2jE6P99zI4CRqeV7JuShOT1D/mfEc2RqTFGTqRfTvoolVpC+su4R2SMBi
         uscAI/KyVs4csYRuIyhjwY1lGPJc5YaCnncVKxuBUCAKCB3b2pmvXjxtnYjIXB8Csmjo
         KWIsVNQvQdB8AyrwSD0El3/1UziL8zd+KKgE7UZNeiTfDuTC9s5qls9ath6D0PXvVNrJ
         wjTAwc43k2FkfBJrk8p5TMHt6TF8NAW6Cz1vFC1QnNko/u6tLDj214hUDDqBXk7bnCzj
         YHMkvnzLZj++BOxhVTxp6dctM+RnAu7PlIqBSOLYoWStJ80XFVnXXC42Q6BEns1e8BuU
         MPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813442; x=1759418242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=Me9BbHEywkPBbn0Fh07W8C06Se1aubt0MsqVCJJGyxqxAgDJEFEuLOw/KUQjs3l2e7
         wX+hIDTydgodzjHc9IBwUJy2T5yDX9pg4gxiQXdYrJdoiNJ53fHNTflV4w6Scj+zeQWz
         6SObIezpBw7VAkOLPLUXRZkoBmYs/oZZYT3hnDHnujklHYj7vCHVmD04EvqpC3YJtX/r
         m/QxscYa86GAuJdfzX/7ZMN6yCcluJSoY8lSaD4hIfaWFvEW+zB3iNkUq2nqvjnnYiz/
         Mb967/oZiGl7YtaMCXYEN+WK3OwIUMOlzobL7aVS9MSnbSxvrlsi+qTi57Boxcs2ADGw
         b2Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVOrAXoMsSyOWgykRpWNR8+VsYLLdJrSFZ+FBTDisNAwsHew2xY2wsoYfenfDbYrDIHHt8o93bsom3T4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmuCmyfGp/0o56Q0bwIuMbDGIgzdz8pnR/aK+qlhVD+deFggve
	Sm6EEiP+q5E4AQcOjlh8E787EjQQ5GybrzG4m+BoDLS3srjsgkOcS9TD
X-Gm-Gg: ASbGnctqMilETaiKYTPZaHsZwBsjmPv/9d6+QI1l/ZLbcskFKFciQKOztJPm/RR0ud5
	tihCCT/pA62mN6BzuBwpfRdvvwT0FiVVXfyyMirVbO2t2la7jLG/0qM2+Yz+ziLljAmQqg27ucG
	i9czDX+VcXVPZY7ZKF9+u/rXhdcBR1cF/7pYfQUqYZ/qWs5Lsz8yUEBFRyVbubsgmSCWv8/JxT/
	ENRuvmmA5V40z4TR0mKqW/pMrp12GoK8ck4aCKNVHVWIuPQEgOz8VcNvPHoA+jEHZ9FPVPqt8TB
	a1aOW0rTJ2DtDtFXmQxqros4MkJPw7Nf1qDMJo4kBJa+XTI9Y+lvYXQVj6sNyYSY/DdoFQuaCIs
	0As7izbddrfcu3A==
X-Google-Smtp-Source: AGHT+IGR2iv+Kh9ab2Gm8gGsLzPj15GIU7TA9oRp1epPRzVsSpV56VOyWvYjJkH+/G6EVhjFNycXFg==
X-Received: by 2002:a05:6512:6d1:b0:57e:ef77:699c with SMTP id 2adb3069b0e04-582d09297aemr1358949e87.3.1758813441925;
        Thu, 25 Sep 2025 08:17:21 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:21 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v3 06/22] staging: media: tegra-video: vi: adjust get_selection op check
Date: Thu, 25 Sep 2025 18:16:32 +0300
Message-ID: <20250925151648.79510-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
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

