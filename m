Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5889912DD81
	for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 17:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710540; cv=none; b=NFw2heoc3D+ofK3HldKKXgm/w1rJW57w+IOuAUo8UpjrxaQAyCnuBS9Z70GejYToZTRhwvIomlJnh/JmoPfyegOvF/6qmkCGqOtHxWsmvekmEAkYd6H+6Fn2HOEy+GkhUDi5mkhiOfx6O6eCxw+idD1gCvKdEp6lmJcmdojVxAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710540; c=relaxed/simple;
	bh=wJwT9h8AokNQb2o22Z4/Kowd6WdzkRkM7kqVn8suBwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q/KzdcRWcWswXqKp/Mb2HCuqx4ibLhhvwtXPTs5FMKyDvSIGs3yb7rPnUD6iElp+bDSz20M4b3SRtvMPkIyYLW5mPcSzaO5c7UXhtheZ20Fm/gTD0S/1vTVVL4i895DrH/DGUiCTiJBgbeftsTIkEmHZE0lsFtn5MZdk4BKVeG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ds5yq3WH; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ds5yq3WH"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5648d92919dso1278245a12.1
        for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 09:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708710536; x=1709315336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5gnokApRZBLpCTRCXRQsO1BqHcf2N+yhxb11K1iRr0=;
        b=Ds5yq3WHW00fbfI9RCTtN7ty1o0or0per/dI5gozQh3OukQOLb3u8YV0gkoTs5HsYu
         ugpTYIdZBVZE0njkt4ATn7t1jRUmVR6zhjyPGoRa+O9ARtE+T9PGOpQyaGosyv207C4j
         FIxU9r5RFQHYsFyCt+zcSmwH7+K4NycmhFUIHjf0W47OaFgWP3NyLCxgVQpi6PiTeLtP
         vX+aibTHuPWjR83ydSgauUS1ew/03lYFU2rxCTXGP90pvr/oEx5+jfZ9WtmUDrfeLg/W
         RLuHk390dlwmeB1btxoY9ZLI/putZ4MFnRNQp2F93Babos1VvcKpxyIoWKTOrQdiiTz/
         30jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710536; x=1709315336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5gnokApRZBLpCTRCXRQsO1BqHcf2N+yhxb11K1iRr0=;
        b=OASUyYqi7I5DYk1wCYsYK+1lSOCzHhd1b4sH5ROykMr/dXvh7cG7iOUONDFC9f1CEr
         bZvegseHKXhSex+0MtIqVzaNokckLJyV1uCsHUSk/sxPS/RAL3w8+nKuzZ1Q2zk9GtSo
         wuEoAJLQn1IgnQI1EcQddhHAYsGxw/BM2ZmMc2CZ+zSKh4rKhxK5OPVdV6SQsunwaZT/
         1BOi9cWnG/jQl0vGStG125LpdHOUMUMABIDdOiug4H2c+htGdizw9wOXCeEcYsfMRz86
         fHZTm4P/YAVUH6G/NgRDdNxscPYSaEogs/WACFBYf7AY2JSyboy5VH7CBh5/sgHpj4a+
         Tcnw==
X-Forwarded-Encrypted: i=1; AJvYcCUKlH7j7QDl/ZkLlft8GCBdejPa6LaJSQH7AqsX8Dtq8ZetUkATLoZm93UMm9U1rRN87spfv61uW2EhkBrRBLResDkTX3nH2nyZQ7E=
X-Gm-Message-State: AOJu0Yzqe/Q9nr4sWkkMF/G7ZSfJM4d2H0KESd4mPHU2JZvdCdZqoQ1H
	kWXzGUoDvA6G8O3Q2d0ZFdSOZDueYY7hPI0cu/E3TMEHnO12HjQ6
X-Google-Smtp-Source: AGHT+IFcQ5Y9+WAUxM022fZ14XREgi8VhEN58GAxsKKt4sup6AUre9XBREThXiY/cBj8Z83jz4593A==
X-Received: by 2002:a05:6402:148d:b0:564:5764:a5d8 with SMTP id e13-20020a056402148d00b005645764a5d8mr350882edv.25.1708710536577;
        Fri, 23 Feb 2024 09:48:56 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id j21-20020aa7c355000000b00562156c563esm6576396edr.33.2024.02.23.09.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:48:55 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] arm64: tegra: Device tree changes for v6.9-rc1
Date: Fri, 23 Feb 2024 18:48:48 +0100
Message-ID: <20240223174849.1509465-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240223174849.1509465-1-thierry.reding@gmail.com>
References: <20240223174849.1509465-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.9-arm64-dt

for you to fetch changes up to cc36acb8a67ddfe4bc7bc722748f6c1b72eed5ed:

  arm64: tegra: Remove Jetson Orin NX and Jetson Orin Nano DTSI (2024-02-23 18:20:02 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.9-rc1

This set of changes refactors the audio-related device tree nodes on
Tegra234 and improves USB support for Jetson AGX Xavier. Furthermore
this consolidates SD/MMC aliases on Tegra234 and provides correct
configuration data for the MGBE Ethernet devices found on Tegra234
so that they can operate at full speed.

----------------------------------------------------------------
Jon Hunter (3):
      arm64: tegra: Add current monitors for Jetson Xavier
      arm64: tegra: Add USB device support for Jetson AGX Xavier
      arm64: tegra: Add USB Type-C controller for Jetson AGX Xavier

Mark Hasemeyer (1):
      arm64: tegra: Enable cros-ec-spi as wake source

Thierry Reding (2):
      arm64: tegra: Use consistent SD/MMC aliases on Tegra234
      arm64: tegra: Add AXI configuration for Tegra234 MGBE

sheetal (4):
      arm64: tegra: Move AHUB ports to SoC DTSI
      arm64: tegra: Define missing IO ports
      arm64: tegra: Add audio support for Jetson Orin NX and Jetson Orin Nano
      arm64: tegra: Remove Jetson Orin NX and Jetson Orin Nano DTSI

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |    1 +
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   50 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |   51 +-
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |   27 +
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     | 1953 +-----------------
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |    1 -
 .../arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi |   14 -
 .../arm64/boot/dts/nvidia/tegra234-p3767-0005.dtsi |   14 -
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |   86 +
 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts  |    7 +-
 .../dts/nvidia/tegra234-p3768-0000+p3767-0005.dts  |   12 +-
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts    |    1 -
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 2138 +++++++++++++++++++-
 13 files changed, 2355 insertions(+), 2000 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi
 delete mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3767-0005.dtsi
