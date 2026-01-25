Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6F2318EFC
	for <linux-tegra@vger.kernel.org>; Sun, 25 Jan 2026 13:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769346825; cv=none; b=ckYZZvqSL/J2WrTlMC6k41etNQ8j6SMKDXCKXbOudgi/xe6i5n+ZTe9SmDIUc7OZgjfMNu+ncYiqRWX3SSwwtviBetJhcqFxuJCCul4zvarc9KhmNkRCLGe/1h/0G4De6J/omxDDpBD5C59ljru87R6CUwbjj8W3aA1ajg0/jwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769346825; c=relaxed/simple;
	bh=UxIZul5b9k6wX+J6mmAa4LEpSyhDvyYb/iVOgYelMpo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VHVCVDTTAJcqH7s11MkUfhtLy/UOse/Qhj0m6ltdrYaNDu+MK/3ddUsrEKnXi25O/WCUNrGb4c+a7ZldXgCk2AZRpQ9+/SVCxozW7k17Aqv+lnvXH3zGCS+UhAA9Mq2anMu5201+TSpsBesUFWqkjyyQ5KU+Q3pPFgdQPKIG06g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJCTUkS5; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJCTUkS5"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43591b55727so3523381f8f.3
        for <linux-tegra@vger.kernel.org>; Sun, 25 Jan 2026 05:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769346822; x=1769951622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4KsQRxljgKgvfvUj483+iZhYfCZNJIcI9LKEpzOIXw=;
        b=FJCTUkS5Z64/s4QnGH7YZudoGjkzd2noPPFUhvuTwBMG1+iy0zqbZ/6HR1qPcROlRv
         LT6zbPa1MKg0bGVe0uBbVaqHZxXFiUmeUGUVPGTC2D2rH5MD+hSHhh10O5TfAu2uJlp5
         nIvXjTS/lyEVx77//XJ/dqeAQGkUkPwbHPQlweLXqLune5yOT/aBr0yeQmBWrJmFlYhA
         RveluetmuFECheaRnOBnrjHyawzRa+wHosIcm7c0s1AY+4HNAciGyhLH1H2Q6pO+rYjC
         NYSeapyLVzUfO8c4NuxN5f4XpAP0GbPD2ayis73xqkvkvV+52sUmmSdgkeuK+YDz+gkL
         sbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769346822; x=1769951622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4KsQRxljgKgvfvUj483+iZhYfCZNJIcI9LKEpzOIXw=;
        b=qohSkQYaK6HWgGH3twm+1kLipcUkkqTEHFJgY84wjwXdhtA+EDp3ClN4w+r1X2O8hP
         tkXxtcn6p89iQ6OxoTZYXmLprZ2jbQdAnbURKDdNzy5QO+aP/v46dBoRRX47hClaMZFM
         y/Bq7sDs/1G5ssyqWK4GvoZt3uhdRXQJbAOK/9l+7D9f9ACmta+MvqdqH3ooRhb5Sbs9
         T4+qsqgO+gJYDqcfTXxwiaDH/p5CO0lx3FuYQUjx+BpVcmAN/I2C7eS0+RW3DgXwRFmV
         qtabHSU8Jx/vt7Z19bzlworDrTWidUbsVh3oKwlGEWl+RcOxpz5NbMajkaSwr6KZ7920
         aWbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEs5z2HzZpJGTa619MG8O0GWIxrqn3+2JCusgnyNGBGLgz7Ju7e4dNt6TGnyo2ETx9+Nryp5C2cqXF6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+IwGy+xbgnMZMxQHOxhlm3uteBD9r0VsRMByg7VNxjJOVEu7m
	NU3q1E/Gkhf3bTzUfNQyOa8n4pbnwX0bevB3uUAp7NO3Vawgg+qUzuzK
X-Gm-Gg: AZuq6aJ3j3Ry92+m/1njkroxlwOQKjs3VgE0Hex0ZbTRMwDQ0Vhq53W+cy+kyTDwkez
	pu/blLAcbJcr6QDeynwSz8DV0LNl+Ky1wXP2lRgsHeJmq5XgXY0J6cPdusm5+8uIU+QpbOct/JS
	+13vosdp3AZjk5YdbMFf/bqKAT1nMwHfWFXNNsyV5qBR5bboZoYp6gNtUUYJvZj9+t3T6NwVLWD
	4vH52/RF5EiBU3swyNb8RR/cJ5kyvQKVqHabz00PqbkXUZ6ef7G0kLkz6lcmWr/ErljuRJ+nbJ3
	8os4mJlC0q6i0I88X3rBoAkiTGSHWApz5Pw15I7nqycKEnGeNpDy1ChbrdWdFaSx3UbMUehoYim
	7HNMuZAhd3p72NHPV3LcgBJ2GmV8+Mj73cUqzP0nEdJ0KAtqM0cFl+qRE10dHiTkIalBc3dzY9u
	P+
X-Received: by 2002:a05:6000:2886:b0:430:ff81:2961 with SMTP id ffacd0b85a97d-435ca39ba81mr2485783f8f.51.1769346821609;
        Sun, 25 Jan 2026 05:13:41 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm21958244f8f.12.2026.01.25.05.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:13:41 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
Date: Sun, 25 Jan 2026 15:13:21 +0200
Message-ID: <20260125131323.45108-1-clamor95@gmail.com>
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

Changes in v3:
- switched from version DSI to boolean flags
- added comment regarding Tegra30 clock configuration
- commits were picked:
  "clk: tegra20: reparent dsi clock to pll_d_out0"
  "ARM: tegra: adjust DSI nodes for Tegra20/Tegra30"
- commit adapted to recent DSI changes:
  "gpu/drm: tegra: dsi: move prepare function at the top of encoder
    enable" > "gpu/drm: tegra: dsi: re-add clear enable register if
    DSI was powered by bootloader"
---

Svyatoslav Ryhel (2):
  gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
  gpu/drm: tegra: dsi: re-add clear enable register if DSI was powered
    by bootloader

 drivers/gpu/drm/tegra/drm.c |   2 +
 drivers/gpu/drm/tegra/dsi.c | 116 ++++++++++++++++++++++++++----------
 drivers/gpu/drm/tegra/dsi.h |  10 ++++
 3 files changed, 97 insertions(+), 31 deletions(-)

-- 
2.51.0

