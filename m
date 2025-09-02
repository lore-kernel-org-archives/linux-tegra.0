Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19AB2D2493;
	Tue,  2 Sep 2025 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828001; cv=none; b=JaM3Mq5voqUTrZ66VJs0DRvmoG+9rqVuFPw4O3FKrtsDEff3aPCHkafWZRJAKo8RMu1jTZJlwQ9dQkVmLTlBY/qgAhAuzsqOQj6I6NwzqnnWcNF7FzdJE7OZ8gdoXowl3wbtRgih/kr35bODxlAwYaThmeZDzd5E9ZivEzhDvvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828001; c=relaxed/simple;
	bh=dNcGL8tOLE5VhLRhNMW/9r8UL1Qen9PxBwglRwVz/1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YcZM9NhCVjxKtXD/iyRMnfj1PfG9qt6zs/T7w+7HVDoNH+LMUIWUzgnNPnfoEG/VvBjtVs5wHPeM6zZcOGlErcZw0bOgiGvHpV3+R3GkbHt3tVA1x4SFJN7kWnrGmFw8t5RPrlNC5LjGCF8788dLyRAzS9Ko4evMXzEb1PDEl8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+ubXb0J; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+ubXb0J"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b804ed966so18802675e9.2;
        Tue, 02 Sep 2025 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756827998; x=1757432798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ehw/eR0F2M+6G/BFd9v/1nkHSYwDgsa32Hkiapct/js=;
        b=Z+ubXb0J1/fqOMwWS3Ngwb49TH2pwFtSBFayS9JVgSL1T8yCYyWBox9BaJWBVw3AmY
         Uz8gJEj79O1O6QTICgq4A5d9oGuH1y1Zheesu3E6Mi40IUlSoe07I2vOjzn4Qo6vEKUB
         JnDi4XABFnvl3Fwj1w3dgLg5r4C8+kIdwfe0mnlZU1CG4tsRsWs6OX7L2XLfgxdVzZbG
         eoWMpC/XuJtFvdBVOxLKsFS+SxtQK1Lxf/PfYVG5TSLOxyxiLEvzYhZwuoNXpdRochgC
         bKQc8VpIE1ta1d1zNjWaOn3l/S30JOIRH6KTDJ6mpZ++KYAAnz6af4pZxJOWkVjuzY+5
         QY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827998; x=1757432798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ehw/eR0F2M+6G/BFd9v/1nkHSYwDgsa32Hkiapct/js=;
        b=Sa4UHFbLzP+W6fYYuXIe0EyXIGImj6Gu7N9c3WAA2jfTIb3w4AujkQwtg4ZPMEbjVm
         /Nzx/jizAPk3fnqlW01WfgfN4mP5v4B6NqotW7LR5/saSKKZ9zkEF74e1E2/6Vut02wP
         a6sOko8daAA7M8OaxhVgxiNWwu1sAXs4uXbN9x9zhNUVjOSV7X5xHK8EaZlIuxIbwwWN
         t+Cb3zwx/ZHqv2YLqwLpFuT7d1/KkSfQVLGM8Vx2Q0wZNwOJLe9IPPVf6RU93g+4UxMU
         LhIOiWwW+23J1noqFODwc0kdHNX93OK+NhaX/czJCla3qToGmTrekrlYsomnI92vF8Cn
         OCow==
X-Forwarded-Encrypted: i=1; AJvYcCW9kPRTTk5k52b+SdktNaNICZxJ+9Me0x5xLqUyIsWZ4+MMeTa1Cyl3spu5qfLADU7BsDFwmTqiMAZA5JQ=@vger.kernel.org, AJvYcCXgNSFME70RCTvIAy/yQjfF+IlN0TcvmYfuR/A0+NT8I6IvD6Jf05BFivCdQjmymPVgsPR0z0hQJ2Yx@vger.kernel.org
X-Gm-Message-State: AOJu0YxoKTwP8dGdzTQrn0H7y0xgQ0K76TUs4fCGiETcX0cLs2Ro7PpS
	XZb4CUBtMd+P5q9xnQ4gqI3j9Sk3qdR2910Kv1Usixo38SSt1iuFNHDD
