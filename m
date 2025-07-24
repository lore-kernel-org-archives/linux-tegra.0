Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5E119A
	for <linux-tegra@vger.kernel.org>; Thu, 24 Jul 2025 06:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753336929; cv=none; b=LZb9zwEtoVpvXob87h43Oz+S6lQaxInmyiRi5ee406Ad6ZQ1SA5JpPcNsJf89TzV9Rr+usJn7nWphcpPzWHKmICSwswd3zTB1Ivk10f9RP51Wr0aEeKD+cKM8eWMi9tIDSWQmiGtsqdXJmkY6RzvmHWL8EklUKnY/rFfLvtrhIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753336929; c=relaxed/simple;
	bh=LhryfFJ9dvApZxfQJIe8VWX1eu+JA20rxCddQlLHJvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AqaomCY3myccJFCyFlHsFDRmI2kXgSMmuzH0UVHesuEqWm+eWA+pnUCuHWOQWokRFyu8F9fwMO2E99aW0GckbCUwTTEihaWP8RUjYrZRH93wMI1X9Lvpxz1YSlF2sBbBoA3OBapSghiYroDuRk14W/i5LoD+ipTh3bgpOJCSwZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijEDkEeA; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijEDkEeA"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so357975f8f.3
        for <linux-tegra@vger.kernel.org>; Wed, 23 Jul 2025 23:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753336926; x=1753941726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=md7ezImaC8aEPMY35qFAjPwWsP8CSm3ceVQj6sefxsg=;
        b=ijEDkEeAmr8Bze6D/H9wcMOhewI3jNqCCsX4m7pYGsx7TigEXgIix1ZWBMj/70zda/
         zK2/9zHyGRvCFOrXRAsOptELBUwOFdVShZ/NqCkP/urVg5sgSnfqVC4pFHFHByBrK+K1
         +v4U0v3/tjgrVYEDp5NUxDttca8Mo6ccYMr9/7JpsN/xMVV6QJVe2ox5hCA7kiWxGc/1
         UmdM14STkiVSEFcvt9wYYyTuxTMmcL9UM6cJnmJI542iAoslo1JS8Eqj9+I+dgjlZOX/
         kXTW7CMmB9S9L1wJbrlef/EqnrW0ONel229ZIZ17IQ6+0n5BhxMaVEZZPuX3Cr85wZZb
         2ONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753336926; x=1753941726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=md7ezImaC8aEPMY35qFAjPwWsP8CSm3ceVQj6sefxsg=;
        b=k0/yx8lUGrpqZbMZBuZb2iAN3JuA7f5T9ftToWgNHoDbUbamFZkjV0cB3MBVmZOL5p
         fKO9Q8Y38rMt7LnWP+KFOR72QB73prZeiMhpz/QG2apv+tad9euTP5JlZUxrAwhfYUll
         RiUAkYh+6RWVANc3XSlzuCBwEu9MXiKSbcJ2W8v9/aRQD3gxqR20tcDRB/iXHjsZhla2
         U14FKEIf9civ7Jvu2US35rga62AllqlBF40ybAanv+ObFrladzrkqbkb/nYaMThtkDzh
         mQO1EPFoA8vAq8hTvN6im3qikusR0vp9T/NXchCmbEXUNjaluqVd7uG+5Bd/Bh9YgVwb
         ePog==
X-Forwarded-Encrypted: i=1; AJvYcCVIVVhzYAkViMN+yt+v5x5u345v4IpDPKDjW+t+B6uutn5WwURlOJz0ktSxUgyZ+GBKvU7RQz1JHR9FLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGVY2mJbo63lmxG/SN4Y/ByWciL4PQYBKXFRRgodFssr3yBTiQ
	IRLudX+KZSuy3gw94L5SeI5k1Wu8O1QR9adD9aotL9vlWKWTAQPPA5ki
