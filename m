Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5F820DD51
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 19:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454487; cv=none; b=OiO1cVQCunGKaw245kw8lp9XIxwbHxn9Jjn+uO9Uy9kV+CmPO5M78eS3Y9Dc9qkCLPljtf5hJ2kZ9V8zloZXC8S2/D9kEYBRDfNFw8kCLdzmT2N5VSgf6E7nQroqWdIrSbf2zcshASqB3wTHO8txLf5auiAElMP/WA/2l/dmglI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454487; c=relaxed/simple;
	bh=tnVeZAcwDz2MYPEkmWs0axpNzYTNy5GIfEuFoxCgrGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RfadPw/e+2PrVdy5R7Fm1aux4tMM/KQN6I+8oMvqzFvVewevPZOyGVWe69/DSteoOMMpIOxAG3zPSXdqKGULOnhq4oSmPEjr0PyKjVvDMCU7WhGRQ8tjnh0s9aH95ogoEyPL8jD/vfoF78EoBYEZwq2uqkGMT6xDVc5QueyNR0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XomsvYpK; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XomsvYpK"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so2882693f8f.3
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 11:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769454485; x=1770059285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ExOshE1aCUz4IaRsUbS7Z0iSKUCbe3DbikmKcJvXEGU=;
        b=XomsvYpKXhJ4jy2uXM3gLEHp86c6eeRosL6w5ePQjdm+jGOOA5uLD311b0nJ0BWhoC
         yzF8mb6BNewsNENBuXVPIhvvplutVzYXnv5W1n94f5bf2Z0a2ktTWmBpX+PI+KZrRnCL
         WQ3CMck6o09YSPvO9ILPwc3nSv3Z0G8lVQGdvdR2u6CdSerPaPYH9q5lIVeJN9CGUgEk
         y+jVARu+m09KJyi/urffPu21mK8+oQ/rACM3FVJ2vSXESgF3bre50H/lTLqiiW9XaYjU
         nT/NSKAv1K2ROR5dnFUfFyX9wahxAoXlKilcR0LJawMnE19ZqrEZmm1L+BaJdwRiceRt
         yk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769454485; x=1770059285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExOshE1aCUz4IaRsUbS7Z0iSKUCbe3DbikmKcJvXEGU=;
        b=h4okooTJ0gLSagJW9p+oU10uaozhvTer847EaHyLCW/dACfaEyIDN84t/aH6CqJsN+
         Cgs3RwM8ZtE5ItgNpxWVA6+vEaA1klvnb5tq/dIM6aaaTPZQDCGRJNgw+xpBULCKxu4f
         GFGkyQ2IY7g/76w4BMhpjRPN+5zED4HIP8ASmPmOtLXIevbFLxlH2FVdlwCnFizLA3MX
         Bp1e4acw5LzSsTwcSWbvetEpOehvGwEcnNwSaZYQ6n0LSoUXmTsjhZ1tOVz0sq1XR0kv
         qlUD1orUA3sb+AdSh4z5aIaa2a0N6+vMzMKkShVg+N9QqDY64EvUpU8610OEVd9jTsPA
         trEw==
X-Forwarded-Encrypted: i=1; AJvYcCXu++VJgjw1guH+AwSNZjbP+tnGJ0dLV1Of8hz/lQnaedvQJN2CqS0yE7IeigLaaEQegP8l2r1i6XfDIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0GaOe0be3PSCe/kDj/33PjSIEuH3gq0elwuWkFRIBYFfuy6bN
	8wfE6in1i2tLcyc641C54nGYQxoghFa0LLX+EAIaBATOse6tZ+VSiKEF
X-Gm-Gg: AZuq6aKuvPHsf/qH4jRHAaZW+xR+NUeCBQlEuoQu0mmELBMJQ61ztm/I6IQ1dU1Q9Zl
	w8+5UwkCCC+kEJ6abPLg4gCi9N4bpy9lbO7njPZFlxGJoiVuC3IOg6NJNatDC7X/p2/KbiPRUVT
	aPpQOaC4GN6imRUlscYDRsbqeGt1TjjH6g+6Bm75Z+K88NF2uFYSstka/W74vhujmFOm6w/oVVJ
	5+I05CEIcL4cZbWxQRf9XF60FWN0M/3u6zMCmT0UPWh4hysl00BHExq690Lw2sjwl/d+ize4Ub+
	igUonFk1O5xbPv0fLg3hGyI9OSe04VFihbkHE693JbgGk1eS688US8+sJvrGOfOHUhUPlHaB9pY
	Br1/bzb9xulaV3udkQrB8FHXlYtw4kDCXOcUvRYyDxzpkKHL93dCa97aeINRfDFu+6TM5hZKlGE
	npwc7KKjtUNr8=
X-Received: by 2002:a05:6000:186f:b0:432:5bf9:cf2e with SMTP id ffacd0b85a97d-435ca122e01mr9230680f8f.13.1769454484836;
        Mon, 26 Jan 2026 11:08:04 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bf8sm31802030f8f.11.2026.01.26.11.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:08:04 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/5] Tegra114: implement EMC support
Date: Mon, 26 Jan 2026 21:07:50 +0200
Message-ID: <20260126190755.78475-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for External Memory Controller found in Tegra 4 SoC along
with adjustments required for it to work properly.

Tested on ASUS TF701T (T40X) and Nvidia Tegratab (T40S). Both work fine.

Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.158860-1-clamor95@gmail.com/

Svyatoslav Ryhel (5):
  dt-bindings: memory: Document Tegra114 Memory Controller
  memory: tegra: implement EMEM regs and ICC ops for Tegra114
  dt-bindings: memory: Add Tegra114 memory client IDs
  dt-bindings: memory: Document Tegra114 External Memory Controller
  memory: tegra: Add Tegra114 EMC driver

 .../nvidia,tegra124-emc.yaml                  |  174 +-
 .../nvidia,tegra124-mc.yaml                   |   31 +-
 drivers/memory/tegra/Kconfig                  |   12 +
 drivers/memory/tegra/Makefile                 |    1 +
 drivers/memory/tegra/tegra114-emc.c           | 1463 +++++++++++++++++
 drivers/memory/tegra/tegra114.c               |  193 +++
 include/dt-bindings/memory/tegra114-mc.h      |   67 +
 7 files changed, 1770 insertions(+), 171 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra114-emc.c

-- 
2.51.0

