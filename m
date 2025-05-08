Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF59C215F49;
	Thu,  8 May 2025 06:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684465; cv=none; b=Fl0xCObakmVmglSAX40e7VFD4JfwRxoIA+VXF2FemYnqkjICXiPolYdhmXaTw5nOCnkQ/350KCTmf3lxD+ZFuQrhyttzWTGLXpd4LZkI598f5Kzf0irYP2kQp01OAb5J1UQbscvIqFmvpjdORXOWFQT2kMEY9kUTL5BDpKGoZHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684465; c=relaxed/simple;
	bh=h+pfeE2YEuEkhstsQ/EywIS3qHB3FnGPIcU0/7ZAPTU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gASg1WLygT6sp6wkgRZmN2CfoGwqvr6CtyoDLF2aKzV9lDwdS7kvg1DnflSpzh8i+ENbKdPQWCM/gjq5Vh2XphiCO1TOHfIEtps559ivl68JJYV87nOYApDTFV4fohLp2qOq7l5vnl6CHkihLjLq+SIXUBIo/mQ6UmTM9y9XzlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNnZY8Ax; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNnZY8Ax"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C8D1C4CEEE;
	Thu,  8 May 2025 06:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746684465;
	bh=h+pfeE2YEuEkhstsQ/EywIS3qHB3FnGPIcU0/7ZAPTU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oNnZY8AxUi54fgzC1pe5/5StosyfWF8rsZ3VcbEDy52pFh1ycjWwO+07QoFTswycI
	 tcmJ3v8+7zWUE1WTO/S3QGMxmzuIvwHA/G+IgP5CbkzejWBezHvaOa534CSgF39UrQ
	 sb/ID0qRZft7OVTA/MzGLZj9xV3gmK0Sgb2GY2cg0VH39ozK/dMeedMUagEh6ptJLP
	 /AoKCFIGZVEJjttz+Aw9jt4OqDQinzP3M1+BRKNi/IvkGecHrvW6yNy8XarG/yGkNP
	 2Le0ZdsfkqEssva2plEWaeANWq/JWiCCCkwG4Z8TfhEjeIvsBXEvq6LWFtkI0Jt1Eb
	 SXOYxCPCJHPlw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29276C3ABC0;
	Thu,  8 May 2025 06:07:45 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v2 0/4] memory: tegra210-emc: Support Device Tree EMC
 Tables
Date: Thu, 08 May 2025 01:07:37 -0500
Message-Id: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAClKHGgC/2WNQQ6CMBBFr0Jm7Zi2IDquvIdh0bQDTGKpaQnRE
 O5uJe5cvpf891fInIQzXKsVEi+SJU4FzKECN9ppYBRfGIwyJ9UYwpmHZI1WyMGhn5HO3nFLyvq
 GoayeiXt57cV7V3iUPMf03g8W/bW/Vq3+WotGjUQXanvbUt3o2xCsPI4uBui2bfsAPz21Hq4AA
 AA=
X-Change-ID: 20250429-tegra210-emc-dt-97dce690ad4e
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 devicetree@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746684461; l=1217;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=h+pfeE2YEuEkhstsQ/EywIS3qHB3FnGPIcU0/7ZAPTU=;
 b=2sbjpz0NHNUxabBRxSPI3YxFl2lApicoZ+XOPwEzfS+fRBYBmvSKFAQVP6HGDOZW4jdMz3iCh
 WEfRWwRIuxGBjZoADeWJnDqLPX8JjbqochzUpo/8/ZcN2dOBOHsDUR2
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v2:
- Add patch to describe the emc table bindings
- Add patch to allow a fallback compatible on the tegra210 emc device to
  match firmware expectations
- Add a patch to include the baseline emc tables on p2180
- Link to v1: https://lore.kernel.org/r/20250430-tegra210-emc-dt-v1-1-99896fa69341@gmail.com

---
Aaron Kling (4):
      dt-bindings: memory-controllers: Describe Tegra210 EMC Tables
      dt-bindings: memory-controllers: tegra210: Allow fallback compatible
      arm64: tegra: Add EMC timings to P2180
      memory: tegra210-emc: Support Device Tree EMC Tables

 .../nvidia,tegra21-emc-table.yaml                  |  1692 +
 .../memory-controllers/nvidia,tegra210-emc.yaml    |    44 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi | 49749 +++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |     1 +
 drivers/memory/tegra/tegra210-emc-core.c           |   246 +-
 5 files changed, 51721 insertions(+), 11 deletions(-)
---
base-commit: 8bac8898fe398ffa3e09075ecea2be511725fb0b
change-id: 20250429-tegra210-emc-dt-97dce690ad4e

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


