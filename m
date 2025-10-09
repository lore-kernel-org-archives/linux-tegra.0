Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD68B21C9E5
	for <linux-tegra@vger.kernel.org>; Thu,  9 Oct 2025 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760026244; cv=none; b=uwAnSbhjOYYAvOK5mqyovrMNdSigAFm1s9KRoTb1ancjtBzr9bBKbqkgJVCqJrH9R4kKKNbocR5STCQpY/1IfBJrO+MgdSYWly1B7+IwX7nUCLTiWJx6bFHr/Rf5hZn80VskSbNzbl4q8pp0FVq/9rX6Rd5RXPNA4iVZYcIEkfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760026244; c=relaxed/simple;
	bh=/QroLiiLgmRbmdtmGaHJCJNhy+ofzWFn4TKF76QlkYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Na6MiYDRg9KnP6liGY2IpDonJPSumxuFhdrTcZuymRL16UY9beBxlBwXRWHcrF2ay+Te7lavIuMRs3Umrx5es2nKrNoOQ3mX+QOJU4XtLHZ9PwMToNFtuF6bSiVKzNco/EDwzrC4qwAx9BU2VoAn4vqUqHJSXceKOCKz07N34dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4mwxk0M; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4mwxk0M"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso713771f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 09 Oct 2025 09:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760026241; x=1760631041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6dY4iN7PdWChYRE0ifRKVqt27FKLXUFTSH3kC0uyt14=;
        b=Z4mwxk0MvyrZdFXnQKSqPEdN9X1LovenCzi72wyuMoW9OyBRTFTWEyvJ8ePWzQS2PV
         R/hnO/DJJN2SVVdoQdtJU5Pd1jfrrvoU+0cpzo/bxtH6vq+7X7YWyxFG99iaZpv/4zZG
         yIg4qP3tGh+eRmUmax33gKdVK343PWNWJYxt20k/ap9PYcMYFgyQT0lp7rlXEcoHs2sK
         9P6QL2IF5jiYrcH+qK5rpY8t3u1AEGd6imssvgDt5EjjbiY2CmeYVKnJSne4HABuWLGm
         hYMO0/mhCe+Bv2OmpMHZ0B7juulGXUHFbK6qh/D8GunZ7ZkM2WESbWvpkSQ8xgGuo9MM
         8NLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760026241; x=1760631041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6dY4iN7PdWChYRE0ifRKVqt27FKLXUFTSH3kC0uyt14=;
        b=I+hbaTydPrXiUEauJF77IGyyAQw+lQTEyV6y7vujGKhR6q9fuefDdu8AtrRTJwhj/y
         wmRwoToZZgjcHnDNoXIio59gPdTrY6qyghvKjvIUiQpRG74b8EFM0TXlKfID3hR+a9xW
         FZffuhVGCvpVRJTa+R1405zVrIOZ5Gys7+UAStPj2G1EuS+7GePVkDlIp4CDpsdamGj1
         GM52+xh6skjuT2czB2xKAOE6RyBEh16aH9w+17/573elrHbP4dy6JTErJJIqvB7ssd5r
         yr1unIPGwqQzdjofYWd6rN8zZemREKrivaFYGKSck8qIHNuIbsOQ7GsWRB4pLXB3alw9
         5nPA==
X-Forwarded-Encrypted: i=1; AJvYcCV+ZmBGDu4Zi+rUHJf94k+WV47uZD/gpyWwH9U2TTV2lHTXya4RhaK5m1+43e6Mtlf2LPPVHi3WScf4Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBrWO3qVOUPTAbDBGI8/vf4RxVynHafW2Du2+Bkz8qIIUjfD8N
	fUrZOWFF5iUpjG/M/7IIVeIPoNdUyH6D2m1Y25/WByze7G5JbJI6UmMH
X-Gm-Gg: ASbGncueds2UxYWy3/EhkfSk0irX1pF+bxrYoUhvbfZdVMxaTfoSy9Y7AgaWPURILKl
	bVXe6YOoiD4acFgASOqs0x9z5k9hotEyomQ6rYN2nn5afsYvVBOSHRrdsn1998yXWvbm90b6xs+
	iWckHwbmvjFUmUZQda9/0aJHwDrfbRJpVv+vRFp2D+6qrlbwktkLEUcCmhzQXJKEz7Yc3x7Oqau
	dJYMJsYeUhbkCQ83rhMnwBK/y5lYSDuWUULh1idTsynpR5Me0RQv0Em8vIqYkvL2yGDsasWJIP2
	KNVysnG4msGioZ7zHEuxWLxLHl9hdSv12GAdQfQiBizziIm0AG8ZZ5jUTIVmCLEZoJcPEsTGWCL
	HWxxZsA9OCzXZXZo/kte2O+/zJ0MLTRqDgGQdMT0I4qe4u7k20ssWSvvUT0/in5h/YQ3z1zNqWq
	z2hjHYPe+2rZ1sFsnIlvAyC1Tkfrza0fbCb97QV3iEJCNKHsuvgA==
X-Google-Smtp-Source: AGHT+IFkwHykrA+wYAhn/zJi5eTUQsxL1dfc4QaEW+3rGUYXDO/GVtri/nlITfJ9TCBVb2Nii4lSVQ==
X-Received: by 2002:a05:6000:2504:b0:3eb:f3de:1a87 with SMTP id ffacd0b85a97d-4266e8e4483mr5631337f8f.56.1760026241085;
        Thu, 09 Oct 2025 09:10:41 -0700 (PDT)
Received: from localhost (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426cd9a0310sm47995f8f.45.2025.10.09.09.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:10:40 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Sheetal <sheetal@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3] dt-bindings: power: Add power domain IDs for Tegra264
Date: Thu,  9 Oct 2025 18:10:39 +0200
Message-ID: <20251009161039.1766845-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
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
Changes in v3:
- rename to match the nvidia,tegra264-bpmp compatible string

Changes in v2:
- remove _MAX definition since it isn't needed

 .../dt-bindings/power/nvidia,tegra264-bpmp.h  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/power/nvidia,tegra264-bpmp.h

diff --git a/include/dt-bindings/power/nvidia,tegra264-bpmp.h b/include/dt-bindings/power/nvidia,tegra264-bpmp.h
new file mode 100644
index 000000000000..2eef4a2a02b0
--- /dev/null
+++ b/include/dt-bindings/power/nvidia,tegra264-bpmp.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)  */
+/* Copyright (c) 2022-2024, NVIDIA CORPORATION.  All rights reserved. */
+
+#ifndef DT_BINDINGS_POWER_NVIDIA_TEGRA264_BPMP_H
+#define DT_BINDINGS_POWER_NVIDIA_TEGRA264_BPMP_H
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
+#endif /* DT_BINDINGS_POWER_NVIDIA_TEGRA264_BPMP_H */
-- 
2.51.0

