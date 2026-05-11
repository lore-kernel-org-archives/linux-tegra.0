Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386703A1E9E
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485570; cv=none; b=q9zp79ylDR6Vd4NUlxwH3VsY+6aPohC3amy70M7/6r35IJ1ux6rLHXpshKxvk6mmXrbEcpqnI2D4rxFcLKZLX8TwI8i9clHV/auf8ymWjsaVlqF7kqJ2/MjZpFM7S/KNVuy/M5VnTSybr4SYB9jB0ElBCR5uGgKQXdhrHYe7WIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485570; c=relaxed/simple;
	bh=c+EH/hXRJdrpmjmHibfkAOD6Pb40AA262yyOb7eHym8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RpBO46JtLz/V6xbSwLaxPigzeiPtaTwUvhnaOEeWd8RjjjqBqFMqil5TyruXAw/zb6l/wISUAuR1K/9gqpNHp/mx2uzntJ3lar8g3AHpj6fYP/0tgjOuyivDop3FMSC2lHrNv6YahrIcyVLCSI8OKaCRB9l6CFrOJ6SFEU6g/Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qcIC1GQ8; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcIC1GQ8"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a748d5ece4so3796290e87.2
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485556; x=1779090356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hQSj4yb9M7hPwSpBxDj8hHK3jRimcbsKCK5DUSyRAe0=;
        b=qcIC1GQ8pucBYrQYfrU3BseQErBW2g4CjGFrqg/ZHZF3FeoaL3UlobYoEqbFEjODIw
         lfvoFnUhjblwGuH/3FVl3ocr5N00YViBvQIUd0Pg/eYmS+9vuz8OghkQiGh6gYsZU5MD
         NxYgd4zn19+Kh2tOYTlQxpOPavxx6fRYtTItIbfbUbzU13OPnb3NcL9FilfjGteTdjZ4
         0Pl9SBpvM2Tn2zavntGCjePeyF2Oh7UGdBzeAzieWnoFTGv147c2jAzcK9TBmg3mogx1
         sJrsvr7ZeUwY/Yi0wfIQz7vi6lGv9pC5u68Y6wKPcDqCnj7mFDv5e/HXkhMdyuMIm79l
         jpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485556; x=1779090356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQSj4yb9M7hPwSpBxDj8hHK3jRimcbsKCK5DUSyRAe0=;
        b=VPCNWthy0022vFJpWQTbEcKe2KFbqjFtX6Lj2ZwSV4rur2bs+7k8aGPyajZjtXD16h
         xkr5hoo3Ug1SJVk4Ji9pItvH9gp86n28CMFcSLdgHHZGc5hbiLlpo/RiqcS6i0sq6a1J
         vyTXhj4oTyOi6hkW4Fm4zP6ZXnMEAq/WjJin8dC6FFPRe3VvJ9EFSQz4TWLYM8mQ0NDY
         uql/ZCc3naSE1F5Al1r30thYcpmxFNMDBrQ1QfXUo0AP5g7BbMl2gvnLPNs+JgEMuncC
         r0s6pxuyDYIYPIMBXyz8Kz0TzYell0J+5IPUbervd6NO9XYtBwD2oEKkfdXSofyynsg2
         ev8A==
X-Forwarded-Encrypted: i=1; AFNElJ+gyRVgmpsyMD7msASkXROzd1Zos/N0UD3FH+xW9MUijotEKqNklNRCiAc9ob5PVwpnhY7y+S/LVffR6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYsWdTgBbf7g6RmVupX8G7d3JCPWxRsS1e2aiMt8hLVT+KcRiy
	bNEUwhaHZ+WUvmNBaTzcn/mRnmilUzhuPVOuN6+qbzSDp8t7eBu6pH/R
X-Gm-Gg: Acq92OF02hpcLsnk9hzOEtFr8D+sVEZXGTn8H/XxQ44N+1gMk/NomrePe1/ua1338A7
	6fMhy8ue+MePqmQL4XMCxkMk5DXbfMgMdskKXV+G488FuXNbEK7j15Xsevk5f13BPj5Yf+bE7Ro
	B8ZigqvOKUrk/TyUkvnDKP/gtYFrHAV5YGRXh7KJ+IDD8l6QbXXF9yB01kARd+k+ExTFIzZE8zo
	8iG7D+LLudawItnruDltve/8X0r+T8vzX3aYJU27FCATOfM4LqVm0+nkdhS3yjCfWb4X+kUsScR
	1W0FnMauKMAcJ/Y3ggRHN58G0Xca+9rv0TFMV13jEVBAPsSftG7gy35H4XbZF7XjfBOwcEnrLsX
	9DEJEd1KjH63CN6tSJfAyDIeLvthtKnmw7LX92Jk/6QEwqO30Czl3fhHbIrS5MuBtfcFRyEuDET
	njnvXfKSx8CFVv
X-Received: by 2002:a05:6512:308b:b0:5a8:89c5:2bee with SMTP id 2adb3069b0e04-5a889c52ce3mr9201102e87.39.1778485556237;
        Mon, 11 May 2026 00:45:56 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a952705asm2404394e87.32.2026.05.11.00.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:45:55 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2 RESEND] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
Date: Mon, 11 May 2026 10:45:35 +0300
Message-ID: <20260511074538.24563-1-clamor95@gmail.com>
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

Changes in v4:
- switched to device_get_match_data and added check
- added comment regarding Tegra124+ quirk
- adjusted commit titles and message formatting
---

Svyatoslav Ryhel (2):
  drm/tegra: dsi: add support for Tegra20/Tegra30
  drm/tegra: dsi: re-add clear enable register if DSI was powered by
    bootloader

 drivers/gpu/drm/tegra/drm.c |   2 +
 drivers/gpu/drm/tegra/dsi.c | 126 +++++++++++++++++++++++++++---------
 drivers/gpu/drm/tegra/dsi.h |  10 +++
 3 files changed, 107 insertions(+), 31 deletions(-)

-- 
2.51.0

