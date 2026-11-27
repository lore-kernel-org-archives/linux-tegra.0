Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795740951;
	b=vCznzwjCXIqD5hHlt5voCcrWXVcLRLVHcCEM8g56eoAfyPHzfgehlbY8bIsfNidD4OQJ
	 g0Eju4N89EI9NV5rIXAfq/GPIFVIzXS6lZO3u7eNMT+uzQInpSaYGX4NN4TzMJ4tIVT5E
	 T9oOjEQ/WCWxjEf44+QxP2Q6sgddWnpO3Qp4wQthdfCUO/PRKA81oSnE74UXIeXR4eT7o
	 p+Zqs/j4CEhf5+RQB2ZKfXH2kyjNzEo753JF7sYdOEPZHmSnAnVIb14hBof1JBQwmzkiM
	 c8zrlY57MnHPKwQoSx3No3i3IaUFj5A0Nz7b5Ps2Omhi/darmR0nOta3lfzoZNcJPhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795740951;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=7R3zADHrwtjKcbUIuoEKMwqqxvOdiyKSPd1yGegyVyE=;
	b=J1RKqIc7OWp4f7nyLC7LAGwxOiLPTyQgOCq8EdyIk9V9i3CYcLpkjhSlXEr5Dr3s56Dw
	 yXHE6L2s4gxIYi5v+fevXLDcQkjxQlVCas6+y8repLYwKoxb5azQD7qOGoJwoabIPVYxd
	 HmrL9YZx41e3qisDJ7C8w4EJ2b7bTEV6eJP/Hanwg758cysCXAA3Ot7fNXQmGhpYcFAhx
	 eX7Aw87lBM7XoGCuI+hq6e33QFQb3R7+6ODfYHHTBPwVma8axpjFUCbIjuR+C8rAOAzq7
	 8UnjgbCboXuFcbUihUIs6mqaifQwMN8JKf3iUIilxe7nx10s059+eNjyaZQDJPgkgBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lpvsQaQG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13177606A31C;
	Fri, 27 Nov 2026 00:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lpvsQaQG
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795740950;
	b=oBF39AB9imANTF63PP0eNXkZ4Ohgwh/Qa9HDWXOIUnVrBmgI3sLnMNgKcFbdUow0QDcr
	 UZ0Y7jJhmOGN8bOe8/z34uY0fglUQiQVoLVlLqzU+C6SOvwTNeEEBFhHjSj00DFk8ZBhA
	 tMG24AEDcgO0gD9rK89y6jFhl07DkXGQrWEmU7remXTIKiV/hVTxp0sIHx0CfrqOaBcKg
	 F0kB5tyTKxWt7R1IhrIkBn2nZj3roRf64i4+G1vScKxXG/38TKRe/DbwoxCg47nsWkLtu
	 eNFYLCxPoRG7+Mrm6SMJzxNHu4Zz0fDFgMlkcczqXzp404niHoQZiz1s0c6v3u8KTGQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795740950;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=7R3zADHrwtjKcbUIuoEKMwqqxvOdiyKSPd1yGegyVyE=;
	b=HVEFh5NSpYNl9qxDfPJqdH4BRRsXOqBht+XTdFoi32seznRUu2Mrnq8xg9x/NpahyEp7
	 Xz87jUPz/iD+6h07/d1xOkI62PWmRS2Oj5sgjpxTMMD4mic6N3oN8sVfoK+mg8jT9S9Qp
	 v5vKxb2FCJCAfrLu0DRjhms+qlqTuS5yJL6Tpaqst3w5DeIzh2IEvOkmXo9JE3Y95MXsG
	 q7ApBwIxIQtKLrXulwIrrXsPRn125V/bnMmrEiMQZP60/5bj4RyaXRdS5Fito2UUgs9Te
	 CcXvsJSfDC00Mu0IqPoXy/Woh0fw4R01zEhn/c0mK8MsE5pQAp7dd7cSdtqlpyjCKMA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 010C61F000C1;
	Fri, 27 Nov 2026 00:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795740950;
	bh=7R3zADHrwtjKcbUIuoEKMwqqxvOdiyKSPd1yGegyVyE=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=lpvsQaQG+Hyr6UFSMu1kAkWu8xPbdVreohAEn19SjSEZzRq76IrWZu+FXrzIkjYmL
	 8yDepW+B6RrAfgygL2HzVHaJ6Cd579BJl5jvgTOiw+Yjzg6C8hjYWhnaCwT6lIve06
	 9qDhOqN3QhVZ4hidkkKrgxqkRAmXJcjlZLzGBM02V1SeV6CDBgJOlNUfPrYw5HZJLP
	 gG2HUp0W47sDl8ofHDJX6/QmvZjZjdWllmX606y91nLhN8low5FrbSwYeKjC0gZ2pL
	 f7H5CdBkpHDDF1IBMBvqduaWFcHhnieqcQeZaYoAUo+Oyd22swrFHufRcCYyNdTA+0
	 Wx0RUtpqChqgA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 874694B4B4;
	Fri, 27 Nov 2026 00:55:48 +0000 (UTC)
