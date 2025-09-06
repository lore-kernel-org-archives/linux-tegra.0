Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C126317E4;
	Sat,  6 Sep 2025 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757140195; cv=none; b=EozUPGt31z4dQiBoctbA08RNHZh1iOXGSzOr37XkYzZhcUpQ+c+IX+U9xVDa2LwxAuLKzg9FPqWUNMrg5oUYpENgjZsyxzue2CP0VJZ5AEcBOz9vkJHjlKsyHgIydBnTAQ2RdUY5AvcdqisTsj81bLXd4gUOWvWlgf+8d42Oxzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757140195; c=relaxed/simple;
	bh=xNjwqIhiJgduAnJeM3sgzEDOGHO4ZeHCQP4TwyE6qvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LLTdequKkOgZs8OfroDI8aVbtAnTPC4WDX8oi+A8+K3RJnHP0315apJ/cWIVkuI0uWON9zcLYz1MO8qfEj6nvIjMFZvUPc3s6/r+m3aPJtae6dCNAUC0ukrdSFuESlVvPFSNhOUjL94KpN6ElAPqjYvMITXKi/6W276YXG83pBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlZFEC/m; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlZFEC/m"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f7ad815ceso3129731e87.3;
        Fri, 05 Sep 2025 23:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757140192; x=1757744992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DDM4l0XQr6gpl/CwK5RQ/t9x2ic7b6u6nG+2cUDQpm8=;
        b=GlZFEC/mEwyTBRf1/ZjVhSe3QYlhjvIBYID9GAx+uFrUUPG3ygM6r6LQtdupEn2M/k
         TiNx8uHDfQa+gQ/B+Ac5QV/KWEjJPfgJnhTunFa3D33wAJf+BRrwIvXpvEHqBx+XXsgA
         Fd0EGxIwMzpJ56LF08Saw5QfreqL6558ZGrciA4oZLixg5PzAWw+76aLK962QUbyb9Vc
         3DVqzmBGsbceONbvgukiegg6I1oKgRpn7JXdI3dLzAL7+JQtdHiSEpK2Bj8GIkoCGwYk
         +xsw1DnfgOxaK+d+wIDp6y+3XXtVq07M/L+UssLPLddpJrvtUfYBzfPH35CJYKMmJQ+H
         rT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757140192; x=1757744992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDM4l0XQr6gpl/CwK5RQ/t9x2ic7b6u6nG+2cUDQpm8=;
        b=cV9LatB4l4VNFVhdSo9umF5Oy7dmgD8aY5SNlVByItqspZVG9hF0meHqS2aNIX98ph
         aZYmoAb5pbIiPme1T3sn5wuqnybwr/iuC5cBF2E70TeNcRwOJAzfK03KqfbkULKZfQUJ
         a1EUE1RWawAqS85QqSkbHYrnKQjGaJuR92488EyRNK9B5EBxvZIszoUsH9zgXzjxK4Gz
         2NG5Wkv31IYj+XsokD/EmQSOhWtvPvzjI9bN5xdQqubjy11cqWquDybHQnKjyhuC6JMR
         pR6tdgZvavc2mNc5k9arZoMn4MC/9tqC7F4tKkoTJ4TP7OT+6OK4lzifyvv+xbX3+kYY
         p4CA==
X-Forwarded-Encrypted: i=1; AJvYcCWp/3w/hSBGWRY3AtUo4NB4zj4efmnwGMnssLBwgN4Uc+hSaSmcsIkCNKxH7+MblpkqTMlxsfng15MnFf8=@vger.kernel.org, AJvYcCXwQohr3T8s+hzUyzfMtzz7LF8hoXkI3UKjlVZvCC9Vynr5mVvnG7wzRCyakE+RR89yp83Ez7V1z0Amj6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH0R27HdabxzZz0ghCgwO5K5ZYqgqrj9U079p3l9i1z9/CDN9O
	hu05rtrC9h1go4P78mUvJtVUCzP+j4Si0lzN4AcA6y0oJEBy/FXSlACdr2y4eA==
X-Gm-Gg: ASbGncuVn+pClntOSLYBk5+bw8do1Y1X79Su9Tbn8OVhL+iqRbMFiCGQhCUyDf79Gv9
	KSGLPOcR6NWxmM9nlf0s6+tGnb/1ErC0nh2Qu4xaTLtjm/le8b2G/X5HO1ycQnsfCnS7K9ce2QB
	zmOTqlNPJlXeWy1LPc5kvjD2OY/5Nll7MVR8jzy4XrMp2QpIG9hzjNlVe+PkS/QOr5mLzqAVqjq
	yabhT87Au5ZEJySbHcl2NEhdflLn1e0uzS5hPbCPLxVRkOBn74VSmD2jZ1Bm1w3lOhIR9ENeC3W
	K0EtpyAVPk4dFvL6Ueq11nuOqTunumNo72TV4pkLIXUyyZPE0hA/R5avWWi42eWnnaluge6cZdP
	ORX3cMnEum1ITfy6GCJymQiAF
X-Google-Smtp-Source: AGHT+IHx5SUOLz4xxIxdvTMv2D9c5CCtCCVe8BTkyCUM7MimJD0op3PpYt4TOpsdiqkxga2JDcoskg==
X-Received: by 2002:a05:6512:3b9e:b0:55f:4d51:7ef4 with SMTP id 2adb3069b0e04-562603a2244mr405799e87.24.1757140191487;
        Fri, 05 Sep 2025 23:29:51 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608abb7c74sm2178737e87.54.2025.09.05.23.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 23:29:51 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] ARM: tegra: add support for ASUS Eee Pad Slider SL101
Date: Sat,  6 Sep 2025 09:29:30 +0300
Message-ID: <20250906062934.6637-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for ASUS Eee Pad Slider SL101 along with a few device tree
adjustments for Tegra20 based ASUS Transformers.

Svyatoslav Ryhel (4):
  ARM: tegra: transformer-20: add missing magnetometer interrupt
  ARM: tegra: transformer-20: fix audio-codec interrupt
  dt-bindings: arm: tegra: Add ASUS TF101G and SL101
  ARM: tegra: add support for ASUS Eee Pad Slider SL101

 .../devicetree/bindings/arm/tegra.yaml        |    8 +-
 arch/arm/boot/dts/nvidia/Makefile             |    1 +
 .../boot/dts/nvidia/tegra20-asus-sl101.dts    |   61 +
 .../boot/dts/nvidia/tegra20-asus-tf101.dts    | 1251 +---------------
 .../tegra20-asus-transformer-common.dtsi      | 1268 +++++++++++++++++
 5 files changed, 1339 insertions(+), 1250 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi

-- 
2.48.1

