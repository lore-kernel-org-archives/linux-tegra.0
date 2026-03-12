Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0184D38A2A4
	for <linux-tegra@vger.kernel.org>; Thu, 12 Mar 2026 21:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773349926; cv=none; b=A+pYWcJRovKYIRhYFmVS14NeXnleCL3I4SzTD97oWZUUXF8g999fcYlatMAoyak6nYzXG2/dyyhQokCm842N6AfK90/f5vq2NBGDKWwxoVcwDnqfnTGXwvUE15m96gho3jLAdKjBM4BjOniiyo4W5X1HmX9k4YRB0noQpxvoWks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773349926; c=relaxed/simple;
	bh=dgXz+tf8jQBXnsNFeJqpbH2JGsjkuDwJsNvfitrPXiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e/fSr/zGS+feXWQ0m0xUmqZmLHFNux6Tnc/p1z1txkhgviR6mVPqmWwGAcMbYQHqEUrXX5mcRQS6h+AwtTHm6ARM8tMAcb40Opdltj3S0EoysHT0cXBSDQxqfIMGiTnAYzsb+dQ8k3dGMYVb32TPq+QjauOpoYonvNEuxPch9us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgXzzmzF; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgXzzmzF"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2be19f05d7dso981257eec.1
        for <linux-tegra@vger.kernel.org>; Thu, 12 Mar 2026 14:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773349918; x=1773954718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XjwmZwRJZQP1Vyn8dYEBv1tFqAl5zM4GfXI60msFcQw=;
        b=XgXzzmzFrfPJ4svjicQQOFlnTm7hNM8YNz99gHAsu4TFP9ouaiZ9ifjL1VAC+UeU2B
         iqlgptwWGfQEjDvIEXJUIut8X1a2NoyxzyiXDLBtEO6oENEL5I1j0c02V98LcrSMolu+
         NARJn8MygMi/oBnj0VvjIerT1F1rj0W5SyElzAAV7gzpnQZKFKJ63mMrFnCqYOAYut3P
         +yhdvc2TgkXIhYbaieD1Wy+VPqjVHn8g1M3HCxS8yEPJHoscOw6y7HiyVFTzAD8Z8/RU
         bhyXiMFMSH0kQTOm1x72X4Urwgc09OM3Xr1usOCjif6f+ymQKAC5TzYq09nzl17ATcXg
         QDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773349918; x=1773954718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjwmZwRJZQP1Vyn8dYEBv1tFqAl5zM4GfXI60msFcQw=;
        b=fxv00Fg6bdRwv8TUXVpdNKZyJT1ze+2bsN+SSPi8QQwFQAbeqzZKtMS+b0MkJnA/V7
         GqhvyZBeY2JaQXDWtgH+xEaqipF7Gx0Jz7zesQORadaqOAgP/S6i+oZMsbtlUo6z8Z1J
         f+k9Hg3fA2lZoMAI6VWapMcgKNWvWCSUJotXxz799fKktWcEcxw663BE1po2gonHeybR
         knAKEHyNYcNFzgTHp6G+dtb0ygywHi2Jv9UMQwZFDhMKM5GcimzezQiqkocPHKUutVR1
         PDkMzQpdY9zy3bjwWSEAW6w93gPy9hIyaGZuEAhqYLqkU7PEE6u/dw1N6F0Fbml3WwXR
         ueOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYsdFXwNpMilHr78Dy47YVfzSE5ca+qeOJU8t5y0+2KTXIEwF9nxGsM28FL+dGpuXaJwhU6EMzX25jQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzllK1+iV9N/W9bwBXCUGbxdjgS1MpDPgrwPgdpphzDMAWcdWfj
	UffW8cpk7/+9N9t7Bhkwh0RZlTg1N1NMv2BDOI/mx+8DGblDrMeXLjnp
X-Gm-Gg: ATEYQzxa7r4aIRkPyR06THnCx+vnMkdthl2h4Voxvxig61jb9t6sDISojRnrvwXrzqh
	45SI1xlZPNWyiyozOeakL0ZJTpUXlCUEJxGmJc+xfHAoEFDOxV4CTYWMc+yjSqTeFrapfW0YwUL
	475LWAjh/Cnm4czXAFL/NyFOgxoH4WuN88ry4ClFda9UGaiVIW32I1S3kuwM1GuE5PHqnq6Uwxb
	VMmQ+IhhtYxEV7wgot3N7ATwRtXrUDeQLI+72XcHZhMU5a0u2II9TEM1cYqLFX0zpagLjKQpgpg
	2SIO6j6PYu3Ks7ZM2gGs9EllfHuEncPVUN23RrLjxi6MlvsRw4L6DpwywuAokM0Pe7EEgBc9odG
	1s1zEOryiMKM+mIuXdtmvSLTBKB7yfxWata6MyfvP5QGr6cYUBIENBDseowk26agdszi4iF6doM
	8IlFF/4YXVWMwzYQgTFK2jMZayWvnaZDP38tY4EYXLO3M=
X-Received: by 2002:a05:7300:6ca0:b0:2b8:6a22:6d52 with SMTP id 5a478bee46e88-2bea55e3b11mr614037eec.33.1773349918532;
        Thu, 12 Mar 2026 14:11:58 -0700 (PDT)
Received: from localhost.localdomain ([2804:d59:7f1c:1e00:6632:a8ff:fea4:c8d3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8a83514asm8422272eec.4.2026.03.12.14.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:11:58 -0700 (PDT)
From: Gustavo Arantes <dev.gustavoa@gmail.com>
To: gregkh@linuxfoundation.org,
	marvin24@gmx.de
Cc: linux-staging@lists.linux.dev,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dev.gustavoa@gmail.com
Subject: [PATCH 0/2] staging: nvec_power: quiesce EC queries for system suspend
Date: Thu, 12 Mar 2026 18:11:49 -0300
Message-ID: <20260312211151.85379-1-dev.gustavoa@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvec_power still issues EC queries asynchronously and keeps work queued
across system sleep. This series first serializes the driver's EC
requests, then adds PM hooks so the remaining work items are quiesced
while the parent NVEC controller is suspended.

Patch 1 exports a small core parser helper, moves the battery metadata
queries into a worker, and switches nvec_power over to synchronous EC
requests.

Patch 2 tracks the suspend state per instance, prevents new work from
being queued during suspend, and restarts the polling and metadata work
on resume.

Gustavo Arantes (2):
  staging: nvec_power: make EC queries synchronous
  staging: nvec_power: stop EC queries during system suspend

 drivers/staging/nvec/nvec.c       |   7 +-
 drivers/staging/nvec/nvec.h       |   2 +
 drivers/staging/nvec/nvec_power.c | 122 +++++++++++++++++++++++++-----
 3 files changed, 111 insertions(+), 20 deletions(-)


base-commit: ad6bb64332bb4297110950769ad5af52791e33a2
-- 
2.53.0
