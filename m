Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054521B4F2C
	for <linux-tegra@vger.kernel.org>; Thu,  4 Dec 2025 06:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829034; cv=none; b=Bb/B2LI2UTmZ7c2j7vgRFJxWVxus+FXscOjWcJ5Y7kea3z4uXOZ7i8oUMlpKP1WJ4o0H/ECWG0tCQ/kycghCvEyVuqCa+6qLrUGknnd5WHS1ejT2Dr34/j8a5oBs2PGyNLEdgWuHfaq+ZcwZwMMcM1fS0rrPvB1OiyEYNwOAMks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829034; c=relaxed/simple;
	bh=o9IcrFnimv7ibOLrNRYV7WuA4rm8uS1dfW5VR+qdcDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SXHABeCruBMvLqS0bYl16PGky/D5ENzwo90A0HqSud00+/lEiBnrULLtZXkxzkxk+YD5gLktxNeL4osYz6F4/JQLl8dIHLblPi7T1SyzzvvIVNIR+VoeqrkW561sxkRuGL7GeOJss8oO3Om/UiQZ+/J1qzaJ93BWKm2sj3+3ZxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgxBRsKM; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgxBRsKM"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so959756a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Dec 2025 22:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764829031; x=1765433831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5cPONIgu6mzYa/WMF+RelFJ2K/lRyJPaqEbFSvDOqU=;
        b=kgxBRsKMI227Ed/vvX/GnIK/qV3+r1/uu0E/k3N83xM0cicTTRcq0QQEMs2S3TKmgv
         xVWBLKj+KSvKbgXqr7lwO7KsA7cLIPv48ieCTvq0V2oiGuXVR3VEVqU6FI+uxpsQlHqT
         X8Gi3kGecz0+SHX1PkzVuT/ZCpkN5Z72g6LqvMq4MHdmQVnXWNox3AFyEPRogmL3W8Lx
         v1Vjwov4tl7KdhNpJ/YdTFftvMn+lNN+YOiGLJ3nAaWr93CNGHHHGuxKsCzcotDzeo36
         qPsDoLoFWfeQuReSS0HOg73+/umFn2VDRzo4zKQy2HIb3JCAsAG0X3Zd9vouqriF3y6+
         d/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764829031; x=1765433831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5cPONIgu6mzYa/WMF+RelFJ2K/lRyJPaqEbFSvDOqU=;
        b=QO/Q+Fq69cE9Ry9WKqnCsiqHESn4BftI3X7pR3yCvCB5f/e3Q0fxB7toW5+PTwwfcJ
         kzbX2yKMqhMqcDcfC0K8QDgfs++qpAFHIjPfTLgsh4h0/ibn109tigFrrp633gmTg98v
         2oLqGivuQHpjci+WOec4TNVxIE0isBk4fnAUHkuDPqSk4oqgzXmkB0oDKjz+a1R2h0X6
         O1Xv15eHNtDBzwBjVbuy/NVF3hMKTSLlmisK7L4ilg4Hyvyeld4g5GQb4EPr15Xhdg5J
         LPQh+gZGx9eVndqoPROEpEDUsHvDfZbFqKlwwxTgIimUERih69c9rfDlDYwVZm5EYpXj
         uQWA==
X-Forwarded-Encrypted: i=1; AJvYcCXclkmWPNGVHP5eprkJkwCXLlmz594MsOKdeZ/jRSnN/kIpX0xNhWezba7ADtRMC3zAsoQPmCabwc4h3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbSgfKRfun5aD4vxheAO6+17l6zQI7dG0yZ97NH6a99Nzc6b0p
	rnpCMH2n8q7rpNjvSrm9HLAsPtJWSrnUAW6/wfTo+/ImY7X5O6MzUwnh
X-Gm-Gg: ASbGncvENwMAxWY1XOJNvKuQ2IpaPEJqlvcZ6cEbqf2t7KuFDR8JuEqLHmKktRSdNrd
	qv1H3CVziEhMCDW1fF7XZ8jYXPLKkaCcJrh2c/ng9uVJsZViDCkybE2ALidA+8g9y69kHHyq5Ys
	jKnAv+BRdlpdaYHpnMq4opds0QMmNbzMEVaGX2ugXgliRyIZb40GR/8ltL57dcyA/3iil0m1Xfb
	kVUK6hbmE2yTOVibV7fu6sZKaNFuLSWjuSxt7eA0z+HEfB/Aci8Ton1r7JmRHT7UNa6nlegq2jJ
	IP2mOmWZQQioa7/BbnAteFvN3fQE0c8WUfszjZm+34UASQyMTjewhe7tp3nAMGQ/0HQp4gKeDLE
	r+P9Tfw2TTXA9Mev9Wui6rFCC2F5WhGK35ZFlNx9iE3rY9MhQ1L3gnZuOXMRlnboekn37NJ9lxk
	4=
X-Google-Smtp-Source: AGHT+IE96b/uxsEEqrl87S6Pg6TRMB1JugG4AhVEQkgPU/uciaxk7pEZZBKrlSNBh92a+3pEa9CVUQ==
X-Received: by 2002:a05:6402:1ecd:b0:647:57db:c997 with SMTP id 4fb4d7f45d1cf-6479c4f6d31mr4107684a12.21.1764829031175;
        Wed, 03 Dec 2025 22:17:11 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec2d8csm490159a12.5.2025.12.03.22.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:17:10 -0800 (PST)
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
Subject: [PATCH v2 0/4 RESEND] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
Date: Thu,  4 Dec 2025 08:16:59 +0200
Message-ID: <20251204061703.5579-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
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

