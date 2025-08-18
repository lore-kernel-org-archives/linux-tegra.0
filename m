Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C649E335BCB;
	Mon, 18 Aug 2025 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755525171; cv=none; b=tTqJnyGrBhwYL8w5JQ3jhiI92uibqOnQZCeOy77otwiEq055kBEkx4iAFXhwTO9wB7vULzbiZO01ozg0SUL67svMotrhboi+uw5wETY+cWg+TnL0UAmU6IJsU51I7ctT7Y6aSQdmEUtQurv/+yxVEV+dYkphz7cMohXuSD/uji8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755525171; c=relaxed/simple;
	bh=G0u7myyLUC9IGZLchEpGws4b8uSHN0C2lUfMQCJCDv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVr5YStt/W6c4XKcQjS/gTCpEK767pS9sBfWXBu1OZczonxxkL5q2VoUQ9vK/6v/9AVb4Eblc31P34G90FiVeDDmQh1y5TAVQdg1zaXWp2hpy2Rl4VKg2F4QMFlRKp/5VUZZApS7xzhXAUV52PydGPJJc5OIucqdwBUP0DDbH7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JV0zNLbe; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JV0zNLbe"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso21106915e9.3;
        Mon, 18 Aug 2025 06:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755525168; x=1756129968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nwBY8hYWuHKVLhcs/lBqHG3knkz/XdU42q5E6VvPYc4=;
        b=JV0zNLberqqQBo1ZcktQd7Lk8dCSd1A+kHt76fDFvf5lsrmQzY9DEutybNutBREI3F
         BLSXui0p8Cq6RlXhU+2iiCCN+BiYBIy2TAz3z3Xt/y107LeQcaOZcs5SGrh1JsE95k1s
         HpXHjygp1Grg8j2RiQXdm4bJgYm+pG4TpSQQgYjAduGuvZ6qTLXKlZ6YssihuwctcDdh
         lO+4SQSA5I8bgBw5C9hA5ETxsnaQhwIy4vJN/NzXCYIWiaKp9hsCKLXnIR695RBWWIVJ
         7rAWJeqEbATbWZUvNrRjMv2XoL5nW+Zwrg/yk6FVz1CBaMZGV110xYYrIKL1ZmKfsepG
         VK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755525168; x=1756129968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwBY8hYWuHKVLhcs/lBqHG3knkz/XdU42q5E6VvPYc4=;
        b=Uhm1RFxAreYamJCn+nYsPxHXOIFMJEwM9ze/Fjnx7zMPp0uaZ2HmCyU9thwspeRpGr
         qXsk1Yu7Q2L2swcL3p3D3hIO7RS/UKqYxEIYTefYFv1CBKPjm2tVLizicFRS7M4NFyPa
         0xsxG49Lqs+vQ5RNAZScdmFYS7wtHJuws4CYV7PyM/QTywx+N+5dcdYYbOoOENt4WS1Q
         TMoSzJm+VJgVukfSCGiH60zxS2joEEtv+sHlXLNBFSo9htSzoIFH438cT4lgsbdI1/oS
         pWxe+w1wsKAr1i0/AdonqmIGrNMZIeyEGP2FVb8FXYv/Owuj1izf0UV/oynDakJNldqb
         WmKA==
X-Forwarded-Encrypted: i=1; AJvYcCXcfEH4phJJZ+U0Z1dasAauXUnYxWegHT+e1WuEehHIXpyXhHkV2TMZBYRI7iHiByaqVH6obq1PS31pPJA=@vger.kernel.org, AJvYcCXv/+4XPxeprO/pKHljgSIpLqLCNHWQp7VQaoYH95wW8MdSLyMYWDob9JDPGsmzg5uSkAOUhogi84qd@vger.kernel.org
X-Gm-Message-State: AOJu0YxFX6KK+b2w/DTY3YqTsnIw8oScUmkZNfWoP7FDiugNBQAkLxVp
	HndXOC2cO1RB+fA4K1n+LiddVjICxjryqcOSv9wNcZpSETJU6hpHTh8ccL0YwQ==
