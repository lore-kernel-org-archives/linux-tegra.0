Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7933A18E20
	for <linux-tegra@vger.kernel.org>; Thu, 14 Mar 2024 15:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710431392; cv=none; b=H1qSF974oKoSSGpP/zRPnjtW7B5Cmk4EO1icvyQjkRDXVPGU7Fqj60JoyiHspc8OpIB8oQXsOZAA11o8oyRuUWwjqOSUgfB9HtjT5O3uy7zHuBy4FdeyjAekNSYM2rHO6OmJQe+Egq5z5SfJxFVvv0pB0pIVzRR1bAyIGaim6V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710431392; c=relaxed/simple;
	bh=zamrk6J5GT1Ml4Fbdj+B0COd9gJVvvPiofy2pcwbYvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aBZPRdKLVKCxVFYCU/NweLB3gEMfHQ1AR82lNdrmJquMnaaZNbt5x6NgItCwn4unEgfBWyQ1Z7VTfHfA7W8CURdl648vdnQx+RuQxv51YFyDjhhLuxheu5RH+r27Pae+/IxhGTmDjI3nz/6c9L4v/eIPD/JIfDuRlBFEkHPUWTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpWgznzV; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpWgznzV"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a461d0c90c1so134744366b.2
        for <linux-tegra@vger.kernel.org>; Thu, 14 Mar 2024 08:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710431389; x=1711036189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UoYqTJjbAWbKASaNyW64iARhPN3viTnTzys+DL4s3qM=;
        b=lpWgznzVzxPYwOOWdWWRcKOP3wkG36H73/3+TAz22AOFHrkWi7lwSfxmKshnRD5h42
         OnyDDNvycchF5S6soJa7ly9eP8MPeTQAXqsvWblgmsI1AIwXoFcQb//8j/LoUAy0yYHK
         rwEQXw5vdO1wzTLpBxMGOjQWc7bgAUREyPlgDED/j5QHApTWhn9l3cklFT5VEvPuLz8o
         ySgXneRhvkC/uM4PTffMlu7b2Q2KIC+GqLeO6hWVlcE4MNzavk00cUQKSamAyqE/Iv5a
         Na6/tNahJcIH9zbsm83n4q9DOjmx+LNcu5xXsYiqofRM9ti6psRe9pd1eJggbA09T1hP
         BAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710431389; x=1711036189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoYqTJjbAWbKASaNyW64iARhPN3viTnTzys+DL4s3qM=;
        b=tbAJsxOpNdG9Pxbl9HyjnXS/2ql5Bq/i+1vwntJUCjIVx0e29iBxwNXRfMdxqi0SjY
         ugGHGd3qPFqGkM+9U1p2D4za8vnCuSIM/KM/dprt3sa3jVDwMauKsOEXVHl3QXazzMq7
         EXlFr85JpFBOk7DRF30QQbwr9XeoNRoQPDOGO7ZvCQ+zm0UHHUrsFVAXZeyGMAlvv9PK
         b4a8b/SZIylnSVGl5oG6jnJn0lcyOz4w8aC0q6jDF4I2iR05GPtmzhIzoBiu6I/VmGP8
         5hY0F6KsxmcPckxzWNm1H6X3zXwBe9Ibsx7G28ilkEQ0QD+qMjJ2e/WUcyzfylensb0+
         SpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtE1h6fNZCyd1tVELRuyQ/c7HTMho99tjBXhI2CWRJAgLRFQQ43D65xoLu6kYdn4WlgUdp2hpUtCv/NG9blqEBsSave+R3wRqykHY=
X-Gm-Message-State: AOJu0YwpR8GKO9H4RRgxHgChKkICkVptfVVdmLd0zGSsisH/uf/jJOLR
	WIAfBbBXRb9fEjARrOGABKya/VQqbSD02IXw5FGQVY13KTlqbtGo
X-Google-Smtp-Source: AGHT+IHJuEtl91TfCZ4KZZ4Sz6nunyNoL7j5bIkGvOI3TniyhZhZk6mX5MDqEb9xOuiYmazGIBgYEQ==
X-Received: by 2002:a17:907:c205:b0:a46:5eea:aece with SMTP id ti5-20020a170907c20500b00a465eeaaecemr1592117ejc.3.1710431388601;
        Thu, 14 Mar 2024 08:49:48 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f23-20020a1709067f9700b00a45a62e0ed0sm824296ejr.98.2024.03.14.08.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:49:48 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	"Jason Gunthorpe" <jgg@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] gpu: host1x: Do not setup DMA for virtual devices
Date: Thu, 14 Mar 2024 16:49:43 +0100
Message-ID: <20240314154943.2487549-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The host1x devices are virtual compound devices and do not perform DMA
accesses themselves, so they do not need to be set up for DMA.

Ideally we would also not need to set up DMA masks for the virtual
devices, but we currently still need those for legacy support on old
hardware.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/bus.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 783975d1384f..7c52757a89db 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -351,11 +351,6 @@ static int host1x_device_uevent(const struct device *dev,
 	return 0;
 }
 
-static int host1x_dma_configure(struct device *dev)
-{
-	return of_dma_configure(dev, dev->of_node, true);
-}
-
 static const struct dev_pm_ops host1x_device_pm_ops = {
 	.suspend = pm_generic_suspend,
 	.resume = pm_generic_resume,
@@ -369,7 +364,6 @@ const struct bus_type host1x_bus_type = {
 	.name = "host1x",
 	.match = host1x_device_match,
 	.uevent = host1x_device_uevent,
-	.dma_configure = host1x_dma_configure,
 	.pm = &host1x_device_pm_ops,
 };
 
@@ -458,8 +452,6 @@ static int host1x_device_add(struct host1x *host1x,
 	device->dev.bus = &host1x_bus_type;
 	device->dev.parent = host1x->dev;
 
-	of_dma_configure(&device->dev, host1x->dev->of_node, true);
-
 	device->dev.dma_parms = &device->dma_parms;
 	dma_set_max_seg_size(&device->dev, UINT_MAX);
 
-- 
2.44.0

