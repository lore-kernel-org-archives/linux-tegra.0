Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586724;
	b=ceBkAS2uou/O+J0UZJjP7YAejVbPWmI+kQ9x0YA8MY9c5m0zDuvC4zocRjnZ41id+//E
	 H+Kt18Ggxs2VO48NhE6qVqHbLkD+Qi0B1BiQErhwuyf8iHWVJLODukfhwFXHiNfryIy7L
	 soY9Phu9goEyrgW/sdEwzTAX6AfPcdSyiyD+rysgZXn1FACAySXDMXusS2947sXCgf4Xe
	 +5agk+kBJgJ+RZs1KepEu9neJDUhgPWk2uVsGA7pGkw2mMpeOdPbCYPFrxPask6C6SENI
	 o5E6titASc8uQCQfJVYE24SDHvEg4ncuyWoL9vdy42nS82B7ZEusQQfyzadlnl0syjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qfj6AebNSoU7jDJj6yLYm/vf9mSvU/jdtYeDUnTclVw=;
	b=wLlcJk4qxVAjhYS6tXmn8GfEEQvBt3eLcUdahPwPOZAK5L+TmDKjZ63+0w5ljclGl8Md
	 JTQv//tg41TV++IVPTns3vgR+Dxr+KTE+SHl3K7dJfG/g2LikZ+wkGJJCEDOwlHrVzgRn
	 mb464TpKIh7qIZh2l37VQLOy4GUeaayADn4HXgbu5HaB79LwoLXsV/9OnvePDvpu31p8U
	 8FLh3PV1aOXebukvp9uesXSGdD7/FnqKZw1kaWnQDsa1IZjjXNbqW3yy9nhudAgWfkJ2i
	 cji15p02gx/6Tk7PXOywJ36+HEuWsR/+6xmHton1X26FpnbTG//f1z4SASAS2v6MTNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW2CnBlh;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB5C606BA92
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 16:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DB5C606BA92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW2CnBlh
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so216101066b.2
        for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 08:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586723; x=1795191523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qfj6AebNSoU7jDJj6yLYm/vf9mSvU/jdtYeDUnTclVw=;
        b=zW2CnBlhNSQR9WbPdvEY1nHu1vpXRgzQpeR3yrSN56lUcI/pZtxdjas+HtPIm8XqSi
         TWLFOUCYOewkIUmW2iDbvQqCgJlMgfAMOSKE952+2yWhLejL3RNKCzxB5HXiWMo3suYe
         DxaAY1f6GArbgflFx9WoZ9OgvZoAFGxLgpfKnw5hhHe2MgJwokbZa+MT0/+zguSndgAL
         vCfISVMh3jXLRcjuy87D8WpSH63Ytc561VxNc4Jfq0JVA8ZTyd/XQdPwEmqMzaNWSFQ8
         9QzMVOHV/mFoGCmeCUGg6tLdmUiT1YZ1hdA52uOQiq1E+j6/tEtuYncspeHZjPIp02kh
         6vOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586723; x=1795191523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qfj6AebNSoU7jDJj6yLYm/vf9mSvU/jdtYeDUnTclVw=;
        b=MCayawCnaGfXacFxKCGOXLPaG8sYLNsCMTQmBitxxFWK4Hfc7h1T3NyhZCBIF+ls/x
         cZBvOySKX8EL0sY96D6lOSkqNJGK1Aqi/m7iasxhlHasVgYDauo66KexBZVf1CNdVDeZ
         XVFJzKLZgi2Yk9G5GkVBXwoqiDqJu30k1q0QqqNsFgP9Bq6p3bPInTHbGvSwM8Y3A2q/
         za4BrhJyVmMQlZTMmlu/rXfPnwxWYp0wM+0RKoIMcAMp4cmY76i9R3yCjhEuyCI6CZk+
         YVQMRJvqayyVg6tesWA73G+1yBgaVzlTpgClk6STNVkShslfTRxnzXZC/UnIYVK/s1ue
         yO1A==
