Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31DF2DE703
	for <linux-tegra@vger.kernel.org>; Mon, 13 Oct 2025 05:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760334976; cv=none; b=IhTFVA8X0GmeFDDJdx5cRE2XMWoqHXliKRK8+BAV6IKJ4mfFg05tW8R34Pm+xnKotX36rGMlLvvpvVeEVkg3EYg2ieHzDfscIyGB12IatpW4edBX561vxVIc8weMXK2qdSsra/gOt/cqp2EFLXPQ9hkFSmWSoU58clmZUvAn6Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760334976; c=relaxed/simple;
	bh=AAy4P8dvMHeneV0IgwHSPlPKzVlb7cPq1pIPErAgdos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JxIYtWIMXljRi5NfjDkVaHWDcx2J40y44g2gDknH5sqdGqACyqaGcQ19m1fff9vt0Ivp1jgAHNUZGIbh+iTrwSs/6owU+jQBFA9bkt2MYvnUA8o4R7uSZdG3jZ9SHgtYSdtOOunB91QZUBNDnkY/uSj9jhSMXoNAg0uhszx5yKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6MQksTg; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6MQksTg"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b456d2dc440so632576566b.0
        for <linux-tegra@vger.kernel.org>; Sun, 12 Oct 2025 22:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760334973; x=1760939773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZ9/LjENMEgkqGr3qDNK6DAWAvXersuPBKAH6ygTJP0=;
        b=H6MQksTgLYoYoyDZ7H5vM/njmNIzqe+6uIfT9WFQL/pI0kWfzOi3+YoYm6E/IkhW2N
         MDqcdOKZTkG4Co+ALOv2g83Fg3SyywNXcGsTubuC7LA8lkcdQlhB92cxpDnJIc98g9rU
         faR7HbHDZvYmrs0JGeCtctxMyRAKJ17JQxxSEGtGIuNIFtYRoXGy4m75w+zakycaVlGF
         49lT3Ztb6nZtc33UeKwjEEIkni9ly4wR+BvI+Y4/oy8E8J74OEZQ/jp5NJMZb7rg/UyB
         6jkbmyaCgXb7AXGYNvfViWxk3zUt57omBh6mGVOLX1Lpqd08t88IM5zi8xvLmxGlGnAW
         LOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334973; x=1760939773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZ9/LjENMEgkqGr3qDNK6DAWAvXersuPBKAH6ygTJP0=;
        b=nZwIcabnxoqIoUZWTYl9Gjb8pJx2QyHNQcF7AntgUXe6fNJwtIDZWGzGkWLdWIjDFj
         moiIEIjT8hIKe+9Ch7BGIcD0tdx8PSXunxlk5rqjVa+PSvyghSCWCahjtvZwI+PNLty/
         qB8vwQjwF4PdTjPGRNs7Z9PbHlIs2EJvDkJOLmsRest5RjYYiMPq9461qN+XP0UIY0D3
         w8BEMLilRwPuExqNV8AXqLhyrrkP5MK5L/X3ia/bwloWVVkKRJQkPQH16Fnxt5lxZB7i
         iwBCnWmd5R9k3iSUF6Y6b3pwoO6d1M5QkktHp5R8V1aiwSe2SRdcf8cGcBQZVuuWDNbQ
         jXww==
X-Forwarded-Encrypted: i=1; AJvYcCW5ryAdjRTHd6R21kQBHcK97qAIFy5DfFVmXkGK/dKqVYMqD8HwIDVzB+ef9i7rp+0o4rih6+Btg00zDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5CA7ndH2mrVL/3IQHD9viS6JUvMI5rTl+Jsdi2lTaK+P94rkb
	9Zy+7PbymE6JEtkKLfo4JbSyIYPCfikUqLfYu3B8lRB5o6ZKCxAcFFy2
X-Gm-Gg: ASbGncs36jf6t3Gy7cTiNVyNLHqbDKSpwoipVQq/duHc6/cPDxHgjj1u5N8tvb82wc0
	8edRdFoz0X1XxEpro7Jxdel52mWrTkYo9WO2R0H0G3oCy8wQ/HT2zPVys8WjT9OrR+9ZPCh9yCf
	Dz/yxnaawA4LrPLc6XefNbWYZJ2jZCmuFuKQJwnVrLqP3/wLca1HwnHzQmKUhbbDlBBxukNsjDo
	lZ7Jd2ClFcedxREUv7UUJZxicUldWTTpyXtjLxXapNaVyCqavCwqyhPFflyS8XNQCorm/of3kSZ
	Z4yAXQSTl7wq/xqw9Mmp7+7YGYyviz3c7uU4un3iUUYZworasoUz3bpGLgdC2tVgxQTFB6sH8WS
	1SwGL7m/pLuk01EAQHvsIhPBMD69pDxY8
X-Google-Smtp-Source: AGHT+IEoPPn3y805fRrMXlesV3g+CUW+Q9IgTH2jMMITzvjih1OKeTWGE2CbYjx7Ff9blH+VqEhVUQ==
X-Received: by 2002:a17:907:db15:b0:b3d:b251:cded with SMTP id a640c23a62f3a-b50aa393ba1mr2306986866b.16.1760334972693;
        Sun, 12 Oct 2025 22:56:12 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d63c9a3csm860912566b.23.2025.10.12.22.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:56:12 -0700 (PDT)
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
Subject: [PATCH v3 0/7] Add support for panels found in various Tegra devices
Date: Mon, 13 Oct 2025 08:55:35 +0300
Message-ID: <20251013055543.43185-1-clamor95@gmail.com>
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

