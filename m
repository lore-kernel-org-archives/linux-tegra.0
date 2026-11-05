Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887542;
	b=2PW9auyabd+Osa8DACLBi6jSNHe5W9OwO1mkEvO5TnOEhm9jPDKGPHkLL5iSgqUSwdXl
	 oBi4XrDMEHZx0GX/N01q+aKEp3fLgqKMDZgU6FJIj+L3UxT9SUR41VJeSgetEkNc3SEMg
	 EZTHv3YTwVzQ6/xrikyl8heu4QQNKxS5iAY7nc78P7139TCqISw1BkW1dbTmQWBqql61B
	 nvnwbUVOJnv0e+8mHZY/akmWr+2FkzAZuWt1v78w6coOZidlTHHOlxc2Sbw7/2+wDCY/H
	 6GAsAqsb8pYMbhFYsNgqipnIo0Kcr8Qn3+XsAtCI4XNBR4Pl/ZYc2VTmysZffO/R9LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ds7iJJ/yi21YzzuAvjdYkQJHWhK/UE3D72nBbDoPfLQ=;
	b=j3kcK/xPvcQNwGV20nWPhWZjR4nsNqhwzV2c9xUkbCX5kJwIeZ+SSUXsiX/zJhjpecQg
	 x8dRZeV3h/ywhrgV9+FIpWtXqqnzc26QeCYE8rAIC+mmQLMzsQqJTav9AstNCgxpzR0e4
	 Gx/qX3uD3+efo4mFVEmUSLHtRyR+JBndqOySvi4RSI0d8NGsHKUt7MfsMUQmCrgqXW3Pu
	 Qd9S01EP+1Lz+lyQPIuaIo5F9GQTE1PpxWgvW5qwkQbo5s3KMWjLOzvn+CSdgvf9AI1fo
	 FdSXzlqPlGju9FEVE+UejSJhVWCnnGIa6ECxSFKXCRe2AlZ5+BsLNx0/y2ydXTLTG3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jDoqtSX3;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B865606A328
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 14:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B865606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jDoqtSX3
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1180463f8f.3
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 06:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887540; x=1794492340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ds7iJJ/yi21YzzuAvjdYkQJHWhK/UE3D72nBbDoPfLQ=;
        b=jDoqtSX3USL0LEr+5PdC2WmkSINuSexwTTnneOJ8Qp7y+GjuybddaC7wVtU8USV2PF
         yUA8SRNi3o+k7P5n1B0OiiqAHDA7wT3QXifXGa08rPv9/Ph0aH5DUWrBdQJWUAVmFZxo
         nKpI7w6vI8xzelRKjgu/PvxuxvEHnU+MzYUUo1ULApnokZDnuWXf4vjYLgmAmL/GxrAD
         C0k+I+5pD4yVUxbgS5RdORT1Ke1RAqfbskyt9XcCfueLQkwTx3zOJphD2Z5waw60wytS
         skVGpcaWH0IPfozCQ8zDSWMMM+Z5WAf/7P3O3Y1DfYHUoLOPsvtlgVV0ctXroiTQ/tcd
         XPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887540; x=1794492340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ds7iJJ/yi21YzzuAvjdYkQJHWhK/UE3D72nBbDoPfLQ=;
        b=Ipcskwr8LDB3UD7p3l0RGFOPeg9ZBhc2iIp4aoRFENP4cS0seSTC1kCALRHh10qzc8
         n/l6q9IKJsjpasaDqPak35K1kTmVY0jFjsywx6BPeuLC3XHACDsE2zXrFihG3u+6Eamt
         kSF8sMDJbOps33buTg8mw0e44sixP15KOJglfk9MEXcARgdTAadZF5ewiVCxd5qGPPis
         YCScswSwPDb2FmY4S8SXVn0ZRXMjP1WNtISB/BySLr1wi97HCRLMRDsGNIkhjQrJaJxU
         FzQd770kWK+Cq6RXpJHnStlWmrnJIQHutGf8R+mObHLrMDrwP9OOimjHNt7dT+F+R0Uj
         qcbA==
X-Forwarded-Encrypted: i=1; AKwUvBxOXoRhP9Zr+4JzufuyN4G3TXKPi96w1cl/49pLip4mc6ZT6AuF6pCI8ANokok2qvIcQwXxK0V/lmw95A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ktGMf/HdoFs/cE3x7N6Wwhzg9g9MF9/aBTzI33lBQS9mf7emL
	YDxUA/C6fni9EYTzm8C23mETCOzuig4dQJVL1UvEKZW4tGWvlUUdZnaF
