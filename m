Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA8972639;
	Thu, 17 Jul 2025 14:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762124; cv=none; b=jr+XbzJ4pJ6oeJNAvixJDeXNEizJiCR9sypHN9haNH+Dt6Gr5evUudGfEuwZ55CyYtEjkT6Byz+0f9jrgjogBwUEpl3FCLhRU2QaGfc4LcLwBCuuROUVCdCAoSQ1pPMFvOpcfrlC6G8xP+VSau8TW+t8Qa4PbiuWWOlctqPHG+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762124; c=relaxed/simple;
	bh=DTG0d6srwYuZw11HXVSrISSlverDM3+dZg5dZOfkCs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jOFq9rHMONv2aAbwfJU5gpjAxHKTkPwpe05HCJjQi76yXMYPNWsWnHePxuYEoPj4xOr6E4F3r3PWdN2APdEG1o2Hy/rwIpFobxGC2gZvjaoadR1LMa95c/aHwJ0/nnnSv0gWY9QTx5gvHEehMOGrJyyfn84KjdsoVvwzg4TJKsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mu+fOwCX; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mu+fOwCX"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55516abe02cso1052000e87.0;
        Thu, 17 Jul 2025 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762121; x=1753366921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fzV/r9uQPwH3fg/E4X8ZbrbeGCJOX8rINpZLXDiidxQ=;
        b=mu+fOwCXQ8FI8XMD5mIqy0iC7lL+0+6fIPeCTuXa9NRsEkfjMUS2q9yDiy25RtK84u
         shtuvHbxw9GibYrr60jzUN3DtM4BOJklhoNKEeEQhrvf73afdZ83nnpDUJUjdnxKq/vF
         6b1xNknjW1oMzhC7MmKsaDxZq53uXcTthxcnXfsWJOeHmNCL9RMZ/iDRKOMovUuLvsT4
         cmuuxheqq4ze2vUlNLyd6W75GZ6PlQsvVnwzZy6UgUUk2JLc1OSQir3ou1iyMoUWXYAr
         ir+JI1BOSOsXV+8cMYQ1RB50N2DfHt0xaTYs0FHwSKY+1JFsZ1UayHt2hgSB5ckUg+Ne
         R+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762121; x=1753366921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzV/r9uQPwH3fg/E4X8ZbrbeGCJOX8rINpZLXDiidxQ=;
        b=HtiwB+rzbqcajodFQlhW4CNeS99mclGL2mlgfT0Q0XnV9uZVTnhT70T+8TGYJt/RTX
         GPeif1BTZYC33D4BwQsT/laUvAK+QF8ZhlMArjCKNOr33A3D3wzrdwvXbSt0LUerM/b1
         vP0siibC2NvPCqobjODiYJVvPsz2PUxkuymnj/wJ4hokSLxVvOorkx7Y6RGXM7n6hKCP
         GNzaKEyk4Qbr2Va+orBgKKvPt3dQ+kzRbvOk5Up+byJHzBti6igSbkjaoXbE7hYPv8hn
         BC2IUq1ouPaYIpV8fazcjn/xP8738XZclVMx98UrTuMR4Q9Ys95CM3qTreTGYKnygd3H
         cP8g==
X-Forwarded-Encrypted: i=1; AJvYcCUD3csJwQP9Xz59ea0sXyL/H/hsag/yBTED39X4yNGaDaxEDmLlsmEW379QAQyV1VmEthaE1rnaJyV3Cbs=@vger.kernel.org, AJvYcCUc3FNQQ5wVBfOFzFPMXAVUawqtv1BG4qJ04k1hG7NT06THotKYRtLkTUNHMxwh17gYaVvvN1b1Ktcv@vger.kernel.org, AJvYcCX0d678E6zpEKIZqsmpZDMGi66EruhYMeGrPhGMuBbg8M8sqCqOqwpXEQP97dsKlwx+hIjfLoLX1B2m71ze@vger.kernel.org, AJvYcCX621Z1gd03c+0xwu1sItfX+gRfgLnkTIyaXtNslWcTqbUPFcNipWDa+9HJnGUSvDPGN+v6Fiiq7nG6@vger.kernel.org
X-Gm-Message-State: AOJu0YzAqQE1UGr+F1oUoZucKq0TNXY8X4FTtEJgQRrfSrFTixjE07u2
	1XJ+hC21d8TXxeaAF+RjpgiLD0w0p2m7qrkOlmEemoQeRzq3ai7Gi4kE
X-Gm-Gg: ASbGncuJn/i41P8v7APXEdypJb06ueQ6/fTYiaEb8yR1r2+tjQHr8Hxf2A1T1bWDk6i
	FIeG8ml9VTyXDpWcUQd/p06/BpDcjKmEQjkUc+j1HeUOJrSdXG833O5+B6dV1Nz5UtVh3gYOZDM
	AjckEYrHOo0KGKAjwRWYT749X3ZzIMPPlOgifISnRnAb8LymAe0kWxTZChvzDmTQ6g1j0pwqpbl
	MNoc9JhVy2F+s5xsVGHPWlgliJ+r+s/5gS+747ks4i9A0XsgX+URxoc7cW3VAulosJxGsLlO0gR
	o9CFSH4hUzuoH6ytjbTGpkbDLW4MDXNsm5dppQaArJSzrrOUa6/NGdoX4KgQaf70iLWs6KDrpTn
	GtPO8bVioHHxiLw==
X-Google-Smtp-Source: AGHT+IETVuaIe0yIblxMsrahFaAnGTb5KS0kw9IE1R3XPGpMq4J2+RHE3rnYN8FwOfpJSG6kzmwHbw==
X-Received: by 2002:a05:6512:124d:b0:553:2308:1ac5 with SMTP id 2adb3069b0e04-55a28c92645mr908636e87.4.1752762120941;
        Thu, 17 Jul 2025 07:22:00 -0700 (PDT)
Received: from xeon.. ([188.163.112.60])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b61134sm3079983e87.162.2025.07.17.07.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:22:00 -0700 (PDT)
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
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v1 0/5] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
Date: Thu, 17 Jul 2025 17:21:34 +0300
Message-ID: <20250717142139.57621-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra20/Tegra30 DSI is quite similar to Tegra114+ apart MIPI calibration
logic and clocks. With a few minor tweaks, existing tegra DSI driver
should work on Tegra20/Tegra30 devices just fine. Tested on
Motorola Atrix 4G (T20) and ASUS VivoTab RT TF600T (T30).

Svyatoslav Ryhel (5):
  dt-bindings: display: tegra: document MIPI calibration for
    Tegra20/Tegra30
  clk: tegra20: reparent dsi clock to pll_d_out0
  gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI calibration logic
  gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
  ARM: tegra: add MIPI calibration binding for Tegra20/Tegra30

 .../display/tegra/nvidia,tegra114-mipi.yaml   | 41 ++++++++--
 arch/arm/boot/dts/nvidia/tegra20.dtsi         | 14 ++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi         | 18 ++++
 drivers/clk/tegra/clk-tegra20.c               |  5 +-
 drivers/gpu/drm/tegra/drm.c                   |  2 +
 drivers/gpu/drm/tegra/dsi.c                   | 69 ++++++++++------
 drivers/gpu/drm/tegra/dsi.h                   | 10 +++
 drivers/gpu/host1x/mipi.c                     | 82 +++++++++++++++++++
 8 files changed, 206 insertions(+), 35 deletions(-)

-- 
2.48.1

