Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335517;
	b=GdrLvwuIr64VZZXHsaWDfuCNl739epr6YpbkR6SLAAyV/WYQIohYBXOwJqfPuUfrXyd5
	 stf11orC8fQQjt3o9w0Xj7AbTmyubmJR50WtPq0OVANqQek3aTeWqf6V5VMswLjYDzPgq
	 Ff1axzjCzsOwcnXhd2k289+ERRyaeiycAuBuXWJlpQIDOSiQXAoeIgIG9Y+iqJaAxVX+Y
	 bZtbn1XqF260laVzflY50kJfANBOTzCi98d0/KC73EMUXN11YO5CkDNVx0nlzTMepOj97
	 0HEkMA+m2dy/1yNrKCsLay8EIFzsPW4KGPHYXpdnGxoz4j/p8R1BpiSQ5uzi3ijAEmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VhDJi21DzValv8EWmq82eR8h6wo5YimPj433Xh99oIs=;
	b=aG3UPD0Su45cHdPXR8rGxHNudk7PVOedAN8aOJ9n5kAgjjLCKGtsXscyMhC1SrTp7GoW
	 5Cvwj6l4+/+2LCqQaiO+Q9RiR86j1ltiHLC+d5U0dbjntgPnzRCKaeur7vyT7/r1EKxsZ
	 MDbbxG7FLpBJlhWkVVb4E2l5ArYHTOellO7V5M+bvqdBrQ7bF1oXIfM+VCiasVwNm2t27
	 x3xN4QtBpwKiDfIpi1LPwx2Fe5wx2v2RircZiN5dfPaopwXb0D5PSWswnxLD5JL7cF6BF
	 WcbUUQvMr0AYlRNQWml7TmYpQH4JjuW5uMx4do64tEZT1XEYSrflBPjiHYdR++HxL+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ang9tUEE;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE58606A330
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 08:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AE58606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ang9tUEE
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d28f75d62so385864766b.0
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 00:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335515; x=1795940315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VhDJi21DzValv8EWmq82eR8h6wo5YimPj433Xh99oIs=;
        b=Ang9tUEESE1Y7JdswRwqeJ4Shz9TBAytFI5i4fnoSffbFQEzUX+ptfv+xyXmMZ0H12
         pXc28yEMIvoz7bFTmDMwyn2N87lhL+rBw5r2ypHLrIZLRTpmTWoqEYwvsVrVeKottLwq
         zsPA8szwcQQo6N4tREjw5WxJWfGboQ4hx8UMioI2qDa3TFIoWTnUXbxe/nJkxU7s5trL
         /KNqjgTUBAb3y2xCkOOiWlnE6D7U1gPr7XzhSIg6isaQX1RzqU8HCUf2b1wZpMazQ7MQ
         gNMs/SVL2GXjcDpxeV0o/oy5hOeQyOTkArhHpI5AG2q+lXcQLeZVUCvBk0g40dyyaMx7
         87nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335515; x=1795940315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhDJi21DzValv8EWmq82eR8h6wo5YimPj433Xh99oIs=;
        b=wfa6HIoI4ipozHawSqzjFeTOy4pingdAUk4i4U88i2P4wds9mrp5yVGcx8+Vq06QF5
         UUuOLnSfXzUELChogAa+f/3tnY4XPEI1hTg0pmR34MplWwbn9klgVRNlluw/16zJeylH
         981tE7gp69udNqH057dvwNk+v8JDAEiBwy46BGeMrfvehmsXG6V1Uk+8uFPLCksxz/e8
         RqImP424jxO8gq4sVzcR++heUYGIYUYfzGGenK+Z6i3FSyszsQJ4b87jLm5FZvEDgPKQ
         P6HdY/DNjC+HNCYYfbrFyo9GBco5Vw0KfZTm1yR9o5dvv51E3jrd+HiPcYV+RiOUBUM4
         S4dQ==
X-Forwarded-Encrypted: i=1; AL+hErEsJX9lJ+LVW/3+sYfOTGctaPTIrTWzaZQ++qNsO6wL73cckvvVJqqkZtNF17m0pWH4WnfysW/uGeHm5g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/n9eI9/ts2V1ZwG6wPjGovzu/tx8uvHR6IgtQNGa5wIcLbyn9G
	NMdepUi4dYr6n/+XLrUWt/Rzsocu7VQ3nLydXV8ItfysAvA5VfWoHMSe
