Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795740954;
	b=vV/Pah6OBChUHiqPiCF0mvNYCTwdFgoYDxkSJZS6qoPoVpO0LXc55QkxUEy4A7H2DyY9
	 /QZimeYWzxk1U5w3VuPrkNhbNdNik/rOhVKnJI0j8crR9am7zJ5wYpaX6HaMXWJIeF+s2
	 XLjsCgJx72QrO1XmbUjQCLLR5qBRbOE8Xtgqam/mvYJxdDVkA2VdNezTBHgSfkVnI9+E7
	 BHyybuHcQ2+YLufMn2XvoPam+srBbQih1fNpJWrsINlaiiZzAIHt2I1dr7Ziu1KD7OrX0
	 +UpgidQdP2je4MeiPv+RAMIJy8iO3I8GnKC8rU5gscYXZRSlqlGe/nxRvg/gh8d9WXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795740954;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XsmXW8XZm98a/5UJwUoj7Y3j1IjRr8YznN7W41QyG44=;
	b=JOEWj8IGe+/WeBqucuLOqLtKd9roICDoZS+RUZK/k8upFCkm7Wx0RrfRYd4uTond+48l
	 1r1pLveJIW80CGNrKOFAc2m2R+oNeRk3CGx2wo0+u36z9Yb+7hrr7lVleXy7omQPma1Yx
	 0r3yOgZsPyGbs5a9BWuiDG6A2k/4mo+y20DQQLUVoJl8eIGxFJrPWNJpeGvWFek/UDIYO
	 Oht3iMh59kdFnk054aY0tbpRiFmoORa4XkOeDl8as+3pU+HlUlDxdKcxjy6kLNLaRGbzo
	 EIrCwXMPfVmM/wnx0uyCLvojzl3Fq++Vw2zwAUFckLAvFFhBwl0U2t/fxbfBoGaKEaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ncyFGGWX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C7B606A321;
	Fri, 27 Nov 2026 00:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ncyFGGWX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795740953;
	b=mspgwFsYGsEgP9qn+Whl7rD5nJ2fhkINK8Q193zwhDcdpZlIUU9Td4uaximej73C3sdC
	 RTLMnZvFYsVV7z2B75pajKqQqX2x36/WQHroVsZuw9W+LGptW8dv7cDGELijWoU7Th9jL
	 LxjHAQNPoDCK8SV49MP19PEzZhyNWZR4xq5wM3ebUS+Qka/WnYhMk6jmNxqD14CQRKAl9
	 /r52JtIsZU3yf8srt8FA0oX80X6ka8OM5gMjcOVCCJ4+jF4dLCNKNLrD5K5z5Edm1AwEg
	 Os1+yBE2sNZgvQoVQq/cxNFi0fmeYrI0Fap4BqJ/Biw45MaVIA+YuzBVpssnvJvlSmQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795740953;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XsmXW8XZm98a/5UJwUoj7Y3j1IjRr8YznN7W41QyG44=;
	b=zq/sSuiSlkFv0h3ziWNDZlG3pJl1zbW0ebNv1ipzQdnP2k5ZG0FaFh9sL/foKAILnUqX
	 jIiQUxifmVLMtCGI80ClxkxaWyd45ojyjTVSvHZopmHbTO4gMPjE0MI7nVV7eZx6aAk8I
	 xH1ryrfsjFYkriFg6bLrddLVrAoBLmCaYSQU/FBIC5AvlonSSBaMVnMc+YlQMXlAvqcRT
	 uhBlbaJaLWW01hRtsLIqRJCEuDY6d44KKjVVBtW4EzV/2V7E76JHXD5Or9cyQilNzT1a3
	 /794L2Y8dL4uADVGJcd21VDK2voePaOHh6et0JxjXqzxm4VkHB2jMqErCgP+CYZGuCg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2BB601F00897;
	Fri, 27 Nov 2026 00:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795740953;
	bh=XsmXW8XZm98a/5UJwUoj7Y3j1IjRr8YznN7W41QyG44=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ncyFGGWXdPI98Nw0TkEukK5xNXlQPZKuf728Kd2m4sLw2nrUMEEvXkC4kypy/JULL
	 t9cdDO9CfAUIBUuaNKZSZsno0igYAjOK8JNvTzuWWOd9zpVDOzZCDdFOpJ4up4K0qY
	 8RFyyoQSNDebiKDBQJO/EelmmfeyzzqIBioQZzq5hZ5M6JGgU1F/l0RV5rE1JMG/js
	 3ocTc9i94rZp4usqYVw/+XcSk4fNu7Y6oxXsGCRx/14JTaWJklivRPFgFr5wmVXdZU
	 dO9H8f14AA3ahcfqlD5aOdPJfCxKxU2JQdHLRyxEr3Ctzyy5gUPQ6Dki3SRZrA6PZp
	 /tLNaqg2cedyA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AD0184B4B1;
	Fri, 27 Nov 2026 00:55:48 +0000 (UTC)