X-Gm-Gg: ASbGncsud+GaSlaHjVhCCUqx/rpBeuRfgjZbzBd/Buy/dShrde+xLoMB4G8SGDcS/Dy
	mFhlEHo0OKdJ+tijjm2O3PtdBRMB0UjQIe0tcpjKgz4Y5r6IgZiQfXkB80sH/lF62efRGS5FNuu
	xRewz0kVgW86H4uslAD7/+Q4syNhFuKM/oFoq7UBv/mEOoQXLZ2iKMNPGdO9tSPVeu+GwKjMtvZ
	xKFsT6j+G7IwTN+jxAaQousbdjnpY2a9NHbKXWlL8wowqB6CFZ0B9yB6B71HYjDkGgi3WdUzE7y
	JUGBw0ZBXzxql6aI3/x/b1y/qutYkCkhIMXm+9z+rJ/wZ2jFQsCwgN9gG/DSBXe72mbv6RelCGm
	p0viOFoykNlclIMqZdWc4fpdkaZMkWqlmeTLrlOYSGKJlEhQam7Frw89OCRDBkUGp3nICiSBwkw
	/ZJzxpOCVeG8itCEOI+xq2ttHqDzH0n2OOql0=
X-Google-Smtp-Source: AGHT+IHxZ9p9k1C3FC9YNqhQIOdmeyzKaV1k1Kc1LIM85OyldMqEAI3vAyCgAKP/2vO3xunr07gmOg==
X-Received: by 2002:a5d:5d11:0:b0:3a6:d145:e2cc with SMTP id ffacd0b85a97d-3bb66c297aamr9809679f8f.15.1755525167709;
        Mon, 18 Aug 2025 06:52:47 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb676c9a7fsm12830583f8f.37.2025.08.18.06.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 06:52:46 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Sheetal <sheetal@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] dt-bindings: power: Add power domain IDs for Tegra264
Date: Mon, 18 Aug 2025 15:52:41 +0200
Message-ID: <20250818135241.3407180-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Add the set of power domain IDs available on the Tegra264 SoC so that
they can be used in device tree files.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../power/nvidia,tegra264-powergate.h         | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 include/dt-bindings/power/nvidia,tegra264-powergate.h

diff --git a/include/dt-bindings/power/nvidia,tegra264-powergate.h b/include/dt-bindings/power/nvidia,tegra264-powergate.h
new file mode 100644
index 000000000000..344c669e4a52
--- /dev/null
+++ b/include/dt-bindings/power/nvidia,tegra264-powergate.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)  */
+/* Copyright (c) 2022-2024, NVIDIA CORPORATION.  All rights reserved. */
+
+#ifndef DT_BINDINGS_POWER_NVIDIA_TEGRA264_H
+#define DT_BINDINGS_POWER_NVIDIA_TEGRA264_H
+
+#define TEGRA264_POWER_DOMAIN_DISP	1
+#define TEGRA264_POWER_DOMAIN_AUD	2
+/* reserved 3:9 */
+#define TEGRA264_POWER_DOMAIN_XUSB_SS	10
+#define TEGRA264_POWER_DOMAIN_XUSB_DEV	11
+#define TEGRA264_POWER_DOMAIN_XUSB_HOST	12
+#define TEGRA264_POWER_DOMAIN_MGBE0	13
+#define TEGRA264_POWER_DOMAIN_MGBE1	14
+#define TEGRA264_POWER_DOMAIN_MGBE2	15
+#define TEGRA264_POWER_DOMAIN_MGBE3	16
+#define TEGRA264_POWER_DOMAIN_VI	17
+#define TEGRA264_POWER_DOMAIN_VIC	18
+#define TEGRA264_POWER_DOMAIN_ISP0	19
+#define TEGRA264_POWER_DOMAIN_ISP1	20
+#define TEGRA264_POWER_DOMAIN_PVA0	21
+#define TEGRA264_POWER_DOMAIN_GPU	22
+
+#define TEGRA264_POWER_DOMAIN_MAX	22
+
+#endif /* DT_BINDINGS_POWER_NVIDIA_TEGRA264_H */
-- 
2.50.0

