Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795740960;
	b=Lts7A9Mol7e4DBh6rR4oIBPPHdXdk4euTG+5ElgcA6RP1WuIUtHx88d0vMgu/q+MilFK
	 jjBc3BdPVbeUBNCEXZq8RaudRMfNMncpszf5EKsRorLqHE0pGpWGen1fcNwzl7IIPh0zl
	 J5TFHHeRyIWp2IaPoHl3lCOOIbKCx1uSn339mTLHFGl8ov4QPfTZiYC961STylPSNh5zO
	 D0JQ/Mnj+VKTsWN1w4yul+AENdSibbL8hVz+kdV2gD1+ZNRw5Ts3G3XJCmr3KbxkWUwbP
	 WGG5tkjMXXxw0zFrFqF/cIIY9ibwX7DXpfabvYwa4H/6FkzunEiRLI4Y88KQpbteYrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795740960;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9XA3445m8+tNNRZK8Nd0qW5WXJwwG/faDJjEMBIgMJA=;
	b=B49EKBmOZKZJHPpftFwV8R1pG9EogxiAf2Dxm8Qv5F4RMDUrULnV3HK1DWCqHyOCuv0Z
	 2cOyo1oDeFhmU26kKJ1+ssv5T4mE/97/uTZE2tFM4DXaAoStKbHdk5ImNJptM68CSAtgk
	 u076y8dQbAqA2pLUksP9SVFJ+YyVYVH5NBkg5dyCNMeLlmdD0YXxAYce8MN86dQ0qgCVa
	 Qr4wrEHqBm3qS7RCuH/Wb6eYZ3vGYyakTKJw639AH9WAL0AQyYscG1Rj94mlapeoEGxeV
	 gX4AnDQ72fizPq36AJ6CE38wuU5w1vqFE/fhziAKxHIoYMDbCYdKtd7pkZlCNokVuyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UZiWV4d3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D274A606A324;
	Fri, 27 Nov 2026 00:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UZiWV4d3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795740960;
	b=HmV/6FJZZVMhmK8G1mciRwzfM1vuMEJ4pgOdXZ8saf1FsZR4up35mb8ylE726CiASLZT
	 i6iWIdSO8LSTmPSDDeQhQ22HGgOHFbxfBYRXqfQUCUcSE6SSdv1jhULhmFuztoP5E/bNk
	 iVURl54FOigNhfSPZ84aXtFWox/Jl/2og9i15mtX9rrTxskZJwXpt7BLaz7N4VFcl4Y3j
	 QRM9P6Ih6ApBasq+VcXTuR6Sa4eOIMLxR4I9vLBT6FFTRksTh3shy5hpqOlpH1yZ6rqOy
	 QzDaalsvN+UBEZ8vnd65q/2cEFQDy3Nx1W80au1rjV3OthIocRiCBpb6H1nVVcjABhA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795740960;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9XA3445m8+tNNRZK8Nd0qW5WXJwwG/faDJjEMBIgMJA=;
	b=GKQtK7lS5lSUHa8HDDj07CoPWYS4X9M61xhtJbffU3rlKBD9mkSqMnBrHDdUfvlEjbjb
	 z9DxHfbw+fmo4Cl4NcB2UOuyQMtAKHrlV6BrhADkHCGgtA5iQ3PL0l6bOOf85IZm71YDk
	 S3xRmBOyIOYn/31xJHPn+l+da1cfCdRivmXZr06e0KbIZEntsEqgpowRgNN0UG70udgGS
	 ac+hyUsGyHDMazAwOR1fXbZA/Wis4lSJS23PE+m45e6UGP5jrQwpcmrkFlT6gGgef0VlN
	 CQHEZkAvhfT3wlOZ8VwCGDUbcaz0cc/VVcauQUSaJcUVIMMc2j0kabokWN3dPurAaAg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66A3D1F00899;
	Fri, 27 Nov 2026 00:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795740960;
	bh=9XA3445m8+tNNRZK8Nd0qW5WXJwwG/faDJjEMBIgMJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UZiWV4d3h+eZt0E+/xf+f+1JUtQOA/1WRjCSG7V1IoMw0TDHB8a9qrDDYQkT4MFzJ
	 v9buNepsG3zxfDvDbctn+BKEH2M4/rzMr3tzuHHEiPG3ck00n8v5AoUFqeCMvMI2vo
	 G18kHP8zOCQhmPA4gdnM9eaqQFAxfX1D3lCoOxMyKb1stOXZvvioli4AMB1TTimMvR
	 GfX682l9PmAEMlVIF4HkUCJ3XTMyxSucMUkhdRAJV0wF3FEKfJzZAMyJHjBX6lYF2S
	 oPzwyoFvBw3c93vHlehlI50aFf2MvxM3xYhzrymm8xUsxszQHKwLfykdSGf/mrbQZk
	 xF6PB7xn+h+Xw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E8E634B4BC;
	Fri, 27 Nov 2026 00:55:48 +0000 (UTC)
