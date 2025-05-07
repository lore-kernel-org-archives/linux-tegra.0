Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCF51E3DFD;
	Wed,  7 May 2025 14:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628687; cv=none; b=A8v0Zm9d4hpFhflIcmvulYxg+6zAupQhOpi/Z0ijlUE1yMOHn8McNkcTlJTfHUWYhpYdENJvObvrI+ps5fWw25TTd0bPgvWYjbtHrPlBibl5QXY2d1VoSUsMy9SjAyalzrWZh4pRAqsGD6Ac8eRDFlm9zBOR6lNTgbL4XaxxVik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628687; c=relaxed/simple;
	bh=4fi39b5NW/cqyVnGboBXNUQjPWnCyf1e3jEvNp7x5bE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQdujZ4SxgkqZmPigIsZe6Sn8SsOOkSfEtT0FRnsVB6Gcq9r3zcpuBMtAkF36i/8Va9tJPul9S380p4klAAWQsPI/fHGrkuiFV1lqMyoX87pxPQ4BXmFnTWDmTZkXmzTW5LRQP525KiYPmVAtR/Eay0BJFc+R923Jof9MOZMi3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJFaSjJE; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJFaSjJE"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39149bccb69so5480946f8f.2;
        Wed, 07 May 2025 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628684; x=1747233484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qM6MT6DeSdS7exOnWgwuk+Xurm4F1nx95nmeBtoQHnU=;
        b=DJFaSjJEedNMsL8f33k/X6fuikf8vTKP8ccxJtXG0e+ofHE8xd+UPkLlOUadOlPD8b
         kY2Clc8gnyt+KRPmLTm6vfCuPhKRCD0ip7WWDg5Oq6QQdcWmuYtvrvxq8Uqetxy2xm3B
         8gFEcylYBNFMrHOa3kwzGhrj86K0zkwVq5bY89D5hZu2DNnBXla7dKtIR1KguIxw0fLS
         ecpkdqEiAGstmK7eGS7Mpd/X0ESrzrPqW5KnMsNNJpRlhQAc9HzDvtr0+bLb+EfwihXB
         jagy4BPItBGptb3iCvLIKW9DbCwG0EYUwBfusn7JQIaFxOA7cnOCdhd2xOl3YOXVLksR
         o7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628684; x=1747233484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qM6MT6DeSdS7exOnWgwuk+Xurm4F1nx95nmeBtoQHnU=;
        b=rBciDJvRh9ddd5hLKS+Pj0UhBJptsC9ygyJEPiY38r+uPOT171avqid7JzHHiCCct9
         j3Ynons0DNvBGBsRyJUHSEPAgPv/Kz/dMoW9lbatvdq2fzX0UOY/FY7ahDRCk4x8WVJZ
         9+F8K9SXiWpN5mC5Z71J+xWHckYVNRLRL0AqOir457xsn5Y5mjBpI/0sxPiVmkTmqAMn
         +zEFqCG45jd/ECtwPdv4OJNO0dOtq3U4r7ZeXEziwQJgHpJiXbK+FkaLsPjRhBcXQIuq
         ++Vyae4S3vw5npoaq4aj7tRLtdWkPnbeQXGm6oLfpjJDXsi9XzGEVjRTRVeD/JkOTHgl
         xqjA==
X-Forwarded-Encrypted: i=1; AJvYcCVueSAvhTA/mOI8utjhWUd0MzuPcAWVY3O0jbzwh+Z8yh+xXW+PbnddiHiYZwlFUm3rrF6+zvTug/k/SdU=@vger.kernel.org, AJvYcCXlNDtlXARup4TZaHyndDucjNHMuFiD1G16jen0ZOSHv830WU9ey22YnVU63kcE2LH873ZbqHKg5Dtr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb35F36hH/SKLJn7DMpAnr8+brTRT3YgPh14A3opb0iMIY9tkA
	SDds+DNjahlVCVT7hKU6M1kNbTNLuIRyTYxEgGnI+4xGCwA+MHY0
