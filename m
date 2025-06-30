Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E9923D28C;
	Mon, 30 Jun 2025 08:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273903; cv=none; b=p6B8uidnjtZZHTjig+SFS7/JYWNOtwWR+ZTZUi+TSmSCNJCMYSes0gyTvdssOMheACcbEjWtYnVl5E0Rz8nJd3Dm4hzPCjKAf3pUsUJ2CltVuHoYg0ZGKKRSEu/all7uIAQGiylORHp41HpwajMHGEHL0DzINVc13MDSHCevFz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273903; c=relaxed/simple;
	bh=yVRgDYthw0QSa8gzZJJyAZDMS/AvxucxK9cfZfnatyo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SEGoqGFCx/hleiLFfl75FwQ4bVr1hKV3qnSEflour5HeWy6gXNNaJqU7994k3z6Dai7I6WAFXpPHzVsYhUMLW0GI/exUp3l60MWQ4i41NZh5YoWuDVCwRwm7b8rtr30TQ1pyzu+Lx92kdR2bahIoZapivGUlAqepE+BCMAz3nAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=eqJbug3M; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="eqJbug3M"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 9167E6000258;
	Mon, 30 Jun 2025 09:49:20 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id Xf_wChehqG2Z; Mon, 30 Jun 2025 09:49:18 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id A4A1C60010AB;
	Mon, 30 Jun 2025 09:49:17 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1751273357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gf08E0wZsmIUXEMAnTZrONNO6RnUNdCjKGL56Y0nNl4=;
	b=eqJbug3MAXNqqo7r8C/btW1U8crawbL0acRZ3SUEs6EbGmzMke6z4/307BLK0cg8J3WybR
	ouNt4hMf5EGi0BLL2T/fVXUSEZJV+TAAp/Qw+h722aEGIiQtaAtsMJghqcyIz6guKnTqLe
	puJRol53CXaIOtTPp1XRkFpchSnQdDI=
Received: from [192.168.1.69] (unknown [92.56.11.86])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 00F9B360075;
	Mon, 30 Jun 2025 09:49:15 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v3 0/3] NVIDIA Tegra210 NVJPG support
Date: Mon, 30 Jun 2025 09:48:41 +0100
Message-Id: <20250630-diogo-nvjpg-v3-0-a553c7e91354@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGlPYmgC/23M0QrCIBiG4VsZHudQl6511H1EB5v73f4IFV1Sj
 N17bhA06PD94HtmEiEgRHIuZhIgYURnc1SHguixtQNQ7HMTwYRkiknaoxsctenuBwqsP2pZc6G
 0JPnhAxh8bdr1lnvEOLnw3vDE1/XrqJ2TOGVUGqErZQC6qrlMoC1qVz4fGDvXln4iK5jED8L5H
 hEZYdycdK2gbZj5iyzL8gH913UM9AAAAA==
X-Change-ID: 20250605-diogo-nvjpg-e0d4c57126c5
To: Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751273350; l=2623;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=yVRgDYthw0QSa8gzZJJyAZDMS/AvxucxK9cfZfnatyo=;
 b=wDMdcP7d3cTNvN2v+YfmY6X/CM8RvvxYa84Aw8ELVrvp9QF5YmKJd0+/5VXOxTaUcaLXGAnlY
 RW/CT0O+sYHAqpWQfmxDI8ty1Oq+v9UF4Lxhi5+4C/qipsfcsdvqOwz
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Hello,

This series adds support for the NVJPG hardware accelerator found in the
Tegra210 SoC.

The kernel driver is essentially a copy of the NVDEC driver as both
engines are Falcon-based.

For the userspace part I have written a Mesa Gallium backend [1] that,
while still very much experimental, works in decoding images with VA-API.

I have been using ffmpeg to call VA-API with the following command:

ffmpeg -v verbose -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 -i <input.jpg> -pix_fmt bgra -f fbdev /dev/fb0

which decodes <input.jpg> and shows the result in the framebuffer.

The firmware for the engine can be obtained from a Linux for Tegra
distribution. Due to the way the Gallium implementation works for Tegra
the GPU also needs to be enabled.

Thanks!

Diogo

To: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Jonathan Hunter <jonathanh@nvidia.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

[1]: https://gitlab.freedesktop.org/d.ivo/mesa/-/tree/diogo/vaapi_gl?ref_type=heads

---
Changes in v3:
- [01/03]: Properly handle dma_alloc_coherent error path
- Link to v2: https://lore.kernel.org/r/20250611-diogo-nvjpg-v2-0-01f8c76ea90f@tecnico.ulisboa.pt

Changes in v2:
- [01/03]: Remove reset handling, set clk rate to max
- [02/03]: Explicitly mention Tegra210 in the commit subject
- [03/03]: Explicitly mention Tegra210 in the commit subject
- Link to v1: https://lore.kernel.org/r/20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt

---
Diogo Ivo (3):
      drm/tegra: Add NVJPG driver
      arm64: tegra: Add Tegra210 NVJPG power-domain node
      arm64: tegra: Add NVJPG node for Tegra210 platforms

 arch/arm64/boot/dts/nvidia/tegra210.dtsi |  14 +-
 drivers/gpu/drm/tegra/Makefile           |   1 +
 drivers/gpu/drm/tegra/drm.c              |   2 +
 drivers/gpu/drm/tegra/drm.h              |   1 +
 drivers/gpu/drm/tegra/nvjpg.c            | 329 +++++++++++++++++++++++++++++++
 5 files changed, 346 insertions(+), 1 deletion(-)
---
base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
change-id: 20250605-diogo-nvjpg-e0d4c57126c5

Best regards,
-- 
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

