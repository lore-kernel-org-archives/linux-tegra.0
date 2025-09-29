Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEB825B1FF
	for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759155924; cv=none; b=pALGcO2EZlKLq+NaFSgAHTtoZJj0smwsJET/ofvqjZ9lO2hXOr5Bfb6CnI/2l+7/edx3wJPpFu9tlBUunH8miuAM5dJ23fz6vgBojzVANAxoIl5qqKua0r2yNl+rLtqK+gsy8NKob4ZvZqxDuPVkS2EGEA+icN8JCxKSPCVmy8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759155924; c=relaxed/simple;
	bh=K85rkuCudYsXP5pYW/dzKbInwqXPQwsVrWQ5iHSeRC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dxthOoug2fHQVY1TnXT0j600HC+vL/t8RIFQWbvAM5TEQSCZQQGB1Qb1RoHDWAId+hXmQmGytiFr0xRvPdk9jLv82w+FnOL+Ojk7RproMmHOGjnE6bs3ZgeeTQuMJlYkpomfEBzUaGjwYACDen1Jg3tQQK/zpa224ipmNz2iSpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jguj4Su+; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jguj4Su+"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-36bf096b092so65659041fa.1
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759155919; x=1759760719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DPPg9TIoZPnzthQd8E1VwdjwIEaEjaVDMMssW2mg+cY=;
        b=jguj4Su+0loOcNAxNNxH55BAURnQfg2SYpHWQNmmQkSF0DVfime/13OeHnO7IWK5GP
         4CWHbvDOwHLKk5ZfpTkQ8rrLJUat2Y4PRZZSPbm8739wIAbWD8KgAiLns96yYFtuBcTj
         +H3l6deLYG5MTMzy8wJkeYPzJFCc+4Jumk2r0boyTpTkX+tWyzBmj8vQsIMJqMIgNyxW
         nlumtuDXW6Zupae6ugyBlfQ5vc74x9IKxVv02sxaITPBAh1UsYZVgsXSK+wHyn9QZcGj
         laXn3e+7WwJWrW7K47NwUSm0FiMMYI0H0BqhHCXkEQs7fyhYd2uKoAlUnqQ2eZCMSlgu
         Uspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759155919; x=1759760719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPPg9TIoZPnzthQd8E1VwdjwIEaEjaVDMMssW2mg+cY=;
        b=mvq7FqKQ2sFMnPoXy02nVVaNVtt/q730LPXyUGlKqtIJ1GtweQJ8Is20dziLKJn/hr
         2+lIjtNAvCoc/gb2COzcJY0Y9KTya7YVBbVsN4pjkBDwYKEABNyzkKHCnpbCNBzaj7JK
         +6lnhCl7CCBUL7t4bISjZwTorse2b+xHJgkqfYr26A1BtZAerAtPjJFMcWGtcibPTSsM
         eXW298cJL6UY7LrizTb6q5yLw5ck8aNr+EMF2nNs21XWBUzzJBPBlnBLrJHanS7vd4Mg
         bjDQAK3gI/4Om+tfiKI3bxfHc6JPwKriCOpzMON8lBTBFpTfFs+yRbvjmI1oSiy3rvww
         nNkw==
X-Forwarded-Encrypted: i=1; AJvYcCXPOsii/twiPscFyr7QJHNE01e/ByaYJGZTsSIMmHEDtuvkeRzyht9migcFg4yYClIiNkX4ENwyHgxiwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOORHuNdKqsMZO+1iUZ+lo9lEXsgu+XiPzD6L2bNkSgqV7hgQy
	FZkp4pNtN84aaTm95/mZu8iMEHBflV3ljms4kSL+VzlpLRy3jmo59Vkl
X-Gm-Gg: ASbGnctoLuFStw+ZJ2PE+pGVuHLc8wAfEKypMGxEWfYGRswlS+AywpRrTcmnWHWr2K8
	L/oH02GevrfLx805Q2GhXZcsj062cYh1Ta4qdwiO7hyX8J7s7iZWuxc7x6/UioypAQl7Zc4kVB9
	XKfLmvSKPUpmHZTurc8dOEs25aYPUZML3leajTmv2DLmf01v99RajFgkendHim+WmbjJmgep/50
	3kr0EcO4sbYeilgaAiwUayz7/KX6OEdmuye/X0VKSIZqSK5te+MtQ5wYKParXJFwiJ4E8pOcAsv
	3IAuCBMIsg8R1XR2rkG0vjE0vBS1qyzZhsdcMVvGCoJshbDFcNe9A4F0Ax+2KIet5u1mkPDjqKZ
	ozzdV5As3KtE7Ykz73wZmrx6z9gTuXJR61vE=
X-Google-Smtp-Source: AGHT+IHxDGpQBwuQkWcBRlcxN2mP+i2I0/l8+XNF8RRMmqOhDyFCD+mEDRiLnbhKmmlYr8NSnFokUA==
X-Received: by 2002:a05:651c:1986:b0:36d:755f:a6d8 with SMTP id 38308e7fff4ca-36f7d2cb85cmr46262991fa.14.1759155918449;
        Mon, 29 Sep 2025 07:25:18 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3728c23e6c1sm13201001fa.52.2025.09.29.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 07:25:17 -0700 (PDT)
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
Subject: [PATCH v1 0/8] Add support for panels found in various Tegra devices
Date: Mon, 29 Sep 2025 17:24:46 +0300
Message-ID: <20250929142455.24883-1-clamor95@gmail.com>
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

Anton Bambura (1):
  gpu/drm: panel: add Samsung LTL106HL02 MIPI DSI panel driver

Svyatoslav Ryhel (7):
  dt-bindings: display: panel: properly document LG LD070WX3 panel
  gpu/drm: panel: add support for LG LD070WX3-SL01 MIPI DSI panel
  ARM: tn7: adjust panel node
  dt-bindings: display: panel: document Samsung LTL106AL01 simple panel
  gpu/drm: panel: simple-panel: add Samsung LTL106AL01 LVDS panel
    support
  dt-bindings: display: panel: document Samsung LTL106HL02 MIPI DSI
    panel
  gpu/drm: panel-edp: add AUO B116XAN02.0 panel entry

 .../bindings/display/panel/lg,ld070wx3.yaml   |  60 ++++++
 .../display/panel/panel-simple-dsi.yaml       |   4 +-
 .../bindings/display/panel/panel-simple.yaml  |   2 +
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts     |  13 +-
 drivers/gpu/drm/panel/Kconfig                 |  26 +++
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-edp.c             |   1 +
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c     | 182 ++++++++++++++++++
 .../gpu/drm/panel/panel-samsung-ltl106hl02.c  | 179 +++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          |  65 ++++---
 10 files changed, 495 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-lg-ld070wx3.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c

-- 
2.48.1

