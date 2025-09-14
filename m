Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB31027465C
	for <linux-tegra@vger.kernel.org>; Sun, 14 Sep 2025 06:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757831978; cv=none; b=NFN5GdKY/mIO6uSyaBo59gVGAbHPT6+gsN42Uj0EjggC8JSodCSQv+8Nq3Iop4ySdME8XpBNIYU37kMM1BuDQ4PL+bLB1mC7EFQJH1WhOaWSxVJkQ+iaOwhK3FeJZhnEA4AMGl4xCMbDR8QA9z9VAXXF6NFaXTNTveaQ5ufGm1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757831978; c=relaxed/simple;
	bh=FBMpkEG3xuVEi6X8+YIzbjr4P6M5NPjehQ/mvrGD7Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kcCd1Dn2ZJj532hPwvp+fYDjYbcBjTnnQC8knQEghq0O11z3izT31n5KUnq408+/uoOioG14UaWfMoX+O1FXOTYjBp+GQqqZrcYTZNJfPVFNQ41hLHm8Fn1odERQH0eXFudbMyvr0QOC5vCrT7/H5vRQecUCfC7rAa/08WuBu+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jo317COh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jo317COh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so1579345e9.1
        for <linux-tegra@vger.kernel.org>; Sat, 13 Sep 2025 23:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757831975; x=1758436775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iROJ2tx36gbrZBejvZUL/Zr/rsiyI59LCcbHtmzoHL4=;
        b=Jo317COhm6jjtvXfj0tf1oRrC45g3Fi8z2IAEZNQ3foKgZe45RaZ3aQxkcjujB9NTh
         9jADJl1VDNisa/4ySkK1rzGZRE5djvdAasoECx0S/hiOn7Fd/fkepU1ZapffwsB6zzaR
         8CnXgcfvP5l9/bCI9JwMKj8pSh8065ncg5Rwa2AAsh4qg/+L/FwQTLJKtyrOUXCZFNZS
         p54ncEpSl2gtlXw3kAlKLZpDAu7+R/0U9FIaIguISb9kDGQFjFo1EH9B2i08ox9q8AP1
         cLmMcar9Ag336axW3E7OiUj3cVAPCyZ42JwXjX3TsbRWyO9Jhear6KgYDRAjle+DkRYT
         OYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757831975; x=1758436775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iROJ2tx36gbrZBejvZUL/Zr/rsiyI59LCcbHtmzoHL4=;
        b=haW75ZVQyYVVHXxSffDG8tP2X0+iTZjtFfA2s4q8uuUEE7iW844/IWcAEaV1K8Fx3T
         GMfxeNhVwqPx9gqN6uoTH6uSebIR7Jcs0w53GuYmb+m2qcae75rJeC/2ExPs+8be1QGf
         mXw8uqunMvMfpQ7fuSrzT1xyPF9JS9hB8f8XhhXEd3/Mz7vXC3jIEOCSa5okE53NNXKJ
         AdHX4+myLfmfF+UPt9gdbuQ0yklcXZetLC7i1o1kyyvms7QBwoDDAkIQDyp0MRLEdrTd
         eFxGIza5FSqbopZh8TBGoCUekcouws9YGBLJH5gQ9zYx1r+dmjVK2//5GIRPc+7RUv+y
         sIdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE1Fud7IG6PJNe7rBXpBsE9fcTUhf30PJBwxcvGbLNlLKBn6NooUe6DctSWDZptw44CS+3fI64xYZXnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxltXnNmMXfOMiZsC5BhfArF8No7xImOXaWyKM9+wSWuK+P4fr3
	sd+XxvYVMFO04fWmkpMqkW59rc7OG9JJsix0lyagTmMjaG8uEqyqjaIb
X-Gm-Gg: ASbGnct04xKWVTVoYiPBOBLthgpYh5qcKoFWWb15x0FalFX76joTBnIlTNLdoajJ/DJ
	1YATuRZ8itL52mG5Zqebpj3eYCBTevfIAAtITOvIEQEaQcgI3UTFcLngdKVKs4FBvBm9ZIujoB/
	bcy/40O61FIHMIT7gChOONCDL8gPY+m2CvnybB7CegRNEzrhbHwQi4oXge5ubk6pg8ioVWr9tCk
	Fp6nfEEdSgCpu6J+o8NO2JfEmTndV1w2M4CVKaNeijBpIA9R9jQfSV2TaEUt3o0u+sCJIVDlEsK
	JNg1pUDDDQg/QQcoKYblfadsqVBrjjVs06MRgwiFmVlFSYleNg77jNOF1rfanNjJ6G7GEo217Sz
	nONwFlYKk6WmHoOVuQzKggr2dl/iNcHsgtVSkLwWZ4vJsrFI7qbMVFgIkbgW7n7GU5GPCUotrLY
	Xtz6bSNAVyfvXWWg==
X-Google-Smtp-Source: AGHT+IFW+rB6aGFLs4VDxuSN9TMDXFvYUKQVvW3JHgJgSZD/moUw8NiHIlbWSVkHBC+L1vElMhYi0A==
X-Received: by 2002:a05:600c:6610:b0:45d:cfa4:ce10 with SMTP id 5b1f17b1804b1-45f2128d4c1mr71751335e9.10.1757831975159;
        Sat, 13 Sep 2025 23:39:35 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e015313a0sm66917115e9.4.2025.09.13.23.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 23:39:33 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/4] ARM: tegra: Device tree changes for v6.18-rc1
Date: Sun, 14 Sep 2025 08:39:24 +0200
Message-ID: <20250914063927.89981-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250914063927.89981-1-thierry.reding@gmail.com>
References: <20250914063927.89981-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 04f27a0fda6b6be104531eeb95d07ef1b3a72af8:

  dt-bindings: arm: tegra: Add ASUS TF101G and SL101 (2025-09-11 18:28:57 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.18-arm-dt

for you to fetch changes up to 73e23d3bd7220847c3b1554ebe29221f84a01e95:

  ARM: tegra: add support for ASUS Eee Pad Slider SL101 (2025-09-11 18:30:46 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.18-rc1

Add DFLL support on Tegra114, fix some issues on Transformer and P880
devices and add support for the ASUS Eee Pad Slider SL101.

----------------------------------------------------------------
Jonas Schwöbel (1):
      ARM: tegra: p880: set correct touchscreen clipping

Svyatoslav Ryhel (4):
      ARM: tegra: Add DFLL clock support for Tegra114
      ARM: tegra: transformer-20: add missing magnetometer interrupt
      ARM: tegra: transformer-20: fix audio-codec interrupt
      ARM: tegra: add support for ASUS Eee Pad Slider SL101

Thierry Reding (1):
      Merge branch 'for-6.18/dt-bindings' into for-6.18/arm/dt

 arch/arm/boot/dts/nvidia/Makefile                  |    1 +
 arch/arm/boot/dts/nvidia/tegra114.dtsi             |   33 +
 arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts    |   61 +
 arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts    | 1251 +------------------
 .../nvidia/tegra20-asus-transformer-common.dtsi    | 1268 ++++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts       |    4 +-
 6 files changed, 1368 insertions(+), 1250 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
