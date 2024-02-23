Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC3B13B79D
	for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 17:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710511; cv=none; b=BV660EYAxkV8bBs6kOGA8g9yak9CnJL9hTLdW/fsj3zZEkxOOYhHOLS2EBuXcNM3Cj0P+L8h1/prCJzw2pWIPGI5nEEpZ/Wj/rQcHE8NEmksIX61ycgsmUd4+jBVzy8pn8vxwcO0EoMa/quqVjCUp3laCdO/soC2lqX1yX8Eb7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710511; c=relaxed/simple;
	bh=HD8XGrlJmuwdvJhYVwjsu5cGNDMPExUwVKY9McgHRlI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MC0zVjSk4Bx8bKpZD700hXo9SjF2PNFXbunQzxfWVDm4UuQcvIceam9EF+Dh0Xlgj04xJvTR+sM2zc8U6/+LM62brZfougTSd7GlsjDdAiBPIriv1UTJ2d34T258Q4V4LOwUMqZlqWjsL7unjXvFxGgx0LY6qH6baG1nVBDxTy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpK107zC; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpK107zC"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5645efb2942so992620a12.1
        for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 09:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708710508; x=1709315308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qDTQWYCy+QQi/TLHMND383JBwS5i6yYWGE60AiFcEzA=;
        b=ZpK107zCts9WTJ0qGhDxlDMu5ocEuHgqc/dD/hmFfP4n3i7/cZXAHVo0OT9M9J2irE
         UsCKD4kG2HJV0njg5vFo0jyVvofJ+o4SefE54ACL3rbZGzYDLbltsUNkGl81Cd0urXXv
         x/Fv0lssBlMJ4UGlWJF7bJ+IgHDqZYmAWu/snLKTsh+wekCrrNWoqxvFG8b80n/AQJj1
         ZQUQH1j13xGb+Vr6BfGNGUGFmqZRIp1JDiUD43s5GqU+Wi9yx77faWx3f/fu7frqMOMe
         IAQVxtLnogi3jHnFQtK/j007c+D8U9LvgP3sJN28ftYOiaYuFVjdjVggpkLG5MqWIV8y
         Qk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710508; x=1709315308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDTQWYCy+QQi/TLHMND383JBwS5i6yYWGE60AiFcEzA=;
        b=tIdQxNfe7qDlu2+1mP4G4ih7NuFgHNesGqTOewhES+Vdpw6F+7BlJ/bsdMcffE59kV
         pjqInIFucGlk2D6tSbRqZ6Wvfj61l6I4eUZMXSavpSgoIqI7/Fgy13GTGKp/aDX8u0RZ
         HqsQ6hQ9Q43b5xcnM63TBIqUB5lJkaALgry++VoU6+5j0/NLGk4c7HICh3AzFEbCtpxi
         G1JzAgw9ka+KRXEsc+Qm+3eWlOdHWnFWa2g9ARKd9Zg/IecZtZhFqL/MV8sWeQFb4GHn
         swFYh5jYkKnyjcr8wNJVcwo+GwNUOjSueOWihQYyBkvOEeQZV3McnlVW8Xxvp61AevSV
         TnTg==
X-Forwarded-Encrypted: i=1; AJvYcCUlBhq+dh2jK2aF5xrNXFBcOpYJyZjXYm0IVcLQIF1fDByFNb2gxcfdI2vSzpNeWZHKrXcZoifbZE3MhAQGI/pME8NeXHe1H67GjQA=
X-Gm-Message-State: AOJu0Yyo+c9SxOKyiiPYyUd+uOQd5gfLbhilNaUw5kxJcNdryGsyEMMm
	pZToKo7VAmorAHaPxsowE3igyHBaZI1vTBVN4pkisKqj/QXy1qar
X-Google-Smtp-Source: AGHT+IEugaLiKRMQmBJYUFOTsMd4m2NAYjFiDgtEfzsH1fP2f4xeHnWtIwXaTRahNk43oqrA6gEkOQ==
X-Received: by 2002:a05:6402:5389:b0:563:c2e5:5289 with SMTP id ew9-20020a056402538900b00563c2e55289mr399605edb.13.1708710507945;
        Fri, 23 Feb 2024 09:48:27 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id el14-20020a056402360e00b0055fba4996d9sm6605375edb.71.2024.02.23.09.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:48:27 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v6.8
Date: Fri, 23 Feb 2024 18:48:26 +0100
Message-ID: <20240223174827.1509403-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.2
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 841c35169323cd833294798e58b9bf63fa4fa1de:

  Linux 6.8-rc4 (2024-02-11 12:18:13 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.8-arm64-dt

for you to fetch changes up to ff6bd76f4d997642ef390bffe42e93d6f7be87d3:

  arm64: tegra: Fix Tegra234 MGBE power-domains (2024-02-22 17:58:59 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v6.8

This contains two fixes to make the MGBE Ethernet devices found on
Tegra234 work properly.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: tegra: Fix Tegra234 MGBE power-domains

Thierry Reding (1):
      arm64: tegra: Set the correct PHY mode for MGBE

 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi                      | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
