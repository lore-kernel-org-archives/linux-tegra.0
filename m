Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9DC1F2B8D;
	Sat, 16 Aug 2025 05:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755323659; cv=none; b=AM4grCCOa0yfifRcxOUKRz6blywENQlV6uiH9kb+VDk0EJkJLAiECnQao0q872xuQXi4TYDog95Q4WDpo3YZKqarbShr9T8WVueP+Rfm1ynl6igqsilEClSIo9mKzpFUtFi1uO+81jIr7uzHX66HzmsttZbaMJZBXlLBsscuy+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755323659; c=relaxed/simple;
	bh=8klj2uYRMfs8FE617jEyAtR6aZOYS7SLudYM0j1xsJc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PhSTB12hjWgc3WC/fWiSiMnd4oNXsKodZtcJ56rtYpiNuXyxB9qy9NmZsWLmMk+v9Ydr+dOKqBD2fTJJt5TndJrW4drPxWsEDy3EOExHwUClse++m9n1CxP4CO3XGamG+c72eR5Aw4xTsxtqGyf6alfYomIgoYNZNPBd2Vgzn4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=My2OZOmk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="My2OZOmk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3FC8C4CEEF;
	Sat, 16 Aug 2025 05:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755323659;
	bh=8klj2uYRMfs8FE617jEyAtR6aZOYS7SLudYM0j1xsJc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=My2OZOmkgK8S/P8TzqtVuTbioib7+OEyAX+S/+oU0G3Oa+lzPSj92c5JMbq2rdNhG
	 Ejcymzn8Ci5jExdHmVkfVFxXkOCDRebXp6Z4jgpSHW4f0uzhDIkEU+Lv75N9n0Hoyd
	 fxE+BUWaZ4h0yS4YAVembS0HK8QEDMDM7jDVY5BznxFZfD/jEhfx2Qv+kFWdP0Rhe9
	 7kFh/ayeNIERUMk3USg8FVGonhuX+hHd4plqMJei/+X94jluv+UTa0K8yt4jm1VIA2
	 eCLkHqvkocH3vUS17tX6knbmnyEAGyaDa5LNCNUdpWiTOd3r6h5Ff0a9wI6tWZ2J5w
	 Jn7Jgy7GzHNvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24EBCA0EE9;
	Sat, 16 Aug 2025 05:54:18 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/5] Properly Limit Tegra210 Clock Rates
Date: Sat, 16 Aug 2025 00:53:32 -0500
Message-Id: <20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANwcoGgC/x3MSwqAIBRG4a3EHSeo9LC2Eg3M/uxOLDQikPaeN
 PwG52RKiIxEY5Up4ubERyhQdUVut8FD8FpMWupWGqXFBR+tVlKkE1gP0fSyGxTMYpyjUp0RGz/
 /cZrf9wPHlmM/YQAAAA==
X-Change-ID: 20250812-tegra210-speedo-470691e8b8cc
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755323658; l=1124;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=8klj2uYRMfs8FE617jEyAtR6aZOYS7SLudYM0j1xsJc=;
 b=YxZKMWmKba+krIJVoRlKTJR6SZv8sVtniqhXAmEvuC1t8HToXFXb2O9pGXk+SJ4NDI4UrjzhQ
 iSR3FVD6PuzDL/FRX2qtKMXMhf5HBqqGlA0s3BPkRJaKv8q50xfq3HX
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

The Tegra210 CVB tables were added in commit 2b2dbc2f94e5. Since then,
all Tegra210 socs have tried to scale the cpu to 1.9 GHz, when the
supported devkits are only supposed to scale to 1.5 or 1.7 GHZ.
Overclocking should not be the default state.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Aaron Kling (5):
      dt-bindings: clock: tegra124-dfll: Add property to limit frequency
      soc: tegra: fuse: speedo-tegra210: Update speedo ids
      soc: tegra: fuse: speedo-tegra210: Add sku 0x8F
      clk: tegra: dfll: Support limiting max clock per device
      arm64: tegra: Limit max cpu frequency on P3450

 .../bindings/clock/nvidia,tegra124-dfll.txt        |  3 ++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  1 +
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c         |  8 ++++-
 drivers/soc/tegra/fuse/speedo-tegra210.c           | 39 ++++++++++++++++++----
 4 files changed, 43 insertions(+), 8 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250812-tegra210-speedo-470691e8b8cc

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


