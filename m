Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99C31D5CE8;
	Tue,  9 Sep 2025 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757404210; cv=none; b=DLsQGl5rulGan7rlhmvcXVWI9DRvJ1UpUPepY+G8HJcI1wma6CRUePCo205rH8Fqitf6qlb/osSd6GrNoKr5FvVVIEm7YQ+89i2pd3gz5U4rpWQ+lcNi4a5++ZlH0oZi4jYcO3cV0UkWdzjOEv6CwAsPh/L6/kUx00BN78LodSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757404210; c=relaxed/simple;
	bh=rWLmVa1TYp0NNuUGlURbio3UlB5IYc5X1aTpfaI/1GM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V7t0tOAC8AgLS9HiAERkS4S7N0k29fLWMOhGjlGyM+ZFPzcaUChwHbyQfRqlL0H7VL8GZoIMEAkvHR96vT/LPygVbXOkh8XS2gEcAQvRIHZLaxm3IUqReVN9Xbh7Csr4S4m1EXacz1hL1EPKLY1fOGYsrGZpLhSYN8HfBc1bh6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QF43WKdz; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QF43WKdz"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f78e3cdf9so6481894e87.1;
        Tue, 09 Sep 2025 00:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757404207; x=1758009007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d4H7WYsjrFJn7KhmrQ1dVEmvy8K86xvbQWqtesNoEpM=;
        b=QF43WKdz+UBIZp/7CAfMkLCJtEYWUj5VtvnVYyhKuW7KxxzZlUsSUWdhwswrw8DquR
         t9LdFT3qmcvUO1Gydo0B85mlfpjRskKh4yK9mfitgd/P1gAaYn4JRZ3AXCIbKApC2LFR
         aHpsWJx6b6YEMylIDMPj1uKnqNIGjWvOmcqeXY9EM3BWpLN/PiXT1phWosX/CkFNFih+
         2J1Qtd1EUBuLF4KLQdF6s+ItJiL+USpiB4zbpM6ZSuFJSH+VP+PP5aUhShaq2H/cIb6l
         cFwbeJ3HOC0kV/c+i0dBzYPbRVyVqiChXSmveoQ1ITTRMJlLXkVXYum/MmUANs3m2od6
         jyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757404207; x=1758009007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4H7WYsjrFJn7KhmrQ1dVEmvy8K86xvbQWqtesNoEpM=;
        b=jdoq3q3RO0BouUcGV/ybDD+2YR+0SmJXg2gFVnevJ3qno+vsiq9Iu0dPPa03GDc97J
         ST8fi7digoq+TFgAtf4cVPWoGdHjg2DhCgRFNvCsJRaUV/c5vJSA8eHKdct32bZxpcB6
         3sxWNw//G9NEGXPuHRWkYsCuQF5TQxyP0JiWXi5FAInaMHr2wMGn5fmZxLNCrK8s1xLQ
         eMKnL8Ty/3U09lL689y1F+l5iokNzriGdvkrZ8cIRQSkdWzSox/L2plgdi1QWQLVkqeK
         791NbRIlgSPQvYYpNtbcjK+2JFsG+X+r12UHrdAGFf/b8XuTFlR85Ysojoc3Rl1Ap+tV
         bUTw==
X-Forwarded-Encrypted: i=1; AJvYcCVSJov2LGS3JHS684VhxtA6RpFmMETLW+Lu0pkAQ9AMutbQ8pEji97pJG9S4/2AM0p/dN2+Po9Ph0r5mqM=@vger.kernel.org, AJvYcCXj/tK4LOIiDbr1iF16lVvoCYl3U8IB9DY+FJ3Y1PUpF3+Z3L1u9Hco/XlQEGGkJgzbPnjL9FztavEK7h4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsDwCjOC91so9dKIxMxIDKTQTj+ATbH51+r/tjgZFxJmpSjjO1
	eH4ua853twGEsLKxHeNiXTd2CsTuGYp1IDa4YHpJ51SeAHFf5CLg0gpECovDWA==
X-Gm-Gg: ASbGncvmxxAbVCTlqR5B5XlykPPheQeXoq9MC0JULEJOFDleVseSBFuKaaUHkM9gDIM
	r8lcIixJHRVF0i79qLynqGADCv/kK01b3QEYfq9yRd4UuFOXWnRJoL5H784O02i1GocU9xVfWOb
	R4elHgc2ntkLeSF3RzI/VpxEILoG8+dyNLAeLQwbq4xXAWQMAWJsnWkBNE8po3YtiNrwxVxO+XA
	gT9YZHeFbjerOut04B7P20tR4ffPkWlDH7Oicc8C0IxNPwSF0WHvzOZI8MF60zv4ruIJLw/skLg
	DnAeDyJg0TcWYY6QeT/F+Ye2gSUG0dS6+K6VHH3b4KB0yE+W5v65/CoRj6qQOmmBTnrRr3Xj4nv
	kVc//oeQQez1d/WEkeMiAbgR7/T+ZSwh05tk=
X-Google-Smtp-Source: AGHT+IGuojacHFmn7NVWjJTFkCh/+6p32M4jCFYna6r11q099K6j0rKMP9pUo1Oyd/KR14fdqFZ74A==
X-Received: by 2002:a05:6512:3da9:b0:55f:4ede:5d0f with SMTP id 2adb3069b0e04-56261314023mr3027108e87.8.1757404206577;
        Tue, 09 Sep 2025 00:50:06 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680cce9f3csm340021e87.52.2025.09.09.00.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:50:06 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ARM: tegra: add support for Xiaomi Mi Pad (A0101)
Date: Tue,  9 Sep 2025 10:49:56 +0300
Message-ID: <20250909074958.92704-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Mi Pad is a tablet computer based on Nvidia Tegra K1 SoC which
originally ran the Android operating system. The Mi Pad has a 7.9" IPS
display with 1536 x 2048 (324 ppi) resolution. 2 GB of RAM and 16/64 GB of
internal memory that can be supplemented with a microSDXC card giving up
to 128 GB of additional storage.

This patchset requires Sharp LQ079L1SX01 panel patches to be picked first
or at least panel schema to be approved.

Svyatoslav Ryhel (2):
  dt-bindings: arm: tegra: add Xiaomi Mi Pad (A0101)
  ARM: tegra: add device-tree for Xiaomi Mi Pad (A0101)

 .../devicetree/bindings/arm/tegra.yaml        |    4 +
 arch/arm/boot/dts/nvidia/Makefile             |    3 +-
 .../boot/dts/nvidia/tegra124-xiaomi-mocha.dts | 2514 +++++++++++++++++
 3 files changed, 2520 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts

-- 
2.48.1

