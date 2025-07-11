Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01B01D618E
	for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 22:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271790; cv=none; b=WM2PIsauqsD/kYx75onxvNo/i8YPtnNgN8xiu5NHXoy62yuvptVtgF9Xfh9767x6JC/Jn3fE+y6lvvsGGTyCoqBRCtVxidrDgpNcP7FsNcffxLJF8ZNzYhvwRDgxGF6tGw07utQvbPxYS4mSEcGBZS0B/kxdeKL+NcbFmZBf+SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271790; c=relaxed/simple;
	bh=OF2fvSBQt8Kwt2cLY42rrO9+nYIxWQ7baxFlnrzghvs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fgQStcRd96c0RNqmwmvmIpY2kf2frPIrSVkkEU3yzZaStGQmrrOeNVfNgvPM+3JwjaMu+4fwELsWTbGXurWrpNFHM1+knDjYI8YsTXNszg6q+0fJr4qefxyyn8XBlVOq69eUPtKXPgYkdMJPxQVS6gsXT4Ae3AeXH6hejD1KzjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIa/DMMZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIa/DMMZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45348bff79fso31355905e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 15:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271787; x=1752876587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2XRjRf3KPKq6plJUx5qROmCq+MxLh+MWsTiiu/eEjI8=;
        b=kIa/DMMZtbhlQbRahMpUfuazlTL6P6OM8IvH9wBIfcYScvNCtAnku9Q2+yyh/vualn
         7IIZzI0m6+zgqxIGN1caH4jAJOgABqdL4vzsVYDYVs/8497RqxZG3ThdMV8I/jXZ6wJK
         OeOvg8FwgHrbaKD59CqDjS7ezZcAC7YHx9w3f68KKixWIfiZtxoveHI7NIfQeDx1Bjjk
         30e0Ek7WvoWyeEREDKSGxHfpG7BpkFFf14FA2x4a5pgTlVDG11xi1XmbOtTI+YMOqVJO
         8vOVYseSUkKHimxZuEAbrS61Ahz6I25+SZkQ0NLzAI1oJV4jojtS4XswDHR8g/6SzkE4
         Ci/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271787; x=1752876587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XRjRf3KPKq6plJUx5qROmCq+MxLh+MWsTiiu/eEjI8=;
        b=M0v8nHCpergSTCjqypW6J+4ye5WH3/mqfU1Pf0q2SRciNC5lIrnkZvHHFhHtDBBuyR
         cksyX5OT9+M7ByZc33WLzrHmsZVDuJqhc6iQkKl3IN2Q8tARrqwpuajMbc/40EpmTiUP
         UmtDJjP2MCI8wz4VV1amlJn/I8jCs1h2aTvNgU3ORrpYtCcS/7S+WxpCNc+iBFJJETxP
         lCAMl5RY8q3YKiOxp8641Icc1OcdWHzugsqXYioNJXrJtG9avNEd2zwey0oITP/QXxeR
         ItRQisXeb6QC9nhZcPJFeBqYCMRLXD13IDJIP7oE9d5dkJ8Bj1p95qxxIuxb5X9Dk7Is
         CWGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKXWcVQgAaizfnmyn8ZshKX4N3IYZnBzAha20ntwsxPQ0KzYdkEfZd1+yV3a5UqLnafzqKVnpSDtgpbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi+6SeyMlZwOupY/qd6ExYE6OZBjWqUBwe4Fedh61gpL5VIJmT
	HszQacUZi+HN9KwXegE7hA/5Tb3EycnKrxdp4OyGo40O10dY8SRMnXOd
X-Gm-Gg: ASbGncuHLidh+PjQPcR/XpWC9gHPNd2hz2veO16Ktoucd4b6AfpaWbi7KdItk4yCmaE
	QZ5CrIoGet8TX25VAf5bTmHbiYPTlz6a4Lw8hEYnzwJ4PNHNEr0myBeZjjAvnvnr+V1FDxHjFu1
	ubElNhTAXP7fWjuFiNDUxVgtxG0FCBMqteZcl50J4H/UBxHGfEpZwb8F9nyX95p9GQCirttcDp8
	Gx7BxXauUEKReorpO23ncYqQzCNkjUpfBawdc1Y2HFufYL6A33wqMjrjjeycF5wOacfoM9jk9iv
	Dt5rcJouzRNQ+HB4kHV4wvOhXRaB6BgxA3/kPvGb93TpMGLe7/1MuYMirGLY1+A027oGyQOvz/S
	7CU1PzCMh0Cc8jcvD11G/RzG2EeTqC1YP4/f3fQkvpSCvKJ8ZHv+bAaHXX5iDO3RBHY8RGInIpt
	rKs274wIS2LCctoR17EMwXtto5
X-Google-Smtp-Source: AGHT+IHrGSJEVHvFUI6eRcGDZsY//Wte+nfUWJkxTasa3dS16xTpTNIVm+Sxvs8R3stSO6Lru3p9+Q==
X-Received: by 2002:a05:600c:8483:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-455bd87a4a2mr37140335e9.4.1752271786729;
        Fri, 11 Jul 2025 15:09:46 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454dd439051sm59230325e9.8.2025.07.11.15.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:45 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/8] soc/tegra: Updates for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:34 +0200
Message-ID: <20250711220943.2389322-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-soc

for you to fetch changes up to 84daa158bb5e72ec279ab168892df86a25d3c459:

  soc/tegra: cbb: Add support for CBB fabrics in Tegra254 (2025-07-09 14:29:19 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Updates for v6.17-rc1

The bulk of this is the addition of Tegra264 support for various low-
level components. This also adds fabric descriptors for the new Tegra254
and Tegra264 chips.

----------------------------------------------------------------
Sumit Gupta (7):
      soc/tegra: cbb: Clear ERR_FORCE register with ERR_STATUS
      soc/tegra: cbb: Change master/slave to initiator/target
      soc/tegra: cbb: Make error interrupt enable and status per SoC
      soc/tegra: cbb: Improve handling for per SoC fabric data
      soc/tegra: cbb: Support HW lookup to get timed out target address
      soc/tegra: cbb: Add support for CBB fabrics in Tegra264
      soc/tegra: cbb: Add support for CBB fabrics in Tegra254

Thierry Reding (3):
      soc/tegra: Enable support for Tegra264
      soc/tegra: pmc: Add Tegra264 support
      soc/tegra: Add Tegra264 APBMISC compatible string

 drivers/soc/tegra/Kconfig              |   8 +
 drivers/soc/tegra/cbb/tegra194-cbb.c   |  34 +-
 drivers/soc/tegra/cbb/tegra234-cbb.c   | 758 +++++++++++++++++++++++++--------
 drivers/soc/tegra/fuse/tegra-apbmisc.c |   1 +
 drivers/soc/tegra/pmc.c                | 121 ++++++
 5 files changed, 732 insertions(+), 190 deletions(-)