X-Gm-Gg: ASbGnctJQfxHm11bXDWaeM1/MfXYfJE1We9Im2DhBesRHbscikhLpyIBExhBHtJkw9L
	IALdUlfiDdrC4NP+uYIKHwVdP/FCe7qXaP744qCP1LQ9rr9Uf7ixZvqs0h/Pno6GV8NJH5VPNT8
	L4Bd1jyhBfghTPrJvg5qQLK+RzSYQ7uVEenBOxsMyovdYYfFPOcwzPpatQ2W9y4L59JKdvpmtB6
	k3fqiBYWrrHVK+w4YDYujtQPg/RmKOb4flihv4RTjaRQp6tKMsrMJQroxLBeTZilO5JYtd6bSNR
	0l7EyA4pACa4fmtzFr9phpAqecspJdXjWeTpo3gpY0UUHlqYNRXp13hNPk/LhDnRSU0FO1cdl2H
	5bPNq9Gf8CyU+iX8oN/eZXHqlSkD0K+qM
X-Google-Smtp-Source: AGHT+IEyETzlmmc8y6oYf6siZoCpV9tjgqie+KXvCk4K/EP8txjap0qPuJWbj9Aa2mb1QhqO4UEfbA==
X-Received: by 2002:a05:6000:1a8b:b0:3a0:9de8:8a45 with SMTP id ffacd0b85a97d-3a0b49d2755mr3084623f8f.32.1746628684002;
        Wed, 07 May 2025 07:38:04 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd331079sm3041375e9.9.2025.05.07.07.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:03 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/8] Add more Tegra264 support
Date: Wed,  7 May 2025 16:37:54 +0200
Message-ID: <20250507143802.1230919-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Hi,

continuing from a previous series, this adds more Tegra264 support,
which is mostly device tree compatible strings. Towards the end of the
series, a DT is added for the P3971-0089+P3971-0008 engineering
reference platform. This should be enough to boot to an initial ramdisk,
but patches are in the works to enable booting to a login prompt using a
root filesystem on UFS, as well as other connectivity options such as
Ethernet.

Thierry

[0]: https://lore.kernel.org/linux-tegra/20250506133118.1011777-1-thierry.reding@gmail.com/

Thierry Reding (8):
  dt-bindings: dma: Add Tegra264 compatible string
  dt-bindings: rtc: tegra: Document Tegra264 RTC
  dt-bindings: tegra: Document P3971-0089+P3834-0008 Platform
  dt-bindings: Add Tegra264 clock and reset definitions
  dt-bindings: memory: Add Tegra264 definitions
  arm64: tegra: Add Tegra264 support
  arm64: tegra: Add p3971-0089+p3834-0008 support
  arm64: defconfig: Enable Tegra241 and Tegra264

 .../devicetree/bindings/arm/tegra.yaml        |   5 +
 .../bindings/dma/nvidia,tegra186-gpc-dma.yaml |   1 +
 .../bindings/rtc/nvidia,tegra20-rtc.yaml      |   1 +
 arch/arm64/boot/dts/nvidia/Makefile           |   2 +
 .../boot/dts/nvidia/tegra264-p3834-0008.dtsi  |   7 +
 .../arm64/boot/dts/nvidia/tegra264-p3834.dtsi |  30 ++
 .../nvidia/tegra264-p3971-0089+p3834-0008.dts |  11 +
 .../dts/nvidia/tegra264-p3971-0089+p3834.dtsi |  14 +
 .../boot/dts/nvidia/tegra264-p3971-0089.dtsi  |   3 +
 .../arm64/boot/dts/nvidia/tegra264-p3971.dtsi |   4 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 363 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   2 +
 include/dt-bindings/clock/tegra264-clock.h    |   9 +
 include/dt-bindings/memory/tegra264-mc.h      |  13 +
 include/dt-bindings/reset/tegra264-reset.h    |   7 +
 15 files changed, 472 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi
 create mode 100644 include/dt-bindings/clock/tegra264-clock.h
 create mode 100644 include/dt-bindings/memory/tegra264-mc.h
 create mode 100644 include/dt-bindings/reset/tegra264-reset.h

-- 
2.49.0

