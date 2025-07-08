Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65C52D879D;
	Tue,  8 Jul 2025 10:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751971979; cv=none; b=ZHHErk3SrrRx6UtIQf/dNeY3SKy9xnPdGljxltQAYliceouy8umBeUvi/hl62fb/BEN9V0RkVJOt7ZgJw12SVMNoZo9bk7oGYG9IucPdCkitfplhlHXQ/9gC016WH7Yrie25b99/0DmHKCt/TEbWu+/FHUx10wOGQFaVGorgjkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751971979; c=relaxed/simple;
	bh=2eQyf22UoW/JY7lUXzFCcT065FDHxsenTZVcJ1bpU8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1kh0ZBmAgvN0xF/pR/hZcAYU50Chl6TCeWHNUkLX+Tq+/JLr9twY3KDj4f/oVLtOfVye+ViXzjtC8XSdhvnCXJq2iHcD31ggvtImsrlYl0sWtxbtQs0f7gp1OEZudYa2QiA9s0NF0w4C4MWgo6V71dWcKoeRBTkXJRjpTv+Ijg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtHJnsSg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtHJnsSg"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453634d8609so28542485e9.3;
        Tue, 08 Jul 2025 03:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751971976; x=1752576776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hW5KGfWASYsJDMXjc47a4qAMcbCATDg5AN8b8q+DmhE=;
        b=ZtHJnsSgX2npzGCxFRyYqHZrGHpzfyQbENkWpUGqnBIq5CbyIrMeJaLiBEzi8x/6Fj
         rRzcFE3IOT+mF0qeNe0WsSi1WFu4DhLlU+APalCQAwGKqNlWzy0FVdE/+2c1JzNcY1Kl
         +YOVTX+8EJ5fJAHlp14rnanRwSS/3Loccf7xuBh15PiSTm1boEcf0F7iRYn4IgJwfPHw
         26LtpyxXkExoWUAhoF9aoJjC2gqXqJzE2LR4q8iONTEtyuG+3jxXXin0t/dkikjGidl4
         PuZTKMS7kwu31+mxPd2UZohY/ftOcsL1n5Swhhpu9QF6eEyznNuo8X1E+Zi541Ed9+p6
         q1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751971976; x=1752576776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hW5KGfWASYsJDMXjc47a4qAMcbCATDg5AN8b8q+DmhE=;
        b=gBkvAECbnGGbna9yleMjMIBHXDQrl15xukWmfyVsaQMSlWR2yIdmb7ChJBjRPoze5T
         0ny0uSdpn0odE2sa25ASZnUNQ6Dab8R1OlpRHclueUMOv+55mJIWr9wpQ0FRPaJUTeQj
         CWCgyXsnwMzh0BThlaWoUG7NnDgbWg4UIkpzn5Iz/W/bsD7XnoPfH5u2XCQBmd5MNg/S
         ZRN8ld+v1+pRf0+XF+pnasWiN5twrXLOzUVl2T8BLhrZKIptf9dCr8hOm3WWlU+gtobn
         mjDxCQ0b77LA3N+ck/B5ZDWElzrtG9y3musNbFky29vi1vZ1Mb57uZW/ke9//BOlGqdH
         I7Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUrsfxYMogo1jirpw6bnind5Nc9MU3OLBppIQaEkQP5wFaqY+j8ryXpUVOLd4bBLTy7WhRP5CXoo3c/qEX2@vger.kernel.org, AJvYcCWhaQfHdQNnFS2ShU7j649R2etB5iPsEyxEjhKn7HxBGyd5YSxQSq9MbObKg+xZBuIoOBtBFUp03eSgw3U=@vger.kernel.org, AJvYcCXn9FqwOr29FGuNQDSyMt7ouARFRxutgwLoMLb16Z5rEjQJP6DzYEZIdNtHeyrgidklHkuxE/eocIZ9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8U8nn+x/GDFWjcp7gNS68s4OwICHS14hk1p4ZCijl9L2jBqt8
	Ukp63cM4ckWRk1qgnP1dZPnbEqM9ymUKBhs+CuI4kmw/j0mjXzGEKQJi
X-Gm-Gg: ASbGncvyHd84euunzTfUYqjHvnDGwyzf1NBBSiQDwlJFa8uN67/wcHFnc3YvhoyBw8w
	pkNMnTzXcZL2xMBN7dXkdPCtO6H1SqRoi4f8/NkyO8pzKzbhgFJyLYzjkp+PJmgGSiPv7eXf5/7
	sM52SKXuMoPimHczEpUH5RyhL2/5BJ7zUPkBhhtF+zPYn/axI6EWuUi+Qo53deZSIQoOnw/p/Vk
	pDcaSlO9VNm/B6Znr4QjMK2jgQZEU8qPCqiwf48PzAdm7nsLBEXpddahfOxjsoer5XJBBZ9SPEQ
	JAHr/nvLX9jZ5xUgWMZ+WWsznSCDtZ0qwW7/ss4NYaUrZUdjrEqtPnE7hbOcPqjSNiOfLJyVuB8
	zRSTP1puKy5Yb1ehBAX497r4rrYRVRCm5j0c2NJV8SP9dPJy+wtGtnQ==