X-Gm-Gg: AYBFou1cJGL8/heHpv29hHTpTLPndp6t2rf6EAkbkr2dOG+LGwsBCwvdm8ihKHcig44
	jbBhU6zVde/OY9AhVvq3ecpWq9zsLnCAMYMR9dvBlzK9zeUhZcJU0g50EhBQHuN7jlCkOyTg6Md
	ZhN6vRohuME70IHvPKCNUcX3ncEM4jOLWn59z9O8cXMjW3bkhM7AkNeCk+GaPs1LdRnAgcFL2Sv
	pWB7G61mdvze/ml9faGHc7R342InblM641ARJ3VyBmHEx0ClQ4262EqI/8RODtq7SraB5xo60XM
	2GdsZLUnDhTzJdwks0e2E5M6LY8s04C4cTmgun4gmg/2Qi41c41fNJ/ATjO5BajhoOegB/zroRG
	vqevNWjf3a/VxFZzqHx5HWAKiriP0QRzx3PfLm++CfyN6J2CkcYxMeDVT42EcvXvrHrYpqlqieM
	u9GsQd2ueLg3oPTORBQv2U3TPVUc3BGfInnlfMuCUOhHmVOpk7qYr9o/LA/AffDo2WWA87QDvqF
	vdKZysHj29/5sFC560+SQmOpH5eFDXZ3FxRgf7EBKc7ttTtGdaq5vdvEuBBPHXlIGoPHCQMKxbf
	8wKHlC6HTy//7UpJGRzKzFbNqQcRwoSeQ7rSWUZUKXZzmEuQ2LoddF+DG/vqn9Ul14wJxqU=
X-Received: by 2002:a05:6000:1866:b0:491:83e7:32bd with SMTP id ffacd0b85a97d-49183e7341bmr3868887f8f.50.1793887539738;
        Thu, 05 Nov 2026 06:05:39 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11454111f8f.45.2026.11.05.06.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:05:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 00/10] drm/tegra: Add support for Tegra20/Tegra30 8-bit CPU interface
Date: Thu,  5 Nov 2026 16:05:00 +0200
Message-ID: <20261105140510.165165-1-clamor95@gmail.com>
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

Changes in v6:
- improved descriptions of new framework
- mipi dbi bus commit authorship was changed with Mikko's permission
- panel commits swapped with mipi dbi panel conversion commits
- fixed tegra_output_probe() for hdmi
- added CONFIG_DRM_MIPI_DBI select into CONFIG_DRM_TEGRA
- devm_drm_bridge_add() moved into bridge probe to avoid possible issues with
  deferred panel probing
- setting LDC pin to V Pulse 1 moved before GPIO pin reconfiguration
- DC_CMD_STATE_ACCESS is set to read and write in tegra_dbi_atomic_disable()
- platform_driver_register() does not error out if driver is registered

Please, keep in mind that this series must be applied on top of
https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
---

Svyatoslav Ryhel (10):
  drm: Add MIPI DBI bus support for MIPI DBI Type A and B
  drm/panel: Convert Hitachi TX10D07VM0BAA to use MIPI DBI bus
  drm/panel: Convert LG LH400WV3-SD04 to use MIPI DBI bus
  drm/tegra: dc: Refactor and expand header
  dt-bindings: display: tegra: Document Tegra20 DSI port
  drm/tegra: Make panel parsing by tegra_output_probe() optional
  drm/tegra: Convert to use atomic versions of drm_encoder_helper_funcs
  drm/tegra: rgb: Parameterize configuration based on bus flags
  dt-bindings: display: tegra: Document 8-bit CPU parallel interface
  drm/tegra: Add support for 8-bit CPU interface

 .../display/tegra/nvidia,tegra20-dbi.yaml     | 113 +++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  22 +
 .../display/tegra/nvidia,tegra20-dsi.yaml     |   6 +
 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/drm_mipi_dbi_bus.c            | 256 ++++++
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 167 ++--
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c     | 103 +--
 drivers/gpu/drm/tegra/Kconfig                 |   1 +
 drivers/gpu/drm/tegra/Makefile                |   1 +
 drivers/gpu/drm/tegra/dbi.c                   | 576 ++++++++++++
 drivers/gpu/drm/tegra/dc.c                    |  15 +-
 drivers/gpu/drm/tegra/dc.h                    | 859 +++++++++++-------
 drivers/gpu/drm/tegra/drm.h                   |   2 +-
 drivers/gpu/drm/tegra/dsi.c                   |  22 +-
 drivers/gpu/drm/tegra/hdmi.c                  |  22 +-
 drivers/gpu/drm/tegra/output.c                |  52 +-
 drivers/gpu/drm/tegra/rgb.c                   |  72 +-
 drivers/gpu/drm/tegra/sor.c                   |  20 +-
 include/drm/drm_mipi_dbi_bus.h                | 103 +++
 19 files changed, 1851 insertions(+), 563 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
 create mode 100644 drivers/gpu/drm/drm_mipi_dbi_bus.c
 create mode 100644 drivers/gpu/drm/tegra/dbi.c
 create mode 100644 include/drm/drm_mipi_dbi_bus.h

-- 
2.53.0