X-Gm-Gg: ASbGncurh6Yk/JhVG1Ghuq9cn2foxjNWpMuFj99I6o36CVW2rI5Hfwfe0nOe4vv6tPI
	W4+sPWrlmiNNTaBE/zOHD7CGCGCHwIXX2czP30T5bSGeLh6P+Y5M47B9sfR2xxv24bS+596er3w
	gtiA3+TaTJ6H7v9GXjX/nEtTauyRXPrvvNfgNNxAXVw8KhZTps/l7IY+xmraIcjIk7SfQCUF5K3
	KqFzx4uFxT3d5f+G16mShi/5hE1Er604VlLWKIB2tzo7QbygVnsuK73YnoOolKj/ykU8uT/v4CU
	5lac//8KDdpYCASZIhDbQ7Luae7C5yplC1YNUh4dveJClsuMmRON/y1484SJux5UE2qOakXZVWi
	lVtmcT6vhszT3g+H+3WD+IG44Is/9RJ6/M3UvhjGTwohs5Gy2pcbJ4pFAhDeUDT7umbwPFxeQfY
	/2U1cRQ/9k7svZRA==
X-Google-Smtp-Source: AGHT+IEk5vZ1UKWFwNAblqDfd6t+N0Mkjayt6bORHiyfg+et25uqHOWyD2FkHhqLkZP7Mco8q9JdgQ==
X-Received: by 2002:a05:6000:1ac6:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3b768f1e40cmr4157399f8f.36.1753336925465;
        Wed, 23 Jul 2025 23:02:05 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b76fcad0f1sm1046656f8f.41.2025.07.23.23.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 23:02:03 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] arm64: tegra: Changes for v6.17-rc1
Date: Thu, 24 Jul 2025 08:02:02 +0200
Message-ID: <20250724060202.2942616-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-7-thierry.reding@gmail.com>
References: <20250711220943.2389322-7-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm64-dt-v2

for you to fetch changes up to 5897c161dc59e8d5237917406ac4be2d88e942bf:

  arm64: tegra: Add p3971-0089+p3834-0008 support (2025-07-24 07:53:46 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Changes for v6.17-rc1

Add support for the Tegra264 SoC and the corresponding engineering
reference hardware (P3971-0089+P3834-0008).

----------------------------------------------------------------
Sumit Gupta (1):
      dt-bindings: memory: tegra: Add Tegra264 support

Thierry Reding (13):
      dt-bindings: tegra: pmc: Add Tegra264 compatible
      dt-bindings: mailbox: tegra-hsp: Bump number of shared interrupts
      dt-bindings: mailbox: tegra-hsp: Properly sort compatible string list
      dt-bindings: firmware: Document Tegra264 BPMP
      dt-bindings: misc: Document Tegra264 APBMISC compatible
      dt-bindings: dma: Add Tegra264 compatible string
      dt-bindings: rtc: tegra: Document Tegra264 RTC
      dt-bindings: tegra: Document P3971-0089+P3834-0008 Platform
      dt-bindings: Add Tegra264 clock and reset definitions
      Merge branch 'for-6.17/dt-bindings' into for-6.17/arm64/dt
      arm64: tegra: Add Tegra264 support
      arm64: tegra: Add memory controller on Tegra264
      arm64: tegra: Add p3971-0089+p3834-0008 support

 Documentation/devicetree/bindings/arm/tegra.yaml   |   5 +
 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    |   1 +
 .../bindings/dma/nvidia,tegra186-gpc-dma.yaml      |   1 +
 .../bindings/firmware/nvidia,tegra186-bpmp.yaml    |   1 +
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml      |  28 +-
 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 +++-
 .../bindings/misc/nvidia,tegra186-misc.yaml        |   1 +
 .../bindings/rtc/nvidia,tegra20-rtc.yaml           |   1 +
 arch/arm64/boot/dts/nvidia/Makefile                |   2 +
 .../arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi |   7 +
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     |  30 ++
 .../dts/nvidia/tegra264-p3971-0089+p3834-0008.dts  |  11 +
 .../boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi |  14 +
 .../arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi |   3 +
 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi     |   4 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 412 ++++++++++++++++++
 include/dt-bindings/clock/nvidia,tegra264.h        | 466 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 ++++++
 include/dt-bindings/reset/nvidia,tegra264.h        |  92 ++++
 19 files changed, 1293 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi
 create mode 100644 include/dt-bindings/clock/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/reset/nvidia,tegra264.h