X-Google-Smtp-Source: AGHT+IE727F4YYWl8TIHyfkECK4+zEvdaXZW7Mi6Sw9excQ3aRVypHJegd7uGChNTW2FedcuiNlHDA==
X-Received: by 2002:a05:600c:a00e:b0:43c:fe90:1282 with SMTP id 5b1f17b1804b1-454cd4baeb6mr24153325e9.7.1751971975891;
        Tue, 08 Jul 2025 03:52:55 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454cd49df05sm18104395e9.33.2025.07.08.03.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:52:54 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: memory: tegra: Add Tegra264 definitions
Date: Tue,  8 Jul 2025 12:52:43 +0200
Message-ID: <20250708105245.1516143-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708105245.1516143-1-thierry.reding@gmail.com>
References: <20250708105245.1516143-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sumit Gupta <sumitg@nvidia.com>

Add memory client ID defines for use by the interconnects property in
the device tree and tegra_mc_client table in the MC driver. Note that
these IDs are defined by the hardware, so the numbering doesn't start
at 0 and contains holes.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/dt-bindings/memory/nvidia,tegra264.h | 86 ++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h

diff --git a/include/dt-bindings/memory/nvidia,tegra264.h b/include/dt-bindings/memory/nvidia,tegra264.h
new file mode 100644
index 000000000000..d6cb0c9698f2
--- /dev/null
+++ b/include/dt-bindings/memory/nvidia,tegra264.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef DT_BINDINGS_MEMORY_NVIDIA_TEGRA264_H
+#define DT_BINDINGS_MEMORY_NVIDIA_TEGRA264_H
+
+/*
+ * memory client IDs
+ */
+
+/* HOST1X read client */
+#define TEGRA264_MEMORY_CLIENT_HOST1XR		0x16
+/* VIC read client */
+#define TEGRA264_MEMORY_CLIENT_VICR		0x6c
+/* VIC Write client */
+#define TEGRA264_MEMORY_CLIENT_VICW		0x6d
+/* VI R5 Write client */
+#define TEGRA264_MEMORY_CLIENT_VIW		0x72
+#define TEGRA264_MEMORY_CLIENT_NVDECSRD2MC	0x78
+#define TEGRA264_MEMORY_CLIENT_NVDECSWR2MC	0x79
+/* Audio processor(APE) Read client */
+#define TEGRA264_MEMORY_CLIENT_APER		0x7a
+/* Audio processor(APE) Write client */
+#define TEGRA264_MEMORY_CLIENT_APEW		0x7b
+/* Audio DMA Read client */
+#define TEGRA264_MEMORY_CLIENT_APEDMAR		0x9f
+/* Audio DMA Write client */
+#define TEGRA264_MEMORY_CLIENT_APEDMAW		0xa0
+#define TEGRA264_MEMORY_CLIENT_GPUR02MC		0xb6
+#define TEGRA264_MEMORY_CLIENT_GPUW02MC		0xb7
+/* VI Falcon Read client */
+#define TEGRA264_MEMORY_CLIENT_VIFALCONR	0xbc
+/* VI Falcon Write client */
+#define TEGRA264_MEMORY_CLIENT_VIFALCONW	0xbd
+/* Read Client of RCE */
+#define TEGRA264_MEMORY_CLIENT_RCER		0xd2
+/* Write client of RCE */
+#define TEGRA264_MEMORY_CLIENT_RCEW		0xd3
+/* PCIE0/MSI Write clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE0W		0xd9
+/* PCIE1/RPX4 Read clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE1R		0xda
+/* PCIE1/RPX4 Write clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE1W		0xdb
+/* PCIE2/DMX4 Read clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE2AR		0xdc
+/* PCIE2/DMX4 Write clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE2AW		0xdd
+/* PCIE3/RPX4 Read clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE3R		0xde
+/* PCIE3/RPX4 Write clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE3W		0xdf
+/* PCIE4/DMX8 Read clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE4R		0xe0
+/* PCIE4/DMX8 Write clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE4W		0xe1
+/* PCIE5/DMX4 Read clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE5R		0xe2
+/* PCIE5/DMX4 Write clients */
+#define TEGRA264_MEMORY_CLIENT_PCIE5W		0xe3
+/* UFS Read client */
+#define TEGRA264_MEMORY_CLIENT_UFSR		0x15c
+/* UFS write client */
+#define TEGRA264_MEMORY_CLIENT_UFSW		0x15d
+/* HDA Read client */
+#define TEGRA264_MEMORY_CLIENT_HDAR		0x17c
+/* HDA Write client */
+#define TEGRA264_MEMORY_CLIENT_HDAW		0x17d
+/* Disp ISO Read Client */
+#define TEGRA264_MEMORY_CLIENT_DISPR		0x182
+/* MGBE0 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_MGBE0R		0x1a2
+/* MGBE0 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_MGBE0W		0x1a3
+/* MGBE1 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_MGBE1R		0x1a4
+/* MGBE1 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_MGBE1W		0x1a5
+/* VI1 R5 Write client */
+#define TEGRA264_MEMORY_CLIENT_VI1W		0x1a6
+/* SDMMC0 Read mccif */
+#define TEGRA264_MEMORY_CLIENT_SDMMC0R		0x1c2
+/* SDMMC0 Write mccif */
+#define TEGRA264_MEMORY_CLIENT_SDMMC0W		0x1c3
+
+#endif /* DT_BINDINGS_MEMORY_NVIDIA_TEGRA264_H */
-- 
2.50.0