X-Forwarded-Encrypted: i=1; AL+hErETHQ5pi8VfBKxT5t1+HutJm+cDtNynMenLTljTo688YC2OuFRCAZx4KnvABEk13LtATINuNiAjk/H5ZA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+TiHWks8LxJbHyfCQkfh2i2KLhmf00S14RmxpaihmgDmT96msW
	yMyl8Q5lchyl2LE0z9n5cQVjtRfgJu4QGRS2DQDNODhQQJoiNwRh6KmV
X-Gm-Gg: AYBFou3LEhYkdF4JZPLZ86Wmg4l8kFWLijG1ZPOx5+f8eIIGCKxKEu26oU7sRMgiJVc
	HY0lKTbLf5QhDLNuy4QVSEzPJCxJwyUpuMr2CKDL/7e+bloTDKEj8/bYB/eQY5tK/bwvd57TlA1
	CNE/frEIlmIGhUFgPGJukhMl9+PmrYkCFmukiYGSMbIIMOzKJ2O2eTD0vgGz9xB2Hel0tiTI6Bf
	NcS/sl0t5xh5Fx7mSPq+y56HbPq9gBf4U4rjWJsI62VTmFw6zTuOtiqRsIZRJXPw4TkebzWPl7O
	Oxbye9wMKxYg8ieto7ypP/oVyY7Tkj7uo8xDHPAYtePHB46d3DwibuDNdENL6i5Cp/btYENeybo
	BiXvt1QcgkRb1E8627qs0/vbjxgNWhslrtrQLe01QzxVb4pZxs+nU30EadQE5IfIeHq0I3CFPIk
	QrBiaV8lU0yOZQkyu8QHee8NrtVVNr+JFgmIZBxLn85LZpW8S8ChwNOYqQaSxPpnBiPbhvMeq8n
	ou/MLSM3mwzMiC14ujjq9pXOPCs3jm8/uttSzHDGIKrHYTTsXwq4wXlOk0qMGxgR4xIi1YF72mN
	j7RwqcKiGdqAIBhscv4ATJwF0euFXKa+ptgOA+6N1y64Mh2xWsYO7OvW1IqMBjlK+Qt3VrNeAwE
	N6bB/l3d6kA==
X-Received: by 2002:a17:907:c06:b0:c21:9b4b:2690 with SMTP id a640c23a62f3a-c5096328858mr256085866b.17.1794586722589;
        Fri, 13 Nov 2026 08:18:42 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:41 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 01/10] staging: media: tegra-video: Move driver to media/platform/nvidia
