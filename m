Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287773;
	b=VpK2xyzuLirKMTbusDVR/DoXtModhoXbCdm/IFjhRc1L1b+4KVZpL3DiUn7UVTM0csuu
	 tB4o42Y8B2qxcUuoqaL+uUo6UDyaYiBk05ay8jZbQ1RlbKkodfwCACDbbQ7VWHAC4odr/
	 15l9P25Zt2hkSm4rypx7JO5/OFoNtdyU90ME6jxl6a3ueGof5915z41KCfQKwio2q1Ftu
	 VEhKnMeiHy4mQrrwnAkERsXUA13YPTCPM6zJPW85yJLCxzhMoHs6+WfNb3ZKHsJRwpwUM
	 K5FAaSXQ36EqHzswqQSL4ae2rJ6AztlctnsvTjbm0c3pnl2H/rK2ZitT+jspuikDcFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Xz/KjQxYIkaGqYRbTjczSZcjaGYHruf6qA2IzRiuJ9c=;
	b=YXT9P7XN4qqxKt7qzPE5c2o/pC8gmhrsE+Z1t9Bj2ydIsR5Xd5F8xfb52wedTj6iSJ3G
	 B7yZCaX/xQTYg3NByVM/JBPwIc4LKqp7HpP55vkTBChUUkT/whYFvgScdY6/iQgL9lHV7
	 bNYMtss8U2WBKpO42stwJGYFmvbfZW+qpKoS7zb6uUit3HzvpTR7grYtjM07ODMjN/yAD
	 CDoIB43nIumje4m7WrZwBL7d5FdQE1Sr/oqzVRy3/bQCswZprfMrIRckm1z43VUR6F5BU
	 oiTFF0CmkrZnqexy/2Do9rpUYXQ9ESffv6D7+Z5AVlquM+deGXdjwOxRcR5+6czWgGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PB09v4er;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F59606A31D
	for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 15:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59F59606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PB09v4er
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c43fbcb4393so363146766b.0
        for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 08:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287772; x=1793892572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xz/KjQxYIkaGqYRbTjczSZcjaGYHruf6qA2IzRiuJ9c=;
        b=PB09v4er9319DUGcwBCws35Y5clXWQvxxyJ316DSeQU0JO1Wm7RuiV9vRNgRNThyF+
         s9w7f4beT2W0HSldAuNBEEzN416IRQNsFHbP3LbWeYz0M/mEIi2IRCGjUWYwxYMxvxKW
         ztw9+frsAAU4baJMoV83eH7pWxcmMdKZYb4t/fhqrFrI7knWpHhigDtQ1fvZrAatyXdD
         WATr83IGprMp5UflmNUjAt/3BRfkzDOyTMwV4aYxx7MMecOC6LW96fXjdVo1OlPMn3wS
         DSMmACwKyJ3yU9YPhlPiF6l5zgbpYAJqQyqKzQthitf11lc/sPF6Pqj0A2d7L/Dl3sPR
         Wk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287772; x=1793892572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xz/KjQxYIkaGqYRbTjczSZcjaGYHruf6qA2IzRiuJ9c=;
        b=dJeEXMTl4UifNYJIYUIpcBWF2aGAldRbYa4mhtyjQyP/aA79AX+DdMN47orJgTWMan
         yqoZbLIgKwcoRFKsgnZYGfzPfiX0ZePwlyXRyukKgbuFVGUfnNLQFwehaoSUQGcXWZgo
         4ezJPlRn1496shvWeUboh9+yuU49S8F+OM2z1Yqy01bRsp9bxXVTKxGrU1gtFz5DvFDl
         oGmj5xAc+AIfmQluyC38/Rua2xUnsVlwFlRXm81kIZh17FxMLSI+PVcINhnMJ/iXI+xA
         M9TgVygfdmcnK3Jk4azGfGmS5zCPgGJIkiNiFBTbKBNVSd3G1+dW3giJM3esWzz6qJyx
         IfKQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9iod45Isq5n0zRstbl4Als6tumc6shKqm4lazbp5gfh3JRDJI+qbGTLmvkop8rBjHuZ88+0KAPLdyog==@vger.kernel.org
X-Gm-Message-State: AFq9FYJzdF/qCi/vm/ODkA7Bv0CWamsAD3GlrL6xIv8HLUDvqjcvyrAF
	wTLGQ56OQQmdRCMsA/7RL6a9/59x5vUg96VhkpRfRwE8AKihjmq0Da8e
X-Gm-Gg: AYBFou2fJxvKvjruFHynU0NixzJSOYKDCS6unklFbS0iMTsYBN/vpP3mkNC8D48fjOh
	2ZciN62+a2TrmOR8KqJQdd0wBJONb/LYCodZ+pl/e++iHpDWoEM9wwbhZdtpbc9ZLaI6GAogohu
	24v/hIo/wdRQwQztOVBvxnGZBQ8e7pB0hneMXOmVp4FblWBEvgr2Z6ZQtE/6rGm4189koQOFDoR
	GILRMR9kBCS72lALYSG7P0khWcmb1ero2H3ahlKPmmiiq7lYpjS0L5H5eu2S0E3N9sr/cw8hTt/
	V7xnk9OQ+7+wL88jHHUWeXYALbyPuQGD9snvYvHQXi1yRznQY6pMccVmecnCdAQFmu8lO/Lfsi+
	Q2nqGLIroHys9NnlxPZRLGJCLhuYKnDh3qAVtcSwap97PkCCIiO0FovYsfabJyUoynGMvc2XjQ+
	rQ7gzwKUk39QsD+8lmOC2XDGF22CIuWwHIoKi1uP86HWK/vKPDmWqHyjKVofN2LLAT/X+rUEqrw
	DdXzeWDeS94ikzeegXUEIrhnJrhssCrTEmIN9pTqVBAlScIZtsTLMA0DL8VUqW+ORIQ0d3gnsrC
	RNJEfeX1XObTPx3vXZiAFAcsfsjx/x/t8It+AtzvHZF4KQ1pNA==
