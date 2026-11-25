Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604903;
	b=Pk2FrQym5yfwHULkZtoveBCsS19fXoeC991xh1ELZ+XJoWkq8X839iOPUtbhQp4hjmOG
	 cKZIcQQyvJQKS0NYWKlD49vgTWu0mKwADBCQbccu/fr42dlosTv1aEF/UJqgD7om8JGdR
	 0j38v1sbDooPW5Z6fYre8hF8zyuhDyU881hXBsRdl5yMUH0cJJNaDyvQDKr3kf/4Jon/a
	 NOEj5jdsLKaJ2trh0o3Vh7c8MJHZDGbBjX5QQrPaYvmrEtpg9s2STuLptXQZwPg5lJj7h
	 xpNyRSCMvwCzJH60o+5T2FVJ63giXnf150I5LFU24Hpz9I5zule7dVEGJ7s717Hsukg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pi1j4jPx9Xx7Gn8t2YcyKoLu1ip2xWWQfZpWKlKgfuA=;
	b=2/PUftZaPCeNAkAVNYui7BSPWmvYQ5HLnZiW3pKVMpjLSUMDOysmWi/WjEDKghIXdZSr
	 0H2Pm96SBjRg5mXlOE02zCcFVRujJje61a4UYOfHabXa4WnqFz6p4/r7mfnu7UCN5EpOU
	 tQyx51UHMHDyrASuBA9d+HlAMILmlkv5LXeamohbOtOSy1CajzUesDUsayNQ0Z5BTNdjr
	 XIlcNnmIiEFyupfMki5KD1YQZ2098kAx7ZN+UAjcyKJngihdVVcaN210OjUo4P9B1lekq
	 RUIMPdyo0PvOUFFEhCWTuQu5idzB0FPrDlgAATBljX3ZnLW8VD7r131Rlt57gOzofQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HNIiFnr4;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A2C606A33C
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 11:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A2C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HNIiFnr4
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50a4a2132cso824218966b.3
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 03:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604901; x=1796209701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pi1j4jPx9Xx7Gn8t2YcyKoLu1ip2xWWQfZpWKlKgfuA=;
        b=HNIiFnr4kYWvvinIi9eS5v1a7s4KzYoP84dZpIw/UT2N0xiLw5WC+TyHY82kEEtvFx
         l1cB9biakx/lkaaaVKgEibMrcDy01bjkHnJAqe2zBzZ9rJTkGBDLNTsCQ0KRiYNxJQ6p
         385JO+Oz6qiFIb7Z9OBuZjzPr7YRvDcED7d0YB8B87Qwk8wHfVRECUHDj6BJqh8gx6od
         KmOIcIwZZjzWwDGxfQhzewlNmvIHMP21m2SzDLm8iimepReIMkWNl/SV/XmfDHACV6y3
         pMcrmaIOPKMws4NeIWg+hDImK+vRhEuDRrVDCoJdZqsfTs98sf+lFdITLE+DnjeCaOmC
         TPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604901; x=1796209701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pi1j4jPx9Xx7Gn8t2YcyKoLu1ip2xWWQfZpWKlKgfuA=;
        b=KCnakStI5302dGyh/wHjcYPVcZp8PXBbDYDEaDDRqO8t3Rh9ux3IseMdt8/Ebfo3Vk
         6PqUusfNEv24J3vAJ5lrVRpXWyNOYKPiG+xk3jzP37Xv4N1Yk344HiVMX6iCpVAcqvoY
         PDcXQLJv3BVE1w+IEkSWA2dhkwQDWjxiwc0kBjekt83YZddYJLj8+vinfTIgmutvKDam
         e/MsowQ8QkWBqp41f5/gFN2uOYIwLRyo0CnGHjTIFbLfaROyYCAzVhHOmFtB5/tkGCzq
         dd0f1ez57sHY6JCQRKtzAbQYgos45ouwUokCUHAims6lgGaghTpMoq1i+1fL2Bd5jC0H
         E+pQ==
X-Forwarded-Encrypted: i=1; AL+hErEnG4d+NnYcaEFAkzFEX1eoWQ5eSVCb0pNncZyn+bbW548dmfXq2OyFREjjkP0FFVMG72kmEddB5uSCGQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9C0VHCBvDiqw/6n8DbHPwGfYusf6iOxL+2Di4cKK1W8q1Pu8G3
	3xZRpHxCMRyN6ipepEoruZJRqsl9Qp9/sCrAGnAvOXve+lKLJy11BJj0