Date: Fri, 13 Nov 2026 18:18:10 +0200
Message-ID: <20261113161819.36847-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tegra Video Input drivers are mature and developed enough to be moved
from staging into the media subsystem. No other changes are introduced.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/Kconfig                           | 2 ++
 drivers/media/platform/nvidia/Makefile                          | 1 +
 .../media => media/platform/nvidia}/tegra-video/Kconfig         | 0
 .../media => media/platform/nvidia}/tegra-video/Makefile        | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/TODO   | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/csi.c  | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/csi.h  | 0
 .../media => media/platform/nvidia}/tegra-video/tegra20.c       | 0
 .../media => media/platform/nvidia}/tegra-video/tegra210.c      | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/vi.c   | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/vi.h   | 0
 .../media => media/platform/nvidia}/tegra-video/video.c         | 0
 .../media => media/platform/nvidia}/tegra-video/video.h         | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/vip.c  | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/vip.h  | 0
 drivers/staging/media/Kconfig                                   | 2 --
 drivers/staging/media/Makefile                                  | 1 -
 17 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Kconfig (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Makefile (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/TODO (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra20.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra210.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.h (100%)

diff --git a/drivers/media/platform/nvidia/Kconfig b/drivers/media/platform/nvidia/Kconfig
index b211b46877f63..53f34308f5aff 100644
--- a/drivers/media/platform/nvidia/Kconfig
+++ b/drivers/media/platform/nvidia/Kconfig
@@ -3,3 +3,5 @@
 comment "NVidia media platform drivers"
 
 source "drivers/media/platform/nvidia/tegra-vde/Kconfig"
+
+source "drivers/media/platform/nvidia/tegra-video/Kconfig"
diff --git a/drivers/media/platform/nvidia/Makefile b/drivers/media/platform/nvidia/Makefile
index 428415ff83de1..97a94b60fee93 100644
--- a/drivers/media/platform/nvidia/Makefile
+++ b/drivers/media/platform/nvidia/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-y += tegra-vde/
+obj-y += tegra-video/
diff --git a/drivers/staging/media/tegra-video/Kconfig b/drivers/media/platform/nvidia/tegra-video/Kconfig
similarity index 100%
rename from drivers/staging/media/tegra-video/Kconfig
rename to drivers/media/platform/nvidia/tegra-video/Kconfig
diff --git a/drivers/staging/media/tegra-video/Makefile b/drivers/media/platform/nvidia/tegra-video/Makefile
similarity index 100%
rename from drivers/staging/media/tegra-video/Makefile
rename to drivers/media/platform/nvidia/tegra-video/Makefile
diff --git a/drivers/staging/media/tegra-video/TODO b/drivers/media/platform/nvidia/tegra-video/TODO
similarity index 100%
rename from drivers/staging/media/tegra-video/TODO
rename to drivers/media/platform/nvidia/tegra-video/TODO
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
similarity index 100%
rename from drivers/staging/media/tegra-video/csi.c
rename to drivers/media/platform/nvidia/tegra-video/csi.c
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/media/platform/nvidia/tegra-video/csi.h
similarity index 100%
rename from drivers/staging/media/tegra-video/csi.h
rename to drivers/media/platform/nvidia/tegra-video/csi.h
diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/media/platform/nvidia/tegra-video/tegra20.c
similarity index 100%
rename from drivers/staging/media/tegra-video/tegra20.c
rename to drivers/media/platform/nvidia/tegra-video/tegra20.c
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/media/platform/nvidia/tegra-video/tegra210.c
similarity index 100%
rename from drivers/staging/media/tegra-video/tegra210.c
rename to drivers/media/platform/nvidia/tegra-video/tegra210.c
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
similarity index 100%
rename from drivers/staging/media/tegra-video/vi.c
rename to drivers/media/platform/nvidia/tegra-video/vi.c
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
similarity index 100%
rename from drivers/staging/media/tegra-video/vi.h
rename to drivers/media/platform/nvidia/tegra-video/vi.h
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/media/platform/nvidia/tegra-video/video.c
similarity index 100%
rename from drivers/staging/media/tegra-video/video.c
rename to drivers/media/platform/nvidia/tegra-video/video.c
diff --git a/drivers/staging/media/tegra-video/video.h b/drivers/media/platform/nvidia/tegra-video/video.h
similarity index 100%
rename from drivers/staging/media/tegra-video/video.h
rename to drivers/media/platform/nvidia/tegra-video/video.h
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/media/platform/nvidia/tegra-video/vip.c
similarity index 100%
rename from drivers/staging/media/tegra-video/vip.c
rename to drivers/media/platform/nvidia/tegra-video/vip.c
diff --git a/drivers/staging/media/tegra-video/vip.h b/drivers/media/platform/nvidia/tegra-video/vip.h
similarity index 100%
rename from drivers/staging/media/tegra-video/vip.h
rename to drivers/media/platform/nvidia/tegra-video/vip.h
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 644aefdb9d41e..8a5f6dcc49adf 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -34,8 +34,6 @@ source "drivers/staging/media/meson/vdec/Kconfig"
 
 source "drivers/staging/media/sunxi/Kconfig"
 
-source "drivers/staging/media/tegra-video/Kconfig"
-
 menuconfig STAGING_MEDIA_DEPRECATED
 	bool "Media staging drivers (DEPRECATED)"
 	default n
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 584720e91327c..b8d874766371e 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -3,7 +3,6 @@ obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
-obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_VIDEO_INTEL_IPU7)	+= ipu7/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
-- 
2.53.0