From: Jerome Berclaz via B4 Relay <devnull+jerome.berclaz.proton.me@kernel.org>
Subject: [PATCH 0/4] media: tegra-vde: less cache maintenance, reject CABAC
 early
Date: Thu, 26 Nov 2026 16:55:44 -0800
Message-Id: <20261126-tegra-vde-fixes-v1-0-fa4a7c1d24cc@proton.me>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5EQBCE4VeRPm8nZg6CV9k4MKppByvTViTi3
 Q2OXyp/HWSICqM6OyhiU9PfnOA+GYWxnQew9snkc1845wteMcSWtx4susNYBFWQvCo7KSlVS8Q
 zpOjbvLZ/NyGs9w2d5wWK5/AOcwAAAA==
X-Change-ID: 20261126-tegra-vde-fixes-ffe9cf098bf8
To: Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Berclaz <jerome.berclaz@proton.me>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262;
 i=jerome.berclaz@proton.me; s=2026-11; h=from:subject:message-id;
 bh=pSN+aMWG4bSfy4wRZg6S1xm4J1XJvjMCKBOGZErTLfM=;
 b=owGbwMvMwCVmvC9341tRgSLG02pJDNkcV4XuuO9cuz2+xlJvdjD70VWPKngOH+KYoPlu8/tVe
 3c9Y+pd3VHKwiDGxSArpsjC2mCYOv8EW0Ch/rxDMHNYmUCGMHBxCsBEZvgy/M8/8prT8eiT30zx
 0y1SSycvm/ZvbvT3wzdiL3+ubo7L5WRg+CtqY3/0ravbUd473gsFzxtEvbwfs8g1ZtkHbYZ1qkd
 2/eIGAA==
X-Developer-Key: i=jerome.berclaz@proton.me; a=openpgp;
 fpr=058031659FC80650712F9EC233BE6DB1ED151072
X-Endpoint-Received: by B4 Relay for jerome.berclaz@proton.me/2026-11 with
 auth_id=1658
X-Original-From: Jerome Berclaz <jerome.berclaz@proton.me>
Reply-To: jerome.berclaz@proton.me

These patches came out of getting hardware H.264 playback working well on a
Tegra30 device (Microsoft Surface RT) with mpv and FFmpeg's V4L2 request
hwaccel. The decoder sits behind the SMMU there, so buffers use
vb2_dma_sg_memops with cached pages, and cache maintenance turned out to be
the largest kernel cost of playback.

Patches 1 and 3 shrink what gets cleaned for the bitstream (OUTPUT)
buffers: a smaller default size derived from the frame size, and cleaning
only the bytes the hardware reads instead of the whole buffer (FFmpeg
allocates width x height x 3/2, while a coded frame is usually a few KB).
Patch 2 lets clients that never read decoded frames through the CPU skip
the capture-side sync with the existing cache hint flags, as the MediaTek
decoder already allows. Patch 4 rejects CABAC in try_ctrl, so that setting
the controls fails right away instead of the decode job failing later.
Userspace that ignores buffer error flags otherwise shows broken frames.

Tested on the Surface RT with the same patches on a 7.3.1-based kernel
(720p/1080p H.264, mpv and GStreamer). On 720p playback, the v7/l2c210
cache maintenance functions had been about 21% of all CPU samples in the
decoding thread before patch 1. Build-tested on media/next for ARM
(tegra_defconfig, W=1), each patch individually.

A follow-up RFC will add CABAC, weighted prediction and High profile
support on Tegra30, by parsing slice headers in software. With it,
patch 4's check only remains for SoCs without that support.

These patches were developed with the help of an AI assistant;
I have reviewed them and tested them on the device.

---
Jerome Berclaz (4):
      media: tegra-vde: size the bitstream buffer from the frame size
      media: tegra-vde: allow cache hints on the capture queue
      media: tegra-vde: clean only the used part of the bitstream buffer
      media: tegra-vde: reject CABAC in the H.264 PPS control

 drivers/media/platform/nvidia/tegra-vde/v4l2.c | 71 +++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 2 deletions(-)
---
base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
change-id: 20261126-tegra-vde-fixes-ffe9cf098bf8

Best regards,
--  
Jerome Berclaz <jerome.berclaz@proton.me>


