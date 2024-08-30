Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7CD1B1D59
	for <linux-tegra@vger.kernel.org>; Fri, 30 Aug 2024 14:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725027013; cv=none; b=UGvSBCheAsiGC0cgCP8a1yjusjt3NgBytPgW6g6/6pFxBM5ia3L7lHtbsA9tQCZdJT9vAy1Exbzud0gUUyYUShw4dL2X0GbqJpHylvgJ6w09GtFmZgVm6c7O0XAWB5lyLWDIfxUOjbB3907DrCeGVhBcEJxJ8jnh5ejWDNOHRdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725027013; c=relaxed/simple;
	bh=8yZ76ZQ3Gc+h9CHaZUuTwKn7WE3eus3BwCJJknlv9Go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FiAQYxh9+KDnOf8Ivk7pcQHsxRqXi8C2KR/Ge2xmSFJfKJceRJ1b/Um+Rrl4cV8eq+GzenQdU6qzhRLjRxezbXl9e19qXj726VAsIjyyHbQovPDYmHpkQ+vC/SdsIMYEcM8+Rum2/o8L7nHz3C2HJqwAanOwTa2LW9ntN/2xxLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewhzor42; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewhzor42"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42bbd16fcf2so5176665e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 30 Aug 2024 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725027009; x=1725631809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IpUz89wv1oXUxzK+wlN2VqpeUK5IuOzqE77lHVyBLk=;
        b=ewhzor42OK85EVlDPQXZYxe75+H2XgXP8kgqYbmG7IZVGLXbbE3LXWgL2AxK+43UqW
         SIbNpDmfX7/8L452pgB0KF9VGb6VMk2+kN+OhkWZyK4XvhzPVYyIP21yG0SSjDVcE2ju
         lqMSxQHU5kqiZsxYBmeio5NwYueMu79qEO4f04aXOgdkpBYTi5E4V2uWbRXhDO8VqTy4
         BwF8JV65Ugw6eEsqJyiFl0jGY6p1UVW4pvaTpWDMe8JlxnxNMz+Dbl6Wd8PDk51V8/xS
         dJOTjuA1B2cmuLQuRn445jPZDmhdABPBGF9xGUsT+dFGKIg5/zKpVPb8wSt6h8G/caLc
         xGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027009; x=1725631809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IpUz89wv1oXUxzK+wlN2VqpeUK5IuOzqE77lHVyBLk=;
        b=e++P7339TNrf+koay9BbQxVpXqPRg1C4Pk2fdATkfaxFndzshmRJRLAtJ/0Y6QkiZ9
         9PfQMnGTHeNFRb3BlX3xRS6FZaFYlvpg93/2Vc8wgVVVCzLa8OvsRz01ZZ5yZ5c0rUGo
         ONiPp/DW5kMm8nFPIQE97W5Dal4NFqU5kBFakM+47d/D2jSwxrD9Hj+JshA2EOxfmzwW
         nf//yJnB/TBSvzYC+U+vlW8hHMKtcXgwEDJWaLkL3c6Q15XUgO3O+i8eMs34JXIvzmMT
         xn4TcD2ah0Mn4741AtOsxIERstnR3INP0hadCQUpSSjNRjcSWQtjeisYeNvIkupWo651
         2lBA==
X-Forwarded-Encrypted: i=1; AJvYcCXCJbNSDVpvI2jtnwjxv+1ID2fkdetYS4YFjHyl7LyatyjrJznzGAGEACgob3A4gaVfUGpJvRaF3yez3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqDUnRYQ9UL9bTPO3g3FZ5WE37aEVW5DVfYMpyAuzqntoFSdz5
	7SiifYxTEm3+uhWEcI7OddTr/8RMgP4m9mimqGpJTwoznvswfDDR
X-Google-Smtp-Source: AGHT+IFl6onhWS8VB5pArczv3c7KEFizVXpaE6FuWLa/7QdAa0shwOoEwtlZdYuI62q/whTy6AQA/g==
X-Received: by 2002:a05:600c:4f42:b0:426:5269:9827 with SMTP id 5b1f17b1804b1-42bb01363ecmr52815835e9.0.1725027009166;
        Fri, 30 Aug 2024 07:10:09 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e27467sm47422765e9.38.2024.08.30.07.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:10:08 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] arm64: tegra: Device tree changes for v6.12-rc1
Date: Fri, 30 Aug 2024 16:10:02 +0200
Message-ID: <20240830141004.3195210-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830141004.3195210-1-thierry.reding@gmail.com>
References: <20240830141004.3195210-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.12-arm64-dt

for you to fetch changes up to 93ff9686228aa705714c3fe0706ed9ce9410037a:

  arm64: tegra: Add thermal nodes to AGX Orin SKU8 (2024-08-29 17:40:35 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.12-rc1

This contains a slew of cleanups and consolidation changes for several
Orin boards and also fix some minor issues and enable more features on
the Jetson TX1.

----------------------------------------------------------------
Dara Stotland (7):
      arm64: tegra: Add common nodes to AGX Orin module
      arm64: tegra: Combine AGX Orin board files
      arm64: tegra: Combine IGX Orin board files
      arm64: tegra: Move AGX Orin nodes to correct location
      arm64: tegra: Move padctl supply nodes to AGX Orin module
      arm64: tegra: Move BPMP nodes to AGX Orin module
      arm64: tegra: Add thermal nodes to AGX Orin SKU8

Diogo Ivo (2):
      arm64: tegra: Fix gpio for P2597 vmmc regulator
      arm64: tegra: Add wp-gpio for P2597's external card slot

Jon Hunter (1):
      arm64: tegra: Correct location of power-sensors for IGX Orin

Tomasz Maciej Nowak (3):
      arm64: tegra: Wire up power sensors on Jetson TX1 DevKit
      arm64: tegra: Wire up Bluetooth on Jetson TX1 module
      arm64: tegra: Wire up WiFi on Jetson TX1 module

Vedant Deshpande (4):
      arm64: tegra: Add DMA properties for Tegra234 UARTA
      arm64: tegra: enable same UARTs for Orin NX/Nano
      arm64: tegra: Add Tegra234 PCIe C4 EP definition
      arm64: tegra: Add p3767 PCIe C4 EP details

 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |  64 ++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  53 ++++-
 .../arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi | 135 ------------
 .../arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi | 142 ++-----------
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     | 125 +++++++++++
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 108 +++++++++-
 .../arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi |  90 --------
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts  | 230 ++++++++++++++++++++-
 .../arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi | 215 -------------------
 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts  |  17 --
 .../boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi |  26 +++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |  33 +++
 12 files changed, 648 insertions(+), 590 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
 delete mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
