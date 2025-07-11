Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A09C21421A
	for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 22:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271797; cv=none; b=HC52coGVkQRqPTs0WR6K0xgzpLey09UExU7qbqTuYr1W9LA8Wlq5fDFLZ+tEpzK7mMLYrMCNwEqN2jQ7AcsAW/PX86JdctXRmFLOthVz4h981viXCRWWB7SdDifB1ISdS4dKO769g/D0ktGOKCyjG9nwenFMgYLwNAxNu44XKyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271797; c=relaxed/simple;
	bh=WlF3nKUmNavgZ2QL1+b0EzOu74PpWxeIy3ufvxiL1kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=msMYfLq1H3C92y/EpkcnlbT3a30Y8QlVZz3yScFD500xabRYaD8UxO+sVTpoXTN+jYQ44oeCSp+O3in6A+xdhinaBob+tVK1ntqgyLbhzic+r6/MURZRa2QSeA0BFDluIp81mFqoQK3qMnrvQwDbAtfD+GOzwbJwoXmjtcKWav8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0PHnfm2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0PHnfm2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a575a988f9so1607769f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 15:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271794; x=1752876594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUDfhSJE8vypj2jOQNw79mTid7Mo8GDTdgpT5HJAMuY=;
        b=X0PHnfm25bi6gfx8BQqWkWVvqlWvtURZcHt4XkbKvPopeLMo78YODqJTtt5HHVaYmO
         4jBa+i520FTlCY3LpdrC5Z7r1a0N46Mycs6DrNI6laVV1hQcSW1W3OeaiNn6Q1o06fSh
         ajMTuF35wNcr1xuWKsBT2RTYmBFR2CcyOaVQtEDpU5Ma5HQDTnFPWVZLyYymPmOvw2z/
         jVXolxZA3FPLMpsc18Vpx2gx+mOqu2GJhJkktxLNmhtb7oIID0rzWaKL11eGsL65zh/G
         Cxt6nl4B4PJwfj928SblhHPD29ONvdkO8dQUQtwYYEwCnwodaNuzFSqoEQ0ZTvYVpD+D
         HRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271794; x=1752876594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUDfhSJE8vypj2jOQNw79mTid7Mo8GDTdgpT5HJAMuY=;
        b=J27nnR5LDqDJ+Zb8rEsGTfa3GwCd7SBFjHK8Y8KUHRdDrOys8t3sUI5luePRcg62CY
         sTEcGpyZCHXoTVe6Rb7jHMH6wCiSA51XkxvFbovw5xNNrJdaF/A+cPIsxz/wDGlFAs0G
         ZLR5APX7zP4hi9LzCn//LsSDs9ZDTq7X/SPhNxM5FOBoMPT3aCBGArjSLVEumFCfXokG
         tNUs/ZL/Z/Abj+ZD3AeUPracybPTgpLCWd3PkdZQGKDd1ZQP0a1VaFk3bJEQ2xepB0Bv
         1FYIDawMvD1RzB4lE9PyfmQ0QuxkGroMBVfzCPNXmYEHPzej3FhBE8lUnoidffe3JzLa
         hcrA==
X-Forwarded-Encrypted: i=1; AJvYcCWiTkH/zhulZtf9RKZB4upYoWbW+4Bgdgdu4uMg46V0+qFsrsXEIJCBHrjjhZwlEFaOUt+iVSFfw+GtHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YykAGik60SvFFeJYGMB1tJ2hdLjZ03n62pfTFOone+73p2cnabF
	HMKfGxA63i9KYIXrQDSvXjhNLDahJ00w3WG7txJ5KeyKNA52+rShMSf8
X-Gm-Gg: ASbGnctTYCrefUUwO1G8T+xXKVFRLRnyRvEdzfeMLuom8q7iFT9edCUUOaNCx68mNiC
	U+YU9p1qokp88I3RoV/VS+71+vtugIzMInLPjEQJwEamCP+4LlkXr9+Uee630ptMhEa01pqavUx
	fIbeFNBwvr1FpHqnqhrhvU1ekojuqVhyFCDFpM2cypPYJ9ohchsxwmj9QTZnyrYbhCflNVBl85K
	0pc2WhRXSv0/Bm8zw52i4xuNgLO518lMj0td3dQU+amFOTt01aT/laxLCgCXgyZXcLkXS9azRbK
	maMsMElDBCMk8Dlh5xWEH2W6U37c9A8j6P1y6Wc8WYgDjtEzHtFHeC2sufrx5fBiPcPm9sYw3Qi
	lUxgFtLHBCjN/ufeX9mriO6gBn7CAax2f7d+nmacHbzPqvPkWUyFJjh76b1g1WK3Iurj9v44bpf
	IpuWtmfak/tk9s2Q==
X-Google-Smtp-Source: AGHT+IFrfogdrgCJD9N76R6dzps69tuCBPv2TcIdLoEKcZbRZKlsXRZeI4f3CBmq7rSlADwE0IUmWw==
X-Received: by 2002:a5d:4389:0:b0:3a5:8905:2df9 with SMTP id ffacd0b85a97d-3b5f18cebf9mr4138320f8f.37.1752271793586;
        Fri, 11 Jul 2025 15:09:53 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454dd54c512sm59580125e9.37.2025.07.11.15.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:52 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/8] memory: tegra: Updates for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:37 +0200
Message-ID: <20250711220943.2389322-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-memory

for you to fetch changes up to 2401dc4dcdd02920faa9a8c4384f1503a15e779a:

  memory: tegra: Add Tegra264 MC and EMC support (2025-07-11 16:49:42 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Updates for v6.17-rc1

Enable support for the memory and external memory controllers found on
Tegra264.

----------------------------------------------------------------
Sumit Gupta (2):
      dt-bindings: memory: tegra: Add Tegra264 support
      memory: tegra: Add Tegra264 MC and EMC support

Thierry Reding (1):
      Merge branch 'for-6.17/dt-bindings' into for-6.17/memory

 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 +++++-
 drivers/memory/tegra/Makefile                      |   2 +
 drivers/memory/tegra/mc.c                          |   5 +-
 drivers/memory/tegra/mc.h                          |   9 +-
 drivers/memory/tegra/tegra186-emc.c                |   5 +-
 drivers/memory/tegra/tegra186.c                    |  17 +-
 drivers/memory/tegra/tegra264-bwmgr.h              |  50 ++++
 drivers/memory/tegra/tegra264.c                    | 313 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 +++++++++
 9 files changed, 613 insertions(+), 8 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra264-bwmgr.h
 create mode 100644 drivers/memory/tegra/tegra264.c
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h
