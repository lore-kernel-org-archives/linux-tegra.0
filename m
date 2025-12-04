Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124B21DE4E1
	for <linux-tegra@vger.kernel.org>; Thu,  4 Dec 2025 06:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764828415; cv=none; b=rNfYrn71bX+A/2AEce6mcvS0T4eK3DjtBhAC4KqI4uzn3dGpmBAX+ihzYeO466WYo1RLX9hPKxaCWZzwuk742mzomkxvJrQCLC4JQjNGbQSofoxxqS8EW6NihoIJPM3t869w6fbRQ2GkDU21qmkXXNXgNPTqlxuC/hBeIH1z7WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764828415; c=relaxed/simple;
	bh=AAy4P8dvMHeneV0IgwHSPlPKzVlb7cPq1pIPErAgdos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hJnCO5f52wPlihRBes1AzKKW5g1+ew8WaXPYVn1O2QxiRydP0jP51Zzbr7FqSTwAAPbAhfhjzDwzmaMX8FPqthFzCsoQL1k5fV2aHoW2Msx2c4v0pbeK/vhm9vxgQi4TjoV7oWlM8gRVCkAm6h8hkmeJtIDQ8SmsQmmO7mOkgek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkrVp30M; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkrVp30M"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so903210a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Dec 2025 22:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764828411; x=1765433211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZ9/LjENMEgkqGr3qDNK6DAWAvXersuPBKAH6ygTJP0=;
        b=PkrVp30MQE1vfk2G1gIlcfb4551DN2ZeNHIh5VqaIQqW5O5UX7QZlWVFkNN4CZ7hzB
         qOelANgAxO7ZlApK8PvYrTyznQOrt2Ul1ErAmtZPRKEZPAd2/F4sRO6Nh/QKPeEo67IM
         /bH0KqrbM2WJfJ9jbCO4zSZd9QaU5YdNVXxgXvNzSP4+LY1YbkZcpqV0MwKPFPiDwl6f
         v/BZSBCDxTEltlZhYhYoXVJgGDQBpqrcL0BVBcCPIqt3OSqSfkIKvemYqXY1oH0+MNdm
         eTx7f8WE9WvtMn+0ESqMeZUoYI5vZ4Kr4CtkiFchHY4IVftk3OpANNFUTeHCnqsgXsew
         9BiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764828411; x=1765433211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZ9/LjENMEgkqGr3qDNK6DAWAvXersuPBKAH6ygTJP0=;
        b=C69NI7T9cSVeyWGiWyfUOElCBrZgl16odqXZO8q2RhBdsdaRmc3/HvJpaxDb0F5/38
         KSMYxpD5SOu/0y30ZRKKqdBFeqXgiRW3zZvJ+6Vsx+Bg/L7vE5SI4BMe6ynqq2iY/POC
         nYhpDtbu8rovelfEs2vpu5o78MSFUyD49pfzhZVpR6GrBe6drgb/nidMeCduK1qzvamL
         31jK22QnBU0jmcqQQQzkdq343eDRwuwmUgXUiaw9oFE+59L/b7EmwrfCLLEAhbENKhor
         GKF9mnBqeqmGKdOCDmPH/+HqYmpUcVzF6/yIeMMYr4zfimmk60uHTs/rDWbkXJW6qeFl
         1FgA==
X-Forwarded-Encrypted: i=1; AJvYcCUeeXnCoQQUjK7+Aze97yJZtBKiPb0Dy7NozTvzS2FVqxttE5md99rqHAtLtdRBMQ4Ves4HqAuhvJ93kA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7cEc3ZGVS2OHTqyJh4lY+WSknTcTRQXKJzXcS8M/z4Pcu0tCy
	peinlLn+qp9slKTFdY49+MImySErBDsOE2589c4NyOtvpZ/G0guuc0LN
X-Gm-Gg: ASbGncubp7O3g3y1u5ZmwbNVETyESCKFp+6u8/cIo/jZ/GwJH5Ai8d4IiuCzUNNKTBa
	MheMWXiUQah85GmDJ/ryPmUCxJAOsyMCv14CHoy0etBfJUMqtUFQGj0P/FyZQq8lCvKtoyFn6NT
	6dDEyP4y7JB1Phrk5H0+ksTaXsKFuC59GUjgi6s8NMpMbTCjm3PRikbOxmFnB3EC7w7+64nK9FA
	A4IwRWEUWC2iu+NnQRXU3cQT1yWajr58MB+o/wRv38DaM2kb5T8gR8CdT6ute9J5aLcts7G+BZD
	N9dxH83URy6Y41bVZhMyjA0TeMIzQhfTBuK+HkqaLEMBTSQr3rsr1sPZDfJ6TU26XhBjf8brorH
	b7r/j8kW1kk8ld1c6dsc014z1wXYVF3K5juemfQyRgWmtHCJrEFXnDLuGmOed73k+fkbCzzNwra
	RWHj7WfwTxcw==
X-Google-Smtp-Source: AGHT+IGzgtbqSQa+Nunwm3tsFNhMDU83uHRCJF1GCTTEVoUczGHtwgIxvcTuLpvcqSN7APe8juko5w==
X-Received: by 2002:a05:6402:4302:b0:640:cd2a:3cc1 with SMTP id 4fb4d7f45d1cf-647abcf4242mr1593608a12.0.1764828411280;
        Wed, 03 Dec 2025 22:06:51 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ef7798sm460296a12.15.2025.12.03.22.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:06:50 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Douglas Anderson <dianders@chromium.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 0/7 RESEND] Add support for panels found in various Tegra devices
Date: Thu,  4 Dec 2025 08:06:16 +0200
Message-ID: <20251204060627.4727-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for panels found in various Tegra30 and Tegra114 devices,
including panels in Tegra Note 7, Surface RT, Surface 2 and Ideapad
Yoga 11 T30.

---
Changes in v2:
- dropped gpu/drm: panel-edp: add AUO B116XAN02.0 panel entry (picked into drm-misc-next)
- expanded commit descriptions
- return accum_err on prepare
- switched to devm_regulator_bulk_get_const

Changes in v3:
- lg,ld070wx3.yaml > lg,ld070wx3-sl01.yaml
---

Anton Bambura (1):
  gpu/drm: panel: add Samsung LTL106HL02 MIPI DSI panel driver

Svyatoslav Ryhel (6):
  dt-bindings: display: panel: properly document LG LD070WX3 panel
  gpu/drm: panel: add support for LG LD070WX3-SL01 MIPI DSI panel
  ARM: tn7: adjust panel node
  dt-bindings: display: panel: document Samsung LTL106AL01 simple panel
  gpu/drm: panel: simple-panel: add Samsung LTL106AL01 LVDS panel
    support
  dt-bindings: display: panel: document Samsung LTL106HL02 MIPI DSI
    panel

 .../display/panel/lg,ld070wx3-sl01.yaml       |  60 ++++++
 .../display/panel/panel-simple-dsi.yaml       |   4 +-
 .../bindings/display/panel/panel-simple.yaml  |   2 +
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts     |  13 +-
 drivers/gpu/drm/panel/Kconfig                 |  26 +++
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c     | 184 ++++++++++++++++++
 .../gpu/drm/panel/panel-samsung-ltl106hl02.c  | 179 +++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          |  65 ++++---
 9 files changed, 496 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-lg-ld070wx3.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c

-- 
2.48.1

