Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5CE2F547A
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 07:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908691; cv=none; b=A80fWpmnHbYKiePOL/3u1tt+I+SA4HfyoU8ntRT7Aw+b9twRPdEP8HnrDNbht08Aznpl9sSjc07M3sJFjREFkqEx+9QXnCH+ee9BAuCPiMg5d8JXylyHivMGp06t/Fs3nxvpmFqZyawvTsUfa1UwNUv1RQp/rYy9vlzcDsfJiGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908691; c=relaxed/simple;
	bh=unhDWU3j7HXm8tKnMiJwHfKNJbf2ZhuKuePm6ASfLQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNO0bLAzZhaQWqJt0/uQoCCUhxk12IBbVOqpDN9yMwnjyklBuldxjz0oJwyB2xdDlYOqqc1AhQJg/GM72Cv0Ti6RiJrylxEY6VwZCIZEKiyK1d/rjSacRNLjVF4In8DD1etPJgOx7gntoC9FhNkR9JiiC+96VmpCsxyw4exMcQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icM78hie; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icM78hie"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso2398453e87.3
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 00:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908687; x=1760513487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
        b=icM78hie9U+Z0fwC/uppdOSKbaas91nW9zLII2laUcdu3ka+DZHNMfrL+Vxi2jv/bt
         w7c+T++TX/LkIvCMQSIXDqys/PElxerQI3VKp11Ih4qWTdAei3W+pppBlgUbeJPU8gfM
         Z8t1pk4k7ztXptaNWC6JkhYUa3iKcPOaRkqz7k5ylw0XtPhAiivwpCzN3bmuAak0yXq/
         8UtHPBX8YZcg/mY7ow3ta5cO5Lr/iZvm2mCeDYaP4y6fIIf98mG3NT8yYvg1BEayJblu
         s0kScq8exE+I9jitwwZgHGXmVTZdYv8X7myxANDsyNMSIbAmmjNd0fbNDsBkhwE9pXcB
         ovHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908687; x=1760513487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
        b=sf/5LtPGPlyoYDnzWQbHamQehjUS6Ca39R6Yhjzm3/mI66t0KdnPYDsi2nEhUYI++m
         vbNsejve3XCc6YosvLF/Ig/uAjUcW6+NFNJQOMok0huRdEaOZy+DcOMe02oyEjc2VNZs
         OR3mdXcqTlb/bFZv3vMhX1AR8ECP2Njx4gU4hAoQrCs7h/0hjZ0ajfT05JbwKpm/tjT1
         gbyyF0qt/hlxKmqkfEDGzXvPqJKzNW7pPBz6DF+w415BhNMMLp1QUCs0TTgEu3AO/X9B
         +UrqhRet9yvAtEWf8fhnfVoVwVshF2ZuLw46WHCPxlvjpcaPNlIFTXDz4Cb+gsYLmflm
         FK8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwyau1cm8bNRBMD/OlEhw9vSUWXOr6e8IPy1Xd4p8R3ZzMo9qdIhPoXVm6OhgtkoTL35BJRppuiDa21g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFKx+PV0+L6LLhKCyeeEfgmuxiRdPgeafNIrFReMdtdjuXymgH
	flBgPMhzj0bCOGU70uh+3lR4Ph0Uil55+cOnjyHWUTBcxEk7iGZDB5pj
X-Gm-Gg: ASbGncu0EgDw/6l5M4jJIksN7tl+ylpCkg1Gr1E8a2DJVQIz3CY0nHIK0KjwjzqYJfY
	s9hVWN7wk6iXuaTVxWBULZoTtF7tIQ1a9DlkngYfe4KwdxNSNY8N7Ssg6l1/W4Apj54FJ34XOan
	/a5vT+HKMdz2A5QHqN96PghqUqEXT4t4BakAAfUaodoG5xPsYD2B+gIF7KQa1Y4LwSaTdFhSFMS
	wP9eecoDiOsm5EuuYZAx4geakNUu4E/UHWeY/WZr7RM88SQ5kci7E2S1ALdNPvj+P+M2Jkk8M1b
	NY/rwibci5er+F+Gsuo/BYEjymibUOTgXM8SGhmcI4iS17a/Dl1/1J0ZqFc26NcPjZUimVs685j
	QczR6NbdGFQZvsfWDsglUb2qUkQu5IL4nD75EAtMsollmVs9S
X-Google-Smtp-Source: AGHT+IE+7DyJpwvFP5qOZN8PeNT6/Gm3MISOvz3ifkWRFTEcK846nRXZ88LLrVfYB+NusyJQJau+2g==
X-Received: by 2002:a05:6512:3f28:b0:590:656c:d10c with SMTP id 2adb3069b0e04-5906d88b1aemr661760e87.16.1759908687027;
        Wed, 08 Oct 2025 00:31:27 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:26 -0700 (PDT)
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
Subject: [PATCH v4 08/24] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Wed,  8 Oct 2025 10:30:30 +0300
Message-ID: <20251008073046.23231-9-clamor95@gmail.com>
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

Because the current Tegra video driver is video-centric, it exposes all
controls via /dev/video. If both the camera sensor and the VI provide
hflip and vflip, the driver will fail because only one control is allowed.
To address this, hflip and vflip should be added from the SoC only if the
camera sensor doesn't provide those controls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 856b7c18b551..90473729b546 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.48.1

