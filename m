Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A8A2222C0;
	Wed, 22 Oct 2025 03:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761102806; cv=none; b=vB+K1ZRK1OhtFoC6ZSKV520ONJf5w9rleCVYGQSJ7hdsB01z2+cwZS2CVvh/wP6B7YnR7xUKS6hq5oSFmA8z5dIsa8wqMlE/dJ2FOtvvpqCRSvfToeD8G0uNbpBJURp1Fz0NhIuke2Nj8LVgFSY4DQ8j5yWzF20b9RA7rVAgYB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761102806; c=relaxed/simple;
	bh=sY0LMNg4G27hdJljmt+cFEfQtETCUh15GCY4IWkxMSY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oq+RztcZtZweHFZK24Q51rVit+UrmP9+/OiUoEvjjDWqALO+x1oCGz95m6J/osc91i8mfARyqXWm3+Zu0uznc3bo0zHaTU/hGcLpq337v288loTL3NKYKxwtVAcPz7MQ90316uPJkng0Plgf+aTKnFjETSwhfM4qJKDKv/YXYOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8NsJU3E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8NsJU3E"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AAE4C4CEF5;
	Wed, 22 Oct 2025 03:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761102806;
	bh=sY0LMNg4G27hdJljmt+cFEfQtETCUh15GCY4IWkxMSY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=F8NsJU3EwORgNv92pnv2538k2eHtTqYU7w/gJl6YgZEFyCQbQsn91g5tDHLH3inN3
	 lGc9FiKW/UlVtHyMonjSDHNlNJyYBkpXVgpbuTSHeU7ILIg8OnK+rIdaETL2nDIpC6
	 ++RH5KBCLH5InX1NFsvAY+VaFiILLzwyOnrDMyD9JD/BC6XmFPuNR5bdybgf884mGV
	 Z1FSmyY/Vdo4KFBCozYuLY4/tLtqFZUY3n9lzvfu+Ni56Lp1jVqV9CavSyfUwrGAp9
	 cJJ39Pe2fbv7zR33SchvFsSgISUTFyZPMR+FOjE/p8VQLq3najwj8HvYlAa2aT2Bk6
	 OCstiZjKww0QQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A017CCD1AB;
	Wed, 22 Oct 2025 03:13:26 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v5 0/3] arm64: tegra: Enable Tegra210 actmon for EMC
 scaling
Date: Tue, 21 Oct 2025 22:13:21 -0500
Message-Id: <20251021-t210-actmon-p4-v5-0-4a4dbc49fbc8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANFL+GgC/x3MQQqAIBBA0avErBtQMYKuEi3MmWoWmahEEN49a
 fkW/7+QOQlnmLoXEt+S5QoNQ9+BP1zYGYWawSgzaGU0FqMVOl/OK2C0aIk8qW0kdiu0KCbe5Pm
 H81LrB1n1bU1gAAAA
X-Change-ID: 20251021-t210-actmon-p4-4ddcd0f7deab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761102805; l=1891;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=sY0LMNg4G27hdJljmt+cFEfQtETCUh15GCY4IWkxMSY=;
 b=FbnXxhEB/ukDDzBDlmyXcngghzCYG9Gw//yf+iw9AO55OiCOfAXPZEeJYZkMJrUnXdn91Gdd5
 Zu6Ms4e9gPEBoODc49WZnPKqR8n1dqCJNcf0lHiwWocx8KMnek/jQL/
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

Bindings Dependencies:
- https://lore.kernel.org/r/20251021-t210-actmon-p1-v5-1-1bc8f9221917@gmail.com

Runtime/Probe Dependencies:
- https://lore.kernel.org/r/20251021-t210-actmon-p2-v5-1-a07dc70e948d@gmail.com

Logical Dependencies:
- https://lore.kernel.org/r/20251021-t210-actmon-p3-v5-1-e1ef5e93909d@gmail.com

Merge Strategy:
- Merge all patches only after all dependencies are picked up

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v5:
- Split series
- Link to v4: https://lore.kernel.org/r/20250923-t210-actmon-v4-0-442d1eb6377c@gmail.com

Changes in v4:
- Various cleanups in patch 5 as requested by review
- Fix a couple typos in patch 4
- Link to v3: https://lore.kernel.org/r/20250906-t210-actmon-v3-0-1403365d571e@gmail.com

Changes in v3:
- In patch 5, don't fail mc probe if opp tables are missing
- Add more mc bindings to patch 1
- Add patch to use tegra210-mc bindings in the mc driver
- Re-order series to align patches within a subsystem to each other
- Link to v2: https://lore.kernel.org/r/20250903-t210-actmon-v2-0-e0d534d4f8ea@gmail.com

Changes in v2:
- Assume 64-bit dram bus width in patch 4
- Add dt-bindings patch to document the new properties on the
  tegra210-emc node.
- Link to v1: https://lore.kernel.org/r/20250828-t210-actmon-v1-0-aeb19ec1f244@gmail.com

---
Aaron Kling (3):
      arm64: tegra: tegra210: Add actmon
      arm64: tegra: Add interconnect properties to Tegra210 device-tree
      arm64: tegra: Add OPP tables on Tegra210

 .../boot/dts/nvidia/tegra210-peripherals-opp.dtsi  | 135 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  43 +++++++
 2 files changed, 178 insertions(+)
---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251021-t210-actmon-p4-4ddcd0f7deab

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


