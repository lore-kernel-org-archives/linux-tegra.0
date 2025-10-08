Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590712F39A4
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 08:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759912122; cv=none; b=eR14MGPEtJIfj4JSifkUr0b2ydNzlcGwx3NHu1+g2r5zW/zPgDBAIBum7Wyjsv+XcumNrQ2Ve+C3WzNphBr8CjzevDcoXAQ3gaRttUJY5yoJOlp5hNuqvi7XZgP4g1MuZcVquYgVJNXisHMEq54mLPqcgkQQv4SubZ+ZcRKMq9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759912122; c=relaxed/simple;
	bh=OKK/sJXtOy2H/hU/K2/b5lACA7f2zIZiTfFC5Kd2Tc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N1q0srqlPPPJI5zfKgNDNWpLfSWsM2PcteIoLRTtnF1vvVPU4tY6zI/cX1453kZD+bjp6VDyP/7hKzFAx5PGgPHxLBBSC3VKTny6lDbkBSNWrjcra68qsSwEif/n67hBovRC3zIUWVCd9QjJiH1l07ER35YS6mtdwMfWcw2Mh60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9LzUjXL; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9LzUjXL"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-375ff2b3ba4so15303561fa.0
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 01:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759912117; x=1760516917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WDL2+5qpXYINNhwEmiyG4VFEg02NXEqwf5yd4xv3H20=;
        b=i9LzUjXL1gpkHUEQ26xLyQoy2OafwgKN1YCpqh/WCgTziktTfNQwGuHaEvv/2jgUGW
         DCkJ9Ohvz7OjaPqUzzyqsJB1vS61hkBOs7zu4/VY5ScB3GiMdBkj6D80u2ZWnvqpYFSl
         K/hEYTW5Jrnrnl+f8U3d8eHqbuaeVovTCG54UAUBFJbftY5bGnJGnNIHMExQDkme7epg
         MpRN8Y+nAhGf2E3Lh33TGIOJRks9XUnLlrMRNUBoyw3l1VeV1myDR6G/DEziQJuSO8bf
         wR2Oz0uwTn/8AInYk3rmk6oTnt501blIIP0BsgDAbmo709JaM4WB//sT2CFmp8afGtLK
         EA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759912117; x=1760516917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDL2+5qpXYINNhwEmiyG4VFEg02NXEqwf5yd4xv3H20=;
        b=tf/6q0oeviPdfANQzL73xyeUTQQj3L10RBOCPxpZE3b+MyvoGZ24cwKJ9d9+Y2kqUP
         9mLuZeURBhkiFIosMbFaUFl1h42Qp715IEW90Fl8VxiSLJgMBUZJSRF8lCi0F8BHzON4
         dCYg/RXrKT23YvwyDkwU+VoL7V8a1XduLUFJeJm+ILwbY9Ll8wbiGmTTofjbR9Ncz6W0
         A670x4VAKA75inTISjS+LxByMYrlQZHILm87qnGDEni6gyU3jEQp1PBIjkEkLZQnZ6eY
         MFmhw1nh1fASCd6JiXgHN4P2g6f1oRLk0s1Pufni/Id8KQKkytoWjMq3KrjHD5SHAyMx
         0jbw==
X-Forwarded-Encrypted: i=1; AJvYcCULavCA+agQbCCgwizTXeSDlGjVfe3j+fF9duOmp2WJ99bECzm/QmQxC2gPuCX51VOPYmtM/DktHjF4sg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys7NnCzasV8mU32MBOW7mRWlXv4Cxmn54MuVyHnqYAPOAwxV06
	dBCzMz9p5AvqlmRRb6+YHYDp/AUrScfoVUnaPM8VA7pZ5gNs0DnrMDPu
X-Gm-Gg: ASbGncttFlikkRZA9NVI4nRuB5ytdFj94G8fzOh2Sz9ZX5RpSV57oNvIdl19v1yNI1u
	/mokxJDYS7EoBm70b8nNbU4/YKZMRq/RIVVrKvyR/fSapTUFByS6b9gi0G9MV017xbtlIQVyUbG
	qNg7x3QkkKXQ3pFBVDdG+qBMeSxXegaQJl3dZXGhiGG3WrMmcvWxkr4a19E/w6HQh4un6xzZmfs
	yx1LZeLctkKKlavtJRwfZT/ZMe2zU8wd80qaI9FemES/Icb5GOiq9QNAtzdSQ3QYq1dubrvP1g7
	bD1kleaEIzDHVG7gLqCJwgWuHL2OC+DsefOJx686KPmxvaZGOs0M9hL1tVP+w4QiwyKoT29HKKE
	RhmynvWDfGr3TxJ8eLZ2efh6wK9IJBpOjBZwVmA==
X-Google-Smtp-Source: AGHT+IFQxyHSbODYuzrHx4CLDnLSfhATzRQS4eJZQ4bwmDnpLeGrbfUB1YUBpZ6Ww46Qx9cA5lS5uQ==
X-Received: by 2002:a05:651c:2210:b0:35f:246:a751 with SMTP id 38308e7fff4ca-37609cf7d65mr6119911fa.5.1759912117289;
        Wed, 08 Oct 2025 01:28:37 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124649sm6968733e87.15.2025.10.08.01.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:28:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
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
Subject: [PATCH v2 0/7] Add support for panels found in various Tegra devices
Date: Wed,  8 Oct 2025 11:27:52 +0300
Message-ID: <20251008082800.67718-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
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

 .../bindings/display/panel/lg,ld070wx3.yaml   |  60 ++++++
 .../display/panel/panel-simple-dsi.yaml       |   4 +-
 .../bindings/display/panel/panel-simple.yaml  |   2 +
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts     |  13 +-
 drivers/gpu/drm/panel/Kconfig                 |  26 +++
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c     | 184 ++++++++++++++++++
 .../gpu/drm/panel/panel-samsung-ltl106hl02.c  | 179 +++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          |  65 ++++---
 9 files changed, 496 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-lg-ld070wx3.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c

-- 
2.48.1

