Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625901DD88F
	for <linux-tegra@vger.kernel.org>; Thu, 31 Jul 2025 16:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753979306; cv=none; b=MoMSrfmFB16zg+Cj56OJHR9JcwZ35HohV+D69wPaGI5XR20EIMEJdEfOJ9woa/O3M7sQEesCpPBeumONsJg8d6Oq97Dg+S8NR68Ii8ZvOQD6tp85IDvMMsUfUHxI8ibj7IyQRW4JC3b/5aZ4eRcA0EA4YRcLePb3IX28BZBMOwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753979306; c=relaxed/simple;
	bh=YtuzjCU41wJEnFoFcwq5nanMAlcjcrWVpheE/tRBn00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UvdD6rV+eDoOTFKMso80QhDD8nHjw5pYOU9OS0YLbaz4AlAqTyKH8QxaqIKp/xZc2mycTvsCXI6HZI8d6CI4AftwhhUwRuH6TFzdvYwZazaJ9dGsUyQ1hd3iSYbhDKnpykyqfwSwSZDdKwi4jt4LgItywJH1q0qb5RIMHvRGiF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sc29dnC+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sc29dnC+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4589180b266so6176465e9.3
        for <linux-tegra@vger.kernel.org>; Thu, 31 Jul 2025 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753979303; x=1754584103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUQuX9EcTmyMXIDhh04yCMIk3QAsrMOgdgEviKTt1/Q=;
        b=Sc29dnC+kIMSROHM7dwVI3QV2NqptVf/DggwdX/d4qdkwBLeV6ypMvslX9bIlHjmYK
         3PXgntQC27brPXHcOUZ5Qm23XZzBdks9uflPbmV5DFcECK3yr8Io/U+OuZoo3Y3aWaDH
         nYz//FFsvXdOfjayDeARsIz+9g4IDWZf9P957TBH6V+DmqicwhM76DJ25GjO5V01KAKk
         mMvCNYthAGUG3G64f4/lTvUhbPxajwRBR1nRCe1tor0L6xhiRvA8ZGD9jZMWTYoaAsmA
         CMEixfq5ByvtbvvQcnm59ht/+wTxl/9ITH+eTgZwbKObEk4yvtR77sSOlfbMFsDymlcJ
         4VBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753979303; x=1754584103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUQuX9EcTmyMXIDhh04yCMIk3QAsrMOgdgEviKTt1/Q=;
        b=oJEiRrrc3QrTlPfAi6ucgQk6/CgtvK0xFA/l3XDLBLZ1/nFRjjUZaR3huMKQ4/77hO
         J4OVpb8Xi/IaJlzqXeN8QEWt5mATbki8FPWtT9C4S+moAaU1fWhcylc9pCwDEarqd3rC
         NpU6GdJJ3zjhyvrOv6Rixqt78UoxHGiCbYgNRLvtAl7RXVbn+5PNeeKoPYpUifRvmyQM
         tK4k3PgYVQCanWQuJK+BdF1dlhiA532xyxdU+Nq6V8RwMKF9vs63B1xQ6NpojWmwOEcC
         PcH17ecFVO/gXY+J2g3LJ3lRUPzvjQLc0s+htt/JC9Kr7hGPfcUDNp0vHYZJmckBJXUX
         MmxA==
X-Forwarded-Encrypted: i=1; AJvYcCV3Mpm1q0YSr0yk1mQG0V6SSATxllIsaTmGJFYlu0/BgtEQdvIjuPw9UnQsl92pBHqD4gg/DyK/htJCZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOzPQPUAYbv/8U6nj4Rzu8QF3ytcqUHBMeofkG6etqtgCjvpaI
	em0n/isyUViAz5cxTvLI2HpHWG/LRlGkKnSxAx+TU1stYU1nEDS1gKJutOf4wg==
X-Gm-Gg: ASbGnct9gEgD9OF4xr/D4w28hzRN3TuOAqn3+rOJtsLlPSnbj9ydbuHoghQcusZ+au7
	G6CXTQFx2oxlupKOSzcVX7O3211CgEvU4LE9+8Jwm5CaXG7OHPc33QmLFSlHEqGRmWgF/fpyngB
	RtDZ9wQbgdMnnn9fhWgAPxSFUhUc+Yga1Z1jNtJr1t17KVchsGI1DGrIGZ5ZqqrwRZ7OFZX2Jrd
	KrTN42DxVWclJE/ssMfgYbeTz4Wht5bRDVk8UJn6vGfeztOT+xaDlv1ukco1fmiAb+t6y035ugC
	LLnVYD84HTJZl2YRR4G7j/QCYb4/5QeTyXs1mjc55hDkwi7/pUuHjGkZhBWzgG+/a+MIz3Z6xdz
	HXJPRyocBgNjpen4cazyl/t8SWGlG1nKdV7RFR0yHK3orolf2EuOAr1d874IPW7i3S//xND8vg/
	FAMF9gcOlnrU4daA==
X-Google-Smtp-Source: AGHT+IHcEzUc5fmL7aR35NqQbifBaImO098SauslIIzWmoLzT9eyyd/1zs4+hdMyqVtFP+GuFPg+aw==
X-Received: by 2002:a05:600c:c4a3:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-45892b94d5emr69940185e9.6.1753979302184;
        Thu, 31 Jul 2025 09:28:22 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4589edfcdc3sm32989405e9.12.2025.07.31.09.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 09:28:20 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] dt-bindings: Changes for v6.17-rc1
Date: Thu, 31 Jul 2025 18:28:17 +0200
Message-ID: <20250731162819.3329735-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-3-thierry.reding@gmail.com>
References: <20250711220943.2389322-3-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-dt-bindings-v2

for you to fetch changes up to 6f8dcceb29a9d3169dbe23d3516783139544de91:

  dt-bindings: arm: tegra: Add NVIDIA Tegra264 CBB 2.0 binding (2025-07-29 17:08:47 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.17-rc1

This contains one more bindings patch that fell through the cracks and
that's needed to properly validate the new Tegra264 device trees.

----------------------------------------------------------------
Maxim Schwalm (2):
      dt-bindings: arm: tegra: Add Asus VivoTab RT TF600T
      dt-bindings: arm: tegra: Add Asus Portable AiO P1801-T

Sumit Gupta (2):
      dt-bindings: memory: tegra: Add Tegra264 support
      dt-bindings: arm: tegra: Add NVIDIA Tegra264 CBB 2.0 binding

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
 .../bindings/arm/tegra/nvidia,tegra234-cbb.yaml    |   4 +
 .../bindings/dma/nvidia,tegra186-gpc-dma.yaml      |   1 +
 .../bindings/firmware/nvidia,tegra186-bpmp.yaml    |   1 +
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml      |  28 +-
 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 +++-
 .../bindings/misc/nvidia,tegra186-misc.yaml        |   1 +
 .../bindings/rtc/nvidia,tegra20-rtc.yaml           |   1 +
 include/dt-bindings/clock/nvidia,tegra264.h        | 466 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 ++++++
 include/dt-bindings/reset/nvidia,tegra264.h        |  92 ++++
 12 files changed, 822 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/clock/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/reset/nvidia,tegra264.h
