Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F170B3A5459
	for <linux-tegra@vger.kernel.org>; Mon,  7 Sep 2026 17:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788802401; cv=none; b=YQPPXFsSXo2sEFk1i4BAcFf6gk+hQsHIgdvCdc+JWKiC4JBEmiV/z0qHlXK8AgV1mzJc+cRvLMzzBgM3Fibz8QcKc+OTIWrUsXjhFTBDLuMS/oPRInsJYEiBUSP4z/l2TrtgHVkg5HYqSXyOhRk7IEDPL81glc/cx/eXB7BdBj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788802401; c=relaxed/simple;
	bh=WBdR+Pa9MECsVH2zWYA4pufWwidowE/sGBM4Qspyv6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4+83JmZDM2MYhmTu9n4gKyFEb8PaLaKopz3ftea+Mpvl5EXkFf39CmenL6NqMGQqBqhHiCJXfJ+Eu7Z7drOUSgIvuO1k0l9kz64gUYNEmlc9Lv2Tur+YHV3cvaFsJo5ekxXFb0rtgWk95YxffOCnC+X+qj9W9lROjmZTu0J6Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OI4wkkc9; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI4wkkc9"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so2440661a12.3
        for <linux-tegra@vger.kernel.org>; Mon, 07 Sep 2026 10:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788802399; x=1789407199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QHpQ550r1xJVd5hJxlbP/ggPyAbrP04jIcC0YlMdAkE=;
        b=OI4wkkc9LuVD+9DrgRdmAtVXdHQVFWVqsse8Ujbf6hcia+/sEbzsfJ6PgZLk9riU/7
         6FzNtWgFBJCHHTownuGi8reEOKrQdx0u+om3mguaADdlDnTkrkEU483ySTOWpzlmsKou
         1ZV5rtO5U/ZpQX+qyIiPgEsDBQCCsGpG7OUNR+9lxWKWyMsSi7h/dB8XrjNqszD+JrH6
         gn3FuDYWlIloCpACgHdu7eJZsfkZhPaVYF7pX5EytUKzjxWo9MZoz7gncN/NxGPX4ltm
         6eB8XkYMopcg1qkP61oTwbrXA5PySSqHdvxwinzMR++dbvuNO2DybEvU32hXas3SQ198
         XwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788802399; x=1789407199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHpQ550r1xJVd5hJxlbP/ggPyAbrP04jIcC0YlMdAkE=;
        b=IQBpL57FV6MQB0mHahUaWSggolvosmdwWqbUb7bvBfRH/Efm5v0kKwUNdma6FecBAB
         i5hmRcbno7K0IRkSdBU4WgoPlHlZoOHpjHDj+A544OciEitU15iLPbI07JdRzOmE6XuS
         BxDirRRV8d1ew0BCSnmENkh3R2qHwDxhhXKCceqIoriE9mDR7zwrgnmg7sRDZZZdqXnc
         EobL5xlVFQ6xHKhpacO7OCmTaOFgRq2beyyutRXnzG2EOXYFHRiTPGYVvnC1nCkpPrQ2
         UtomUnolyJngLlZe/by6h+rWwM77OsqTH3zaVSrDBwkxVDGQBnxOSLXGMOxXi+eIvEVZ
         moDA==
X-Forwarded-Encrypted: i=1; AKwUvByPiemPabSjcfY/4Y4YDkn58oCtvfLeL//IJykr8FGO6+zEZc7UZnswO/Y0VZkFi6L0uhy53l80MSxZYA==@vger.kernel.org
X-Gm-Message-State: AFuF++l7EJGn+sco/UHiCxFGXMq4Xd6K34pp2VrmyMzISol/uHV2dKXJ
	1ofqCr6xTh7KCLYA8MJFxPl2+p7bEFYGedtB8D0umDmfS8oparfvxBnS
