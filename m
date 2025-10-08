Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9B32264CC
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 07:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908677; cv=none; b=WlNMi+dvlBSpNcirJdI3D5i61a7kAJkL2jHyHYU6pjPIFMa7AtLL/AsK3eLIplz4SQX6EXRBp5e6iiWyqQOfF2F00InSNZ3rAzZIKIGMsjdFg0PeY9zoV5K9E8hiee+1wSEHYwtjqTG4cV3Fb4iMh7plAgQA/zieUByfvjp3Ekw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908677; c=relaxed/simple;
	bh=AjUdUU9clCEIteMqZnK5UhkyrMwTL1Vgqjw3pbKqwu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iqRFRzh7e4OB+VyAADgEeZA4DnkyqXY98ahqH8PWgIEpi+4iJVbmgqKBHk6ANTl9xvZhtT6R75PpEOCJMpQVhPHiC8Y8KCyEP8BuBxZsS7XlcWxcDvwLt3ZqiaoblJJ+eqiVRk37eiXMGMlf04AcMfPycpAMOhnkoaiV55ENDKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMI/xynq; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMI/xynq"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57a59124323so2274559e87.2
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 00:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908674; x=1760513474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KNXl+BMvGcWHYm5AdqooMALHOD7RIbmzWkhPJvrl09U=;
        b=gMI/xynq4kUkNbBGOcSDts/+H1eSlw3N0qTdLfFKXbHTQtJXT5klxXH3ckE1pPe/3Z
         ezusRMVsf64NU6Ki6exOLlrAq4blhgX0Sd/6pvYuONXxkr/gTg+Yl6RIGtSHv/6CUMfJ
         K3iVQiHSL/sL+RghViC9cxe26CDEtG3wknRYjVH7gylAOYDIop54H9crmAfqtgJkYQZ0
         UuIv53PVeeItvA9yxcoyBRVeOUgjDhwptvft0dK4V2yARjtgxNLoRI+lXdEMeO3EBRfk
         52SUTRSINX7FksNmPLXvH6pcJgqx0WKRVbenFgeswosKs6ZjUfMaFu9XLa4pGiC0CKIv
         C34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908674; x=1760513474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNXl+BMvGcWHYm5AdqooMALHOD7RIbmzWkhPJvrl09U=;
        b=AVByA9GSqslX4BihmGfjuSEBjacWBOLB4owlVWdNiQoTBAFd/E9SUvUcjjYF+a3CzQ
         8uakPQjn8HvNooErjznJLVCrm9Y7YE0gkvAYFhi7o6FmomfDYDawVtr3BfK7UCBFM7qR
         MNWVpydK+UUzMZJJuR2wtaWvEyAoYTdFtOJhkr608px9qZcXxsddx7OG4NClJgAD6rXM
         JKGnen6Dc+jNEn15qzUZhtneJCng8hZ+HVWGt4EI8+waIgmyfedFUTuQDW6iAwokBnNW
         n2rtQa2APWCxJBmoeGsrqDNCRF8F4SCcPnCq+Q1CHhOMf5zxM4xveHfzkyk19oh5FPT9
         Np1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSTyQ3uGuM1vxhuwHO6Mnyuo41Nr1afyAo8vHc8m6JwlL2lSukg8QPO76r6AC+1bzqTtDMmZw4Ri7JcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc6FLNVrNEgTTHLpSTYxQqky36p97HT3bkJJXHBOv9JFhwM6Cu
	tbTe7WO6dwYxunYu2c0Cwc7fR06gwCPk/+cf/J27Rf335mEh1B43XRJ9
X-Gm-Gg: ASbGncswK8e8xDaem70Fpn7nSqMrBgiax8XMuQL4h8GskWJQWKzxrN1XX3rWXuwe4sy
	0GwIYrSa+6jG0AhCoG8zIaXvWOhRVxBxTOmhMnBllmB56V0SoiLzVmHPa8PFnlKjZocRK1GTWjs
	jE7Gr+FHrDqRdil5QUX4mnLCluzyrlOIeEVsBU5c/8a4KNb7O51j5XPjZ1XhafeOo6+hVirBrqZ
	YMd4GbwNRx2xCiMZ+wMnBPLoc2SKzUdYmhhhDRWshfvdS1V4z3Mos0ThucmZCw4y47CddQHSGpn
	bOOjkcySzboZxUXofCqzoq+RLgzk6EwrFRnqvu6N63gN8rWhXSEb4ih5OfriDloEpq3Nh0Zz+6X
	YE/Px4x69Ah94fLQtwLuEpXRf9WTz+DDb6yAj49Wy9fcCqHRB
X-Google-Smtp-Source: AGHT+IFV3E4I3q4SCv11I4QSl5FglkY2KNmSqRcvzIhlPIX4IulY27ZI42wQ+IdYhbz62yo6igIseQ==
X-Received: by 2002:a05:6512:4015:b0:57b:517c:bf19 with SMTP id 2adb3069b0e04-5906d88ec80mr672523e87.19.1759908673445;
        Wed, 08 Oct 2025 00:31:13 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:13 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 00/24] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Wed,  8 Oct 2025 10:30:22 +0300
Message-ID: <20251008073046.23231-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
with a set of changes required for that.

