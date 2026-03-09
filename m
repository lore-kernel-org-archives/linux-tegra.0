Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B7F363C5C
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 07:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042793; cv=none; b=YV4lqJD8fQPqA0k0fGDvvReqLKhb2E4oowUOoTx6rTq7B+PLYUg/KarXlXv+AQB3gYWceG6KHtafHUImV+aMdnw7kG61zgrLHFtmME6+pBiEQrpsqR7611JoiJdWR4fkRf36N4+QtOWNrf+WS3eNoluMfU5rEbGafgnRIpr9jlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042793; c=relaxed/simple;
	bh=c+EH/hXRJdrpmjmHibfkAOD6Pb40AA262yyOb7eHym8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mJVX9IZRu3sLVAYt0bgACClvJxQj0UDYAFvugxSEDnl/3LpWxbbKDK1FVPrKMwUxrNYUaCeXT246KUjDSjfNvOYjoCVa2+k58288RG+qzjhqLfr879mD5eJHiDok6o3Nb2iQGaOAO8ewfWGZ3J8BV3YGiolBmjtO+XKTrsSQTC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tig3OXLZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tig3OXLZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48370174e18so69089095e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 00:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773042791; x=1773647591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hQSj4yb9M7hPwSpBxDj8hHK3jRimcbsKCK5DUSyRAe0=;
        b=Tig3OXLZnCgZ3xbG3sNH/zl2iqo6EifR7U/IkucLF3RzoxefgH1255Ka/UtOpR2t4O
         seW/8BHB2tDUwzIWel0OmyeKpkojuPa/wsbIioQ6YVeKDeK5iKhnUmW76MOKpp2LOVbl
         t0C64dXGWi6YyzH/BT5hXSHKNxFz55jmqkUNZyFO13/4TRFAU5sovF+GuQoAXf4Eq4Fn
         vcWRkG5NLGZzgrWtDfvc/U+/uNk/ZncpTUDPiikfbeXSzhroBeaaGgAwfkjpiCagxbLM
         iLGh2H2jzxVAnc6fDncoVebVN/nBHBc3/vZDxj44gYmW/ho6dKOKX2HtaxzYbVSgIxm0
         FKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773042791; x=1773647591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQSj4yb9M7hPwSpBxDj8hHK3jRimcbsKCK5DUSyRAe0=;
        b=Rv6+XiQcwjMkroSqoDWt6bjazTGWYAUyXbzZJbZFVDmVMBOuZQ21G+OvXME3BWCoFC
         6xW+GKh6RZBHehk/EmWRi1okVFmNJsXxYydlSX/ExBIWtOrhNXMAp8O3TtQcTOuDahv8
         S0tHM6axR2g6CzYO8bM/JqptH24dMnOHg65StcMRuM8mIAACQAdBnkjMqO72IhuV1LoY
         vSUiRFv+YGyOYkPs7E7V6hluizlmSYAcjH78Npz6lvrZB/6Hmb5aLWXz4RoI2IiXCU5b
         9UhMsg+RwtB+l8ixR7//1b5EioPmO71tnTmOopE0n3M/Cpx0G3uBzPHTagysMi6ml1uU
         P/AA==
X-Forwarded-Encrypted: i=1; AJvYcCV6EQ8EE1nzi0u/i9BpPdGz1/QVenjVfgL1Ko49T9E77XXg3wIqXIcxTKys2sdBqR5B6WuEQq2YLR0CoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo3kg/XNW0CRisr7qn8D+GsOBUaFBi9uQHTJqe6o0yDEzzrsCQ
	eFjBWdB7Z1OHVvZKLh9B7AtARS6cv7pJmSmAcHEJqAgdIEJCgwSggfP6
X-Gm-Gg: ATEYQzzb+KRkj4AmdwInl8WptXDjzbfnQDLcniqxvp8y6TLMNQWNWtZEPBSB9vZgwNB
	sSmbA+/Dvg+HTcAqS/A5w7fdLRUqIIu/eK32DOwSR/lpsgmZ7f0y5a04GN28tMiqaOxeEGweO4+
	QMPR4l/fHNRLXS0MUBNujtdKtNc59NVEdTZVhBhLLTpm2KdhKJXXBLIZ8AfyoILv+xg/3eXq1iA
	xHn2Zp6Ptv69QTNs7yiJSx/qYAtEPmHpgLwuF8/Hgeu3bYpkpzT6ZhgnMoDMmw3NKDzd+qboXJu
	9+mjZ1UoGl59YrcA3R2nCtl0Rb1KcYChlWM1tHjAAXMuu6irFmMTcMlJyLzED7xkqTimErDzfmh
	igEd17Ms53cchpNUFiWda+6XyOtVhEo8SMeSCohFSROiOFEq4Teg7EzUP+VgYxWgJ1esP6Hs8px
	5vzw5XfjlOCXCz
X-Received: by 2002:a05:600c:a403:b0:485:2969:cd9f with SMTP id 5b1f17b1804b1-4852969d02emr123760865e9.12.1773042790689;
        Mon, 09 Mar 2026 00:53:10 -0700 (PDT)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485245dbd87sm97799975e9.16.2026.03.09.00.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 00:53:10 -0700 (PDT)
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
Subject: [PATCH v4 0/2] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
Date: Mon,  9 Mar 2026 09:52:46 +0200
Message-ID: <20260309075248.47730-1-clamor95@gmail.com>
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

