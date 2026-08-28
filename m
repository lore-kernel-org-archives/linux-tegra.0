Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3F0443A97;
	Fri, 28 Aug 2026 11:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917936; cv=none; b=FiCt95FOXx+nvVwrwv7ovVecUxVtAgorIO8exaNY33HIesOFyY0y5tEZPLpFzuVyyJ7bROK/9T+rXGF3LXP2qwURjujGP67OyH3IrJrgk2dV5YFNmdX0ZSHO7/vDO2vD+WAJTk5YKPEtnm/YhJ/+aj3Bqc83jA8iMJOfXY1Fndk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917936; c=relaxed/simple;
	bh=Pn2/KZjktrPOZoBzbV7uLwvKJd5JYGCRcgXtmCMEdys=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jHITJ+E6EeeoeR0t+u3cM07xeBv9IoqLgHx/ij9hWUh/7O2zE2jgNQ2ORwjOq1y/DRmzs+DnJ1LQVI+Sfkdvmup3DI93o89ukeJGb+oYFlE/iVNm9BK7r/0cC0lOpdMeWSUX9iJXx8d5JsyerOq3fiz7T1hoocCNjL3ab6EqGzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+MAkJTQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+MAkJTQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F1D1F000E9;
	Fri, 28 Aug 2026 11:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787917916;
	bh=OBnZ3hSK1RnUqQQLSZVvcttUVWSDSWfITLBsHWVcyHs=;
	h=From:Subject:Date:To:Cc;
	b=E+MAkJTQjr9CRAyM+rtYj0XgqMy+7d28g5f/OxEIZAda2GI7TTOzpKsZx6r8l4ML7
	 hzek2HZ5kn/LxVgMRrAK6r9kBsGAWiHZZZqlTYuVLQFTKjUQRL3kaFgO6EDrAG2pCs
	 gNpeDk8zn+7L5f3vcoZjDgjmGTsLxxWYHo/2dXpBSvkekIgANdxcUoWUcaBBG6WUHR
	 Qc/HsMXT40X6ydaAyXdLHmZWirK9sD0FX9wfry9t6jeJ+dPfK2gD257PxdmlJC4yTE
	 j7OMED2Iarz0jiS/IGlE6NT1KFy26ul0b6hvNluZBsIUFDwdgijqjujPuSlKNwPHAD
	 Y0hpZ6XsTy0sw==
From: Thierry Reding <thierry.reding@kernel.org>
Subject: [PATCH v2 0/3] arm64: tegra: Add cooling device on Jetson AGX Thor
 DevKit
Date: Fri, 28 Aug 2026 13:51:36 +0200
Message-Id: <20260828-tegra264-fan-v2-0-a460389d8ef5@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NwQ6CMBAFf4Xs2Zq2QkFP/ofhUMoCa2JLWmw0h
 H+3RU8eJ5k3b4WAnjDApVjBY6RAziaQhwLMpO2IjPrEILlUvBE1W3D0WqqSDdqyujojKt7zRip
 Ik9njQK89d2u/HJ7dHc2SG9mYKCzOv/e/KLL3S8u/dBSMs5OpqoGbumw6cbWRetJH4x7Qbtv2A
 aFgIlG7AAAA
X-Change-ID: 20260817-tegra264-fan-759ee60d0826
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426; i=treding@nvidia.com;
 h=from:subject:message-id; bh=Pn2/KZjktrPOZoBzbV7uLwvKJd5JYGCRcgXtmCMEdys=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqkXZVdA5CyuqUPOJxgk1kNjJCmeMUwVgGq37ek
 GWCTs9WmyiJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCapF2VQAKCRDdI6zXfz6z
 oW3AD/9ACZ0p5OGG4IUlAmIN0ZahkabipExOQHzGeeXpN6N9zMZJin2mnR67pbSBwuAgqag+4Nv
 4jZ+JfqK75MPUb+tddFQtBtPzPM0CL979xWE5NnjzZAR+PAS44/nojdlg9wdbEFDFiAigX2lL7L
 p2JGztc03pQbDHxLrt5wnG8iA2miKL/AvNu7Q25aU5JYmqnYoVPJgtRftNICtlCAZZ2U5a/hvAZ
 YHr/xdbJfGg/2l/RwXPo8CIIAVfQD852g2H/2QwoWsfAluSJwcrp+9s0hEkJ14tKfAfCTYUXrXo
 S76aVJGHShxMqEds+BBp0CeY0hQFZfxrnjnO4m2YFE71hquJbhpvXJZdpicnThj9g3f+/T2pk6W
 R0FMpbIAd/FkOCtfwU3vZpzS+VHZgXdMmmvUTYtu5vkLiLVUEsv6Jufln5Peh2MIYkAbqrDs0XH
 6WJMWCcu3tVcC/jvV6zUVi2hczqmWKpWmvF/0bVJOILPk05ttC1yym/XccrBEQf+HdgtAYWqNLX
 R/Cy8pCCWkDyYZkDqlJDcUacQ73eW9ugtc7YVaiRnNRNQmqun/nhQ+MYqKvVlqKXAe9Fi8sjp1G
 x4uShgp8cMC2us/Fgdm2RbjLhp6oebQrwyaJj60Fgo5T3Nd4d3mNLiHdlnOzlVsAIdkUC9qsH36
 iMgC3IDYWjljxAQ==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

This set of patches adds the thermal zones for Jetson AGX Thor and sets
up the PWM-controlled fan to act as a cooling device.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- move thermal include below DTS subdirectory
- fix device name in commit subject
- fix typo in include guard comment
- Link to v1: https://patch.msgid.link/20260827-tegra264-fan-v1-0-3c55f0c748b1@nvidia.com

To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Thierry Reding (3):
      arm64: tegra: Add PWM fan on Jetson AGX Thor DevKit
      arm64: tegra: Add thermal zones for Tegra264
      arm64: tegra: Add cooling device on Jetson AGX Thor DevKit

 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     | 32 +++++++++++
 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi | 65 ++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 29 ++++++++++
 .../boot/dts/nvidia/thermal/nvidia,tegra264-bpmp.h | 20 +++++++
 4 files changed, 146 insertions(+)
---
base-commit: 1aa1ddfbd85b8d7306bfc3e89044f2c0bddbb3af
change-id: 20260817-tegra264-fan-759ee60d0826

Best regards,
--  
Thierry Reding <treding@nvidia.com>

