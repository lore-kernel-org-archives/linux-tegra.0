Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1386A289365;
	Wed,  7 May 2025 14:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628697; cv=none; b=HzFlHoBgobx+4B70nE/0fbJsC9xBjT/abK66ZQsfqojHs2PQAxIVXWPod5SBnJ/XlNvVsLaggqHT9vWD2PFAMPR/unn+BURXyA/ULVl0XMaebt1eLOM+jDuS3Ck5bzIk+ori4FXbaUNuqxVcSs8y75UwokNwI2mijtwSGokwTbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628697; c=relaxed/simple;
	bh=IQF+w9KgJJTojKRnzcgnWvO6me0w+AOxALgiK04+xWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kWuXl5vvRTJHOlKS5kfdzveseVVJ86P/49smxtLWGcrUE/PB8jMpQ1gEpq9EcC0f29aoPxJomzVKO7xJWT0BoY1NfxnKi/artlLTC7PVcxqrJATx1ZlRoNrVdmsA/FCLv1lewkRXHyPmrmztmdxl4Am8yDGU0/5yPrcpH8JcATM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4FIcTIJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4FIcTIJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so2435765e9.3;
        Wed, 07 May 2025 07:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628694; x=1747233494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnALzRPg1oF+peGB+YZ+rJ4L979AUZFvnhwyo+/bFxE=;
        b=h4FIcTIJQV6Y4JPr4qzj6hXIwLAKkoaPTiyrXcnNd5lDAikPgop0MlaR7WTcaVAH82
         5fLTYZxfyBs2fXm4VizWJZJkCnJ1pmbcyDlocrFd4AeLIJ/X6W//LZiGZ4YI+h3Wmp9B
         rk4oAIUso1rLhHLJLsLTlAruGjj21mydMOA/OuQOrVOFe2b/bFb+hns6dZBwMQHRVTKt
         mvw+DIjS5a7aarHioBkwH5a5P9JKeIYj1bJQZDeiVvB9STv464jBpilZ9MA1rxQDheRQ
         Czt9aoO9fpYYMrNw43yFJGa0mBLUBAe2uOc0aF/jl+5h7g1gMkP7/gJJ4GyBFmR85K9s
         f6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628694; x=1747233494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnALzRPg1oF+peGB+YZ+rJ4L979AUZFvnhwyo+/bFxE=;
        b=cuLUCGzReGbBUvYevjIEDZIAqou4nUvDA7wptRF3mNdycbpU3XUIPAvXsK1Utd3Zd0
         eZhmYazG8LSCDzAaMqMF/SsFD7DNkW6VV2xHVw6h11MOXz4ox36o842YHeJ/Vf0ta6Sy
         olq2e4QEc5LIur5GgeTqU0MawcZPTAk+skYWRJIahJk6qVWh5fGpsO97fGdXdOJMMXkJ
         9bzwCBsq63GA/vrCJXixEQIP9G3kRx3MdVY6pNvzt41EcsCMhGTwlY5h1iOykljMXWUk
         97NSqSZlXqi7qZ0b4/Eqz4GyHl6ePhv5CP9STGBiWPrBRG7AA0BhVZRJXinsmnjLZe1m
         T6gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwiAxdGABJ6aAMk1dHrRvuWiHtpIMgMVIhD43HB2+2McLKNyTL+GfZH3j8UKs0VQeTXtmJoKhlmVWxvn4=@vger.kernel.org, AJvYcCWXKjYJSzRbBaNzadUoe+iFl4TXSabui1vjwp+cZCIQEWA7hMwUo9iX8wDifGp7OU+n6kbCSUC0Qgl7@vger.kernel.org
X-Gm-Message-State: AOJu0YyAWHPiEPFvwz7yYA0QxM7V1LhD9EYZqMmAyms5IsREjMGjitwo
	q0uQVa/iA6As4/nBjIiKH+abJNteap4LoDNMtL8SAgFJ1ss/i2tycSdRYA==
X-Gm-Gg: ASbGncvAz6Pr5kNOGxPSlYI0Hb2GuQd59+jAmGda4CrVE3orS26fjQwAx106iHjNsaa
	FfsyGve340d0CoJkCH7W4ddk9r0TFF8v9eilHFy5+MwC5ZdErFAaPMSX+CsGPWISMlZcFKZl9qR
	m7dEm1hd21SS5Enx16n/xJ3WyEvdYJ1/2an7jMQd5XZ6watnEurygP4jdzqM1pGtiTs8sp7mm0w
	VHeNZNdjGu8XwlcVQilPmIRgR3eSxHd9+8awZvnwOHQnkz3Ka8HEOZBvBe8OYxghB6hGZk4F7XP
	CR5lWqBU7cBMfhW0Rx5LUSbY00gHL3XAadj/XbomQ/xkuqFZp4ER7bb60Z0ZnOYt93qu1dmwQ+P
	czirCoG2Xz4Kb2A6fzvNzIghQlnHUuYk5
X-Google-Smtp-Source: AGHT+IH5IeFx0/m3RABkAiATe+yCuv6gUvShra1iSISAVHww4IwhhJHQk8Zyb+TcfiCKhKpeW0ZkpQ==
X-Received: by 2002:a05:6000:2c8:b0:39c:cd5:4bc0 with SMTP id ffacd0b85a97d-3a0b4a16a0fmr2600408f8f.52.1746628694320;
        Wed, 07 May 2025 07:38:14 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b0ffb1sm17050498f8f.73.2025.05.07.07.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:13 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/8] dt-bindings: memory: Add Tegra264 definitions
Date: Wed,  7 May 2025 16:37:59 +0200
Message-ID: <20250507143802.1230919-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507143802.1230919-1-thierry.reding@gmail.com>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

This doesn't currently contain any stream ID or memory client ID
definitions, but they will be added in subsquent patches.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/dt-bindings/memory/tegra264-mc.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 include/dt-bindings/memory/tegra264-mc.h

diff --git a/include/dt-bindings/memory/tegra264-mc.h b/include/dt-bindings/memory/tegra264-mc.h
new file mode 100644
index 000000000000..128073d05895
--- /dev/null
+++ b/include/dt-bindings/memory/tegra264-mc.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/* Copyright (c) 2024, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef DT_BINDINGS_MEMORY_TEGRA264_MC_H
+#define DT_BINDINGS_MEMORY_TEGRA264_MC_H
+
+#define TEGRA264_SID(x) ((x) << 8)
+
+/*
+ * memory client IDs
+ */
+
+#endif
-- 
2.49.0

