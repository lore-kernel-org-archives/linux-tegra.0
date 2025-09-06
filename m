Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD9D2877EA;
	Sat,  6 Sep 2025 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757164638; cv=none; b=q6NuLzASw0FER+NjATGSw/Z3XxWUeMQFkBRAV9oHAuMc6ETi+KMU/+j0tF0Gx9zc9kNf2LWfcdZN56bS5XwxWO1cTly706BKUf7nWee6Bu3U/hIm0q1SFq1OLB76VhEDjOXPBz7H04sYictqWQ6mogE3oTpLPtaEYcwT2UgL0gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757164638; c=relaxed/simple;
	bh=o9IcrFnimv7ibOLrNRYV7WuA4rm8uS1dfW5VR+qdcDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PMToz+lSdmZ3LBeAX6d3V2ee5zOxYPSdskzVRC7SzIhuwOO2l4RwWDigkvx4VUT+pkulac9FN10pGTiqIyiAg3bn5VgUVBx1aQEWcyGy0o/X9Ew/+0V+jnEtTxi+++5BXF/d70XfoAIywXndgj2RjAHcZ4tWXYG3mIfWVMGJxiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/kI9R8o; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/kI9R8o"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5608bfae95eso3355361e87.1;
        Sat, 06 Sep 2025 06:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757164634; x=1757769434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5cPONIgu6mzYa/WMF+RelFJ2K/lRyJPaqEbFSvDOqU=;
        b=e/kI9R8oBRSh2GAcbDQBRtuqa1ofI89Lb14GlNrfgTEQ1tL5zBU/Ts+t03ohPzMPkj
         6dScjHsUhAQ+BHLt1tKak1ccTkbqo+Wis3T3OfBidXkfVjwqXTs8kiH0YDGZtHOFsyo1
         cIL9BFyZmLuoy4Li2jVn1dHlNfZNR3fvWWZLIQ1Fr4Jy8kd0WdnP+EQYwi3hUEOASUtS
         6PzTqrSl86CikswjcvOwPn5xyj5H4jKYl9eq05Mm5UWUyQAqLchGlBJgFBmd4dAjoGGJ
         DTGnhWFEoCKVFcqoEUBeW7guDICC10kZshSNrpC+xtTqkj89LXkcjReK0GhGBk5KSMUv
         a1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757164634; x=1757769434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5cPONIgu6mzYa/WMF+RelFJ2K/lRyJPaqEbFSvDOqU=;
        b=Jr+5tnfujSuIQJzSOyfJMo72Xx5dJ3LWZHEBPMHATj8smzxg6GWTGDIYhgA1xvlYYL
         O34KFDB2oKDhtGZYxq5nK10csSZgtwGo8/U4IMCo8HcGoIqclb712QXjrLxkMlQg1TYp
         MneH2VQBmPoqyyj/JHWGk5dZjSDjp06x1JeltQu8itmDN7rWjqP6x2m8Y4Rsh59XqIaE
         jQIA+8EbmvlL95efNxjGMzpIOK5GZWZe28YszUCyuJulFgJCO1TSw+87IsilUMtf5+P3
         06OWHQw3uffDFyQojWzTkfKp/tppVctCmPgICQ67xESA0symyYidFYJvf543mafPZPyo
         5e/A==
X-Forwarded-Encrypted: i=1; AJvYcCVbAGXUUD873yToQVa2V4ZQMBzzLZP4JKx5S/lgXlzmYsEiw6gQI1rz2C00mhZyh/bebIqgQP5+H4w=@vger.kernel.org, AJvYcCXrKORT5jFKyazkPfPusz/RR42+7UmzgJpllJuGF28ti7aux0UaUBxUJh2EunZ/CLaNv3oZncCIOIvHhR/Q@vger.kernel.org, AJvYcCXuax2z6Gu2khUH/pwglMj0KHD19Ys+f2LZH7cbO90BGpF/Pz+lJ/jclP2w+Vt2YeneokK9Qf9kPIx2mTo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6W0OORc0lr/pWj0TXR7ZE++EhpQUsWLQ//DAqn7ZU+pHybB/k
	CR2RpS58o/ie35OqX8gcic3e/zCM5GTAv4cN3yLpIlwQ0RHs04arAvpI
X-Gm-Gg: ASbGncsmKS/5Oj9ZKYjXV1DQktYovV4XzU13AzMQWSmm3q6RmuIjprp7B/mXEK4Xm3R
	XZJ6FLxadJlH0x1QQvyBEpCZVRrgCpPTtJLEOCQqSF07lBqY+Y1W+yAbKCjPFqFdR/IiTC8S53h
	/XnE5T6dLZo0QVygBqv3T+JuwYhjDf+RRFOSdR658bnyB+hP20UED3YfRq7jDC7eT5N3ZtgVl1w
	n0a2TH0ZsveT2b+uXLpvfk/rvz2/lkVYCxwLPZC+bosvGUwGYVMnHL/XNrIIaUQLC0TQr3jTOlY
	iE5kZupVXv6OgBo9CdwM9EhXApHKRqoTnvemMc0rwAznQBy7D7iXYxO8IxcDwNgSbTrKZYUacFg
	8iDPJiqgaJSn+5zh5FE1FP9NH
X-Google-Smtp-Source: AGHT+IGemkowJ9DUUuzY2mYnlqSwBPTYFfnUHammCbEHEEG+j0HPGbQknwWy53AHiTbfVkzNhph45A==
X-Received: by 2002:ac2:51ca:0:b0:560:8b86:75ba with SMTP id 2adb3069b0e04-56261db5e31mr599542e87.52.1757164634145;
        Sat, 06 Sep 2025 06:17:14 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad44f8fsm2312647e87.137.2025.09.06.06.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:17:13 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
Date: Sat,  6 Sep 2025 16:16:51 +0300
Message-ID: <20250906131655.239340-1-clamor95@gmail.com>
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

This patchset depends on Tegra20/Tegra30 CSI bringup since both share
MIPI calibration logic. Ideally these patches should be picked after
CSI bringup but they will not break anything even if picked before
CSI patches.

---
Changes in v2:
- removed all MIPI calibration, it is handled within CSI bringup
- added per-soc structures into of_match
- added fix for hang caused by register access with uninited hw
---

Svyatoslav Ryhel (4):
  clk: tegra20: reparent dsi clock to pll_d_out0
  gpu/drm: tegra: dsi: move prepare function at the top of encoder
    enable
  gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
  ARM: tegra: adjust DSI nodes for Tegra20/Tegra30

 arch/arm/boot/dts/nvidia/tegra20.dtsi |   4 ++
 arch/arm/boot/dts/nvidia/tegra30.dtsi |   8 +++
 drivers/clk/tegra/clk-tegra20.c       |   6 +-
 drivers/gpu/drm/tegra/drm.c           |   2 +
 drivers/gpu/drm/tegra/dsi.c           | 100 ++++++++++++++++----------
 drivers/gpu/drm/tegra/dsi.h           |  15 ++++
 6 files changed, 95 insertions(+), 40 deletions(-)

-- 
2.48.1

