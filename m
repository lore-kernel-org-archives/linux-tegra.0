Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381EF279345;
	Wed, 11 Jun 2025 12:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644331; cv=none; b=ani+fhpasqiVO4UwRnmTSYIEtm7XxuuD3Cka6e9sGttLot+IrHvreO22IXrerDvtnung7mskQVTAgfHKxrohzxWS92GHOt0r5cMWjP/Z2pb1WGi8TBBSsX9EVqKn4KzIm6MX8jNvNcrshPSbq1zMVPgTuq3y7IibKRs5xMoXWYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644331; c=relaxed/simple;
	bh=v5RXLigG8aIKIExdJGg5HcvBIh2/wkBko4AAd6qmGmI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jIvW5glPKTWAdVn3luf4r2vifpBL8l2pDVNXI+rak/gQotXLCg1DaaPk/LXzj9xaxwFNLCv2PhLNHKhqoCyaH6NN0loWWZolc80OHTtRt58peJmOjku7EW2fglwQymXtIqpixRMwB1l6ok+wKa8yTsZg93yWsJyHQtR11PoAJ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=hlPy9Ian; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="hlPy9Ian"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 7827D6002409;
	Wed, 11 Jun 2025 13:18:46 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id TKkBtBk9tKFT; Wed, 11 Jun 2025 13:18:43 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 63E766002306;
	Wed, 11 Jun 2025 13:18:43 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1749644323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bsCIytP8F7I0Dm27535yA17bXs0Y3AmhN8O0FTm92vU=;
	b=hlPy9Ian4tmKDvnbSBxADY5p4WcAy2WopGd9PAvbepwIC6hd5C7a5d+34u2ukIQWHfwSVd
	GOE8GwXrxbCkSsTAlr7IpC8G1jRgE1rbiCOv6O/D6ZvyxiN8G4c4/UiVsKEYEk5lifpFsx
	pEE616DIlN7qtOLQa++ikxJZtwM+V74=
Received: from [192.168.1.151] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 279DD360084;
	Wed, 11 Jun 2025 13:18:43 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v2 0/3] NVIDIA Tegra210 NVJPG support
Date: Wed, 11 Jun 2025 13:18:00 +0100
Message-Id: <20250611-diogo-nvjpg-v2-0-01f8c76ea90f@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPhzSWgC/1XMQQrCMBCF4auUWZuSpiaiK+8hXbTJtB2RTEhqU
 Ervbiy4cPk/eN8KCSNhgku1QsRMidiXUIcK7Nz7CQW50qCk0tJILRzxxMLne5gESne0+tQoYzW
 UR4g40mvXbl3pmdLC8b3jufmuP8f8ObkRUuhR2daMiEN7vi5oPVmunw9KA/d1WKDbtu0D9hBil
 q8AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749644321; l=2448;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=v5RXLigG8aIKIExdJGg5HcvBIh2/wkBko4AAd6qmGmI=;
 b=UU2A7JimG4deA21OVUCUZKd30eaNbTbzfEDJzxtmPgPbgXSU41wHwdNrrnIW4BrF5KDitB1lP
 7HwLpdm/0MEDvsF0m2zzmxffRhEU3d2srPGHo9/mV4Pr8k6wpXf/H/E
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
 drivers/gpu/drm/tegra/nvjpg.c            | 331 +++++++++++++++++++++++++++++++
 5 files changed, 348 insertions(+), 1 deletion(-)
---
base-commit: 736ecbbf1e57fc3bc6575c76f6a46c84760233f8
change-id: 20250605-diogo-nvjpg-e0d4c57126c5

Best regards,
-- 
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