X-Received: by 2002:a17:907:a88e:b0:c40:36ca:9d1b with SMTP id a640c23a62f3a-c49be0398aemr530750766b.40.1793287771423;
        Thu, 29 Oct 2026 08:29:31 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v5 00/11] drm/tegra: Add support for Tegra20/Tegra30 8-bit CPU interface
Date: Thu, 29 Oct 2026 17:28:58 +0200
Message-ID: <20261029152909.234584-1-clamor95@gmail.com>
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

Add MIPI DBI bus support along with 2 DBI Type B panels used in
LG Optimus 2X which work with the 8-bit CPU interface.

Convert rgb, dsi, hdmi and sor to use atomic versions of
drm_encoder_helper_funcs needed for bridge state requesting.
Refactor and expand DC header. Add DC parametrization options
needed for fine tuning by bridges. Make panel parsing by
tegra_output_probe() optional and document optional DSI port. 
Add 8-bit CPU interface in form of a bridge linking to RGB port.

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

Changes in v5:
- added commit modelling DBI bus (suggested by Mikko Perttunen)
- hitachi and lg panels converted to mipi_dbi_driver
- dc header refactored and completed
- added commit documenting DSI controller port
- added commit which converts drm_encoder_helper_funcs to use atomic
  enable/disable
- added commit which makes panel parsing in tegra_output_probe() optional
- dbi command/data converted to enum
- dc com pins are now backed up into drivers private structure
- magic numbers replaced with pin defines
- dropped tegra_dc_readl() from tegra_dbi_pin_set
- tegra_dbi_pin_set() accepts boolean third argument
- tegra_dbi_write() second argument converted to use tegra_dbi_dc_signal enum
- used field_get() to extract pin value
- extended comment regarding init sequence
- nvidia,index > generic reg property
- adjusted tegra_dbi_atomic_enable() to properly handle shadowed registers
- switched to use of_drm_get_bridge_by_endpoint() since panels are auto-wrapped
  into bridge now
- added support for mipi_dbi_host_ops
- added resource managed helper to register DBI device and provided to DC via
  header
- dbi.o built with all other tegra drm files
---

Mikko Perttunen (1):
  drm: Add MIPI DBI bus support

Svyatoslav Ryhel (10):
  dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG
    LH400WV3 panels
  drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
  drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver
  drm/tegra: dc: Refactor and expand header
  dt-bindings: display: tegra: Document Tegra20 DSI port
  drm/tegra: Make panel parsing by tegra_output_probe() optional
  drm/tegra: Convert to use atomic versions of drm_encoder_helper_funcs
  drm/tegra: rgb: Parameterize configuration based on bus flags
  dt-bindings: display: tegra: Document 8-bit CPU parallel interface
  drm/tegra: Add support for 8-bit CPU interface

 .../display/panel/hit,tx10d07vm0baa.yaml      |  58 ++
 .../display/tegra/nvidia,tegra20-dbi.yaml     | 113 +++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  22 +
 .../display/tegra/nvidia,tegra20-dsi.yaml     |   6 +
 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/drm_mipi_dbi_bus.c            | 232 +++++
 drivers/gpu/drm/panel/Kconfig                 |  27 +
 drivers/gpu/drm/panel/Makefile                |   2 +
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 294 ++++++
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c     | 233 +++++
 drivers/gpu/drm/tegra/Makefile                |   1 +
 drivers/gpu/drm/tegra/dbi.c                   | 632 +++++++++++++
 drivers/gpu/drm/tegra/dc.c                    |  15 +-
 drivers/gpu/drm/tegra/dc.h                    | 859 +++++++++++-------
 drivers/gpu/drm/tegra/drm.h                   |   2 +-
 drivers/gpu/drm/tegra/dsi.c                   |  22 +-
 drivers/gpu/drm/tegra/hdmi.c                  |  22 +-
 drivers/gpu/drm/tegra/output.c                |  52 +-
 drivers/gpu/drm/tegra/rgb.c                   |  72 +-
 drivers/gpu/drm/tegra/sor.c                   |  20 +-
 include/drm/drm_mipi_dbi_bus.h                | 103 +++
 21 files changed, 2372 insertions(+), 417 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
 create mode 100644 drivers/gpu/drm/drm_mipi_dbi_bus.c
 create mode 100644 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
 create mode 100644 drivers/gpu/drm/panel/panel-lg-lh400wv3.c
 create mode 100644 drivers/gpu/drm/tegra/dbi.c
 create mode 100644 include/drm/drm_mipi_dbi_bus.h

-- 
2.53.0