X-Gm-Gg: AZFdTZfWzA/8X09H3AiJuPoqT9zxhw0vG3U5wgJXIay8Bj0m0CcQxoolCr/FzQ8mykw
	/hIFBavqebUfBrlpgC5NX02RhYOU+YYsWez8DhJ5eejAZGIEFnf3cMmRohCefqrpP2eosoN5vo9
	J0WycyAfvbPqXLXt4uoflSMXXahF4tlJYJ36Oeg5j8f9tPjKZlGRRM4BmGzl/RFqLjvoRhTeL56
	I/cH64kC2tpjgQr0kM1KqIEZ8c2RLxKUAbXJantv/6EP+syqMEsp5Fi567MZpzlXgPwKbucwKFO
	oC4vuTJg/KgccqNcVJq3FpavTi0UW4UY9EsMwqMMivoF2FDp4gJb3fp64MjRwCz1F5LtNniFLnD
	qCcI21V2Jytkc43QN60ZjLNIiHJ37QXaaQC2dHqG+S8bdCKkOfHOMC3TLxflOtJ/mbNXi+lA3+a
	dj/j+0diDo7O4/pd/FvSoe1qZPbVVkE4yP1sQXf5wmWdviQ0r2yheyxVikM8fYebDRJvbMK/iph
	et76fxzG1RAijZMYxU2tp8xKiO2d9eXLFvxtZvQ79X29UHHyTfRF9annW/acTOFypNHAj7uIITl
	/fHkTdDvHd1MVGTQ2SWoykEimXdP1pEPSrtCOAstcY0nsL/nhwTw526xjvt2srRXHESbf9ugWS7
	PmrqsysZSHA==
X-Received: by 2002:aa7:cd65:0:b0:6b5:823f:3462 with SMTP id 4fb4d7f45d1cf-6ba37e83f29mr3868790a12.19.1795335515150;
        Sun, 22 Nov 2026 00:18:35 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:18:33 -0800 (PST)
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
Subject: [PATCH v8 00/12] drm/tegra: Add support for Tegra20/Tegra30 8-bit CPU interface
Date: Sun, 22 Nov 2026 10:18:08 +0200
Message-ID: <20261122081820.53199-1-clamor95@gmail.com>
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

Changes in v8:
- return of_node_get() in devm_mipi_dbi_device_register
- add mipi_dbi_write_buffer_multi() and mipi_dbi_write_seq_multi()
- remove return doc from void function
- replace disable() removal in panel with mipi_dbi_write_seq_multi() conversion
- removed of_node_get() in tegra_dc_dbi_probe() for dbi node
- switch to drm_bridge_clear_and_put() in tegra_dbi_host_detach()
- add check if DC is idle before reconfiguring pins
- restored original tegra_dbi_atomic_disable() operation from v5
---

Svyatoslav Ryhel (12):
  drm: Add MIPI DBI bus support for MIPI DBI Type A and B
  drm/panel: panel-hitachi-tx10d07vm0baa: Convert to use MIPI DBI bus
  drm/panel: panel-hitachi-tx10d07vm0baa: Convert to
    mipi_dbi_write_seq_multi()
  drm/panel: panel-lg-lh400wv3: Convert to use MIPI DBI bus
  drm/panel: panel-lg-lh400wv3: Convert to mipi_dbi_write_seq_multi()
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
 drivers/gpu/drm/drm_mipi_dbi_bus.c            | 287 +++++++++
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 234 ++++---
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c     | 114 ++--
 drivers/gpu/drm/tegra/Kconfig                 |   1 +
 drivers/gpu/drm/tegra/Makefile                |   1 +
 drivers/gpu/drm/tegra/dbi.c                   | 592 ++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c                    |   4 +
 drivers/gpu/drm/tegra/dc.h                    | 197 +++++-
 drivers/gpu/drm/tegra/drm.h                   |   2 +-
 drivers/gpu/drm/tegra/dsi.c                   |  22 +-
 drivers/gpu/drm/tegra/hdmi.c                  |  22 +-
 drivers/gpu/drm/tegra/output.c                |  52 +-
 drivers/gpu/drm/tegra/rgb.c                   |  64 +-
 drivers/gpu/drm/tegra/sor.c                   |  20 +-
 include/drm/drm_mipi_dbi_bus.h                | 148 +++++
 19 files changed, 1638 insertions(+), 253 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
 create mode 100644 drivers/gpu/drm/drm_mipi_dbi_bus.c
 create mode 100644 drivers/gpu/drm/tegra/dbi.c
 create mode 100644 include/drm/drm_mipi_dbi_bus.h

-- 
2.53.0