From: Jerome Berclaz via B4 Relay <devnull+jerome.berclaz.proton.me@kernel.org>
Date: Thu, 26 Nov 2026 16:55:45 -0800
Subject: [PATCH 1/4] media: tegra-vde: size the bitstream buffer from the
 frame size
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
Message-Id: <20261126-tegra-vde-fixes-v1-1-fa4a7c1d24cc@proton.me>
References: <20261126-tegra-vde-fixes-v1-0-fa4a7c1d24cc@proton.me>
In-Reply-To: <20261126-tegra-vde-fixes-v1-0-fa4a7c1d24cc@proton.me>
To: Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Berclaz <jerome.berclaz@proton.me>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2227;
 i=jerome.berclaz@proton.me; s=2026-11; h=from:subject:message-id;
 bh=of+v03Cai+sc1Z1OBE6gFSTjg74YDAkDoxW4asgwOx4=;
 b=owGbwMvMwCVmvC9341tRgSLG02pJDNkcV4UeLUtdzHLyAV+H5FRLx3mKMwTSNou+vOnvLTvL8
 jBf5Aq+jlIWBjEuBlkxRRbWBsPU+SfYAgr15x2CmcPKBDKEgYtTACayjZmRYfdCjh9fFDg3zbz2
 Zs/nj1L5omvTblXPfm9kaL5Ca2FOWCjDP+Xj0YmSnJ1XJxhUGdX8O/ik8XkPw1tnxucKBoKPPt+
 czAQA
X-Developer-Key: i=jerome.berclaz@proton.me; a=openpgp;
 fpr=058031659FC80650712F9EC233BE6DB1ED151072
X-Endpoint-Received: by B4 Relay for jerome.berclaz@proton.me/2026-11 with
 auth_id=1658
X-Original-From: Jerome Berclaz <jerome.berclaz@proton.me>
Reply-To: jerome.berclaz@proton.me
Content-Transfer-Encoding: 7bit

From: Jerome Berclaz <jerome.berclaz@proton.me>

tegra_try_coded_fmt() makes every bitstream (OUTPUT) buffer at least 2 MiB.
When the decoder sits behind the SMMU, the buffers use vb2_dma_sg_memops,
i.e. cached pages, and videobuf2 cleans the whole plane for every queued
buffer (once in dma_buf_end_cpu_access() when user space has written the
slice data, once more in __buf_prepare()). With 2 MiB per buffer that is
about 4 MiB of cache maintenance per decoded frame, although a 720p frame
is typically well below 200 KiB.

Use three quarters of a raw 4:2:0 frame as the default minimum instead
(704 KiB at 1280x720, 1.5 MiB at 1920x1080), still aligned to
SXE_BUFFER and never below 256 KiB. User space can still ask for more.

Measured on a Microsoft Surface RT (Tegra 30) with GStreamer
v4l2slh264dec on a 720p Constrained Baseline file: the v7/l2c210 clean
and invalidate functions in the decoding thread were about 21% of all CPU
samples before the change.

Signed-off-by: Jerome Berclaz <jerome.berclaz@proton.me>
---
 drivers/media/platform/nvidia/tegra-vde/v4l2.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/v4l2.c b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
index f2ca1c7ed9ba..9fe31b5c0275 100644
--- a/drivers/media/platform/nvidia/tegra-vde/v4l2.c
+++ b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
@@ -635,6 +635,7 @@ static int tegra_try_coded_fmt(struct file *file, void *priv,
 	const struct tegra_vde_soc *soc = ctx->vde->soc;
 	int size = pix_mp->plane_fmt[0].sizeimage;
 	const struct tegra_coded_fmt_desc *desc;
+	unsigned int min_size;
 
 	desc = tegra_find_coded_fmt_desc(ctx, pix_mp->pixelformat);
 	if (!desc) {
@@ -646,7 +647,11 @@ static int tegra_try_coded_fmt(struct file *file, void *priv,
 				       &pix_mp->height,
 				       &desc->frmsize);
 
-	pix_mp->plane_fmt[0].sizeimage = max(ALIGN(size, SXE_BUFFER), SZ_2M);
+	min_size = ALIGN(pix_mp->width * pix_mp->height * 3 / 4, SXE_BUFFER);
+	min_size = max_t(unsigned int, min_size, SZ_256K);
+
+	pix_mp->plane_fmt[0].sizeimage =
+		max_t(unsigned int, ALIGN(size, SXE_BUFFER), min_size);
 	pix_mp->field = V4L2_FIELD_NONE;
 	pix_mp->num_planes = 1;
 

-- 
2.53.0


