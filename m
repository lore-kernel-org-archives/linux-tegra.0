Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48BC1FC0E2
	for <linux-tegra@vger.kernel.org>; Sat, 15 Nov 2025 09:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197266; cv=none; b=CuNMnoOY5Fs69Afjsq9rrI+zTiQedZjq2pHlS4GzwKV0mpZUob2fV1rAY0duR73uD/Yw1smiTzw+36d9i4u7dGdrAPplVAoCXkxPvZ6Ophmffn/3cmcSITtIK0wrz4YsnERe0AE/aBLBCRUw4FyBvJUMBkTnzPxGQQvA6oKr80w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197266; c=relaxed/simple;
	bh=vu7pUM0IdDTF+L7kgMryB8EWa5oji4ICNd2+NfLgJxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fyWR++3CwU2dc/uyYyQ0sgleu4PjYIButm2pbP+uXnyEMMKB24QUHOySE4hHolfTg7Bdnv3PKFLDWIxqK/chNRXTMCmBCvSn2sEwDhlXkxGHL3Cn8AeKcA3JS0kRec8N1sWPDiDKo0enf/G+x56AOzzkSM71MoyDwmzUmSHPPP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UB4iHbTm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UB4iHbTm"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47755de027eso20260925e9.0
        for <linux-tegra@vger.kernel.org>; Sat, 15 Nov 2025 01:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197263; x=1763802063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NmPq2vIfN4PvbOp0GMu+PlVPyVQhuun4x+h09lqtVM=;
        b=UB4iHbTm9xGS2rFXRGkVUXK5aRQJ0AWFVVGHyLhZ/JzlsyKGYAEhO53J3g3d06ktkr
         /gssNa8QlK1UWQJmgQmBXILVYcbVhLMr1TjiChXQnWe4WgBTdgfd5M/LsdEdmJN8F5F6
         1JdCqrNlSlNLO710+iE01hpjBX1deP5unZ76tbyu/rVxx/JvJvqDa7i3pp2IJX8TPnIa
         EL75YMvKBKKr5tK3WEPYvOBzSu0gbsLZMghR//5JRYeDHtNzSokU8W+g691yciTuXC42
         kyK78NJ/Ec0vC+sSxjKkU5JhoI/0D72630iz/GnlFWn1SM/fmS8kvhc1gQKON3A9xBm7
         Xr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197263; x=1763802063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6NmPq2vIfN4PvbOp0GMu+PlVPyVQhuun4x+h09lqtVM=;
        b=mmewFnZ7cNPGuzh3j+BNSXFmnZaVufEBoWAJRpHQS81oEbdMeaNq0cSrxcQsoi1iuF
         4CWV93HII76rV3kjWMujLoiQNH8BIX8S2TprxbHWeKA4QBgesqgZIPfBcZ7Xhs/mla+R
         AwTnT4rEj2uYcSjH9a12kVmNi3rugL4qBsys7B49ByzGd/Bh1RYsytzvKK/tKuvk3OiG
         61puaZxjPanB5zGJpJySeQ7VBIgwwbrZBk0HliY472OTe3K295VRBcsWoDj5b8hwbkcn
         xrfqNfXMPUWficfomVvLlG6IaPHFpI8bxnNREkDO7Ge+lxclcdj2W7x/a2OlxtqTudm0
         SHIg==
X-Forwarded-Encrypted: i=1; AJvYcCWsq8C2qDivRyBKmLOwIfSaU0KF29ANtIkXsT/V0WXZWBAKiEArrkZVHJEyRBeiVbA7XpoingiG57g1Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG4zQek0s5KNVYsdF2/nybp1PnDdM68GcFbwSXOyJ7OIPeNFyB
	w/Jh02mSDGDgYEnT03jxqS/GWhja6chQiuyEujMtGcf0qFycwWictUsO
X-Gm-Gg: ASbGnctxoiSS4gQio2vZyske/P3Clr8PM3BvBk+GDFtg5wRDWhrJhXayP+PkUsLNM1q
	hqRIkWOHnqQk8XgE24YUNdkg0WdWC3P8Pja96jlSOip8H2iXyI336tEcD5WzuyLZBpfXhk//WJl
	8b+49+jC/BMjb9IfdXQ5NUK6+PsjONKoPK9DrdPKgMnjayoiqNIzy52s7hk20U1cLG6vtWbGfSj
	ms/zA8tnzPoPF+1eJFH2kCCBBj8T2rJOK2e9zH2js+nte+vdhkviFnibQ5R3Ye8UzkscX4TPnfK
	EGzxl4Lksjta4TckzjpSp7PxHJU8dFmvhaa/EhO7k1QeBrqX8j6Lxe9usm8GcUbx4cyF9YpERjK
	A0vv8P5bRzlx+YSGUPGG2hTtPowOeef1pHnqbduLa3fMzi3iNmtSAMmn3By+b1mIOwruz7fE2Fq
	2DrBQf81j+ghh4J9G/0NBmXgva8e+FsMbrWyKZGiXgvwe8jSaJUaIlrQac2cALoRmWV94GMYxBv
	VmWh9E=