X-Gm-Gg: AZFdTZfGHwxwn8pfOE276QGkwau2+NlD8JAP2P2Xj33bKsqZyRqSFB+ApjfHJT/TZyK
	sCmBIcpOGMSKP715CRUrV/c2Yu4WZBwoKibEhAMeDfovGKgWsLrdYy7sZg1sdn91aOA+ssJGB9k
	He26Lx25o06zKMyuBh2pEDYIiCry9DgX76LWK4u4q4lJEM+zCkx6OuaiFK+5guVEeP1gDTdMypz
	axWU4nxlhIZEbUo2ZbFJkPdyGWI6EHPXbqr1O7tW+qIDh16QyWVAyzIv9EDrMXCWwCC70QnaS0E
	JF1Bxtt5EOo8bFBQl9SGy5kxReJqMF17coldffg+znHiZ/M8VDGuO5BchXDN7qRtTwSqh2SschP
	JHi/YAGveWjp4Axff9gIQjfkDh+LqxPeeNF+Mb4QIaqY59E4dWhJVQe9lzkyTfJ5zqe+i7bAwK5
	2RlnuTRce23ho1aQgnXIqPhnOTwSkhGXsaPXbTK4Suq5RLgonlONPvAZzZ9x9A3n7YtugUeQ9Ly
	bBwJBuQE1Y8ioFfAHJt9Tk8X6ikt+0Cb8wK64/SA/JsBSxZCP3eOLs8kwVu4gqqls430WuU623U
	9UmUXbe1Vjv2eJMbW0mT03QNqYjYQ5Dpm/d/WoKri2tMtXi4wpDInZlO8qBykoQlCVPlKO+MoZ2
	wz6cpO2eltQ==
X-Received: by 2002:a17:907:3f05:b0:c41:e0c0:e6b7 with SMTP id a640c23a62f3a-c513a99a69cmr1283264866b.12.1795604901175;
        Wed, 25 Nov 2026 03:08:21 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:20 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 01/13] staging: media: tegra-video: Move driver to media/platform/nvidia
Date: Wed, 25 Nov 2026 13:07:38 +0200
Message-ID: <20261125110750.223628-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125110750.223628-1-clamor95@gmail.com>
References: <20261125110750.223628-1-clamor95@gmail.com>
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
from staging into the media subsystem. TODO file removed. Path in
MAINTAINERS updated. No other functional changes are introduced.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 MAINTAINERS                                                  | 2 +-
 drivers/media/platform/nvidia/Kconfig                        | 2 ++
 drivers/media/platform/nvidia/Makefile                       | 1 +
 .../media => media/platform/nvidia}/tegra-video/Kconfig      | 0
 .../media => media/platform/nvidia}/tegra-video/Makefile     | 0
 .../media => media/platform/nvidia}/tegra-video/csi.c        | 0
 .../media => media/platform/nvidia}/tegra-video/csi.h        | 0
 .../media => media/platform/nvidia}/tegra-video/tegra20.c    | 0
 .../media => media/platform/nvidia}/tegra-video/tegra210.c   | 0
 .../media => media/platform/nvidia}/tegra-video/vi.c         | 0
 .../media => media/platform/nvidia}/tegra-video/vi.h         | 0
 .../media => media/platform/nvidia}/tegra-video/video.c      | 0
 .../media => media/platform/nvidia}/tegra-video/video.h      | 0
 .../media => media/platform/nvidia}/tegra-video/vip.c        | 0
 .../media => media/platform/nvidia}/tegra-video/vip.h        | 0
 drivers/staging/media/Kconfig                                | 2 --
 drivers/staging/media/Makefile                               | 1 -
 drivers/staging/media/tegra-video/TODO                       | 5 -----
 18 files changed, 4 insertions(+), 9 deletions(-)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Kconfig (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Makefile (100%)
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
 delete mode 100644 drivers/staging/media/tegra-video/TODO

diff --git a/MAINTAINERS b/MAINTAINERS
index c00d3612c9acf..3f391f0b61391 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27903,7 +27903,7 @@ F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
-F:	drivers/staging/media/tegra-video/
+F:	drivers/media/platform/nvidia/tegra-video/
 
 TEGRA XUSB PADCTL DRIVER
 M:	JC Kuo <jckuo@nvidia.com>
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
diff --git a/drivers/staging/media/tegra-video/TODO b/drivers/staging/media/tegra-video/TODO
deleted file mode 100644
index c821081668942..0000000000000
--- a/drivers/staging/media/tegra-video/TODO
+++ /dev/null
@@ -1,5 +0,0 @@
-TODO list
-* Add support for Ganged mode.
-* Add RAW10 packed video format support to Tegra210 video formats.
-* Add support for suspend and resume.
-* Make sure v4l2-compliance tests pass with all of the above implementations.
-- 
2.53.0

