Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D814A23;
	Thu, 28 Aug 2025 11:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756380574; cv=none; b=e/h42XXMImkNyvKltSzJnmT6mz8usBvP5ohGzv+qOrpafNG+7SoBq19jTdxPlhYVTiA9HctKSzIHlMIzRgmr+Ys3K67BM6hfJPLHHvFFrfvvEqFHsuXEqQYEmqzhrhMkxj6eX90pmVSnw8CXe5aIHQISD8udalaoUitJE6dUh6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756380574; c=relaxed/simple;
	bh=iuvgF5WKbVY5namh3+dkboRF2JUpsrqrZHsv4Tz1zpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GM4/t2dMZ0+vUsA1ND/fJ503Q9+eggdRi9M6RFoxjOs2sOP7eko6hUY8gcSwBgUt/P/JiT8xT/9+lGX89i39pfQIDC5kwZst7U+qRfQZ691Gl1zQrVoIQ1E58hof80q2ESCyunsALcsQHILdFEvvY6KLyVLHHszJOpgYJlgBhPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fA/q1P5S; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fA/q1P5S"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b7c01a8c1so3601865e9.2;
        Thu, 28 Aug 2025 04:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756380571; x=1756985371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8g5+Genpp4nyEm3piiPRUqdPxA645wi1NPlIMX5vuFg=;
        b=fA/q1P5Sp0lXXIyVHMDtyRQvxaAcUULsLecdUikoMdoVQ5o8IBJA8DZT3jXrYcM8G1
         iI/4gGRsLlvd/+jVXyQWFKHxa2Hz5S5bawbzlwTQwFvlox4eLvRSif/SJpla97Glh3vS
         rFIPxIZ69l7dZscBCcrTKtN45942rQKC6QT/PrRFMw8fmxpq/Rh5jboKk4ZHXeS3QhhU
         kbi0ntymswrbT7bArbzXhAg9KR0g+H08Smj2QY1/5mm0S8FGiUjM59D+i7+zMuin11sL
         isFAkwQb99rc6/6u1Gw8HfHyz20nkYxtjVnpDnzydh94hXd29HeW0LCeFsv3ilM77COq
         F3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756380571; x=1756985371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8g5+Genpp4nyEm3piiPRUqdPxA645wi1NPlIMX5vuFg=;
        b=Hb8ZDE4RfKUEvHIhTcdz8Ex7IjBI8NqJS6ht69GnJJFiPQlADtAJU9y02BJx5ghWQr
         8WPRoUrNv1GT8M+mTkYuHKR604XRVUL15HrzcibnyRvAeZMIhC8lSIDoXjhTwiTm2v/D
         t/nRqVhEjjDB1iK/XFZfNXoWIcnv71iZOVY0VKi32wxO7OAiEt36VFO/VQoLTlMCQAEt
         VgjClMWJtqFf2kTsrni73qSDY8jc38+FoK38upavKRn7Y3IfMquw22vNOktkj3Oi5heP
         n9cNN4Lu9Rw+tUfcI6EeNQ5OOjhA7MnMVXc+HD9drhOHRLD8L5lnYnBTLOjh3dTWIj0R
         Y7cA==
X-Forwarded-Encrypted: i=1; AJvYcCVbYgkfu5RtZwQwoVnYIxopBCkMUhDxEvepj5tTMpECtc4M4mwb8lCF1mmy97PohWC7+mm9SOb/smA4NZo=@vger.kernel.org, AJvYcCX4EJiMPaF6vqRlFEWpUzUhg2vvlxmQH9ejuCNm6WtCNM0EQGT+irzlvcWQiSXJeuqDUsBwMFWZqy/v@vger.kernel.org
X-Gm-Message-State: AOJu0YxoBQO8cgUtLsusCTEGGjKo7hKNQbge20NUsPTeg60ktzHMqyYp
	RjpAUihnSd4QiVzOiocY1X1tNZ7evQjRDViU0UMDh+ST8w73+I4T1b/0
X-Gm-Gg: ASbGnctPID19hFqteSehZmjXIUVvVmvOj2Cdz+qSHcB+qgIbhHaZQPvRnpHs0uMGve5
	iqNHUmm0eXISvE0F3M1jc3mY3+wVvFi13bDp5edSbQ2gXdVbM3d13RaupY1OdvOdmzjBaJe/FRJ
	5j5ifsGcLIOPfRC5qZ7CCYXCL9inEX0RSy5lslNn3vru9TtT8f/qMFXxGYW6/oXfcWs7RTRFAJI
	N9GZFJ7EsQ5JccsUyYxWmEDE2eJRn5drmxS+j8VYvOxFJxZ8xn3fU+GXrFuEqa7n+l3lGCH7zT7
	jP9szGkp2pz5gtsAathtrxOHVMl2krM6qpad5XPKaocowDltUZX5NgV3sHYSNuqKB/JxGJcrn9P
	B+rYSaq27hFswsZZignf6yw7UZJNeVOgYP88tAINcUkMFsLdQEwkoZnET7MzsFavXRZI9eED2Tc
	6DkehF+noNpdDovw==
X-Google-Smtp-Source: AGHT+IH7NtIhvwSLMCKqELZD2VmYXgP4iXCniiQSilhq2S7js3HFZ2s/7U39G9yO17ptiDevFBdx8g==
X-Received: by 2002:a05:600c:3b23:b0:45b:47e1:f600 with SMTP id 5b1f17b1804b1-45b517dc59bmr200319745e9.36.1756380570880;
        Thu, 28 Aug 2025 04:29:30 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cca0dd7014sm6888118f8f.13.2025.08.28.04.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 04:29:29 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Sheetal <sheetal@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2] dt-bindings: power: Add power domain IDs for Tegra264
Date: Thu, 28 Aug 2025 13:29:24 +0200
Message-ID: <20250828112924.3773782-1-thierry.reding@gmail.com>
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
Changes in v2:
- remove _MAX definition since it isn't needed

 .../power/nvidia,tegra264-powergate.h         | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/power/nvidia,tegra264-powergate.h

diff --git a/include/dt-bindings/power/nvidia,tegra264-powergate.h b/include/dt-bindings/power/nvidia,tegra264-powergate.h
new file mode 100644
index 000000000000..1e2acd50c099
--- /dev/null
+++ b/include/dt-bindings/power/nvidia,tegra264-powergate.h
@@ -0,0 +1,24 @@
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
+#endif /* DT_BINDINGS_POWER_NVIDIA_TEGRA264_H */
-- 
2.50.0

