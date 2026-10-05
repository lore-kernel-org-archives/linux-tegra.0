Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB6D372049
	for <linux-tegra@vger.kernel.org>; Mon,  5 Oct 2026 06:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182815; cv=none; b=G6Xqu/r+u/TKX6J/glhfouJYmrPkHrVDP5dU/iKP/ATOtfT0W4kEsE+6BrmCB9dEuFv+iTLOxaSKxhg/ZKTWm6TCNxcoeIQ99UUsoz3HB3SAm8y4YceadhkQpumM+SXGrMqQsiq/NZvQmNt7MqpzZaBsspGegKbbKGmu6n92n/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182815; c=relaxed/simple;
	bh=pPxWjPgoC5ZIds9yfuD0Hb2xgEd3s6+PhvxvqEZ957Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i9yi8x42UwJAW+Rtdfia3t5jOpo02r/rrWgZGmFk4ExG3dntcJjVWRSelJYprekudfbjXToPvhsPWQrCROHmW6rVj4bhyi3weCuH84jDOuQedbKXRx2KUU4vz62FmlFpjprZm8hwTb4rpjtgxgcd+LbhW3ipMR2RHbpeCFGljGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbxG+bzT; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbxG+bzT"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a11603310fso12938985e9.1
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2026 23:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791182812; x=1791787612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14533aMWhAmVs8SNCRLlWVRuMICBt1zkdaHBPEpaQzs=;
        b=HbxG+bzTD+p+rn9qx7izKiqwLaK7HHFf5ZJq9kycITHZIq0dorjbM+urbpJWvZv4Wr
         bKe74GiBudMJhH5CYZaDBWQrtTCJzS3PC2+lkcrls3xpXTTWUQc5YOtwGNvGiZLyEqRk
         kNMRSYd3hIit+5Ecyf2nQBIiaKfco7OOQkaSXAlFrKx/JPEGCJsuljTkcsfSQ4+DgnGJ
         sv/ztOo5NZrW8who/qyaOiLnbbZLTfkuu4aQroGY4YN2eLm7IHNzf4TCKBgDGZl4ZMvI
         8Raz+AqCGqLJUktZCNIAQQ8a4E1Xht3vlDe8kvgPUj86thdjkzchBoa3ZTUXZGmfKVDW
         JZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182812; x=1791787612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=14533aMWhAmVs8SNCRLlWVRuMICBt1zkdaHBPEpaQzs=;
        b=ZcEk0/Wi47QqujDb9C6YmYBNCDEE8aWYUndTs75E2mByF+5fCrgtbBvPjpK0c0QrfV
         WSnj+7Bs1znKjH39sh5IE4Hm3enGSMF1aqBBhTHsgO/YSRgkpXBz8Nx+E1gkJiQYw3oB
         4mmwvkCTJdyuDUw9hHqnPIol0dN2KMyTehqEV1BZ4wYMMXvyezAaa36vADxUz7MULBDd
         BgHu4HsnynmykjwIIg8xEpZNLHvENYJ2gPEbOSPELZb472apZdH24QmEgSkiBu2HsGYs
         Dw9afqaClwtYwEHnIMTwKMgtb3nGH5iWhfZij73uFaUqesTOOa+WBae6cbIaRW1gHbCO
         n+xA==
X-Forwarded-Encrypted: i=1; AKwUvBwrvVSKuxk4v/gxvmF31fQmb+8a1UiV7cgNHrcAXEJhXP954hSZNOZCNG+E3Y8AIEB7veiq/9TQ4iQtGw==@vger.kernel.org
X-Gm-Message-State: AFuF++nLYH421HIfDXwSPB3Y6+u5ALppnjPuokpjWAf25DE0pQts1E1U
	EzFccGdC8c5+cr2+FG9/ffJTPbexdK0ibbmX+o4X4ax2W03ORwXkJYIa
