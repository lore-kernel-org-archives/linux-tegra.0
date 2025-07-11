Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685D521421A
	for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 22:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271802; cv=none; b=nZUIdchd6idHqViRMH1emMQQqzpzNflAQdWB/PdONYNlsupmRxcsc3GdzLeWxIoYAQ09s0NEeFB/dWT1DZwIomBIFUPbG5Ej2jcRXIIuQJjALnD0APNi8mhA8/MtSkcKi6ipcIcpy1Qv9F+j24OFatDd8zkrrVAaO1U0N0Z9aTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271802; c=relaxed/simple;
	bh=Ysff8lfY5O5wvaYZOOIF1evBmJpKFGjjjhLAY7PokHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lLCBB+YX11khqZdfoqojMUFtKYsoFm5HPv8pewvHCUF3rkHB2mgaAiNnz5CzApxZvzzY4dKK5ra8DnjAFoUdWe7I7Ky6qwixghfniCxmhYTcLKF7X5CJl0POW2C2+F6q/zeIvG+gVHF/NqIzgfDs6q0TahB+WyDDr8LYHYfXwwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGQQGM55; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGQQGM55"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-454ac069223so19292375e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 15:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271798; x=1752876598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku+08PMO7/vjq2Tw85ozrppxDpvyl6Hgmrcst5Ryypw=;
        b=UGQQGM559jB5ACzpckm250M1oxr8xC7W+/K3UKCiKN6/CN1mFXmKuYp35d+1Bf/2Mw
         9gO4QoF7Zwsl6g6r6ppdpEbh5/QBd9lxbkAWsHNkqe1Ljykl1p2hrxRYWezGLLsZqWGH
         iS0lWzcB2ZhSKfKcjdtPRqyFhtB2Gow1BspahxRX1bHuiF+HN8CFCtg2jR904P2C700r
         uwD8vTP3CoBYkmg5lXPA8ElDSQymihXax2bWqgdpd51X1ZuPpibVX2wtdmlyog085A4E
         rRSEb1rnxNMI+POteLPjxU+X1Gxnoh5PNbrtL2f5AJlz4Bya2Hn0OsXHUNInQtETxyYl
         Wx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271798; x=1752876598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ku+08PMO7/vjq2Tw85ozrppxDpvyl6Hgmrcst5Ryypw=;
        b=tXlT5R1TTXDgPApxE3o+Axp0FoXg2cxPmTb0GNKxMSPk44QPJXEJlZ09q+sGfhGrET
         p1VAnBXxetfxbIQ6kNGBDXIPyFXKpT6d1B/fbs6qDhhYQYP57rz7wwcCOOQzGtVye9ul
         kC2SmZAMDiTBklZSQp1AtVKAhmPueZRO7NHpjtv5NQFHc9EHxq419fqfIIQ70XciO6qC
         SQfuvdPaT/CX8QgunTfZa31vUQG8ei19w4ZYBw1jSHAsq7GZq5Dv96+gjRXjbMBTYJNM
         Y5RzSRK9S2/OZGwnrr8X7WOZUKnbZrIIrq4LDU240pqtOCXh8FQxapS/QiOg4WpqskOK
         CXHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTy1kxcDRt2/nTqYUAgEaThtSCwEp3zRUqQDi7dmpjjM29QEqczZk97aqn1VxrxrN+Tz+DcG/YMcLtUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWF+bAwOx2aH/3arJdyXe1s3cgyBQzmQS0kTogUygjNAQlszkW
	njk08EusG82h+yErx/jFmeENxPcCiVcHS6zWQCwTxDYvb5ADzbUZCr+m
X-Gm-Gg: ASbGnct3FDJAjodH3kNFigm6QCiw/8Abhv97Z/DP5CfhytKnzcwlojH47/XKhORvibj
	4URe9AGmZrDl7J706UbzpUd+EX0Wz7DC/Bzpl4hquzEV89sJgyrTxFS/KR/ElbJenKnIJ0MCKzA
	Ep/TX5UOiq9KGzJ9JVALdUqh3LBJDXplFRwXFLWArSNxKSCLYQMWURCPoSnYib7m551ctGA72b0
	tnqBTfXjPx5ASsBGSD6BbMHpaaIxB/BKJymgicU/vi5nz92CkmdGRKLm+4LN2wgTEoKZVTp6XfX
	kigQEvT12si61tIez8Jf86tS9R7mwBzLsYTKsp5gpMyKxiR0/n51+zyAUveY2UbspV0bRSr/3wF
	s/MuAO+ggFRcr/5jgLiA/3xd1Ysjor9qVGTpgkDww0JmabEoHg8B0hYQsq1J046ISbcKfJdgP80
	yZDn/j3jSAIc6kjw==
X-Google-Smtp-Source: AGHT+IHipbiPzHtHT9lAlbF3iUj7vcZpxHsOY228G614wvileARaAiUqQeN6JuMPlvDPl0+rJezgFQ==
X-Received: by 2002:a05:6000:2706:b0:3a4:d9d3:b7cc with SMTP id ffacd0b85a97d-3b5e7f3d0c4mr5790806f8f.28.1752271797634;
        Fri, 11 Jul 2025 15:09:57 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d5f5sm5633411f8f.56.2025.07.11.15.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/8] ARM: tegra: Device tree changes for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:39 +0200
Message-ID: <20250711220943.2389322-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm-dt

for you to fetch changes up to 3c2c00572fc3e0b128f75c7ce9c3f70ca457cc3b:

  ARM: tegra: chagall: Add embedded controller node (2025-07-11 17:11:18 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.17-rc1

Add support for two Tegra30 ASUS devices and enable the embedded
controller on Pegatron Chagall.

----------------------------------------------------------------
Svyatoslav Ryhel (3):
      ARM: tegra: Add device-tree for ASUS VivoTab RT TF600T
      ARM: tegra: Add device-tree for Asus Portable AiO P1801-T
      ARM: tegra: chagall: Add embedded controller node

 arch/arm/boot/dts/nvidia/Makefile                  |    2 +
 arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dts  | 2087 ++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts   | 2500 ++++++++++++++++++++
 .../boot/dts/nvidia/tegra30-pegatron-chagall.dts   |   16 +
 4 files changed, 4605 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
