Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ECD28689C;
	Fri,  6 Jun 2025 10:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749206766; cv=none; b=IzslGy1UnIronFR4C9dFXKpH63nqvfaVkoQ67/RbYU9gQeWalRve/kYSYzM3LmHTpBxfJwAAZjUkIWMSHCjrsESDddcR2mS5LlQNUfqYxm0caUrCI1EBq33E/ww3Y9omnS+VcVba6dXhTgqGHU5BgYnLgWs7+GvimvvbpO2Qtwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749206766; c=relaxed/simple;
	bh=b/UYcG1Ax9LboqUqxefB6TY4tC5jNdkFojL1htmMLXc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MBJkTR5KiX5KF5F9E8hZoD5mkzDF+MEKzFvFTbkxgXNH8OoDcAc5e5Ge2qcm5sdOd0+4LXG5cz+wEyXHhE8jsoOeVXYZkzgsnmwoAFGDeoowoCo8h/Mg7A8EyNhDvtPH3nvg/PVlaIPSY9MoH/17Z7kUfuwU8KRIhjMzi3ILbdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=b93hJzPk; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="b93hJzPk"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 293D16002C16;
	Fri,  6 Jun 2025 11:45:57 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id QggEUngRi67p; Fri,  6 Jun 2025 11:45:51 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 32DC06003C30;
	Fri,  6 Jun 2025 11:45:51 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1749206751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cWq3jC53oW+9ppyzQ0zjaoRHRCrCbgV8CsuK0KJm/0w=;
	b=b93hJzPk7nUW0Qy8BC62GlEqW6wlgHXJms5sTLUmtL1iZYwkVHfFu/6OyI6lEs66UkBv1z
	C+fEgpUsBwAfnej1nedMLTdikYsF8FpkShQqodCC/ZO2dO0Pk1ixmrMNPHo89iJiBZt4x7
	cnjFyWSYPpZzk/eWonXJX3OZ5t68gXQ=
Received: from [192.168.1.151] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id CDF40360085;
	Fri,  6 Jun 2025 11:45:48 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
Date: Fri, 06 Jun 2025 11:45:33 +0100
Message-Id: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM3GQmgC/x3MQQqAIBBA0avErBtQSYOuEi1CJ5sWKgoSiHdPW
 r7F/w0KZaYC29QgU+XCMQzIeQJ7n8ETshsGJZQWRmh0HH3EUJ/kkYRbrF6lMlbDKFKmi9//th+
 9f+hludZdAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749206748; l=2115;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=b/UYcG1Ax9LboqUqxefB6TY4tC5jNdkFojL1htmMLXc=;
 b=PEvbpcOdAxmeIrGehqWEUNKIoROMhlmdF8sd/PteghNuUOrJdekELHTyLPmPJyKGamfyRTckc
 dQdJcZ/Bd1YCgqMWWqY3GgROdXjrEYSBKpAjs3MnjvrjL7d+JbvJ5VR
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
Diogo Ivo (3):
      drm/tegra: Add NVJPG driver
      arm64: tegra: Add NVJPG power-domain node
      arm64: tegra: Add NVJPG node

 arch/arm64/boot/dts/nvidia/tegra210.dtsi |  14 +-
 drivers/gpu/drm/tegra/Makefile           |   1 +
 drivers/gpu/drm/tegra/drm.c              |   2 +
 drivers/gpu/drm/tegra/drm.h              |   1 +
 drivers/gpu/drm/tegra/nvjpg.c            | 379 +++++++++++++++++++++++++++++++
 5 files changed, 396 insertions(+), 1 deletion(-)
---
base-commit: 386b76a190ce68afc19d481f17cab1f5479c719b
change-id: 20250605-diogo-nvjpg-e0d4c57126c5

Best regards,
-- 
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

