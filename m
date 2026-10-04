Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81242393DF5
	for <linux-tegra@vger.kernel.org>; Sun,  4 Oct 2026 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131492; cv=none; b=tVv8msm0d62X8b34jBzesKxtx1qa7qHLLfYl3laSrMzlcc3H74s6Y6ilmy1K5V31uzzcNT79nTWlfJ+3yg2Cq0P69fiNWD8QypctHrotktYX/fFOSLEf6D8QASOxUUEYC6mLDf65c28NL7j9rI6D5vC6nK4OMGt71RTXax7WhS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131492; c=relaxed/simple;
	bh=S+ZkZYvED8iboTlDX+3mawlJCZBnQtlH4XISGdo7vmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oq6/kRi8u66DwmWQzVsK037Z9/5im/Repyznp3G4kmJvBN6b1my8prA3qHM7UdLoLm5/oOgkkv03oo+viR6WcnPtL50in0VmwposBFbzhNx6VgQSJg9R1QD/aa3frM41bZ6yo5pDvKr97qPMNExaPf0zr2HuhM7dxQkm8DBEcwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUpWh5KR; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUpWh5KR"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso9515945e9.3
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2026 09:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791131488; x=1791736288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4K1u7HAUlwlZgokElVxrzMuDxi7Yuc8MTskvjYgWwtc=;
        b=BUpWh5KRnnLrs0vhMfH5RHpOI9OxWGYB11a2EPNvReWEcmS0bWeTV5Gug0YociNeY2
         bXrnGtNVMaqxfzyP4BEKc7gL8iJiHg5G65WkeEcuj7GlYxBPoAOn1Li7aUUEb7v+izdt
         4VXTRjpSQAWVFyTdPGRHaewQSlbD+7fyA5mF2lkSBYnfAGeRvCWbyYA3Eth2+zqjlRm+
         n9yX4EeoroTF+Hu1nwuBMSBUXsNZa4uSPCXk1wurT11lNAkjAg+7JZF/MzwJymKdXAmW
         v8TEg3C22isYZrWiSpJjDrb9RO9m72Z91kLR0BiU3x0OHX1MhgKBuH5Ge9/qiuk+LhEl
         udWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791131488; x=1791736288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4K1u7HAUlwlZgokElVxrzMuDxi7Yuc8MTskvjYgWwtc=;
        b=T3f6tBroyGUz6q5tnzryCxWM3ATRp+j9ovosBmlcApJej6zV2wB+Id1sNXv++/g9ml
         eflwdqSYECRHTAkuJiMp2/brLncv5L8u6b2lZ4A0jXnwlaHPnJZ75DZrNhV1jcVobfgK
         lW+EiqcbRUaQkpUp2aBnzGuKWu8G7iLGoLKppZb0l2ePc0TmZnLm2/5CJTzjOMxv6zd7
         wsTSlfWYLlBF3FpT0zLIDc94j7jY++0d3L/VjnHASvafP/i937cFIXuvHw9E1TCQwxJ8
         8kEyhbdCwcBxg9VMS4Zfp3R/nA/HiMpsKYpx2orv2OCQDXpY5qN1hVRFWiQqkXBzzpMP
         y+EA==
X-Forwarded-Encrypted: i=1; AKwUvByOUbAUML6GT5C439/KVwToXPnnzWTy906ZKLCtclfXDcKX+PHQYahchEAo3+zi5RVfuva6eVlLe6KEIQ==@vger.kernel.org
X-Gm-Message-State: AFuF++knnwpbjEvc7+dC8uaH1WPFHI04fVvMpTy61GdegqnZbkzID7qW
	d08qQU5+l5fKeqadFdvLVjzxSpYTXmM8XqvoprGwx/lhZ2f8aSDGPAEJ
X-Gm-Gg: AYBFou0uxo5w5ELxVxIVsFbRBxaczetrXAKG1YueuVsWlP2LesWtHzvvcLC45nn3VuS
	OQ3NSdv3MjMD0xPSwkaPh8NFWfbNu9rMvaEiIQ2zjuxxFAmBkV9wuMMijsrDly0YMssSH0MUe7W
	bz+KCxF/2ysTkjHplDuxtexQQ6Xy3OCll3f5NQePBix6gorFft14NoVQuIGJkPT7GKAFfALAkBs
	Nek+nrR90/F+wo5VJyjeHiwCL+JpcZI+gcGKBM0agMjWUCloXGwsulodfpd2b2wYLF662fqgtHk
	e6I+TVMMiqcEz6tXMk6CakBkcN4Z2LZvC1aN8/CVw5kxA0N67UI91N8M8UsCF/ITH97lIC71dXa
	XaL5QASR3tephAyY7nKcuBp7SJVP+gHy0wMlmkukDOqptQMTmYC6R/1OjIj8CNLJMaz8s92GOKT
	j3CvRCj8PMRqw2h+Hph49lmbJEltQXG0pCYozW+CwkK9CgwcsZfJJKNh2PdLAImDAbFohUVsduZ
	0MUzy99nAHOsAVRNO4=
X-Received: by 2002:a05:600c:a011:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-4a0275107e2mr140690815e9.1.1791131487995;
        Sun, 04 Oct 2026 09:31:27 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm315365035e9.1.2026.10.04.09.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:31:27 -0700 (PDT)
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
Subject: [PATCH v2 0/7] drm/tegra: Add support for Tegra20/Tegra30 8-bit CPU interface
Date: Sun,  4 Oct 2026 19:31:07 +0300
Message-ID: <20261004163114.181800-1-clamor95@gmail.com>
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

---
Changes in v2:
- convert enums in the dc header into definitions list
- add check in RGB if bridge_state is not NULL, if yes, use default flags
- inverted FLAG_PIXDATA_SAMPLE flag setup logic since default value is set to
  be on NEGEDGE while v1 set default to be on POSEDGE
- 8bit-cpu schema renamed to dbi, removed compaible and set as DC child
- expanded list of required properties
- 8bit-cpu bridge remodelled into dbi interface as DC child
- improve gpio handling
- rework attach to get drvdata from parent
- add panel supplies description
- split panel driver into per-panel drivers
- get DBI interface from the patent directly

I have deliberately left GPIO parsing from device tree since it seems to
be the most convenient and mainstream method of working with GPIOs.
---

Svyatoslav Ryhel (7):
  drm/tegra: dc: Expand available registers layouts
  drm/tegra: rgb: Parameterize configuration based on bus flags
  dt-bindings: display: tegra: Document 8-bit CPU parallel interface
  drm/tegra: Add support for 8-bit CPU interface
  dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG
    LH400WV3 panels
  drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
  drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver

 .../display/panel/hit,tx10d07vm0baa.yaml      |  58 +++
 .../display/tegra/nvidia,tegra-dbi.yaml       | 143 ++++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |   3 +
 drivers/gpu/drm/panel/Kconfig                 |  27 ++
 drivers/gpu/drm/panel/Makefile                |   2 +
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 297 +++++++++++++
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c     | 236 ++++++++++
 drivers/gpu/drm/tegra/Kconfig                 |   7 +
 drivers/gpu/drm/tegra/Makefile                |   1 +
 drivers/gpu/drm/tegra/dbi.c                   | 416 ++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c                    |  24 +-
 drivers/gpu/drm/tegra/dc.h                    |  50 ++-
 drivers/gpu/drm/tegra/rgb.c                   |  41 +-
 13 files changed, 1293 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
 create mode 100644 drivers/gpu/drm/panel/panel-lg-lh400wv3.c
 create mode 100644 drivers/gpu/drm/tegra/dbi.c

-- 
2.53.0