X-Gm-Gg: AYBFou0Q3iW0pffzr8BCKISqxmHflWsM8It2pk1zoUEDA7H+ARfVIDERcvKPgZqOVPB
	mJSk7C6J9hJo+Xg9HSLYryV0obByUMuURvyqyLAKNOvxRDesxPxri1UgoMqSDUWSHehiCc3RYO7
	BDDhr5UYWiMSyq+50y5SkN+e3lYlmPja8XPqJBbH2MalB71Nn5TqPnPfLX3z9ov23UZ0cmsW98E
	EWNqRFk/FlrWq3D5FHWBez5YJsx5dnG9VFQ9f7yYaVOIjnn8aKc0LvN8rsWmoVnKB0d7Gj7g/wx
	ifFK9ubXP8Wr6X/Q1c6J4SMdp2VDHaUN0rD8kEzK84+c/cCG21blBrBsyVo5MLXMGAFvDy/EkQV
	EkSI9VJ81jySokJJN2hQOIvbLnAkMjiODH9US887qXwh1RI/JJ1KmL9cgjs4+mAfUiNRyHpIp00
	8Y7nwKlGzDX2Fh7t8yiXTH9llzmH0mYibyZU9kiCRs06YsFZw1VrdlSDfATVOsLsOu72JVKtVwK
	dqwWrZ0ZZxLyNC2r3gMHCpstsAV1wk7vyOE9Sreyy+2nkvF5REOFOCvCHUHFk30tXGZ/xL836jT
	JDA0F++Uq+nkEMc6lHNvKuMz2BKTHggLC5aHR5mUaqFDc9HVr9ngyCiiVyp1g5t2LDh0vtbLR/U
	xL75bOcTHZ0ZZ
X-Received: by 2002:a05:600d:82e4:b0:4a1:71af:cbc7 with SMTP id 5b1f17b1804b1-4a171bc2193mr44005545e9.13.1791182811349;
        Sun, 04 Oct 2026 23:46:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm315273615e9.14.2026.10.04.23.46.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 23:46:49 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Russell King <linux@armlinux.org.uk>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/armada: set an unlimited DMA segment size
Date: Mon,  5 Oct 2026 08:46:39 +0200
Message-Id: <20261005064640.7776-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261005064640.7776-1-kmehltretter@gmail.com>
References: <20261005064640.7776-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver never sets a maximum DMA segment size, so the device claims
the 64 KiB default. With DMA_API_DEBUG, importing a larger contiguous
dma-buf reports:

  DMA-API: armada-drm armada-drm: mapping sg segment longer than
  device claims to support [len=1228800] [max=65536]

armada_gem_map_import() also needs the buffer as one entry. An exporter
that respects the 64 KiB claim has to split a larger buffer, and the
import fails with "dma_buf_map_attachment() returned an (unsupported)
scattered list".

Set the maximum segment size to UINT_MAX.

Verified with a QEMU stub. Not tested on real hardware.

Fixes: 96f60e37dc66 ("DRM: Armada: Add Armada DRM driver")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Tested on v7.3-rc4-70-gfe2ec83746e5 with DMA_API_DEBUG on QEMU's
    xilinx-zynq-a9. The LCD controller probed from a stub device tree
    node, so all registers read 0. A test module registered the
    armada-drm platform device, because nothing in mainline registers it.
    
    Creating a framebuffer from an imported 1228800-byte CMA heap buffer
    works before and after this patch, with one segment-length report
    before and none after. With patch 3 alone it fails. With patches 2
    and 3 it works.

 drivers/gpu/drm/armada/armada_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index cae25ad66c74..42498fc77e54 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -6,6 +6,7 @@
 #include <linux/aperture.h>
 #include <linux/clk.h>
 #include <linux/component.h>
+#include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -101,6 +102,8 @@ static int armada_drm_bind(struct device *dev)
 
 	dev_set_drvdata(dev, &priv->drm);
 
+	dma_set_max_seg_size(dev, UINT_MAX);
+
 	/* Mode setting support */
 	drm_mode_config_init(&priv->drm);
 	priv->drm.mode_config.min_width = 320;
-- 
2.53.0

