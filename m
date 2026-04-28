Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7999E7404E
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 16:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394007; cv=none; b=eA3IVpQNn6g+bXabUOtevx7U6CFB2q6TS0ECU6JIukI48B2M5BIC5caod+GJ8XToDEMHzEMprEKmYZVrUHXybCh3dA9+0FoytG5Xo3VLyihZOz7a3TQqzxX3NwqK6S38dZP3llm7dOW6pus/AdajBj9ca1YW8zzgk8KBo7VSfOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394007; c=relaxed/simple;
	bh=WDH6pRA7EbpkJTMzOV6Go8ZWNnndc9bdckcBY8wTY3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a2FLuGSJwJdedz9oWzVKRjXVgtH1+x+a91lm3MKc3rvjdsoO7LBM0BZCBcff7Z+FHF027Y4NPOUsc97bZKIjUmzlYWEZ3vEXwnjzKbk7yaLuNz9SrrqDsyeb3toSk//NyElzTz/jGN9Fv01Y+exGky+ZIqrF6p7Am8WbyhC9YRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCJBPJ9h; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCJBPJ9h"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-40946982a78so4268458fac.2
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 09:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777394005; x=1777998805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wboe/aXKnnq5f84y1la/d9ohgX40/EwE5yX2y+CnoIE=;
        b=QCJBPJ9heJ8V5fnaMNy6r1JltVRJVSd/0xDBxX6+m3IC9Jzz2JztudW3FM764iRg45
         E8Qcuq77FH/fnQBeSPS/GdAZGuzu7FECLiu6gWJRvtK/R8+7wVXWizPsJSuZiV5Z/wT0
         9jlFbeUU7IumL0kSSyBI98v5Pr2xPnwPtH1qOxWXlc40tWz4jbWB5NemY1am9Qoc48bl
         5A+rQKc6V8R2cxm0okiBMV4nXbAGyxLCYyADIvNeueSvteha92B0AdL18C3/naQsO0zu
         KBS+EqJFRrLSqWxKmX2YLy96sg+y9p42N8xaPMJSBdCVNnYY5Mv64LbnOqx/5szm1d3c
         RRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394005; x=1777998805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wboe/aXKnnq5f84y1la/d9ohgX40/EwE5yX2y+CnoIE=;
        b=USrp+KKso+DDJlRs/WiSzsRB5GryVG1lGedzHHH3tpFlo9eZzTTF1B8nsq70j/ywx/
         Jnf32bdnKWVB8Esey3onUHPdFVdSzaYM1HQG8lBW4u0cedfmf1V9BRcVxf84xgioxiI1
         8xpLQ7uspBP831OqoeAUa6v5DmCcrJ4EgSrafVSfUfrvhncdLGUgF/YzwPxPyK/7qMIy
         V8N1GtttwLM1rpzH+tdGl3vlJEO683SoojICq76fyz1O96RIKKoq0Fx1RUofWqz9aG69
         SQZyLjH9gtE3lxCLhwiZUsBBpif4Zoedz2PVfVro+bA5HLRPiZPO9Y1gkqXndU8AKDFF
         nkDA==
X-Forwarded-Encrypted: i=1; AFNElJ/M2Zfb/xMmEQrPJOpdjm+ObcVNuxy2liAC3ERdXkmCfCBLAld5QgWR5Zpbn9gJRe37Pa9LfrMrFGcUtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypB2Oa88r8/Wkas6gElRGopSxTwqVm1rYlBH3PGILtpfTizrCZ
	L4bHOO86gHCraXv+yKr4SHMK7Rie7/I43lOYGPV9uWjQy/kv/jow8uY=
X-Gm-Gg: AeBDiev2zx31sQG9QzJBtrDZjYNWtlZ7pYAVfsomc3vF+pemu3tD3Ih7jNWABtvkL3W
	5db+dwJeHL1AgXq3kq8gRJwnLJqMVzxyUHio7TGqpZ6xWQ6iovQludQ0t2iu3k3wBjf3TC6eIeo
	kDSDVlq1LQh3chKWPDAS8NcKAmCt82M2OOgpzbmi+BtnXdP0KxswGt5IqnhQWICUqZiJ5aQuCH8
	LEhOTNd58U080118tby7xIRentWxFqKP8OCGqfdT6gWmm6oOTl1hOQG6Q1NyGqisycqD7DAm6sa
	fPUve3In57+qki/X+Pgxa1+XTaD0E/oPqY4dnZkINLCIG9t+lQkfAbnQpi0A7voGf6+eWY+J8ft
	6tqZjEpPU0YcaMxWi9PNRryc/ne458PZe3vJAoEyt7fj0J/dXvrrmH7NW7XjCu/pnsoTRokeYjs
	I7NQrJdNa9rRmX+mKoU5AIh0ECQvkw8q00AVPQbM7CgxrqCxCjo0AY3TWoiv9W+ueCteCtZp3Mp
	hqPR3FvEiDCX9+6tbCm78EWrA4=
X-Received: by 2002:a05:6870:3233:b0:42f:e6c8:2ea8 with SMTP id 586e51a60fabf-433f37e6fb7mr2077151fac.6.1777394005428;
        Tue, 28 Apr 2026 09:33:25 -0700 (PDT)
Received: from MSI.hitronhub.home (24-40-252-177.fidnet.com. [24.40.252.177])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-433ef7d122esm2301556fac.0.2026.04.28.09.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 09:33:24 -0700 (PDT)
From: Mhanna112-code <marchanna111@gmail.com>
To: linux-staging@lists.linux.dev
Cc: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mhanna112-code <marchanna111@gmail.com>
Subject: [PATCH] staging: tegra-video: replace bit shifts with BIT() macro
Date: Tue, 28 Apr 2026 11:33:12 -0500
Message-ID: <20260428163312.7374-1-marchanna111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual bit shifts with the BIT() macro to follow kernel
coding style and improve readability.

Fixes the following checkpatch warning:

CHECK: Prefer using the BIT macro

Signed-off-by: Marc Hanna <marchanna111@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index eb1fc5b7e2cd..f3edca909684 100644
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
2.43.0

