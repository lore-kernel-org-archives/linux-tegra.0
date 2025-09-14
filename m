Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C772CCC0
	for <linux-tegra@vger.kernel.org>; Sun, 14 Sep 2025 06:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757831974; cv=none; b=Ae2VYV71Kc3vDzxdfw6rVgL3xuaqaAfxEb3RZKdgKhQ3OGZUh01LhINM7GKw7ducIWQxInpKZqItA0ErlyIgCmYGb/Q9C7N8cZn0HOwZM1pbPK1EhA2GpggirYxLU05aPx4CpehIlwfEePbGvcU+x0HY8esEglMlaEIfhfExPvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757831974; c=relaxed/simple;
	bh=4FFNZ7Qc1XP5MwlijQ36HKg31FNbc8PhI5xahVdCOy0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hRAmFIBRVo0mV4cPeZ/m6MA4BFAu8hsTcKm2F5/JLB67JFllPi0NKkYHoAhJdIqSQ2/OFTtrHqV0NN9dkDh4VnB/MAchgilwPvJd4rjly68SijzhiGItUarprf3BeGyCgT0F+bqSN/4Jjsca1M/ppL59tdDI322HJVgRvE/Ws+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaSIIsOp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaSIIsOp"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so28046585e9.0
        for <linux-tegra@vger.kernel.org>; Sat, 13 Sep 2025 23:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757831970; x=1758436770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu2Fy/Koa4ceqWj6i/DQ0jJIb7GQDqAQHuEca7zbCNE=;
        b=HaSIIsOpzohyW0uO4FgOwtiaYsaLclR9GKQLSF4bcqErPXzFBk1LUph8lOohcT/Y8t
         jT6fxUuNK2Ax0y4Oa4dlDjsK0VTQUXCHH0UiQkteGhRHYTXM8vwnR/xu1ry21J9U3EK7
         fnlxLSD5wF3NSAAdxxWudVyzqNlc6aggl/O4+eJDNIgrCDfc+9wkb3ooMYrbgmjjPGh7
         6I740wvpB5/K1ZbSWPmTMMtSNBV9FNItysySWEN63q+N5uvXgZJ27TAleRMP2LyL97Cr
         cP8b0HbJ9e7usGEzs6jOc3TIWhnnX3F3VWDxt28vmIDf3ofCNe7Pet/dl7Ta+NS46HlU
         eY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757831970; x=1758436770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qu2Fy/Koa4ceqWj6i/DQ0jJIb7GQDqAQHuEca7zbCNE=;
        b=tBJlKGLHZ13trkOIu3pW3hEQYXbzPRcP190TtdYzNNmX0BVviFVItZfVyFaEmpvKaU
         /IMV1/W1PdZ9bKqxC++ae5mdjIjT1asAuvOhxTHhFwhnZnLgj7vtj4jlfWyDvRWwBiLO
         qJt4DQNonAFAbM2qGoj1SaX5UHiFXJzE+powdBBVRCh4ppjXQC3OHCQRAph+B4Yxg+xm
         OMPUEBsZt2YEAAHgBjQk5zsDwkQD1QsP8mxGbhgwYFzmvtHptunHf8VGo11A2klmNaeC
         JeuqP8nhZzjM5mGBwDKTsLlGzbV7tYMg1+Qs4AZiWytChYdo34pl3p6zl5HoLYMzQbuc
         BmgA==
X-Forwarded-Encrypted: i=1; AJvYcCUxwlSGhjJarZ9nSJOj0ulxPqRQZ70MbY2J5Sm/abVCsR3e3yY4slV9JRKJ8TBdfYkHoPQBfb2BZoFJAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXozV+Tl+w4ndOCDQ6t1gUI2hAmi8dXETrECs5S7ADUOZMbsWB
	oVIfXNYMIvAuolUioC0z4mZSMjprlFxJ9NBv53qtshnPffdZWtxXYOWs
X-Gm-Gg: ASbGncvoxeRjfNT0ylG+D1jFMO3syCttmVmXtRyU7dbV4XhcGDwa61CUeurd2VXrvKT
	xiu4l/DanAWDngX48olnP6PUgopxuIQhKAYNEPEK3qzOScS3xiKvpldbeQ2zmJSPjc2ZM4UcDY7
	iwE/yu/0mRrU9O8d6aAla7kz/FltcHtsrC2kSBMSFRowISQ9v4tcF3X0qeX/AZABsMr+uJRF+EL
	HJIES2wX6sMcqj8AcPe/seDlCtrMOuOlHKnkCf/h+bAGgfGa/QFElJ+MF5queZa3T8r3x1Ln5mx
	1nBW8wvx/3TkbDDbWbEz/s5NhGWDfhvdYBz3tWyZmbnW7uPvGxFlNuaIjbHBXTApW+tb4XoDfv2
	M9zdCT9qEscynp3pM7DRo7CPdz8Mz+RBCZl0xl2RaLxSVqGW+y5hGM0gLjd2Jg+fhEs2/C/QP+Q
	xMtGaFctxpUVngniS3pf/EoyEJ
X-Google-Smtp-Source: AGHT+IHsVQaLwK9kbPhi5b+T5uL5yRbv3z8nvbXvjRDH7NM+UJPCf41nboJd5RQK8c2xCzYZfBtU9g==
X-Received: by 2002:a05:600c:4755:b0:45d:dc10:a5ee with SMTP id 5b1f17b1804b1-45f212933ebmr70561585e9.15.1757831969491;
        Sat, 13 Sep 2025 23:39:29 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45f2abd2c03sm18404525e9.13.2025.09.13.23.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 23:39:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/4] dt-bindings: Changes for v6.18-rc1
Date: Sun, 14 Sep 2025 08:39:22 +0200
Message-ID: <20250914063927.89981-1-thierry.reding@gmail.com>
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.18-dt-bindings

for you to fetch changes up to 04f27a0fda6b6be104531eeb95d07ef1b3a72af8:

  dt-bindings: arm: tegra: Add ASUS TF101G and SL101 (2025-09-11 18:28:57 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.18-rc1

Support for the Tegra264 generation of I2C is documented as well as some
older Tegra devices, such as the Xiaomi Mi Pad and the ASUS 101 devices.

Contained are also some additions to existing bindings for Tegra114 and
a fix for the power supply feeding VI/CSI.

----------------------------------------------------------------
Kartik Rajput (1):
      dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C

Svyatoslav Ryhel (5):
      dt-bindings: display: tegra: Move avdd-dsi-csi-supply from VI to CSI
      dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
      dt-bindings: arm: tegra: Add Xiaomi Mi Pad (A0101)
      dt-bindings: reset: Add Tegra114 CAR header
      dt-bindings: arm: tegra: Add ASUS TF101G and SL101

 Documentation/devicetree/bindings/arm/tegra.yaml            | 12 ++++++++++--
 .../bindings/display/tegra/nvidia,tegra20-vi.yaml           |  3 ---
 .../bindings/display/tegra/nvidia,tegra210-csi.yaml         |  3 +++
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml         |  7 +++++++
 drivers/clk/tegra/clk-tegra30.c                             |  1 +
 include/dt-bindings/clock/tegra30-car.h                     |  3 ++-
 include/dt-bindings/reset/nvidia,tegra114-car.h             | 13 +++++++++++++
 7 files changed, 36 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/reset/nvidia,tegra114-car.h
