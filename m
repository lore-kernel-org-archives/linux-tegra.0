Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7431CC8F0
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 08:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768723399; cv=none; b=nZ/qV2hZ8Vfwpxjc/wqR+h/Ibhlcedhknzhi+O3pmXD2KWt56yrg4j0IqHpQtHuqfTULJ4p52F4jtzpQrn6MiEo1/2kHus9wRAXdvK29MGCyAfwSBu0VP20Z45XEFqhC1A4AQZiauKhyNOX/4fBag2CLaU43m5eYjDFEbhbeidI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768723399; c=relaxed/simple;
	bh=BmqW9qasO22gs3uI9qJ4KhDesE/yCqRFybixcoASBc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mdp+fZElRqACZPorPe0gu7MqTT6v8kiLH9ZbOVWLIok2Uwlx7ttTAte5QZWh6/VX/MxokOjh00YoTkeVaQ19uWOL/E8ACGpf3ET8qFS0nEL4VNaixJihGLs2LdKO+EokvoRarsU2AxffSKkp8ikW3KtcaP7ZECOko3r7vvLO8Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hw+sWtJx; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hw+sWtJx"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-124566b6693so2120998c88.0
        for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 00:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768723398; x=1769328198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xChtBKPsImfoi84c2WhbMuILCNFs4bzMlyLsBvJi1U=;
        b=hw+sWtJxor963ZYItS7QnGMlnE5gQCuGe1JYXMKEcFLfF8OPvhuub9MfRzscZSdnv5
         td3NYhdwtCTSwCRwfgbDgStkCsRdJrX4QjIh3bhCWOhJtmhR58gX9xvj98waomRRXd9w
         b/6w9LaI9oCB2WSQO5GOwIwRJg57NjvD4p/RrJltDHrs14J4t5kHMlP9q9FIX++/LjXo
         +j5WVNzTADnQgFOwR5tJHP1axrX8+RH+CnDMA4tKLCe6FNG7ZzRlqg8Bndj2GGmUgkaX
         yhENLWE+dxNtdEuu73IY4T7MfqOzKcp3UTL+uFzcbV2jSH2Idye7p2kDzwmMhGTgVthq
         UlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768723398; x=1769328198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6xChtBKPsImfoi84c2WhbMuILCNFs4bzMlyLsBvJi1U=;
        b=xRyhKt8dTvdb164QAdn3Zct2kW1HSzejMfmxpraLBRLuYoKWkUA7CIqOly5YyXMnQM
         Z++N+J8ZeEJN8x1+Ab33ZT1flWgJ7ThM2JIb+QnWchAwv7JY8lfjzUIlEllqfSi3exOI
         i689wV95Nu8QRAZNF26hgV92+kM6U8afxKESdpqVBYExkgdLKWRxUtSlJftQJkgSMmPJ
         D6EQwaatOgFn96jxYtvCl5v88oHup11cSF9rRvXshfAeGDezmMpOyA0uuO/rilJOVdRy
         4jyH0PSI9s8jddLH0aGLHqII4zVmLkqy3S2wJTY0wX6WXQGnjjgcnLhCRyDbfV+xKPfP
         eitA==
X-Forwarded-Encrypted: i=1; AJvYcCVJC3zM+/bD77GVStK5Tvxn6rvegQTtw3WYI3hR23e3LrxUh76U16l77J1W6BW5dFVKEOFOOI1HDuyicA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNiywRDwSLEXsJCDNBUC4XuouHOUnLGBk8gLKih2lsCY7FS3kE
	V5ARSZO/JS/uBVSdyUpi3KViSChyhXl9bTNGne+gkWmxsod+xpySZRA/
X-Gm-Gg: AY/fxX5V4FO52tQbZifBhLPn5JNINwJ7mgyAr7FG3C6HskHFUSYvi8fP6EXCO+yGCHt
	WZd4FuSEBts46lU1XB1Zz7Jd2bTUleU36gZdbmw6wO6+Tl/0tvMsdWFIEvzo4927a6MJavNMAh8
	S5x6um74iWfw8Fbro1ALvo7xXtZISO62U9XPTCGEVZ1+ZnzmNiLC7gJOYwT8x2KNmMMW+mjeyVl
	uYAwBec65MjyoCDXVoAK117LXk12IjXAtl1t71iaEQ30sWC4gv298AOwY0rMcho5oITQy2J9Gnc
	wDOlT9Rc75jbAqKJ1MX74fPdlphSIbyU/FOQx22n0LNeQJOnN9bey70dn7rnzioKuRE3gbVvow0
	UlRY1ZMLw1cjMZ0INtb1Fft6pd01eVPdijkju/OiA2KBAyMdMLV45vFBdmLbrG9gZgQzJBUpKNj
	jopAWxDsRnR3wusnu+2DRdixk3RM4o9zil1mqmsIt0sImqQGRKmDfliJrRXK030KeMcDpfpgIT8
	MyFGpM=
X-Received: by 2002:a05:7300:3254:b0:2a4:765b:b4bd with SMTP id 5a478bee46e88-2b6b5045f4dmr6001906eec.37.1768723397526;
        Sun, 18 Jan 2026 00:03:17 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3619a94sm8475422eec.20.2026.01.18.00.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 00:03:16 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/4] arm64: tegra: Changes for v6.20-rc1
Date: Sun, 18 Jan 2026 09:03:03 +0100
Message-ID: <20260118080304.2646387-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118080304.2646387-1-thierry.reding@gmail.com>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-arm64-dt

for you to fetch changes up to dfa93788dd8b2f9c59adf45ecf592082b1847b7b:

  arm64: tegra: smaug: Add usb-role-switch support (2026-01-17 01:15:26 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Changes for v6.20-rc1

This update improves Device Tree support for 64-bit Tegra platforms,
specifically focusing on the Smaug board and the Tegra264 SoC. It
enables full USB-C functionality on Smaug by adding role-switching
support and enabling DisplayPort altmode. For Tegra264, it introduces
nodes for Command Queue Virtualization (CMDQV) in the SMMU, adds the
Data Backbone (DBB) clock for the memory controller, and corrects CPU
compatible strings to match the Neoverse V3AE core. Additionally, it
performs a cleanup by removing redundant status = "okay" properties
across Tegra186, Tegra194, Tegra234, and Tegra264 files.

----------------------------------------------------------------
Ashish Mhetre (1):
      arm64: tegra: Add nodes for CMDQV

Diogo Ivo (3):
      arm64: tegra: smaug: Enable DisplayPort via USB-C port
      arm64: tegra: smaug: Complete and enable tegra-udc node
      arm64: tegra: smaug: Add usb-role-switch support

Krzysztof Kozlowski (5):
      arm64: tegra: Drop unneeded status=okay on Tegra186
      arm64: tegra: Drop unneeded status=okay on Tegra194
      arm64: tegra: Drop unneeded status=okay on Tegra234
      arm64: tegra: Drop unneeded status=okay on Tegra264
      arm64: tegra: Correct CPU compatibles on Tegra264

Thierry Reding (1):
      arm64: tegra: Add DBB clock to EMC on Tegra264

 arch/arm64/boot/dts/nvidia/tegra186.dtsi       |  2 -
 arch/arm64/boot/dts/nvidia/tegra194.dtsi       | 15 ------
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 25 ++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi       | 15 ------
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi |  8 ++++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi       | 64 ++++++++++++++++++++------
 6 files changed, 83 insertions(+), 46 deletions(-)