---
Changes in v2:
- vi_sensor gated through csus
- TEGRA30_CLK_CLK_MAX moved to clk-tegra30
- adjusted commit titles and messages
- clk_register_clkdev dropped from pad clock registration
- removed tegra30-vi/vip and used tegra20 fallback
- added separate csi schema for tegra20-csi and tegra30-csi
- fixet number of VI channels
- adjusted tegra_vi_out naming
- fixed yuv_input_format to main_input_format
- MIPI calibration refsctored for Tegra114+ and added support for
  pre-Tegra114 to use CSI as a MIPI calibration device
- switched ENOMEM to EBUSY
- added check into tegra_channel_get_remote_csi_subdev
- moved avdd-dsi-csi-supply into CSI
- next_fs_sp_idx > next_fs_sp_value
- removed host1x_syncpt_incr from framecounted syncpoint
- csi subdev request moved before frame cycle

Changes in v3:
- tegra20 and tegra30 csi schema merged
- removed unneeded properties and requirements from schema
- improved vendor specific properties description
- added tegra20 csus parent mux
- improved commit descriptions
- redesigned MIPI-calibration to expose less SoC related data into header
- commit "staging: media: tegra-video: csi: add support for SoCs with integrated
  MIPI calibration" dropped as unneeded
- improved tegra_channel_get_remote_device_subdev logic
- avdd-dsi-csi-supply moved from vi to csi for p2597 and p3450-0000
- software syncpoint counters switched to direct reading
- adjusted planar formats offset calculation

Changes in v4:
- removed ifdefs from tegra_mipi_driver
- document Tegra132 MIPI calibration device
- switched to use BIT macro in tegra114-mipi
- pinctrl changes moved to a separate patch
- ERESTARTSYS workaround preserved for now
- tegra_mipi_add_provider replaced with devm_tegra_mipi_add_provider
- reworked bytesperline and sizeimage calculaion
---

Svyatoslav Ryhel (24):
  pinctrl: tegra20: register csus_mux clock
  clk: tegra: set CSUS as vi_sensor's gate for Tegra20, Tegra30 and
    Tegra114
  dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
  clk: tegra30: add CSI pad clock gates
  dt-bindings: display: tegra: document Tegra30 VI and VIP
  staging: media: tegra-video: expand VI and VIP support to Tegra30
  staging: media: tegra-video: vi: adjust get_selection op check
  staging: media: tegra-video: vi: add flip controls only if no source
    controls are provided
  staging: media: tegra-video: csi: move CSI helpers to header
  gpu: host1x: convert MIPI to use operation function pointers
  dt-bindings: display: tegra: document Tegra132 MIPI calibration device
  staging: media: tegra-video: vi: improve logic of source requesting
  staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to
    CSI
  arm64: tegra: move avdd-dsi-csi-supply into CSI node
  staging: media: tegra-video: tegra20: set correct maximum width and
    height
  staging: media: tegra-video: tegra20: add support for second output of
    VI
  staging: media: tegra-video: tegra20: adjust format align calculations
  staging: media: tegra-video: tegra20: set VI HW revision
  staging: media: tegra-video: tegra20: increase maximum VI clock
    frequency
  staging: media: tegra-video: tegra20: expand format support with
    RAW8/10 and YUV422/YUV420p 1X16
  staging: media: tegra-video: tegra20: adjust luma buffer stride
  dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
  ARM: tegra: add CSI nodes for Tegra20 and Tegra30
  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30

 .../display/tegra/nvidia,tegra114-mipi.yaml   |   1 +
 .../display/tegra/nvidia,tegra20-csi.yaml     | 135 +++
 .../display/tegra/nvidia,tegra20-vi.yaml      |  19 +-
 .../display/tegra/nvidia,tegra20-vip.yaml     |   9 +-
 arch/arm/boot/dts/nvidia/tegra20.dtsi         |  19 +-
 arch/arm/boot/dts/nvidia/tegra30.dtsi         |  24 +-
 .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |   4 +-
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   |   4 +-
 drivers/clk/tegra/clk-tegra114.c              |   7 +-
 drivers/clk/tegra/clk-tegra20.c               |  20 +-
 drivers/clk/tegra/clk-tegra30.c               |  21 +-
 drivers/gpu/drm/tegra/dsi.c                   |   1 +
 drivers/gpu/host1x/Makefile                   |   1 +
 drivers/gpu/host1x/mipi.c                     | 525 ++----------
 drivers/gpu/host1x/tegra114-mipi.c            | 483 +++++++++++
 drivers/pinctrl/tegra/pinctrl-tegra20.c       |  11 +-
 drivers/staging/media/tegra-video/Makefile    |   1 +
 drivers/staging/media/tegra-video/csi.c       |  70 +-
 drivers/staging/media/tegra-video/csi.h       |  16 +
 drivers/staging/media/tegra-video/tegra20.c   | 808 +++++++++++++++---
 drivers/staging/media/tegra-video/vi.c        |  56 +-
 drivers/staging/media/tegra-video/vi.h        |   6 +-
 drivers/staging/media/tegra-video/video.c     |   8 +-
 drivers/staging/media/tegra-video/vip.c       |   4 +-
 include/dt-bindings/clock/tegra30-car.h       |   3 +-
 include/linux/host1x.h                        |  10 -
 include/linux/tegra-mipi-cal.h                |  57 ++
 27 files changed, 1651 insertions(+), 672 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
 create mode 100644 include/linux/tegra-mipi-cal.h

-- 
2.48.1

