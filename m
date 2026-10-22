Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675401;
	b=LmIWG8vv0aLgRkFJjoXq6ANoAD3wP4XAm6RtXoNZ3gloBmkqcHOONP9aQQEago4zZCqc
	 rETTeguwgo3W34ctTMLlC6fm05OuirgM77TJKlZJRCGRsAaSkVbSsSA8M0E3lzcs3hTqH
	 hr/NMFHtzk+owMBWHzbo7AHVPmrLNt6e4VcMM/QYtTn8fXKDeCK/HQnYuyIeRJd8Staif
	 /efHAvcOiD01Fhj5YcX7WbkTb0Ljtw4e77T5+N3TCj1I/Mbh7dLXhSdcN5DKeDESDNyqx
	 3aJ+qtKSipWcyGG5HCbYdhMCjyi/yajWZgfIM+jSmfTyXeFFRkq7TJ4gfvKRV9pFX9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5ZnaBjVx8QabD0XIo1C2JwLGY8gbe6s95hFqcHQRQqE=;
	b=nViHg6180e8u8BP6qbE/tkRHXGsb8XvsxI2Q7PDwlX7Wotw4eUvWntA80JGLFcjwV3vT
	 PKP4PFDOjjCiRw4n8hVRFzd2nm+u97Xe6+lqTpY/RrIZ7wVDBBlOFJHNYkiCzZqYd2BLG
	 7oTN6JSFPWJgZA4+V+jkcvGtH21naHcfZz+4rTp2g2aPmnynj+KO0PqfRXcLJtkj1RlHd
	 L4uFG5Y4JFt4cYEUYBGrxLLN4l9KK+mupnMnbLaiLlNNp5wAhFOg0rzdvuErSXjmDfs7t
	 HyB2ho4BjuOrQqnXB6HKr1ewD/aTGY9vvt8uqKXaVOvjxWae3JNUFkOnK1LNoRYSbTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M8MI6MLW;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDB5606A31B
	for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 13:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCDB5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M8MI6MLW
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so2718524a12.2
        for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 06:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675399; x=1793280199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ZnaBjVx8QabD0XIo1C2JwLGY8gbe6s95hFqcHQRQqE=;
        b=M8MI6MLW/oqIYL7bAbSl5TvQribAzSirRqMJR1M+Mch23Vc0bcfaRA3Capnqy/K0MV
         oKeCoZR596AEAu8eVuWT0D6chDRJE53qezuNk+XD595jMmO9FAVQHGt/gveJno5J3NZe
         YwnfLv2VL75uDvzSA6GJwvmZ54DM3zhHj+0sMInHkrKTDAjv45qE95lEPhJkWXqVQTR9
         AN1tg1Ni6uB+yipZ66cqVWmSv5UOKWFr4tDOY0xy53WW+qDtM4svaONQgdmlZ5ec4gsk
         Tbg5SSdwoFGx50OYCvmv3NKQarwzCJ6ccdQvAi8iOaGMwmvEp2M2XmNMeYipn63Fg6Su
         nhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675399; x=1793280199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZnaBjVx8QabD0XIo1C2JwLGY8gbe6s95hFqcHQRQqE=;
        b=LIIHbJRDxMNbguKaHBAJS2KU2sopxGmuapT3IdOp/oFiDr4oL9gwrSnnLfoJbsER4g
         d3ep1rUA+Ud+vFiSnNiNmmyCJEFN4OvWg4vzVa78oqx9V1+5SXPooK1On0RE0l+UI2Ta
         pXRIyAF7SHpPV1aCLJYC2qqU6FRSbBmKrSoyhN6yCd6r9coSKWp1VWAfMY9Y/0fsaX7R
         8Kgg5LUxyS1yPR5u6pD8S29/ZyGK+xq5lqtc9vPjwK9+7j/3RWlalkrkWe1uKoGCw1Mn
         PsCJe2+qoHJWT8Vxkot9rPkXThN4MrYurldrxtd43mZ6gYMkXAw/zoQK8F1aSfzn2DOf
         PUAA==
X-Forwarded-Encrypted: i=1; AKwUvBzSfv7RJ8JPIN87UethGuIvl6A7291hLR6IMh95bD4GLRt63I19gB/7kSwKH+6e5+7ZBHenHYBvof5M/A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLx3ikCCqKmH/pyYpEEcE3LLg6IgkOJRNw7Z8/duM1k3fCW2pG7
	F7zVenrK/T6HajwCQSRi67m2lEA4Er1ROKfrd2EvgezT+wlwxOZtUFLS
