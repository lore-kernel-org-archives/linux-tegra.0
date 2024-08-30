Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CF31B1D43
	for <linux-tegra@vger.kernel.org>; Fri, 30 Aug 2024 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725027012; cv=none; b=Hb9xoheNF7FpLbjeWhtgBVIT4mrB7dyGkpvNuJNN+Bao4gPhZH6knS8J07idVlUN8MFPQzttQjmzZIVn/nQpcDapACUkY59mFRx4zuIJSMbzf5TiEGvwaUDYI+yxUUKMnV280YdSpLP2Q+bFSzPKvqyoKOCLsmvFKS49c2qTfHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725027012; c=relaxed/simple;
	bh=woBv7xSaBV8J4fMHZzd5ujS01OmY0WReaMhlnsKdjfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OnJ3pyzCrzmOikQnG0rxxxR0TeQRZzjwI2v+jN2Za1O/JqHr6vo15rrNJKG26xn2d+gdCGVvnQ8wzGzn3ceWUiioX7Pu7sAN371lP9xB2oi+AkD6lZrNvHDVde8kjYnfoqGpkEsB8B4iBX7MOGJm9Idc/i5Pw9Dz8rHHTDQCn8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMq5EEM0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMq5EEM0"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3717de33d58so1184854f8f.1
        for <linux-tegra@vger.kernel.org>; Fri, 30 Aug 2024 07:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725027009; x=1725631809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RJ1FPZC+rVZlb51jlc31En5hT69orcbEeq1sqqoigc=;
        b=cMq5EEM0tvU3raH4cD3bybdQux8AyH8kRAtqk81ayG6nCt2HDxQlyFCjv5gaHAJFVi
         c8cKOy5MR/FdIKvH8DW57ITxy/avZ4j+15L9k2hiWW9DXdoFL2nXLEVsv9RSJVIqRrde
         tSZWNVGOTmVxjFQgTItkPaxbUdfZBzxcqCm6FxRK8zq9cueDeHbBQQ42j85/pqpFI/g6
         plAflIIDTmZQWVeyNn1cL+PIHHPx21J4LKsVyZFTCGbDWPDti/hrtcmoTxbe9gvSKFwR
         2Xisab+snzTCN4+dL8oXooanQg/DBH8kod8GvC7wnTTJfADimu6xIGFqBcS6F3aGcrUU
         VtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027009; x=1725631809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RJ1FPZC+rVZlb51jlc31En5hT69orcbEeq1sqqoigc=;
        b=lloszNcCkU+/h+6+Cdj2Zir0UnSRCIXKU/L5NicQTb7T9NlSK4ho3VnkWOGv0qVqpo
         4WzZdr9PydYUSR3+gwh/10C4q8BQd2D0hwOjXRa2nh3ob1ETo1xJ+jUBvTTD/guUSeVU
         O5ALc9wWSl3prHtJ7OLX7X5ywx7ukdl/hKCZ/xL7tfDXo9hXhiFcqhaTYTY5XSw1RI89
         MLa1z7IrS6oE/mZ2+O8x30823MqClWMSHeedrAojtPTHNBdthq7pdiCVTu5i4hDNnTmQ
         gekYI+MQjDmvckFDNsClhhjmeqXLZpzNU8ZVPN84o55AKorNm4yuVoy36I/MTDfSiEd+
         MUyw==
X-Forwarded-Encrypted: i=1; AJvYcCV0+7BMcjyhfWE7XiytOsTgZEO+ZKFfJR25aMEJp9/0iDjY9ewtIdDuC08SYLrG365YfL2z79DEWXnZtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd/o9a34z4V4ANwcFOjLVKiQe3cYlGssEOsJfkjL1yOMa6n8DE
	nfzqgmWiwS6FQKvGQ11wba4Gr/LiJiTotVdNtfgrxa64EgipCyVx
X-Google-Smtp-Source: AGHT+IEeHeAt1JoFxeGnZsodFkqRqHsRdx29ZzeEC4F0qoCp6hYYtYLfQeRzmunZcnzpHRFwCiXUAg==
X-Received: by 2002:adf:fc88:0:b0:371:88f2:93e7 with SMTP id ffacd0b85a97d-3749b544847mr4374310f8f.18.1725027008329;
        Fri, 30 Aug 2024 07:10:08 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee72ec6sm4090941f8f.42.2024.08.30.07.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:10:08 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] ARM: tegra: Device tree changes for v6.12-rc1
Date: Fri, 30 Aug 2024 16:10:01 +0200
Message-ID: <20240830141004.3195210-4-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.12-arm-dt

for you to fetch changes up to 8f4c834d89150e9b1c6c3e006668ed6fd9ee2b15:

  ARM: tegra: Wire up two front panel LEDs on TrimSlice (2024-08-29 17:36:39 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.12-rc1

These patches add a bunch more features for the TF701T board and wire up
the front panel LEDs on TrimSlice.

----------------------------------------------------------------
Svyatoslav Ryhel (11):
      ARM: tegra: tf701t: Use unimomentary pinmux setup
      ARM: tegra: tf701t: Bind VDE device
      ARM: tegra: tf701t: Correct and complete PMIC and PMC bindings
      ARM: tegra: tf701t: Add HDMI bindings
      ARM: tegra: tf701t: Add Bluetooth node
      ARM: tegra: tf701t: Adjust sensors nodes
      ARM: tegra: tf701t: Complete sound bindings
      ARM: tegra: tf701t: Bind WIFI SDIO and EMMC
      ARM: tegra: tf701t: Re-group GPIO keys
      ARM: tegra: tf701t: Use dedicated backlight regulator
      ARM: tegra: tf701t: Configure USB

Tomasz Maciej Nowak (1):
      ARM: tegra: Wire up two front panel LEDs on TrimSlice

 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 1558 ++++++++++++++++++---
 arch/arm/boot/dts/nvidia/tegra20-trimslice.dts    |   30 +-
 2 files changed, 1381 insertions(+), 207 deletions(-)
