Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABE1267B9B;
	Tue,  8 Jul 2025 10:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751971975; cv=none; b=FcRHIfu4lKHp6CM4D4PsjX1hfj1UY+EyoYGD0gxDV0na3d/DErq3snQHHeEeMKziuviJJWpunmD/EjVscwxdzPIxPTt2XVXau9ZIg0X0n+ifY12Sq4FQCco+X+BP0zGGt9A3k/qvmuBhz5tvbADKAGA0Ffego4TIE+jfmnQYKTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751971975; c=relaxed/simple;
	bh=zXKm3gCzdf+0WOqQiQB2ecy5OEQNgbE68zuVRoOeDS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bLA/WWPBPsuJqEQ8WQwGbBVbTYOxerSfXvT7xKp/ZZzdlZWPGbeFBJhbkiatSJU/zuH5FF1mlkwnLKTxSPwFXkn2XxUPO6zwkBmKUq/Wnpcc7WBfoJaZZa2DgHQcnLxiaLYBNrjB1W4tszhlLsCa0NDJDGo+dKNA/pbTrmhmRkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUeyhW8X; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUeyhW8X"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d7b50815so34329935e9.2;
        Tue, 08 Jul 2025 03:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751971972; x=1752576772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mXmFtw03K9Ho7dtEWZJzgumBXZhUbzs/rF51bEysYQ0=;
        b=BUeyhW8XtrPWQ+MB7nxgKzSlSyto/ZMT1C3xnw7Xy5yvQBWIXZBNfyv0W4/lwK0FVR
         s6Qi9nXpjOxpqcnA+KXA3NdcroOaCpccdvqSTQweTB8UXR1LDime1VoNShLQOKtXTifa
         bKH4+9QBKE6Pekn3iWHOFSZNBaexCpfzckuePQcTfVbSTKALLMTry2lkFuhSc0FIKBB1
         vV5nwsRYlMlfF2o/0tz+WQHtPp+x25TEb5twKFDe3gU/VW3qfzmagEnzsReK7Q+0kyPS
         s1s4OGM/mLomkDUtnPiJaUfkH8PY3Fpk+Yl92lhEBMrlrYVMT7RRFpAZyNW6kIW+E8t8
         p4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751971972; x=1752576772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXmFtw03K9Ho7dtEWZJzgumBXZhUbzs/rF51bEysYQ0=;
        b=CYr6PQaPIAkDbxYnijvr5DYYZkbNHgeaXxlUaPZaItLid0QvfGfOvC3A1YvXaBa6nS
         4Zcu2ltasR7wiY6l8Bh4pqd3tYGxsi6ZeQOqSu+cWA0obnUTwYEGPzIUHKaSLctLz4PA
         WLoNXCoxIgizrxK97ZXr0I4nTUNhBKjCNcDkSnpsXsCBhBGU0h5te1ZvZmxkbh9TBidD
         tg/1lRwJOlAlmfUOcivq5eHwYEAH51u0SEtlAod8C2E2skRw2swM9zZ8hRWwUU6x3kny
         QZov8OurfCyxFLUFWJc8IjIGJcQ+qOl1ruzpL1PQ+IdLCjCyOl9TG14OriV3H93o37Dm
         NvpA==
X-Forwarded-Encrypted: i=1; AJvYcCVN1s02fcu84NX1IR+hkJnoY7y+lF48r13Iacwqc/u8ipmlNJ9jsPiXZJyXfkVu6JZ++SLMAdGni2l1wO0=@vger.kernel.org, AJvYcCVyDRQbXDmfs7KwYzskwbKKTv8CGbLWA3KKNZtn7bMpgDVHV5nFpazSs1TSr05sBYA2SjOI7cdNlwJj@vger.kernel.org, AJvYcCWiX97X1DhHahqjm8Jkh30ZwYMK4krhjzt0g/y2BxLVLala8F77wsQAJVi4huTBUaHB1EMaJtlGz/fJO3a9@vger.kernel.org
X-Gm-Message-State: AOJu0YzOaPjtdZuvLK7oy2b8mVZpRiDfL8sPoc2h0EW6xr8cpRqCNxIh
	rvNNraRe0pLdRQJnAWasgR0I460N/mxVH5a3vEx8EdkRjx0Ob9kLfXKSb6u55w==
X-Gm-Gg: ASbGncuv5GYBqxZ02xHe8b4106iJTON/+t4ymGJYBDPoYqSAo6FkJM795841emXk+66
	rkzfunhl6+oAtFWFo4/rxhrvu+H9CbFizJ7STTRYkHNf6hPMVk/UUzjDX7mrQaRkR4M+Uk6/FYR
	K/a1mA9d8Q/OI+W4QvVezzNPmrm5ItStttxndxhg+VtY1Y0i4ODG5XQvJu12xCjBXS73hGzyp1i
	Ce7vv46o/yybjmewD8ZH5r7vweEQiT3pIK4n1617TelUC9dXMI+k99Oxk7MEVt+2Dbf4IIvmhDR
	YQyCzynDzRU2/PtB4J6nl6/6xsBAvdFthIEFdODzM4CgtELCommpHGUpydPaqLBucS2Aly+1eG0
	XNtruuSDYhlKQ7SbRcTkhM7dCrQMz0CD7THyJ2FsU/YZWpW5zG7V5dErho0YNW+44
X-Google-Smtp-Source: AGHT+IGV9EffQDUiAnPPj+Iwo1ao4TdyZHsWRJVQ9wBbm5gNGpRuslBDzKOmrgYEF5A5dgacK7uErQ==
X-Received: by 2002:a05:600c:530e:b0:43d:b3:f95 with SMTP id 5b1f17b1804b1-454b31878e0mr118758265e9.28.1751971971857;
        Tue, 08 Jul 2025 03:52:51 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454cd56d936sm11286885e9.0.2025.07.08.03.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:52:50 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] memory: tegra: Add Tegra264 support
Date: Tue,  8 Jul 2025 12:52:41 +0200
Message-ID: <20250708105245.1516143-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

This set of patches extends the DT bindings for the memory controller
and external memory controller for Tegra264 and add the necessary DT
headers with memory client and stream ID definitions.

The driver changes in patch 4 are mostly an extension of existing code
and the bulk consists of the memory client table for the new chip as
well as the bandwidth manager calculations.

Thierry

Sumit Gupta (3):
  dt-bindings: memory: tegra: Add Tegra264 support
  dt-bindings: memory: tegra: Add Tegra264 definitions
  memory: tegra: Add Tegra264 MC and EMC support

Thierry Reding (1):
  dt-bindings: memory: tegra: Add Tegra264 stream IDs

 .../nvidia,tegra186-mc.yaml                   |  65 +++-
 drivers/memory/tegra/Makefile                 |   2 +
 drivers/memory/tegra/mc.c                     |   5 +-
 drivers/memory/tegra/mc.h                     |   9 +-
 drivers/memory/tegra/tegra186-emc.c           |   5 +-
 drivers/memory/tegra/tegra186.c               |  17 +-
 drivers/memory/tegra/tegra264-bwmgr.h         |  50 +++
 drivers/memory/tegra/tegra264.c               | 313 ++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h  | 136 ++++++++
 9 files changed, 594 insertions(+), 8 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra264-bwmgr.h
 create mode 100644 drivers/memory/tegra/tegra264.c
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h

-- 
2.50.0

