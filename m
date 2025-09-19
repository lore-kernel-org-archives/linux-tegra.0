Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1600D25B2FE
	for <linux-tegra@vger.kernel.org>; Fri, 19 Sep 2025 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274240; cv=none; b=i/K7W1E58YZKL4NnGjpQrTNdosLCJGAAk8cGH4665bVZiWFDJ0Z3192TsEYz2p/99ng0AdfzM48DH+cJPJdXaWr5N0n9ygDX0aL3EDCeg/5ek1DFdyHhJzFguCqUlCI20QrAjQMXoMsUlqlG9wT/zYu/oKX1osEFF/ivdTQ/NoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274240; c=relaxed/simple;
	bh=avDTXxWThbmAjC1QHoBfYODid9NjOrfOHkrQc9E/jS0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lvzsjTee2qDCXh/f2BFvIbahAvnw0jIaO1wGUGwG8qAsFoTK/AQAtagdYRTpnWZi+SPKZ5ClGoRB/hk6Yj73Kg/ozPcUhGBT03v1DBc4xTwtyM7zmxtG3OSe4f1e1ghwUC95QUKgcvIP4HOXMT/kDzREmKtt31BSFv03UPkINzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSPH3nRM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSPH3nRM"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso1386202f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 19 Sep 2025 02:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758274237; x=1758879037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shAUV/4fLe8epMbZhEjkFrhPpzpShVnyKXxo1s/wp4I=;
        b=XSPH3nRMrD9tGuEpsIO8UVRCeAm1yTfKYoDjwl8ssdKqtSL2BepVrOtoo4xkz4q0Zq
         laGY2DliaIBPNAH37GMrWgLbYPqcfeBMeAMnlEqCTrs0dB3TJDXCLI14roDGBSTp5GVx
         35Q79jeO74uUNJCwodFJUeBjFz99URG3iRnOvYWRZktjDJTrfE4Cdiiqxg05Co6fyLeE
         TnME7oy164pkR/elBZ4va0Z+r5YzKPXYSXqaeboILDh3ZW1op4g9THOtnwRh2n4pyiJm
         AQVHvn29ey5BnvugEFaAJqFKPHJcIG/JnjrQHAV/XiuIffcbQzqjwi76S/qheJFfv0rO
         ynJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758274237; x=1758879037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shAUV/4fLe8epMbZhEjkFrhPpzpShVnyKXxo1s/wp4I=;
        b=V9GZ9dgofmAHDF0oL0YhGssGf3RXnSIqlGW7gKAijaz6tpxNSYwTsGM3R+Lle804Z1
         J73eGBqXrLAZIpuAmHDz70Xsy2MpI6sc+5z/p9CWqjpXcPyx22EY7Z4rEnCEu9Igde54
         2kINPkMGfsWaTLtYrloD7ZjN/wY9hSlqLUOWQE0QFu/Sm27MEwoUf8ibcbVykPYK7IMY
         94ujaT+5I7zAxARxcdzB2FqBbCgPcxeUUR93E+yS10X5VO24lDCFdnkmWzANkrLwNn4s
         kPZiH/QKTDG8hMeS7o6BGhu8nrx60iEHcbTcfXGPTT2OIRauk+9afvVijPt5gsw6UeqL
         jYOA==
X-Forwarded-Encrypted: i=1; AJvYcCVXmqDEwYWn9aIKhnclbBQdeeElgGBxxNnkBDfVU3G3mT5WBEsEVwxHUmAfeQ41ASKZnf+wyz/TyHKlGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyG/53uGJ4+tOPNSPjzG7LReNGodnaKIlNJCBkFv/wJWCRwjcX0
	qYDyYy7FSG5nuq528J3kLukSqEEV4cMVcPHvxB7i8jrwI61TQgwv9x8O
X-Gm-Gg: ASbGncstldZwOfOiukt/3KPZsWJdoMItFFUZj+oawG4tDT2otZhDG328FTIh+A3mp/1
	5uyjZ34xgGn6YT0Wh6BdhlCXsgyXtJY2pVK43UtlhkfeEujGon4dPPDHOMKkZPy04QC/vCWI+u5
	ckn811/0ducUEfuuOqETHXO34YDeJgZlYT7PRpGBQrq+2T5qh+rpm8bsraCS2WSa/J66AUeaDM2
	WtUNK365/wptPl7UgRJuhBnCq0iXfs6ROpPj8j398ogsQQQJsy6Q7+AaY93CplUCE0DmwJs5b24
	WpgBGQ0HtW2f8L5PkL8kCPFROsYzoxXiQCtqL2X8qhm0TU/0kFXDB9nID7VunOxYNmnlCdPX9qA
	pURW91MzJXu0rlmwCltW34XCuGmqKNbl4FtHSxIaWlBCyyS0bmNhIYrZ2adhINpW9ULToCy0jCF
	sChrM16y6gNkLCqw==
X-Google-Smtp-Source: AGHT+IEc2Z9yh5Xo4qu7XSr+O293iGaa2p4oGxQBjn1/Zv3QlzQilSw5ukGaWfDe5r0j6EsTMEOZxQ==
X-Received: by 2002:a05:6000:1ac9:b0:3e2:b2f0:6e57 with SMTP id ffacd0b85a97d-3ee83da0688mr2182377f8f.36.1758274237120;
        Fri, 19 Sep 2025 02:30:37 -0700 (PDT)
Received: from localhost (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbc7284sm7083373f8f.33.2025.09.19.02.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:30:35 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] firmware: tegra: Fixes for v6.17
Date: Fri, 19 Sep 2025 11:30:33 +0200
Message-ID: <20250919093034.2747884-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-firmware-fixes

for you to fetch changes up to 6131690df4adae33e01c0b51b9b78b3e8ed3b76f:

  firmware: tegra: Do not warn on missing memory-region property (2025-09-15 18:28:09 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Fixes for v6.17

This contains a simple patch to avoid a warning in the case where the
optional memory-region property is missing.

----------------------------------------------------------------
Thierry Reding (1):
      firmware: tegra: Do not warn on missing memory-region property

 drivers/firmware/tegra/bpmp-tegra186.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
