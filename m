Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1045237F8BC
	for <linux-tegra@vger.kernel.org>; Sat, 23 May 2026 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526281; cv=none; b=u8d7diu+JAPP2JXtMwcFlbOnYSurMJeJo7DAixWgfyO7sGsqqQwoY5yAoRFTX42xW2XmtKZjXHBSRCoIpYFRum0+S7ultAYUfeROZbKmQjBX3pFNar22yzBQqUO1NtQoZVuwR90mLind2wqJi+AwQm7th/udV6JHHo0VCe1niWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526281; c=relaxed/simple;
	bh=YlpVUBY7qjHm3/ZERt7CV3iv2qn0LVcIMaSVXRO4BdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=czU43iIKjZuOYZyR9azsU3ZBHkONQWyzAQVYJvyJ4j70lz084JYuzJU88xTDovUleWEkJwu6ROxNx2QtyTqSABhWPKhK1HPh57nG3Q32pqQJOaz3Ewzb4USOpkUZbFm3/2PM1NdxzYS4Oi7kdR4H1ChC/AhdykOpdXcjWNADliM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rheejzAD; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rheejzAD"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6870f904c6bso7068434a12.0
        for <linux-tegra@vger.kernel.org>; Sat, 23 May 2026 01:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779526278; x=1780131078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMVVhkCyi3BTFhYWA2PfziVCVQZjQefJnSrFOyQ7TOs=;
        b=rheejzADHtw1ekI6ea1X3SUvldIzI4pCz+KFP/YnAucbaT5V1S9SGi60tYrUocBqbu
         G6F12JB+2YkiIPnvVqnecRWlGPCHMDykEYl34Kk1wFy9XvOGd8t7Mh5x1D+ixGtztaDy
         LxkSO0EFyW5ZHh1pRN5LQ0qWIe6g3nMjSBrMTmns/jT8SiHeN1nNT7mqaUQTu7OO+gj/
         Vd4mslHtrrtLDdUN88IzykX/MnhkZzEJGGLjc1ltlCE1WTTUw7/aOX4xPARjsiKQAGpo
         VMkoDhT+LlVZCy0NZow3e4FsT8lokAwprsDqTPnTphIpgdBmpoxpc6XCTjFB4wZ65SwS
         10Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779526278; x=1780131078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMVVhkCyi3BTFhYWA2PfziVCVQZjQefJnSrFOyQ7TOs=;
        b=SARPjVv3/zDQcSe4z+shcpvoGtfP40uoja9V+W73JQfvWiBhsj+KObtXTCNCM54BxM
         5n20oaRdiLGweXdwIjYc4QApi/dLm8OLy0heAK8sqRsCD7iUAOLry51rYcUfvHdrU4M6
         UldoVo+PMWe9mI5pDACvUrrs4ojLQ+Lz/ffrrf+EXHsEEwKS6cqUxzGkHPKAzST/ioPQ
         VCSbWvsJ+NDmPO7dDI8tjl2pimNNHUmJqDSYCXomAomjDGjNL8E6bb8PZd06DTwblWof
         xClYCKFgng22RYrAnCMrnADYhXzLSVIOd6kW4wr89YCtwUJtomFPaBPJc5iuwrasiGqO
         wtdw==
X-Forwarded-Encrypted: i=1; AFNElJ+fbr6UVkiI0HFird3nzXg3Uoc2H/t07eJwa2aK2EV49PYAGwi4PsFnQXMHegPim3a5RkCinqWeAgEG9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpQjarolfGdRPd091SjLvbvDyAD8FfzexDAtkQLY4dfdp42hyH
	m+qcQsPcm5UPvaNqbHdP/wfMP9o/6mw/Y1hr4LZPkk/aQfkLS3+Irp06
X-Gm-Gg: Acq92OHggLrFSFqlR15cL85XQip9c2UYvC5OYZXSQBEQpWntijh3BljF2a9UmZcr6W8
	lZjMygcXChKjjtAFiRF51yfWhJyHVyZUY9hgYqBSWumZUTfhkhJlxpYZrudsrV5UuVS0bU8Flq7
	7Y0xW10jEPHZtVZ91UTPLTqrxlv85OUTirPJf/ziVCYeLUOrO3udhNcU39hGatYK4d6KklatztP
	iX589DYxtpo4wQCboFXhHv3CZ5QZEF3TDo4z7XtJi9ajYaYhvtsbwTX0NdpI9eZqMiPGB7zQ0vP
	sQxQL++reoaqsr1GtwQ53PKcmmWLFkYEn9QhlJOQ0S9Jl8aFahqzCiYG2n9DSoWXQFjkYQ1/1UF
	+7tuUAyqLAqVYN+nQ8cizgwqqCFfNCA7vPjJ1WeAmbl5DYe/4YpWIS2yO173eb6QfXy5k6U7hGB
	R3EYgT3cMEkulyLAkGuOQYBIw=
X-Received: by 2002:a05:6402:40d4:b0:687:cfde:ddaf with SMTP id 4fb4d7f45d1cf-6889c440492mr3668932a12.7.1779526278408;
        Sat, 23 May 2026 01:51:18 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688baf1f0afsm1642658a12.17.2026.05.23.01.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:51:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 0/2] power: sequencing: Add support for Nvidia Tegra modem pwrseq
Date: Sat, 23 May 2026 11:51:00 +0300
Message-ID: <20260523085102.51000-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patchset implements support for the Tegra-specific modem powerseqence,
which handles the registration and unregistration of the USB controller.

This patchset is a part of larger series aiming to bring XMM6260 modem
support for Tegra devices:
https://lore.kernel.org/lkml/20260511135703.62470-1-clamor95@gmail.com/

---
Changes in v2:
- previous phy driver reshaped into pwrseq driver
---

Svyatoslav Ryhel (2):
  dt-bindings: soc: tegra: Document Nvidia Tegra modem pwrseq
  power: sequencing: Add support for Nvidia Tegra modem pwrseq

 .../soc/tegra/nvidia,tegra-modem-pwrseq.yaml  |  49 ++++
 drivers/power/sequencing/Kconfig              |  12 +
 drivers/power/sequencing/Makefile             |   1 +
 drivers/power/sequencing/pwrseq-tegra-modem.c | 209 ++++++++++++++++++
 4 files changed, 271 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,tegra-modem-pwrseq.yaml
 create mode 100644 drivers/power/sequencing/pwrseq-tegra-modem.c

-- 
2.51.0

