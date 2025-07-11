Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9752521ABA3
	for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 22:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271795; cv=none; b=q/SdUdIs9OiGQ/fq4EsQiIuTFTSU+9Pkj4uvS1lYFbGTWpKwGJm+GpnsO1xK6CFfULJZ5PImsYnVvanneQR3QQ4MqfaT1NQR2t+VxJAHTOWYGL/+zkdAhVCnokfJhiv6srQCKeNit0XOH9FgBQKW7lpRPBrVyYKIJ7/xYgOFXao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271795; c=relaxed/simple;
	bh=twQN4szJviXlTffWihCZFgvw0JCyvnr9tfOri3i8sqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N0vq2dKeKphdrZRJRgYVWnyamC6PByecoHTMKj2uw40eyvIvw4dczQ/u0HqM0k7CWEG4F0/0Zmk/4yL9wxNv0cMeZn4gGF5O/pztgQfrp4+zGZG8e/z00PVBFgf43rXcT+R1bz/OV3T18VFKQJCumAlTzmTOnRGcSV4bOpvRWUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jw2J9jzm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jw2J9jzm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so22393025e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jul 2025 15:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271792; x=1752876592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxlOt1TcvjnPL+nIYmbqEz8a6dgQfeyHjwXGW8M0Duw=;
        b=Jw2J9jzmIfU05OgMOl5sKEuVc5y2AeJFiAmQky5dV8pRFq3X8VoNX9i78M1VB4E0pq
         65NJlOdPFbOIRBqq12nfNzbTsKIUc3+alpR9MzjQD1EOmhajrYv2ncqT2DcRAmvf+42I
         Ydvdfgx9i9LP8/d67IyoLz4flLZwaOmzdNJfQglnDUg5Nl7nXy2NfK3nic1dqCw4uQuz
         CFZVSDC8q9E2L4N2piemwBAaH5TddRg+I5lj1PRACxqEd457bBXtk32AGHyucIVHVsOh
         FgiKOHfPXFtJpEl3sHpcutfTxWqtmJB7pt/kJkPgvH2y3E7/vkPcrYkEZAIrNysR560u
         5rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271792; x=1752876592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JxlOt1TcvjnPL+nIYmbqEz8a6dgQfeyHjwXGW8M0Duw=;
        b=ATwuvVNp4nBVBuAF4cVqFEuFHyfaEjgBx6294wM9I4MBdY4fImh3AOioIp+uDVdkSI
         DDPGhnCr4ruwSXshdAGUZiRPRAYJrQonSJWQkq+oOs3HU2eVult7xqf36XQEO8OQyRMp
         mdedu2D3xjZNTNZXUpOra+/QzY+ocXL+MiytRH/6eCR6urmDmqMGIUvnPtgVA8Nf9JYS
         68ZP1XWpT9vohxPbcVRAksZzaV8xTLOuh3b82F6nvwlN6GyI9+OQhcRDOslkKeXmTlwT
         hqLAYwPxuK6gw4EwGzcAs6OWw3GqUKHXFmJ9MCOi6da0/VNIWqwz0EbxUV2r3vPSfS1V
         9GqA==
X-Forwarded-Encrypted: i=1; AJvYcCVzRqmftX2RgiIiHDkqJI4ANUyC5+XkQ3KqKiZxk9dC8ETzasRqq8nMxyX7kSpci+y/JAle8kKAxnE84A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCFYeiukoNAqJD1yiVCCdwz81ZsYe+6arXL7DO4Xu+7A9kD4DJ
	bjtHygzMQoGoxQffxGEhJSL/lgfoRvNgpYRvPKAWGAG0U01CoXAnz9Yn
X-Gm-Gg: ASbGncu8lq5c2DoTkQ1E7eTLGYwjD71gMGwOrkSr4gY/Un2KuET0yqwwJpZ/ELG0bAg
	iVD4BBXvNqqtjDLFHouTxyFk25u+OXeCMtA5blfttxJAZC6o3Z/eweKPZjDWOTRSHuOW7CkihPR
	rq1nlh8plYxdDr9MJttLsLjPlEpiYEQrJPSjxpm+MWeV2Xpd/yFpuIYsixUdht4daR0q6Yyf2Ie
	eQ5YE5FHYW8k1sH54OqBmSGEEZaOGnuHguk0qEHN03xGgxMl5uAHCs0LlZ8Imd/ZASYLjS2C+YN
	4zd24YbvWRvUgoNR8b9Wpj/nwE1ENffQcYwg0XJ+j7uZjwdzGL26OQl0YrHY78+Dgc5/qDK790B
	SmRDefRw2ZIKai34EpVb0yY1tlrxDa3avUMgnbqkbWcWjFleQ227J6T9E34o1xbeecMX+niknbt
	0cU5od7N7DQ2TAgQ==
X-Google-Smtp-Source: AGHT+IExZjFpIAcWoQpl+VbmWsdNzvcMBIOoWZxuJvknKQKNhrZ/J+dmt8K8Q4OF5msRFOLLDCGpUg==
X-Received: by 2002:a05:600c:1d20:b0:453:10c1:cb21 with SMTP id 5b1f17b1804b1-454e2aeec43mr51634295e9.8.1752271791612;
        Fri, 11 Jul 2025 15:09:51 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d5easm5540016f8f.48.2025.07.11.15.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:49 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/8] dt-bindings: Updates for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:36 +0200
Message-ID: <20250711220943.2389322-3-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-dt-bindings

for you to fetch changes up to ad8247beb4c45acd29ded24c8e956bb96ece84d6:

  dt-bindings: arm: tegra: Add Asus Portable AiO P1801-T (2025-07-11 17:08:36 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Updates for v6.17-rc1

Add Tegra264 compatible strings for some core components and extend
bindings where necessary to accomodate the new hardware generation. Also
document some new platforms, for both old and new chips.

----------------------------------------------------------------
Maxim Schwalm (2):
      dt-bindings: arm: tegra: Add Asus VivoTab RT TF600T
      dt-bindings: arm: tegra: Add Asus Portable AiO P1801-T

Sumit Gupta (1):
      dt-bindings: memory: tegra: Add Tegra264 support

Thierry Reding (9):
      dt-bindings: tegra: pmc: Add Tegra264 compatible
      dt-bindings: mailbox: tegra-hsp: Bump number of shared interrupts
      dt-bindings: mailbox: tegra-hsp: Properly sort compatible string list
      dt-bindings: firmware: Document Tegra264 BPMP
      dt-bindings: misc: Document Tegra264 APBMISC compatible
      dt-bindings: dma: Add Tegra264 compatible string
      dt-bindings: rtc: tegra: Document Tegra264 RTC
      dt-bindings: tegra: Document P3971-0089+P3834-0008 Platform
      dt-bindings: Add Tegra264 clock and reset definitions

 Documentation/devicetree/bindings/arm/tegra.yaml   |  13 +
 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    |   1 +
 .../bindings/dma/nvidia,tegra186-gpc-dma.yaml      |   1 +
 .../bindings/firmware/nvidia,tegra186-bpmp.yaml    |   1 +
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml      |  28 +-
 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 +++-
 .../bindings/misc/nvidia,tegra186-misc.yaml        |   1 +
 .../bindings/rtc/nvidia,tegra20-rtc.yaml           |   1 +
 include/dt-bindings/clock/nvidia,tegra264.h        | 466 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 ++++++
 include/dt-bindings/reset/nvidia,tegra264.h        |  92 ++++
 11 files changed, 818 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/clock/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/reset/nvidia,tegra264.h
