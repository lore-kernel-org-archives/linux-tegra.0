Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4750423644F
	for <linux-tegra@vger.kernel.org>; Thu, 31 Jul 2025 16:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753979365; cv=none; b=EtAmJGq2veTuUiTL3HHsZsTOtjSCyCsUVJ9s/Id0VRwIVoAn0njIJ5dzpz3wOq0+WjsZNL0wndmwJr9YBcIgPHYtnhY8j6P+Np12nmbp7Hg2ZPIzDlfvfvQAKaziKTwbAE83uplyccv+PL901+9Yqb4xX1HlwwP64PNjp+y6PBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753979365; c=relaxed/simple;
	bh=pTAemJ0yh0Pc1HDNRdAZitGZHWrrrmXazPzQFXeUMWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XR+SOdhJG10h7jhz781+ZqUaO6in4yQyULjON+YpDAy9QSK3ZXT6VDCWbfdpdt+FFQmHQwM3Ez4nEepLe8jfWGpVi649QPtuNmDqBy/fE67/T+b4KksVQ/h6JXNPjYDQjJnNA+IDLr2Ow7x2paKDnpeu4gPB0fPoL9+7k2EVm+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzjXuOFx; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzjXuOFx"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so574892f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 31 Jul 2025 09:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753979362; x=1754584162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GrfhnOllGO/ZBhleTB8LJWdBObsKh2pIJ95KhExliA=;
        b=DzjXuOFxzHAaBcvPpydX//64zKSv11fi22h9IMTUDtqpWHzW9PdC3qy71bCi7R5Jju
         bk7fM42KJrqwsDaM51tE8b0xiNo+BB2KssDWr2jYADRWQ1WEfvNwpfqHWJh0vWnu3rlx
         F3MXYpmuMBzrOQVvRJMs/8/DJdEe4DOWvXwCFlLpP38vyjaCwsErrknKnV//o3/dYQcw
         qyrgNyOJ8M2/98sEaYDWUcXo0K6yZkHMSLIkt2M7NUH1HPWnnqGctma98Gqw0sIMO+UK
         YruKrQz60WxWfw9g9Pis34wmlYFChax6ppBuIDj2pHJv21wTDsVKo/p6lMJrJFvoEH/y
         8jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753979362; x=1754584162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GrfhnOllGO/ZBhleTB8LJWdBObsKh2pIJ95KhExliA=;
        b=xA/ria/SL4e5Tb8uvNnhi+fhY8Za93jgaIaKVlTz9yxcRckvHkJXqJRxzxsy78ZeQ7
         gt+lhCEUhJ8dY3n5/lrDgu8jZORiaT6t6av6Nwuy5a8UIK+Iz2IQO4mkg1cQU8VCnX7E
         Pbx6Ic1Oxa0PlAzUionfvX/jPSe9fIkATc0wKzLtJjActB4Kps7WgAl0SFEQaTL5cG82
         FJU9UwWilQowDum6/7RxpCr+Hj/S0UEiEHbkhfipX72bgAVA9giXDw5auLJQ1dyborsp
         TKWsPi9efOaQGZTu5riff1QR/XQ2Qr6sC3KjzSOdQVuDSCI/p4+3w/ofYHQIZtHHyPiu
         HPIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcS5Mpmwq+r66SIsddg/cRiNFjUrXZXn06Hdzu+jA+FM9BRHNXpyHE6Q4xlDns5NlE+dXZ9VZcZCF0rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkpSJ3ev5Ow3SqUDiEWwKRauUqGfvK/DaH5WEYxdUOQwe96A6v
	vfNO+CaLZYWmX2KfYadrUDfKGzBD3NvpLA9YjRds+UkeI/4eOrQjRuHy
X-Gm-Gg: ASbGncsTnACLhrNiC56KbC4oMswaAsJv92NSjCiLKAatKfxBipfV6V+D8a7pVGCORqs
	2vAd/DQdSkzU9Mpvvs5pRb7Ht/shP+A6cMXApaPEnjdfy5vt4YTdJTCV6iSV+9Xbpdklca9KIxM
	NN0IuQa2FrgXJSrrDDT7IesVdph9FzlRdjb0FuvrjD2fwWevOJwIVt9PPS7ICq7ImbHhaonqp/L
	S4Y04I8F5n+DiIhnTAw6LKdnP5ng5S6/MH8I/3gyUPo6X6NmSK0vIIcnmSbzplSrat1xh5e0vSR
	w1uHx25Mso/YrvI8MmWxCuNRwA8g66/fYzA1/F2o/wY7NnBJNkKzUNSg2vUbjSGVG/vFjsUInTw
	rcU7j/o2u3zOB9tKizy2YC+A/Sqt5/qZ0lfUxE/9XUgi4cq5f88nxBgprfhR3W/siCxG74NcuUp
	WikHcwuI/I+sPcrg==
X-Google-Smtp-Source: AGHT+IFgEWwFjomsToqFVgplkYJcpc+0XO5/g/a4wp5+gHc+xPLMaQiVmjOvF4+UjzxA5M7HDt25xg==
X-Received: by 2002:a5d:5d09:0:b0:3b7:8af8:b91d with SMTP id ffacd0b85a97d-3b7950286f0mr6927192f8f.35.1753979362041;
        Thu, 31 Jul 2025 09:29:22 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c4534b3sm2849619f8f.47.2025.07.31.09.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 09:29:21 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v3] arm64: tegra: Device tree changes for v6.17-rc1
Date: Thu, 31 Jul 2025 18:29:18 +0200
Message-ID: <20250731162920.3329820-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250724060202.2942616-1-thierry.reding@gmail.com>
References: <20250724060202.2942616-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm64-dt-v3

for you to fetch changes up to c36049da6c903b732f238eb6fd13c2051fac96cd:

  arm64: tegra: Remove numa-node-id properties (2025-07-31 18:18:02 +0200)

This should be equivalent to v1 with a patch on top to remove some
numa-node-id properties that were added by mistake. This should be
equivalent, content-wise, to v2 but doesn't have the dependency on
the extended dt-bindings branch that I had added in v2.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.17-rc1

This contains an extra patch that drops numa-node-id properties that
were added to the Tegra264 DT files by mistake.

----------------------------------------------------------------
Sumit Gupta (1):
      dt-bindings: memory: tegra: Add Tegra264 support

Thierry Reding (5):
      Merge branch 'for-6.17/dt-bindings' into for-6.17/arm64/dt
      arm64: tegra: Add Tegra264 support
      arm64: tegra: Add memory controller on Tegra264
      arm64: tegra: Add p3971-0089+p3834-0008 support
      arm64: tegra: Remove numa-node-id properties

 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 ++++-
 arch/arm64/boot/dts/nvidia/Makefile                |   2 +
 .../arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi |   7 +
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     |  30 ++
 .../dts/nvidia/tegra264-p3971-0089+p3834-0008.dts  |  11 +
 .../boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi |  14 +
 .../arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi |   3 +
 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi     |   4 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 412 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 +++++++
 10 files changed, 701 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h
