Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565532FE56C
	for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 09:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762766127; cv=none; b=AEwZhrU5/qgLKeeWaEeQCHshVHqG29OJqblHRTG8KyT8vDv4ntdRu3n4tzUL8QDL+A4zpZgzdP8xtUIXhmsTaOOhpsGprFxHCYgd1YBxw+rpEMHSjDV8/XbZdPrpptkyk6lOYEFkqBrDMHUALwNY1d0I0HFOiPimx7erORJlCRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762766127; c=relaxed/simple;
	bh=AAy4P8dvMHeneV0IgwHSPlPKzVlb7cPq1pIPErAgdos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pVkFMAdqLmmIus0k56+AjLuuNILg4lpISNh1Yar6z/ptmguM8LifnPMQkqE0sRbRMFC5HVifIghiB36Hxjr0apP/mtSGUwrOJSbUldSrKXCufeMSKRgVMMxUCN6kuWJ49ePyWCG1b1DxIvBaSipv+EA9oAohnX2iQdwBm7Lfr+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8sZF/QX; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8sZF/QX"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-591c9934e0cso3510141e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 01:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762766123; x=1763370923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZ9/LjENMEgkqGr3qDNK6DAWAvXersuPBKAH6ygTJP0=;
        b=i8sZF/QXlQPY+qiEh4soUumRZDPKVA6eX07Uy9ERGiT2k4GHQu6azi160AeoxD8nl1
         NgWDaqt7IrKj+3lJbwDXhpyObq0cze/b1VD0DphTzj9oivxjlnbL68EwKerhiBICnqIN
         3dqZEafDhFBhkkH/r2x0oCGwO8w1rC72FM2mslAAN31rqz/NM0XkrfLXiOYjIuXQ8B1+
         Uurk2ch4uFgBWnXM2KoqKxCuVB2j2VGySJqo7FFhN3jxhSvSwLuEgEsa9ERSHWGaBwab
         +qCxNmBO6L6hpb0aVr42yiFW81nUzFGlYK4GHKBjETzFI8tGgIZdQ+U2YopEWLSmirER
         kn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762766123; x=1763370923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZ9/LjENMEgkqGr3qDNK6DAWAvXersuPBKAH6ygTJP0=;
        b=QMPAmLtG9B1hKY9SuT9ZD7ljBdtlOZrsGTq9c05vzkxui+wepoGIupS/W1EXA2pOfd
         y4tGUY14sFW3k6lJ5sFlmT7yaWqKxXZ4VKEx98ZuOnLATNgtb0wTj+fiyb3lQv23KrJH
         lbjSasmBmnfrCs5SesGaYpGDN18bqEHlCcW0MVDSMGPYF0SU4qCNa0r3nPdzMWiy5E6J
         lAle1QY655yjmJppxQtUPV8m6d/veP/Iogo6rZDei49K1omvN5BiIqERiC6ddqs9sooG
         5LuEA2xsV1mJ+LT3AdUIGpeofeHah9XLV6LPBKsqdFIELm/T3q2ArVpkq1V0wgEqz3wn
         mHqA==
X-Forwarded-Encrypted: i=1; AJvYcCVppUNP6mPt6SEBr62B6GWmNcb3LJTE6e4xq76VLyjPS/iubejFvNZpnJ3Sc3Y5mQzfDNDNnCK2/cnzEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBQISDVarf4c9BCb4dFIyuKRajk/c+8yAt9WkNQeFFx03j7++k
	+dDqowzTjMBT3phgs73Q42YeLCKpI3KjkjYrzgEZBRF9WjQH8MVAm7I2
X-Gm-Gg: ASbGncseoVu6dhJMzQtBP/0Mitw/bQLkoh/qaEMFK389pCrvYEsA+7f8yrhsAM60e6O
	mDMxyhF9IP7kGiORaGeEcmlgLFaTTWi7K9DtvG7OGZqjHCOdaa5TvUM9+ZhY1KsQYVUyqeM1nqK
	r+m5a8KfOWLZPm3iKSkvT3WuVc73B/ZyFwkb4eWsAPx9BsmRxRVsvceWGO13Np6Dfr/Q3D4GDNv
	D0lHppdKMuQV0X5kMdUDHHBy5eGIOhbH1aCwgj5gRRHf1zGUVDgqK2GKy0zl337TOMjPcsWjhRJ
	M2l9eVdtsZlWQCYkvapafr2a4+Kg8t0i1XrV/q+RjzBQbljzElE3qmv8YlshCmlu9SzSDollM3J
	34PMDCeLh6tP+JuoZxPxeSeBJrPr+UZwgD+3gRGIzAIpjhql/G47G+aAkW9n0oPvUGoCcFejFxj
	U=
X-Google-Smtp-Source: AGHT+IHKflfppJ9fE4B/jxYw4Ee0cwdoj93J+qONHoGq9+fPDTkw7v1R2iIj+5ReVkBMNZS93KUhOA==
X-Received: by 2002:a05:6512:308b:b0:591:c346:1106 with SMTP id 2adb3069b0e04-5945f1594a0mr2128941e87.9.1762766123168;
        Mon, 10 Nov 2025 01:15:23 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b76f4sm3852006e87.73.2025.11.10.01.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 01:15:22 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
Date: Mon, 10 Nov 2025 11:14:30 +0200
Message-ID: <20251110091440.5251-1-clamor95@gmail.com>
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

