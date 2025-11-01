Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24782221F03;
	Sat,  1 Nov 2025 23:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762038076; cv=none; b=M8MU/Bg5nczQFrEWGe5Q5F5hPm1xXMhXx5Hd19+d6G07EVSNcqxazAm1Pk37u3uP05RJOEbtJ+LnrLcBLewIDK+ZGt/CJABSgYZ5N02ioVcMEyoZlLWCJDgUTvlgqPkFAXzGJXFMi3UkFRtyhP9eTkLAfI/dtctjx+dhI/HVaJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762038076; c=relaxed/simple;
	bh=24ZR53rGFlS9aCl+cwrC35kW0ffMoIyXJnJR8Fkzos4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lFgrq9BTRL2943yxsJ6nOhSFE4R2nHfYJx7vUOR6cm1xpW7t3dNUJhymYViW4WsnOpQT2y0w4rFVaQKI0lAIWh8taQUhabiZM0uiqq7GKFfylGB80VKF1ZTRK6Hq/YifNC/4wNwhvxJQwaYCVGTUAN7e4sI2nlFGHoF8s8IX+vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SC52EshU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SC52EshU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DB78C4CEF7;
	Sat,  1 Nov 2025 23:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762038075;
	bh=24ZR53rGFlS9aCl+cwrC35kW0ffMoIyXJnJR8Fkzos4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SC52EshUG0sKa1iIsH10cKdkIIPoq1S1Qrfm5Qd3qhP5gqLRQtP0IMVEszhSb/agc
	 bRJYcTdXczQ2alLeoe4NY6oH4nXYACTIxZe5+GGmBCFwa+ymCmeF90E+C05TrG+0pl
	 RT2+WWxa3d0dOpoxe6eKTHvEQwBwRpryZMBcltE7CJM3IwW3tr6HdZK9BsmwUlmQOK
	 OQSCIh7S7nu1kF/hhqIiT446XdGFA8CZ21PDkq9eaVWYLtJk7MTzKHl2IQcO9SfyKa
	 jHEx7ApsBKMkfJ/gVMy3QTdfejjyD9cx8/LG5s4uYN3X6ok98hn0Y0MTcD6uITvSoX
	 dC3a4YWUjM0ag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828F4CCF9F8;
	Sat,  1 Nov 2025 23:01:15 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/2] arm64: tegra: Enable mmu on Tegra194 display
 controllers
Date: Sat, 01 Nov 2025 18:01:09 -0500
Message-Id: <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADWRBmkC/x3MPQqAMAxA4atIZgNNtYNeRRwkTTWDP7QqQvHuF
 sdveC9DkqiSoK8yRLk16b4VUF0BL9M2C6ovBmusIzKEp8xxoq5Fz7iuF7J01nFofMsBSnVECfr
 8x2F83w+5kEo3YQAAAA==
X-Change-ID: 20251101-tegra194-dc-mmu-ce925cf3d4cf
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762038074; l=612;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=24ZR53rGFlS9aCl+cwrC35kW0ffMoIyXJnJR8Fkzos4=;
 b=qoKvxUZlk1keasy7Yzs1Er5PafaKd65ytc2MeyLgvp4vKYmZSTeWrLaxizj19b+88vFthzZFn
 JJPZb/5aUiNA7MIIYICOzjKu/lByTWzdpQKcSdzQGZNO7ypdpbvuYwa
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This involves reverting a commit that explicitly disabled the associated
smmu, then wiring that to unit to the display controllers.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Aaron Kling (2):
      Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
      arm64: tegra: Enable mmu on Tegra194 display controllers

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
---
base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
change-id: 20251101-tegra194-dc-mmu-ce925cf3d4cf

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