X-Gm-Gg: ASbGnctiibHPv9nvwRoo4C2l49kdkhZoZQKopG4GdsHaePFjOf2JXysXm559v6y2zPd
	P7XQJe4JyAJP9f4ikdzpuNyR/jui/gIs+Yj873RQNdmOR1Bp/qkp2g5CStNDV9erOhBqdGHqyB6
	xvYFrM7meSA9UKZhzdqV3GZB8Nk3tRn0f8K56C+ff2nuHl+o3L1huH8yInp18qZDM69TedzSFqg
	rVoWp4BLcfO/ODj/YfJQqwxnUMUstCMzLKdyCgQGeBMVHNiIGJyR52J2Ur+0RYRIsdTGRR4TWvT
	fDQsEZI1iHm7jKLF1vy/mDlF+uyeDRq7F5REW20mNS5JRYd9jtpgUvhy7rWVWVjJymWgyD5LO4O
	3nRFi2AbkvHrfQOBsvccS2TyjqGqTtJZUhZTJuG31INTgDiGB42AqB73pzYapo7E3Jl/1i0jGdY
	tWj/afbcjtSrW4TQ==
X-Google-Smtp-Source: AGHT+IFWiFaPK/3SzCCDMU0eaVs82NQJjjs4OJMxCNhx+PRy+qfGvhLoB3urjp1BVbB0eezwx8zy/w==
X-Received: by 2002:a05:600c:8b33:b0:456:302:6dc3 with SMTP id 5b1f17b1804b1-45b877be066mr95265895e9.26.1756827997621;
        Tue, 02 Sep 2025 08:46:37 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf33fb9d37sm20384921f8f.49.2025.09.02.08.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:46:34 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-mm@kvack.org
Subject: [PATCH 0/9] dma-buf: heaps: Add Tegra VPR support
Date: Tue,  2 Sep 2025 17:46:20 +0200
Message-ID: <20250902154630.4032984-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Hi,

This series adds support for the video protection region (VPR) used on
Tegra SoC devices. It's a special region of memory that is protected
from accesses by the CPU and used to store DRM protected content (both
decrypted stream data as well as decoded video frames).

Patches 1 and 2 add DT binding documentation for the VPR and add the VPR
to the list of memory-region items for display and host1x.

Patch 3 introduces new APIs needed by the Tegra VPR implementation that
allow CMA areas to be dynamically created at runtime rather than using
the fixed, system-wide list. This is used in this driver specifically
because it can use an arbitrary number of these areas (though they are
currently limited to 4).

Patch 4 adds some infrastructure for DMA heap implementations to provide
information through debugfs.

The Tegra VPR implementation is added in patch 5. See its commit message
for more details about the specifics of this implementation.

Finally, patches 6-9 add the VPR placeholder node on Tegra234 and hook
it up to the host1x and GPU nodes so that they can make use of this
region.

Thierry

Thierry Reding (9):
  dt-bindings: reserved-memory: Document Tegra VPR
  dt-bindings: display: tegra: Document memory regions
  mm/cma: Allow dynamically creating CMA areas
  dma-buf: heaps: Add debugfs support
  dma-buf: heaps: Add support for Tegra VPR
  arm64: tegra: Add VPR placeholder node on Tegra234
  arm64: tegra: Add GPU node on Tegra234
  arm64: tegra: Hook up VPR to host1x
  arm64: tegra: Hook up VPR to the GPU

 .../display/tegra/nvidia,tegra186-dc.yaml     |  10 +
 .../display/tegra/nvidia,tegra20-dc.yaml      |  10 +-
 .../display/tegra/nvidia,tegra20-host1x.yaml  |   7 +
 .../nvidia,tegra-video-protection-region.yaml |  55 ++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |  57 ++
 drivers/dma-buf/dma-heap.c                    |  56 ++
 drivers/dma-buf/heaps/Kconfig                 |   7 +
 drivers/dma-buf/heaps/Makefile                |   1 +
 drivers/dma-buf/heaps/tegra-vpr.c             | 831 ++++++++++++++++++
 include/linux/cma.h                           |  16 +
 include/linux/dma-heap.h                      |   2 +
 include/trace/events/tegra_vpr.h              |  57 ++
 mm/cma.c                                      |  89 +-
 13 files changed, 1175 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.yaml
 create mode 100644 drivers/dma-buf/heaps/tegra-vpr.c
 create mode 100644 include/trace/events/tegra_vpr.h

-- 
2.50.0

