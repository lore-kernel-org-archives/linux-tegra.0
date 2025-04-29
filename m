Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31B21EB5E0;
	Tue, 29 Apr 2025 01:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745891538; cv=none; b=gncgioq7wpv9knfW1mLH6p4gEItO64RgOLBYbh/q/JwPE1fpSX9FedLzwL+WgTGD+Az73dFlvJ9LcUS5rWkRKaPP6p20Q1XpwjiINE9ABYjcyuViA5dlzbP4WA7mbGxmkt1uchv6vQUhdBGXKeilZZm5xeJpOgCf9d1u60/WEwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745891538; c=relaxed/simple;
	bh=3rBhkmDwlkecphkN0Dy6r3jKKnMCRAC/bfxsVRUq1Fg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tR2D6Agij8vKjEGzkf3dSBcXjCtMlVMIzZtKLrPB2AS9sh4k7rbbwHxzVPW8fe38nquowaJ1wiX2DNTjz4Nyj1+IBUsdz5ha4vad1zreyBoFImY/27NDrJkpvJi5u+URpwNuaxRjQ8HWbksvbFao6xSbxp6sApRJquUFiI1R0j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtppYo2a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtppYo2a"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABC7FC4CEE4;
	Tue, 29 Apr 2025 01:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745891538;
	bh=3rBhkmDwlkecphkN0Dy6r3jKKnMCRAC/bfxsVRUq1Fg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WtppYo2ahciomp5MW2Niv+CiEfEy7I62HZ4O7Sqfi7BGs/KU6BtqKzwpjHMjldq/N
	 zpyBetdp4LPyMsTTubWgW+K7igBC84av2Q7BvQiLxLIENWnFU8r1e7PWuQqL8733pi
	 +HO4eW0MgszI6ifpzBDdRZMux6ZQiDHTK2N052diCkXFf6ZrXiFU0PkRgeKnaphPhP
	 VV4IqA/fqdTf/BngGRkyhMPDHyFD07LEeCX0qlWN1O4zF7Chqm5O74M5SPbWi9ansL
	 kKAOQQxebrVEjxFUW5ExoVz+eJu47fQZnIFlTaRBw0udPU/jPFnQEQWRbcWaRGRwmS
	 7A9xbmar8fUDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEFBC369D5;
	Tue, 29 Apr 2025 01:52:18 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/2] arm64: tegra: Clean up serial nodes
Date: Mon, 28 Apr 2025 20:51:46 -0500
Message-Id: <20250428-tegra-serial-fixes-v1-0-4f47c5d85bf6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIwEGgC/x3LQQqAIBBA0avErBswSbCuEi1ERxsIC40IxLtnL
 T+fVyBTYsowdwUS3Zz5iC2GvgO7mRgI2bUGKaQSo9R4UUgGP2V29PxQxslbZ7V3SkgBDZ6J/tH
 cstb6AtJhidpkAAAA
X-Change-ID: 20250428-tegra-serial-fixes-9fcdc8fd5020
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745891537; l=989;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=3rBhkmDwlkecphkN0Dy6r3jKKnMCRAC/bfxsVRUq1Fg=;
 b=XgXqQ+/gz4QT8jWarYRYNvBu3k28rMjaarAS+Pssbc5Lkd9qeoyB89au3NfrY6IasBFIFuAhX
 H0Ttx7rJ6QdBg47ALj40ZFDx9qct4/GWVIW394GCu6BbYI9UIN+iNm8
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

Several Tegra186 and Tegra194 serial nodes still have invalid properties
and/or are missing dma properties. This series corrects those.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Aaron Kling (2):
      arm64: tegra: Drop remaining serial clock-names and reset-names
      arm64: tegra: Add DMA properties for Tegra186 and Tegra194 UARTs

 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |  2 ++
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |  2 ++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 26 ++++++++++----------
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  2 ++
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |  2 ++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 28 ++++++++++++----------
 6 files changed, 38 insertions(+), 24 deletions(-)
---
base-commit: ca91b9500108d4cf083a635c2e11c884d5dd20ea
change-id: 20250428-tegra-serial-fixes-9fcdc8fd5020

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


