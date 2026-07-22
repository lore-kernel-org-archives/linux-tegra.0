Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DDC3D9DC1
	for <linux-tegra@vger.kernel.org>; Wed, 22 Jul 2026 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734978; cv=none; b=Hq+Erj3MYC1nGjuXOcE9f898Cz59vfptl4q2HJb6Az3CmtG43JGKmBg1NEg3bdXOEk9KAFsLafM1NXc4pVbnHLeBk7ZBxLhkes4BXkV1O17Lk1MD1Uoa1wG/j63NEgp/n7HB6dP1N5zLer7q8xMmxZiAT9NcJrxUlUGl2zarQ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734978; c=relaxed/simple;
	bh=6U37pSBUsFqGwWSczzhAZcH+3PB93yJspCigulFbK00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVw8QGLFiiJG06n5DoruksuRpXECZATXQN1XJn2SwHhVv1jxRX56WeNLKzWeyiktR9p5EnJw5XFQxdJa6jOvJHJnIPxtkg1ix/LjlrdaA+cEFxa0NSTGVoRyBhI3yEMIt3sfFGuhfhVEHMyOP8SMQsLD2HZ/j0K6y4s2pgQLCTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3tJv3H3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3tJv3H3"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-471eeac43bfso11935440f8f.3
        for <linux-tegra@vger.kernel.org>; Wed, 22 Jul 2026 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784734974; x=1785339774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtaD+wctm/flHKZdG+eEG/nGmQRGwK75GvDz6KLeZjc=;
        b=H3tJv3H3ptii/nnWwqTf7XoBCV6LvEJDaHwS5us7wjVT3xHdYaDXrRyL7iKL8oaSMX
         Ere4hvxiARb7cVSV6PAwPkBZJTu3LEDVs205kmBLPdwz/aeRTrGGKZjZ/vjZFnxFX6i8
         mFlVyMHG++2xOSgBvjT6WEir0X3FYFS9D9a9CBKApQ2CpTWBh0oPeIflp9JxV/Bill2t
         GGtIL9YTsJC0e9HOwqmxRYrn18YT/WK33C94ogr8AudomINKYlT3LLQmbpFs3Xytr7qK
         iQGB03n/OIX6xkPvm98utV4EYLnFNyKD7tSbvPn4g+05jcZWL2KPwF0LhDsl1Z+XwQuC
         95oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784734974; x=1785339774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtaD+wctm/flHKZdG+eEG/nGmQRGwK75GvDz6KLeZjc=;
        b=mkslADozL7GeDrthzh0dgErQYBVklF6DHmHICQycZyb5/5FRcubKcAG8Hdz+DSsSV1
         gHh0nvvjxMNHhaxXAakbbUDQAI8m625qEt+iuqXOrDRFHMcDLsCGhX8PdP2Qfeyfr52A
         rt5D9U4CG4AxIzeWq/SBhIY/SmtoIOrwAhsFPkJ7zkAV5esW6ZagjI91sFhmCvtpRkVn
         0kArqh+Djgibp27RUCb2e8GObS6POVOCwojWKhktmmNFxR5TiMB6Jz8Q5eO8uPz7poWk
         zZmlIIAmZ2gWSMS/mtQX38VXs26Lyp8pbJfqa/5qaaPeNXvmk/QXFTo6zi+WPAujS49Z
         bbog==
X-Forwarded-Encrypted: i=1; AHgh+Rpb1ZWrosuhsV4c9l/qU499Dvaac9G1/lj9OlQepwQVJttUpBeSNfL2UimEoVjnzzmJIpQ3iIjMrsrvcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0V7I4Nz8rDfnE8qXbZlgEv0e1rvsI9bWQEYTifaU7AzRwjp/e
	ob3CuhEIeSvslUP2ZSnccgkW+HGfCh9PK/0GqV9+HSIT5MbmR7KIokDB
X-Gm-Gg: AR+sD10TL0PeslsSuIADZCpCqgtA4HQ/eZZ4PRXgc955qi7YK70khbmIbh4jHl7ye7h
	eRFYu6/edgKZ5rzzxGBMppTGFjXvdnhXfLV2nWNGModPCy2tcSpOA7PE6flm2WfrSBI5fD1x/DV
	aRjY2Xck2+jPAygxCYA39VhzCHDm4ZqyuzP4uBcM9fZGoP3VFyZBZhS9R3fL2EVIImll4HKx5Go
	T90C2znoUKcWPzsn9D5PozPTNG01j0yt4vijUNPJGVBF+MdukUcpG2Leimw26x6CUSif1uAiduT
	lvyPl++QbxmDhRidUKkRtlLsxAS0Hh6GFnBbJEckyWRCKQBBDARry6mMcawAcFuVcUExTVbYM+E
	8FRIru2olyfKVgqnCpeHvF0hL/7gxbvDfNmCa1fz605NHgYmrdUr6jzF4MjgB1JyAkHLJBL/oFy
	cOQ0o=
X-Received: by 2002:a05:6000:41eb:b0:475:c946:36c5 with SMTP id ffacd0b85a97d-47f622fce56mr30653466f8f.9.1784734973852;
        Wed, 22 Jul 2026 08:42:53 -0700 (PDT)
Received: from ubuntu ([103.196.162.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm6889489f8f.18.2026.07.22.08.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:42:53 -0700 (PDT)
From: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>
Subject: [PATCH] media: tegra-video: Use BIT macro in tegra20.c
Date: Wed, 22 Jul 2026 20:40:55 +0500
Message-ID: <20260722154055.385164-1-mukhtarfaisal03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings by replacing explicit
bit shift (1 << n) with the BIT macro, to better
adhere to the kernel coding style.

Signed-off-by: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb776..cdfd9f276d11 100644
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
-- 
2.53.0