X-Gm-Gg: AYBFou1ua9HMPoOJq0zSEsTAxcD7sYQO0qYjSbrdTmSniHApbSn+hmkYEV81SbTNN/R
	Hp7E6jk3enUEU/4NYG100Hhgp686LxccPtDDUyeherr/GZO65bs3DLCNfjYIN/VpR83y8xR382W
	jQq8PIoxR7A4+62M/PXKEzzRxll28fg53fY1CoHo4ucPYIOXDKPVprLUzcaJOgIgFEZOAkATPGI
	XRZ+V5jA1+CXrDo7KaQiuqcOfyACUtn5AUg1WOiwSzfSrr5mA8NQYXd7I3yYnCG0PUZ0rHleEwe
	p9gDcsHubawjGFua5UPyY23cdK7izU2OMUXAs0DYIsRiq3xgPLIVXZgMT+4PGizwPi6MBLrmyGJ
	5K2J88iWh0JyhtC4syCJNz7szJ7C5ukLgbQxUcBWYQAw1RXOVYu0B8BXDlzoCZjqA/dEBsL1aIa
	55EZlzEhGjv//4Pup65F6vwes1L1Kqp5xBbZi696Jbd/kCGshWIFA4Ys1Bt9mccKvE
X-Received: by 2002:a17:90b:4c86:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39b25f78ab8mr34395694a91.0.1788802399187;
        Mon, 07 Sep 2026 10:33:19 -0700 (PDT)
Received: from G15-5520 ([103.246.195.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm33581587c88.15.2026.09.07.10.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 10:33:18 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org (open list:TEGRA VIDEO DRIVER),
	linux-tegra@vger.kernel.org (open list:TEGRA VIDEO DRIVER),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] staging: media: tegra-video: use BIT() macro instead of bitwise shift
Date: Mon,  7 Sep 2026 17:33:02 +0000
Message-ID: <20260907173302.23053-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the remaining instances of (1 << X) with BIT(X) to follow the
kernel coding style guidelines.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index eb1fc5b7e2cd..2586a137d9da 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -177,15 +177,15 @@ enum tegra_vi_out {
 #define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
 #define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
 #define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
-#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
+#define       CSI_PP_PAD_FRAME_PAD1S			BIT(28)
 #define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
 #define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
 #define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
-#define       CSI_PP_PAD_SHORT_LINE_PAD1S		(1 << 24)
+#define       CSI_PP_PAD_SHORT_LINE_PAD1S		BIT(24)
 #define       CSI_PP_PAD_SHORT_LINE_NOPAD		(2 << 24)
 #define       CSI_PP_EMBEDDED_DATA_EMBEDDED		BIT(20)
 #define       CSI_PP_OUTPUT_FORMAT_ARBITRARY		(0 << 16)
-#define       CSI_PP_OUTPUT_FORMAT_PIXEL		(1 << 16)
+#define       CSI_PP_OUTPUT_FORMAT_PIXEL		BIT(16)
 #define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP		(2 << 16)
 #define       CSI_PP_OUTPUT_FORMAT_STORE		(3 << 16)
 #define       CSI_PP_VIRTUAL_CHANNEL_ID(n)		(((n) - 1) << 14)
@@ -214,7 +214,7 @@ enum tegra_vi_out {
 #define       CSI_A_PHY_CIL_DISABLE			0x2
 #define       CSI_A_PHY_CIL_ENABLE_MASK			0x3
 #define       CSI_B_PHY_CIL_NOP				(0x0 << 16)
-#define       CSI_B_PHY_CIL_ENABLE			(0x1 << 16)
+#define       CSI_B_PHY_CIL_ENABLE			BIT(16)
 #define       CSI_B_PHY_CIL_DISABLE			(0x2 << 16)
 #define       CSI_B_PHY_CIL_ENABLE_MASK			(0x3 << 16)
 #define TEGRA_CSI_PHY_CIL_CONTROL0(n)			(0x006c + (n) * 4)
-- 
2.53.0