X-Google-Smtp-Source: AGHT+IHYtVjjbV83ei1n6TC4jPxlxk2Cr9Io5XeSyAGj/Ci1P0LZPNejeCahGUTN0PRdBl+3ZD2IMA==
X-Received: by 2002:a05:600c:3546:b0:477:1326:7b4b with SMTP id 5b1f17b1804b1-4778fe7973amr54525965e9.19.1763197262830;
        Sat, 15 Nov 2025 01:01:02 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8e6acsm200553165e9.9.2025.11.15.01.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:01:01 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/8] arm64: tegra: Device tree changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:42 +0100
Message-ID: <20251115090044.3140331-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit ccec1069246ad121c1cbb6494d75140d512a9b5b:

  dt-bindings: arm: tegra: Document Jetson Nano Devkits (2025-10-30 20:29:47 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-arm64-dt

for you to fetch changes up to 0936fa80150ef9121c6a4340fa2369bc9f16a520:

  arm64: tegra: Remove OTG ID GPIO from Jetson TX2 NX (2025-11-14 22:55:12 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.19-rc1

This contains a bunch of additions and improvements for older devices.
Tegra210 devices now have empty reserved-memory nodes to improve inter-
operability with certain bootloaders. These chips now also support more
multimedia engines. A new variant of the Jetson Nano is also added.

Jetson TX2 sees some improvements. PCI endpoint mode is improved for
Tegra234 so that reset interrupts are properly routed.

A new RTC device is added starting with Orin.

Rounding things off is a flurry of small fixes for DT validation and USB
OTG mode.

----------------------------------------------------------------
Aaron Kling (10):
      arm64: tegra: Add Tegra186 pin controllers
      arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
      arm64: tegra: Add ACTMON on Tegra210
      arm64: tegra: Add interconnect properties for Tegra210
      arm64: tegra: Add OPP tables on Tegra210
      arm64: tegra: Enable NVDEC and NVENC on Tegra210
      arm64: tegra: Add reserved-memory node for P3450
      arm64: tegra: Add reserved-memory node for P2180
      arm64: tegra: Set USB Micro-B port to OTG mode on P3450
      arm64: tegra: Remove OTG ID GPIO from Jetson TX2 NX

Diogo Ivo (2):
      arm64: tegra: Add Tegra210 NVJPG power-domain node
      arm64: tegra: Add NVJPG node for Tegra210 platforms

Haotien Hsu (1):
      arm64: tegra: Add interrupts for Tegra234 USB wake events

Krzysztof Kozlowski (4):
      arm64: tegra: Add default GIC address cells on Tegra132
      arm64: tegra: Add default GIC address cells on Tegra186
      arm64: tegra: Add default GIC address cells on Tegra194
      arm64: tegra: Add default GIC address cells on Tegra210

Niklas Cassel (1):
      arm64: tegra: Add pinctrl definitions for pcie-ep nodes

Nino Zhang (1):
      arm64: tegra: Fix APB DMA controller node name

Russell King (Oracle) (1):
      arm64: tegra: Mark Jetson Xavier NX's PHY as a wakeup source

Shubhi Garg (1):
      arm64: tegra: Add device-tree node for NVVRS RTC

Svyatoslav Ryhel (2):
      arm64: tegra: Drop redundant clock and reset names from TSEC node
      arm64: tegra: Move avdd-dsi-csi-supply into CSI node

Thierry Reding (2):
      Merge branch 'for-6.19/dt-bindings' into for-6.19/arm64/dt
      arm64: tegra: Move HDA into the correct bus

sheetal (1):
      arm64: tegra: Add Tegra264 audio support

 arch/arm64/boot/dts/nvidia/Makefile                |    2 +
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |    3 +-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |    1 -
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   13 +
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |    1 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |    1 +
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |    6 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |    4 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |   12 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts |   59 +
 .../boot/dts/nvidia/tegra210-peripherals-opp.dtsi  |  135 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   90 +-
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     |   11 +
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |   15 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   72 +-
 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi     |  108 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 3190 ++++++++++++++++++++
 17 files changed, 3708 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-peripherals-opp.dtsi
