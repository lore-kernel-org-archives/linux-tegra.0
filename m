Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841834;
	b=Ukj4DkWnwmutA/AQrQBL877YyRw76dgL1i+n3iaLwE7JvAy7SJu/kSVCUSenIH9n6P6k
	 jUVqJlZPrTG+Fw0Eo5rR/gEcSE4jan0cJ0ZdaiNvFRL4/vHL9m66g3v6ZhagDVw0RMmTd
	 GF7Q3EzVG1co96/krD1MXCj2qTo3mqrDaVntD4bQaNW5TtF8e/E1iJZ9sd+V3gw9NEUbQ
	 S3LAQpHcHJWp+fnb58g14WGDkafEsLu2L54zU2Jy7uJKRJuhpIo4fb78f7SUvOu97LYff
	 53KlI/bUohm4ZYu7nc3dqWrUKU3mjdsQSLMEWtmez2b4A/9ThtezHMVKfI+Gik8t5gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LbqgOhVybNkMwnYCeynnQ6YccVR5nx8I+2FxMfh6a2M=;
	b=PnbBDKE8M/2armVQhVoorN5Roi8R+e0NJhmq7z1OPfrjXvO/XAKAUA7/kVQhhxEVUnc7
	 K1MHct/XRrdTnn7CmQwDbFfJ2iO+O2owe/uJU3XFm2EivLVWKbpjia80mQSx7AvO3SzuZ
	 53aVNwgeZUhFxwSulhx/KH6mDWnfKmSSIeUd/lw4+wgTz3TtDIiY6oP922+/vSYYEkfbW
	 1uthgDd285jchcC2MpMdwymyuA6Fnbw3zRTCpaEgReARpM0UVfqRZe/9Z32S6y2e5vd1l
	 5qamw4+CzvinW55oouI1K4w0IzEdfqqXhqJLtrWNCu1SlnHI9Z9/mvgtCuK411eg2Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f6DGU+Hc;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68526606A31C
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 15:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68526606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f6DGU+Hc
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4395d31228so574232166b.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 07:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841833; x=1795446633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LbqgOhVybNkMwnYCeynnQ6YccVR5nx8I+2FxMfh6a2M=;
        b=f6DGU+HcSxlHxYv5Tm4Nl1Odjt+hIGzC88yrqlY4HniHll+xVJWSCo5ibVxCXygR7g
         7dXQin42WLyZikwYMyKQ5JlyBCM6Cqe0o6bPET5NSFp49FeNcQ6QPLCbq5EBSD7+2Aik
         ZlyTx5dJMHCbtogOS3Y3i0n9XU53WZDCs7ePncUMBa0uAAoX8EJWM/VVIsoZDWxu+ibD
         NVchlnyNt0J02JAw1fxPzzhgJ3TpiYF6j4zlpGg/ET3esZXqmkw3WfR0O2AjwrxUp6XS
         2SQcZAmMsLMuy7VRo38S7BfLHAEKKN/N6hRIN1jx5o8p47vp0HcBxXLxl3HD3AAyceIQ
         WCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841833; x=1795446633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbqgOhVybNkMwnYCeynnQ6YccVR5nx8I+2FxMfh6a2M=;
        b=RWOKZof3XGfCEWlKMhsEg8mNkfuWxM0Oc/im9nRL7Oysb+HsjYJgfnSFq8oXch2lDh
         LU7lH4TiLY8BocLoZTbNTk7FmUjPpNtl+hwH/ncTC3+w/9RgR1r/PF+mcxglnN20v/Nw
         x02U4/ZLzBlm0T07tkk9H8NTXVq6Z5cJ+Jmj7ep8n+g9C3F1lTQEE/R/0ESdQWR87OLm
         XgY8hShdwqzRyXuC0bFVWiHY1oSAvqj75Wb2raZ0MG5mWyCzk3HxBdxaSQ4CvqvrC1Aw
         McgxfK8loiN2rvF3kr6irVrhCo/QhMLLqQ02uNBDyIIib7fzBRDVvk0pquwdnKy2VEGa
         0vUA==
X-Forwarded-Encrypted: i=1; AL+hErH7lzXEoXyDVEdqzZWVkF9JiJP292qF2iyKUv6/s9tYysP5CqgoK4+Dh+urzMGiYOdRD1Uy25tKm9Q/+A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8IBhieUx30YrZTGVan1niRljjSgV6YHbf2Z/PTSUIg/G63qyB+
	qVxmHd+1XWKHLPrUcnv5vuU3mS9+rLmjuuwESzkZnH8KJ+xeT/z8C2js
