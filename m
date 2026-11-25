Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604901;
	b=krCi//NiW3vupvq/x88+52+7O1r+B0P3oIo43Zi6H8u8d5jdVK8wyHAsUhk7jVJ1EsiX
	 fgRrYZyYb4dPD8l4lE7fdFcHDE20FkieHJTepFXmpPn6cK1ykXls1+cFbawP6Ob6G4TFG
	 9cCrVyP4HIZ+wOhNVQqRTdtJTtH+iEv1HfPWgvz+EW/x3JDEfxxqcxR3bjfKyMt6qd1bX
	 lkGd3+04Ly8LdLPZulW+3ZCVDiXGobUvcISLirQ8/ErOy4KkNfxj+kAsfV75oTx24S5tG
	 UIG98mggISz9bdqIUhPmFbvcUnU1qBwUJ395YccpJAFXtccXG6sk2fcE5YrIhtxZM1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vim7sbndF1zYQuJCjFH9ennVNq+IgaxKfDCkwcZwj84=;
	b=19byRSsK12qmnw2EjZSXom/Bsb+uFWaESYLQtWazEzzdooql00VYOLNILMsGlnNDzIoc
	 R+pN5LSDyFCKUTVC7pfHwR0mgQUvUlPt9KvZJ3vNrqYgLkMwCDIV9CXWA1GbIfNfI35TE
	 KNJ48p77bWhz5QhWmyQbZnbSmz2XR32MkvoQQ6io/Rn0zHfW9dma3CI9uqmcuExwTlXiU
	 Iqw1f5/WP39Fy1f/epdnbPDw85RXOv1S/xXfutjb5rHbN9c9N/sVGkotUDMnk5e6iN4jG
	 g7OEDNAHM2rWjEuzxzCbeKi5fNq8AW4ixiwoNXtgZ1YoYhio7FnVdhFjhj2O8oExpzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFYeXBci;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D692606A323
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 11:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D692606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFYeXBci
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d21051042so52980366b.0
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 03:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604900; x=1796209700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vim7sbndF1zYQuJCjFH9ennVNq+IgaxKfDCkwcZwj84=;
        b=wFYeXBcidB6bUPa0ITenvDyBv8wZDaQpp3EpsIXZkTsArAmVChIcxDvhUnBiCCb+/t
         WeSNE2euEeWKnRuUgkFsRIVv0m8LgqAU3Sgf0JhoVqwC8MM0GyF4WPGToccLYGXCTMnR
         FlhpL2nxRtspw50yKDr8EaLMru20w3BcngHhuD6GM4ftL16diaksn72/nZFPDjnbbxqm
         fxL1lQpzHwe6f0Dk+Ub7dRZCD6aiVopqowh+UdXP5dfxzHeSaVurBDZo1Nxsd+cCyISq
         1DUzMBxwOy779Q4vp3qKWS/Qfr4+pKSvDxFORflGFZNUQD8SpqEuboUqHSCMS7Dlq4Dc
         r9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604900; x=1796209700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vim7sbndF1zYQuJCjFH9ennVNq+IgaxKfDCkwcZwj84=;
        b=DWWUVQV5CtBS6RZ8ZRYMXozK7qM1sRHtSkds1ItrAYKsMDbV25Ohd0UuFhqZ73s/Tw
         +QhSZn4yUzKcIEelnNdtZfaHI6wAFoYzw+Twg71bAT7Bmf/tX0Gg1dnq+LZ+DEzJbxNe
         LKo42jZpNAJfHhHiqX6Wo8fc9oZNuHLwhxkiaN0i4w/KjT11Ix+HvVy+EFvqMVyr2o/+
         GsqL1ef5SwfXNti3rTKiF8zhX4R6ifzN4BRVgEnuw4vCCXkDAagySGR/qVUCCIJ7sAmr
         LEYdR2iB5gjIvlmEDEIf7IAw3093EYa5K0XDq0wyod/+Qa53yzMbsBMp1HNzy3ja0pcF
         YhEQ==
X-Forwarded-Encrypted: i=1; AL+hErG2kTDbthnJzw41y8yFoD/3xJFZTXkx0xdpPnhGLZHUuMlcclok7E0il+b9ppAbc62/PVqVsiazkA82Uw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/8r6DTWnJYT7C6kTm701xvlWurDEwRP/ciZo3gtxSBaYBDHMEU
	HpoVvIj42TdvXD7gBruvOWSL8NXIRW9D4g+xJE9Q3N4bTwqYq2OVtKPl