From: Jerome Berclaz via B4 Relay <devnull+jerome.berclaz.proton.me@kernel.org>
Date: Thu, 26 Nov 2026 16:55:47 -0800
Subject: [PATCH 3/4] media: tegra-vde: clean only the used part of the
 bitstream buffer
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-tegra-vde-fixes-v1-3-fa4a7c1d24cc@proton.me>
References: <20261126-tegra-vde-fixes-v1-0-fa4a7c1d24cc@proton.me>
In-Reply-To: <20261126-tegra-vde-fixes-v1-0-fa4a7c1d24cc@proton.me>
To: Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Berclaz <jerome.berclaz@proton.me>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2968;
 i=jerome.berclaz@proton.me; s=2026-11; h=from:subject:message-id;
 bh=rI4bjGiLaIB/dHE/FaYnR9GQxHnftZtGARPOU0E1YCI=;
 b=owGbwMvMwCVmvC9341tRgSLG02pJDNkcV4V/Rd0O/F/wautk1ydMOXbaby9t+9PbE/Ihevr/T
 K6X/7fVdZSyMIhxMciKKbKwNhimzj/BFlCoP+8QzBxWJpAhDFycAjCR4COMDF1/1h5/8+aECuOb
 78x22a4MMbtlG1ZcMDqX9CaCf8l6g+uMDCcFrUsvGDDqO8Ttmuq1tGyjV5L8og7d3RtvKrucrxP
 4yg0A
X-Developer-Key: i=jerome.berclaz@proton.me; a=openpgp;
 fpr=058031659FC80650712F9EC233BE6DB1ED151072
X-Endpoint-Received: by B4 Relay for jerome.berclaz@proton.me/2026-11 with
 auth_id=1658
X-Original-From: Jerome Berclaz <jerome.berclaz@proton.me>
Reply-To: jerome.berclaz@proton.me
Content-Transfer-Encoding: 7bit

From: Jerome Berclaz <jerome.berclaz@proton.me>

When the decoder sits behind the SMMU, buffers use vb2_dma_sg_memops,
i.e. cached pages, and vb2 cleans the whole bitstream (OUTPUT) buffer
from the CPU caches on every QBUF. FFmpeg's V4L2 request decoder makes
these buffers width * height * 3 / 2 bytes, 1.4 MB at 720p, while a coded
frame is usually a few KB, so most of that work is wasted: it was the
largest remaining kernel cost of hardware H.264 playback on a Tegra30.

The hardware only reads the coded data and the zero padding that
tegra_buf_prepare() writes after it. Clean that range from
tegra_buf_prepare() and let vb2 skip its whole-buffer sync. OUTPUT
buffers are never synced for the CPU on DQBUF already (DMA_TO_DEVICE).

Signed-off-by: Jerome Berclaz <jerome.berclaz@proton.me>
---
 drivers/media/platform/nvidia/tegra-vde/v4l2.c | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/platform/nvidia/tegra-vde/v4l2.c b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
index cd25307ad9db..3269ca75593f 100644
--- a/drivers/media/platform/nvidia/tegra-vde/v4l2.c
+++ b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
@@ -12,6 +12,7 @@
  * Copyright (C) 2019 Boris Brezillon <boris.brezillon@collabora.com>
  */
 
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/slab.h>
 
@@ -214,6 +215,30 @@ static void tegra_buf_cleanup(struct vb2_buffer *vb)
 	__tegra_buf_cleanup(vb, vb->num_planes);
 }
 
+/*
+ * With the SMMU the buffers are cached pages (vb2_dma_sg), and vb2 would
+ * clean the whole bitstream buffer on every QBUF, although the hardware
+ * only reads the coded data and its padding. Clean just that range.
+ */
+static void tegra_sync_coded_data(struct vb2_buffer *vb, unsigned int plane,
+				  size_t size)
+{
+	struct device *dev = vb->vb2_queue->dev;
+	struct sg_table *sgt = vb2_dma_sg_plane_desc(vb, plane);
+	struct scatterlist *sg;
+	unsigned int i;
+
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		size_t len = min_t(size_t, sg_dma_len(sg), size);
+
+		dma_sync_single_for_device(dev, sg_dma_address(sg), len,
+					   DMA_TO_DEVICE);
+		size -= len;
+		if (!size)
+			break;
+	}
+}
+
 static int tegra_buf_prepare(struct vb2_buffer *vb)
 {
 	struct vb2_queue *vq = vb->vb2_queue;
@@ -264,11 +289,19 @@ static int tegra_buf_prepare(struct vb2_buffer *vb)
 			if (vb_data)
 				memset(vb_data + offset + size, 0,
 				       hw_size - offset - size);
+
+			if (ctx->vde->domain && vb->memory == VB2_MEMORY_MMAP)
+				tegra_sync_coded_data(vb, i, hw_size);
 		}
 
 		tb->dma_addr[i] = tb->dma_base[i] + offset;
 	}
 
+	/* the range in use was synced above, skip vb2's whole-buffer sync */
+	if (V4L2_TYPE_IS_OUTPUT(vq->type) && ctx->vde->domain &&
+	    vb->memory == VB2_MEMORY_MMAP)
+		vb->skip_cache_sync_on_prepare = 1;
+
 	switch (pixfmt->pixelformat) {
 	case V4L2_PIX_FMT_YVU420M:
 		swap(tb->dma_addr[1], tb->dma_addr[2]);

-- 
2.53.0


