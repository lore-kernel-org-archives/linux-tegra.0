Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150E3223324
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2025 18:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736535254; cv=none; b=tcxBc5R81vhtjhGvjQ1WKC0wfBwKcGDu7nMDl5j3qaEJDjzE0qbQVou/ROQiqflwYcW4LwW9QQXt4AEjWMm2kfzD447hvr3BV3kPLWW2x8X9xO7ShSPVxk2JNfn8aRXHArG99jKXRiOHeP2z/bDia4lsMlg3RC5oFeYV3xXD0YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736535254; c=relaxed/simple;
	bh=DndyNylIL+ZUCxEtjNb9q4yI0eEiTKy2w9nASbTZbxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gJIx589mzpH8ToslD4oLQBqnBw7aSipxJhZ6MivIlNodSoVY+wfGo0jUF/joUZhPbB+4X2lEiM8NohLFattKEKuUft2vPBTpwm/NPUuEEi0ICdpYsRqt0BBkiU93bbNnOaWQOmwO9S+pYhNMlEukjnk9tTeJaP8ggAUxAGnyQOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFwg/HOr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFwg/HOr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso25542255e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2025 10:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736535251; x=1737140051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSzrQeseUUwDfAM8Q0k65Q1Koz1ieX1zSngb4j0vsQc=;
        b=BFwg/HOr/+cRm3I8l32t//kGzkh2SbDtBzYNIRZHoQAVUSXVgGedR3PK6VyiFzF2Ft
         FeCOUThPM54Lhn1L+DiiA5gz6XdcZ8x9qwIz6kJ5CNEpP6StfdnTlXKcFY0DDzyZV2XJ
         v11Z16nbmX9xIKvU9FNeF5M+twEWow9fHvobXDE5C745SdR3ml9U2mDVvMPk1l5TCxpg
         2OsiEkk5aDwL6hvVWLdxcO/oRpfb54xZGJIrvjN7EMho7e39ZgY+U/K70dyIQX3SPnWu
         oX/aC1mcDvD+qk6h7PZEAFK6ZtBqOXKa/79ZmZvs4NSlNsVLbf0m/7nn3ynmYHI1qkbu
         VB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736535251; x=1737140051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSzrQeseUUwDfAM8Q0k65Q1Koz1ieX1zSngb4j0vsQc=;
        b=Q+uKrIZXrGTUnSeeUQpAeAHHZkI5aatcfkx/W515GN6L1TPOhcNZHSz0rJi2MbbafZ
         pCYo+kaEYrLyYqh6gpvgA8F2xM+8Sb3pQyRwbOVVBI4vQT1UZ1MdSaFUGBpAKFnovjOt
         R7P1v2F8QMxbdQ6fhoJjwPEBCXIvgiyv6G7QCRyOEmRtxVWDqHbYtDIgdhxolk4dUd8a
         SldTonvj30M9HIxy0Brf7jl1K76GMkcR2gaXV6BfiRWLEsoeJQtBc+L6JnjzGPpxDRTY
         3pEM095AUETnU0mi+gy91YcwPlOwgeP8dd/yrNhYcepDa/PYlCLRBuG/YpBWArjKUISw
         A+ew==
X-Forwarded-Encrypted: i=1; AJvYcCU+iu76HABrJz8rOOxL0tlqtcn2/eRTVvLfkIBFmSRmF37EhwUjNT+HBhJZNuhFZkSIk4L1xbDftKNImw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEy9qRbbNNu4+Wrw92ay5f92+ViUSw9c8wKaBdAWO4ej8YV90U
	dtozsQlG/UxYT558tp1PJvUNhHx2A5JkB/SRZeWSupUnWRJq1CW+1XRCgQ==
X-Gm-Gg: ASbGnctEL+PHWs/6F0FYvWb1oPISpz09yyO77ACQpVc9ilLzc1a70H8i18+Xgbap6O6
	9Q70WaxehU/VG8n7TWrOTZdrtCS3NaUdfhqa15TGBAhWKBRqC4HtiS/LmDQNoVpKX4bCpAfm6tq
	AkvTI+N1d2fNhe4AUTMPKThyr/jxFEQsbrj4FB05uDI0mg4bSg33qf3N9lBrR9HeQiD/mHJA2tE
	wBX1NvnArNUB/6I10VBxUVUiigkDrPAI7VgES9zSY5LUqJ2FdZeRWIgOe+BGwQJ394dZAVoNyHx
	yR3J0z10DYFYZ67U2fpBF14q6+dNc5aissV76/0No+cqkB5n
X-Google-Smtp-Source: AGHT+IGL1UNuIWvfIXF5q1ZuB2NL1WSHb5lPRNZ4RnJeqXAHuM/DlevEFHezs0QM4/P/ttrkrToSEA==
X-Received: by 2002:adf:a295:0:b0:38a:873f:e31f with SMTP id ffacd0b85a97d-38a873fe683mr8253747f8f.1.1736535251283;
        Fri, 10 Jan 2025 10:54:11 -0800 (PST)
Received: from localhost (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dc895esm59818695e9.13.2025.01.10.10.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 10:54:10 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/3] arm64: tegra: Device tree fixes for v6.14-rc1
Date: Fri, 10 Jan 2025 19:53:53 +0100
Message-ID: <20250110185355.4143505-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110185355.4143505-1-thierry.reding@gmail.com>
References: <20250110185355.4143505-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.14-arm64-dt

for you to fetch changes up to b615fbd70fce8582d92b3bdbbf3c9b80cadcfb55:

  arm64: tegra: Fix Tegra234 PCIe interrupt-map (2025-01-10 18:47:01 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v6.14-rc1

These patches fix up an issue with the DMA support on one of the SPI
controllers, as well as properly identify the SCE fabric and disable
it to prevent accessing registers that may not be accessible to the
CPU. Finally, the GIC's #address-cells property is set to 0 to fix a
problem in the PCIe interrupt-map property.

----------------------------------------------------------------
Akhil R (1):
      arm64: tegra: Fix DMA ID for SPI2

Brad Griffis (1):
      arm64: tegra: Fix Tegra234 PCIe interrupt-map

Sumit Gupta (2):
      arm64: tegra: Fix typo in Tegra234 dce-fabric compatible
      arm64: tegra: Disable Tegra234 sce-fabric node

 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