X-Gm-Gg: AZFdTZd3+cN/G59UnsIWBZzzEhYqsigrZtvfazYLW3lFOLISE68kDrvciidQX4tY//U
	/eKjUXjGlj2d27UFBIFZIjZZ7V+dH10MS0R6+dgrXEvgY9P9+Sl3f1twFA2sl0QnjCHuFPszbwE
	F96IbU/qN3NqUDYQ8/jlJfSsVad+akY4lSWiCCYtGakbQbSYNT+VZpccThctSZZ1DxF8FKsse7b
	WSQAUU0AaJORxMPgq660aqlG+rneS9LkcUp7Gnq+oUC75qhAlb+pCYGPsC3Pttv8YvAKnuVBpZr
	p3zpUO0O605XcygFoEPmN14Hxp6RnKBV9mCNN3pcJLXgjF/TtG4gRF3KyvSV88LZ3BGwfe70K4Y
	0KcIo+N/dIi7eL9lmV/tBLd8r4tP4Co+yaa2e6NISUMZetdO+FXryTmFDXBRhapM3Cnt8fEtrCy
	MUuaizGSKPxGtgsp8UipgU0KMRrAnPbZ5/ECmFJmbYUIfOlLWbo3kHWlnBeG1HrMQWhAic7DqgI
	MutgDFsTwUiWs3KywVtg0AHqj4xHYmpqlTWc2wXg7bwFys35qMe9nluP0KcjLXmDPPCmnIM46lR
	Zx+eBOogKZWhh6dRF52PUKoUYwTlXei1t4yCyIW3sEVB41x9xvqYJCkYv+xEtfAJQ1vzDhkxpUO
	hfWwE4aApfQ==
X-Received: by 2002:a17:907:1c9c:b0:c49:df95:fd0 with SMTP id a640c23a62f3a-c519ac70721mr350640166b.48.1795604899681;
        Wed, 25 Nov 2026 03:08:19 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:18 -0800 (PST)
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
Subject: [PATCH v1 00/13] tegra-video: Convert to media-centric pipe
Date: Wed, 25 Nov 2026 13:07:37 +0200
Message-ID: <20261125110750.223628-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A minimal set of changes required to convert video-centric pipe into
media-centric. I know that moving to /media should be last commit,
but it may be beneficial to keep this history in the /media subsystem,
instead of leaving it in staging.

All changes were tested on:

LG Optimus Vu (P895) Tegra30 device:
 - MT9M114 front sensor with complex topology and irregular pad mapping
 - IMX111 rear sensor which has simple pixel array and a single pad

ASUS Transformer TF701T Tegra114 device:
 - same MT9M114 front sensor
 - OV5693 rear sensor which has simple pixel array and a single pad

Nvidia Tegra Note 7 (P1988) Tegra114 device:
 - OV5693 rear sensor

They all work and produce images.

Svyatoslav Ryhel (13):
  staging: media: tegra-video: Move driver to media/platform/nvidia
  media: tegra-video: vi: Drop controls consolidation into VI device
  media: tegra-video: vi: Expose all sub-devices in the pipeline
  media: tegra-video: vi: Drop subdevice passthrough and input ioctls
  media: tegra-video: vi: Implement link_validate for video entity
  media: tegra-video: vi: Populate stepwise frame sizes via vi_fmt_align
  media: tegra-video: vi: Report stepwise frame sizes instead of
    querying subdev
  media: tegra-video: vi: Enumerate supported formats instead of
    building bitmap of compatible formats
  media: tegra-video: vi: Configure capture format locally without
    subdev calls
  media: tegra-video: Remove remote source subdev helper
  media: tegra-video: csi: Scope pad and state ops to TPG mode
  media: tegra-video: csi: Add pad and media operations for own CSI
    channels
  media: tegra-video: vip: Add pad and media operations for VIP subdev

 MAINTAINERS                                   |   2 +-
 drivers/media/platform/nvidia/Kconfig         |   2 +
 drivers/media/platform/nvidia/Makefile        |   1 +
 .../platform/nvidia}/tegra-video/Kconfig      |   0
 .../platform/nvidia}/tegra-video/Makefile     |   0
 .../platform/nvidia}/tegra-video/csi.c        | 298 ++++++--
 .../platform/nvidia}/tegra-video/csi.h        |   0
 .../platform/nvidia}/tegra-video/tegra20.c    |  18 +-
 .../platform/nvidia}/tegra-video/tegra210.c   |  18 +-
 .../platform/nvidia}/tegra-video/vi.c         | 643 ++----------------
 .../platform/nvidia}/tegra-video/vi.h         |  19 +-
 .../platform/nvidia}/tegra-video/video.c      |   0
 .../platform/nvidia}/tegra-video/video.h      |   0
 .../platform/nvidia}/tegra-video/vip.c        | 102 ++-
 .../platform/nvidia}/tegra-video/vip.h        |   0
 drivers/staging/media/Kconfig                 |   2 -
 drivers/staging/media/Makefile                |   1 -
 drivers/staging/media/tegra-video/TODO        |   5 -
 18 files changed, 433 insertions(+), 678 deletions(-)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Kconfig (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Makefile (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.c (75%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra20.c (99%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra210.c (98%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.c (68%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.h (95%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.c (71%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.h (100%)
 delete mode 100644 drivers/staging/media/tegra-video/TODO

-- 
2.53.0

