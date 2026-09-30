Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CF743BDC1
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 07:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751961; cv=none; b=aHfHau7ufoj+z6oI1q+rV5154mQhV0YEgGXtdYhov/9BuMi3l1cSGrhhxKgGKqYxerSKqAoeJC+V+ml30WLvcb4PddboqQTfyydXWK3F/6bLhl8vGRnE5+mvxyaEkxfd03jW+KKvY/KCoQl1fAA599VORVKss6zAIrGyYv+W3+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751961; c=relaxed/simple;
	bh=KquUcj0yy4UIql827S1Ctd9+3+E8Q4jB78n9fzRwyIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GXPG18VEK2jV0ZCb7GhpBaLpNM9FQ8261TihIMcin5W5HnQ+Abs2z09QmNV1FrvvZr3XoZk830sMa4tyTkYBid1835XC0xNoF2Tb4FRpuNtVAJffJz7L23+H3cn2kw9KX1XBAd2wWA//GUCiHv2YYpvMDjMtaqW5e8uOumxm4Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gjnuwc9k; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gjnuwc9k"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48affb828f1so410512f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 00:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751955; x=1791356755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4ypwwp7JTLk+2ivLn91M7UclGnNz67wo1x4IhoVtME=;
        b=Gjnuwc9kXtf/kiuWt9LCw/1FDvCecw4TDAoezRE37g/PQpCobTIkFPWG75+1KMbvzL
         HX+VJPz8Bfoa5m9KgIWXOYXH1xyJn4/fd/yL0F9k9B9k49PBA7D10W6AaA/tLq0V1PeI
         ePYGQOxzqdfBvpHQESGmJ+g0uaCFEKIVi2drka+O+btoEpE0XpC8jlElNDqGLrBYPhLx
         +Mz8qQe3ituF1BvZ2S3D2gsQcdoOPL/6XM4FVQgu7oC04BeJR5Y8gJo1y52EY0rZH6kk
         53H1uBTzH5Yp7vIMIlwaicRyXgvV8alFh1/pzn3xos3jvkoMYZsFxwh9W+gw3FHh5JQW
         ffuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751955; x=1791356755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4ypwwp7JTLk+2ivLn91M7UclGnNz67wo1x4IhoVtME=;
        b=irAWidmC2+rfd/R1fIBQHPwhnblKx+6NqlrbzjmwhHz56eDzPz4Bu9qpeqCnVoWYTF
         2WBCVCX2oQno99n4lTtNH+tQCRKPw6xqEQncxolijIm0ZaILTbY44O/Ymea3jYftQaug
         smQmcnGTm0R/aFa73FtxuUyqpu+4Dk5BNSxtI1M6Ysl9J5hww9j4VW0+Rv0Ql2YK8rXl
         y+l14xM6II8q9jbPbvptFyAJ0Ep6cVHye52ICi4rWFa/VU0h2qPzq15wEdEtBZ7RWRcN
         bWr+l/Ny2b8XrthAuIJce8+pW7msqmOMiT914HfCjFPdSnAoiX9A/+dZGydBHh2FDeVa
         aVeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhVutW82eZ87Pr2y089LrJP7QjK1b+XjuigCkPsq/vEI1UzZKNGrtwRS/nifpg53V6xl/9XnfEOJNFpw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK9m75XfXi9NtweiXR7kZLjHQkjOFnkgK5KRtejmKA036TVCVOY
	CHe+3JMFug7jdtgWkbkeYm0zc98oisRdIcdKVTSSRvFVAZ2Gj2Ql9Kct
X-Gm-Gg: AYBFou1VsuFwjXpaOx5NUOTqFc8W2D6qrGQOEhMoq98p2xpkG9a2Zf+hlYO+xw9bGKt
	oSjivI9fmipALVCQrNlscjyVHP3PI5uYiSe10nFbUF9uVSuVNI45Fk2+nUSet/PV9I/nir19ynp
	2VDUwU3ZONvsL13j4e/9VBZfEKocjy0mqk3tx6VUKKnt6XwIlbg3EmAyeG3SfLmWtzd2gNB4xtA
	uW0HF7nl6xYmeRZQEyrafSyYmv8NDHk2DpSz+ztDwTvC9mUU6VqDWAbPJPXOFXso70MmkvHg0pO
	NLGoZ6O4glI9/W7OHOxLj3eorYRPlHJkLcfICDcMXmelNNvzkaf4NTLZcQsphozbsYPVyU1W2uV
	6N30L994F4J3mZVp7b/FYRhKNdZyaP2j6Eqy8LSGSDz5HNVq9HIiBcl8hrvMs1GJjSK8c+NjZRx
	v4QgiKsDAkS1H0B0hXgAuoaQifoPtBcsgVQ7IRvhPIeaRuBrEZUyUNTVyPdYLp5vPgIxXl3/TQr
	/vhliiY9HStd9caGas=
X-Received: by 2002:a05:6000:18a3:b0:488:811c:c78 with SMTP id ffacd0b85a97d-48b024f7a40mr1076050f8f.32.1790751954748;
        Wed, 30 Sep 2026 00:05:54 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f5bcdsm1145150f8f.27.2026.09.30.00.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:05:54 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/6] drm/tegra: Add support for Tegra20/Tegra30 8-bit CPU interface
Date: Wed, 30 Sep 2026 10:05:29 +0300
Message-ID: <20260930070535.47130-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The display controller in Tegra20/30 SoCs features an 8-bit SPI interface
that closely resembles the MIPI DBI Type B protocol and is referred to as
'8-bit CPU'.

Add DC parametrization options needed for fine tuning by bridges.
Add 8-bit CPU interface in form of a bridge linking to RGB port.
Add 2 DBI Type B panels used in LG Optimus 2X which work with
the 8-bit CPU interface.

Svyatoslav Ryhel (6):
  drm/tegra: dc: Expand available registers layouts
  drm/tegra: rgb: Parameterize configuration based on bus flags
  dt-bindings: display: tegra: Document 8-bit CPU parallel interface
  drm/tegra: Add support for 8-bit CPU interface
  dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG
    LH400WV3 panels
  drm/panel: Add Hitachi TX10D07VM0BAA and LG LH400WV3-SD04 MIPI DBI
    panel driver

 .../display/panel/hit,tx10d07vm0baa.yaml      |  55 +++
 .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++
 drivers/gpu/drm/panel/Kconfig                 |  14 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 396 ++++++++++++++++
 drivers/gpu/drm/tegra/Kconfig                 |   7 +
 drivers/gpu/drm/tegra/Makefile                |   1 +
 drivers/gpu/drm/tegra/cpu-bridge.c            | 427 ++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c                    |   3 +-
 drivers/gpu/drm/tegra/dc.h                    |  54 ++-
 drivers/gpu/drm/tegra/rgb.c                   |  36 +-
 11 files changed, 1121 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit-cpu.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
 create mode 100644 drivers/gpu/drm/tegra/cpu-bridge.c

-- 
2.53.0