X-Gm-Gg: AYBFou39Kx4a9LlVlA1z2bhX3HBYhryUwLTzW2RZb1Y+R/gmMLy50gSJnleDoPcPtYi
	JU/eSBKcpvfAIwu0+f1xXnFjdYJGpO6hBjFVA5iF1GUXG9WIbxNCgv0OgKaMfkyAd5wnbYIaxwW
	venQtki1kky5Gy7/S+JJVm0O40D+VQinP3r9obE4iLu/Qo26q0r3mqu+duCmTSzpkaJwDzHjRN8
	j1TuNIbdz8UCokJ2Q/MfFqz7bU7+ZQD1fRZaTjv3LxWb99LAYvZlmiLMotDSZ8IePhfGQMMTMdv
	1lvIqXdgMT9hT3MlFnZBCYE5CRA/cJ4w+MaSW6+NP4RFUn/zuz3F2hstPfInEA3dIbk2KIhjPLT
	SgX/cEw30l1VDAtELvt5TyAtXl7BmaHFKIAQ3Zf8OeSWnHYlNSUkGBLTghaBUu+TF7KQTvna0aP
	g9icgb31W4r0FEGFIFaEzLr7f6LwJxtr0e4429WbECpp9H4uAFYTj/xVXfC75IBqKo7bMm+HZ8a
	YTyRc3cYCsMCCW8gJwGCHitE1pzURkDZBCuKhxW6gwdryVs0h0GQDILraIMJDKHzWDq/cfAeyCb
	r9EZaKU8ECs83mI4qwYd+mnb4DdvHEjx/oUrManMg7rmRcrdJ+s/WHNWcoprp46HXEChgRnwKN8
	0HGkdXebRTw==
X-Received: by 2002:a17:907:3e8c:b0:c3e:ee86:d2c with SMTP id a640c23a62f3a-c5096343b6cmr963645466b.27.1794841831798;
        Mon, 16 Nov 2026 07:10:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:30 -0800 (PST)
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
Subject: [PATCH v7 00/12] drm/tegra: Add support for Tegra20/Tegra30 8-bit CPU interface
Date: Mon, 16 Nov 2026 17:10:05 +0200
Message-ID: <20261116151017.274764-1-clamor95@gmail.com>
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

Changes in v7:
- reduce changes in the panels when converting to mipi dbi
- dropped of_node_get() in devm_mipi_dbi_device_register
- remove enable()/disable() operations and add prep prev bridge flag
- drop add DC header changes, add only strictly needed by the dbi
- dropped tegra_dbi_iface and reg_entry enums
- dropped reg from struct tegra_dbi_priv, com_pin_backup converted to u32
- interface dropped from struct tegra_dbi_interface and init call added
- BIT macro converted to PIN_UNMASK in the tegra_dbi_pin_set()
- init functions and tegra_dbi_interface structure moved before probe
- tegra_dbi_atomic_enable() split into pre_enable() and enable() phases
  to squeeze interface into existing framework
- DC_CMD_STATE_ACCESS and setting active true moved into init functions
- reg reading moved before bridge allocation
- reg renamed to nvidia,interface

Please, keep in mind that this series must be applied on top of
https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
---

Svyatoslav Ryhel (12):
  drm: Add MIPI DBI bus support for MIPI DBI Type A and B
  drm/panel: panel-hitachi-tx10d07vm0baa: Convert to use MIPI DBI bus
  drm/panel: panel-hitachi-tx10d07vm0baa: Drop redundant disable()
    operation
  drm/panel: panel-lg-lh400wv3: Convert to use MIPI DBI bus
  drm/panel: panel-lg-lh400wv3: Drop redundant disable() operation
  drm/tegra: dc: Add elements required by Tegra MIPI DBI
  dt-bindings: display: tegra: Document Tegra20 DSI port
  drm/tegra: output: Make panel parsing configurable
  drm/tegra: Convert to use atomic versions of drm_encoder_helper_funcs
  drm/tegra: rgb: Parameterize configuration based on bus flags
  dt-bindings: display: tegra: Document 8-bit CPU parallel interface
  drm/tegra: Add support for 8-bit CPU interface

 .../display/tegra/nvidia,tegra20-dbi.yaml     | 108 ++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  15 +
 .../display/tegra/nvidia,tegra20-dsi.yaml     |   6 +
 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/drm_mipi_dbi_bus.c            | 258 ++++++++
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   |  35 +-
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c     |  35 +-
 drivers/gpu/drm/tegra/Kconfig                 |   1 +
 drivers/gpu/drm/tegra/Makefile                |   1 +
 drivers/gpu/drm/tegra/dbi.c                   | 551 ++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c                    |   4 +
 drivers/gpu/drm/tegra/dc.h                    | 197 ++++++-
 drivers/gpu/drm/tegra/drm.h                   |   2 +-
 drivers/gpu/drm/tegra/dsi.c                   |  22 +-
 drivers/gpu/drm/tegra/hdmi.c                  |  22 +-
 drivers/gpu/drm/tegra/output.c                |  52 +-
 drivers/gpu/drm/tegra/rgb.c                   |  64 +-
 drivers/gpu/drm/tegra/sor.c                   |  20 +-
 include/drm/drm_mipi_dbi_bus.h                | 113 ++++
 19 files changed, 1397 insertions(+), 111 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
 create mode 100644 drivers/gpu/drm/drm_mipi_dbi_bus.c
 create mode 100644 drivers/gpu/drm/tegra/dbi.c
 create mode 100644 include/drm/drm_mipi_dbi_bus.h

-- 
2.53.0