X-Gm-Gg: AYBFou29gtthDBWsqwe2OcAfYlyXwTq5Z+iWxkLSi5lTMKyhsbKkFhrOGtwu39SiLtZ
	TZP+snL6DjG8HTc8PItWNOTF1jTO/xKL3gQ4qhKIgg+Ea6seZ24dIyhwaJs0Y6upYs4AhcoS+5Y
	aG7vDcDeQau64ieqYERBpo4fa2aXJ8aoRGWyerb9aT/WW5s5sacKIbB3nSGUZlWzyx11qke5g+K
	iJMsCcQzpndKULpF6vIQYD18f9NFDOLCJ72kyurpICi/8q4N4heVp5aOO0FXkbscCdQ+N7aFHx8
	HizlrBOsK3Es6btm/z4euxBM9hAVAC7A6EvZKvx+zWCXRUsJV9awJLd5XsW3vcF1a+7Uy5z+Vrf
	M08S8InnjvoicFQidBInPXpculqnxvByYHjAQgG6rON/emgC8l0v3veIFdC1qITFUs02EUDm7hE
	n6GGD1lQRzD8S2JnKiBlKFgO91n23/5yxZEiFYeSRQITr+wG885FV6te6zR5F9UbvpPiouJf0Vo
	zjA+wEYNxs363Bz32jZo42bF3Gwe8YWCzhwuVN+496QaGzBTZweBB6d6doL7XVpUn+jAcWZ0dia
X-Received: by 2002:a05:6402:64f:b0:6b4:2aa6:2c07 with SMTP id 4fb4d7f45d1cf-6b42aa631d2mr825748a12.14.1792675398767;
        Thu, 22 Oct 2026 06:23:18 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm1818061a12.27.2026.10.22.06.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:23:17 -0700 (PDT)
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
Subject: [PATCH v4 0/7] drm/tegra: Add support for Tegra20/Tegra30 8-bit CPU interface
Date: Thu, 22 Oct 2026 16:22:52 +0300
Message-ID: <20261022132259.240717-1-clamor95@gmail.com>
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


Changes in v3:
- rgb: fix default bus_flags to match original behavior
- dbi-schema: remove compatible from required props
  remove dc@54200000 wrapper from example
  restrict dbi nodes for tegra20/tegra30 only
- dbi: remove unused idx from tegra_dbi_priv
  wrap dbi registration in dc with devm_add_action_or_reset()
  separate dbi into separate object
  export tegra_dc_commit() and trace_dc_readl()/dc_readl()

Changes in v4:
- reorder patches to avoid errors on checking dbi schema
- dbi schema renamed to nvidia,tegra20-dbi for consistency
- fix DC_DISP_V_PULSE0_POSITION_* > DC_DISP_V_PULSE1_POSITION_*
- add MODULE_ALIAS
- swap width and height in panels
- dropped use of init-sequence and gpios
- dbi driver reworked to use only DC to operate pins
---

Svyatoslav Ryhel (7):
  dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG
    LH400WV3 panels
  drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
  drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver
  drm/tegra: dc: Expand available registers layouts
  drm/tegra: rgb: Parameterize configuration based on bus flags
  dt-bindings: display: tegra: Document 8-bit CPU parallel interface
  drm/tegra: Add support for 8-bit CPU interface

 .../display/panel/hit,tx10d07vm0baa.yaml      |  58 ++
 .../display/tegra/nvidia,tegra20-dbi.yaml     | 108 ++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  15 +
 drivers/gpu/drm/panel/Kconfig                 |  27 +
 drivers/gpu/drm/panel/Makefile                |   2 +
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 297 ++++++++++
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c     | 236 ++++++++
 drivers/gpu/drm/tegra/Kconfig                 |   7 +
 drivers/gpu/drm/tegra/Makefile                |   3 +
 drivers/gpu/drm/tegra/dbi.c                   | 536 ++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c                    |  32 +-
 drivers/gpu/drm/tegra/dc.h                    |  50 +-
 drivers/gpu/drm/tegra/rgb.c                   |  41 +-
 drivers/gpu/drm/tegra/trace.c                 |   3 +
 14 files changed, 1403 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
 create mode 100644 drivers/gpu/drm/panel/panel-lg-lh400wv3.c
 create mode 100644 drivers/gpu/drm/tegra/dbi.c

-- 
2.53.0

