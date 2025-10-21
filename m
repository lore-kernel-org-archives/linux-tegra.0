Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7268634D904;
	Tue, 21 Oct 2025 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761071493; cv=none; b=FQG8USy+5D6EzgJB1SgjFuBsHGKqsmDVoXBzBCZjqamgz/BJFE2lygKv4Y1Cpte0Oe202HehVLo8PWtF6I1AuvvFYamtpnuTry6nEzv8AZ1GR46j2rvLQ5tGIlsqVi0C9DdiD6kDqhboqAdhmfrAx6rw0dZvRpt4g1BEddL2cxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761071493; c=relaxed/simple;
	bh=foOzd1ErH9G7EZaY83TpuvCawP/IuYOE5JCvotPcJ6c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GoxlQZPrRQWiKpRkN7jKaK0B/J+DXrTO+bqPYADejhta/2LNhXJjx63kSyZRqiDyKaXRk58aVbvDsUGCf4D86HhymimJ5rGvp3xV9qBOgSnn0ArQHpbjEFwPrbUNvdyLj4PexHeJlqWDTibLr28rGhKASGshcxVELHl7dPUIesU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2w6avEZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2w6avEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F92BC4CEF1;
	Tue, 21 Oct 2025 18:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761071493;
	bh=foOzd1ErH9G7EZaY83TpuvCawP/IuYOE5JCvotPcJ6c=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=h2w6avEZVMQPgMJWfGohu8I5XNtSFDyw4Nke5xc1evZ17YeqrIIX/vSgwLV27XTJy
	 kWks35WWRL3XkG03hgO2tgAtvCA43tbpibyIGgC/LmV+6ZPXDQOglqO+zs7tiXFBOT
	 9JG4G3SpDINx9X5B3jUz7+xbNnf0JzthDC4k4oE6jmDFOTSBAar5VMBk4ytkpd1TUa
	 Rx7mLV+0LU+52nKITfserOl61UJh9a8CmEyQ56smYZrI8/ke2U/xbdflJPiV8FPqKv
	 3CruB97jVlGOLkKAZ5XHzkACzqtsFPQo9ZQGY+yzVNnxOSUR4qk0EZV8ltR3pFDXib
	 8QR0VCLLwktrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1DECCD1B9;
	Tue, 21 Oct 2025 18:31:33 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/2] arm64: tegra: Add CPU OPP tables for Tegra186/Tegra194
Date: Tue, 21 Oct 2025 13:31:26 -0500
Message-Id: <20251021-tegra186-icc-p3-v1-0-0c313968b77b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH7R92gC/3WOSwoCMRAFrzJkbSDd6Q5xriIuYrqjWfjLjCKId
 zeooBuX9aCKdzeTtqqTGYe7aXqtUz0eOsBiMHmXDlu1VTobdMjgEOys25YgBltztidvfQnEJIk
 1k+nWqWmpt1dxtX5z0/Olh+f3+O2Ow58q2EjMGkCIvYxXML93/mpoY6AiMSCH5fKjbdKkNh/3+
 zp3EUBE1EX0BYhQKYljTFi8K44dEOecJJn14/EEEpeithsBAAA=
X-Change-ID: 20251021-tegra186-icc-p3-3f6454da5ec4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761071492; l=1249;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=foOzd1ErH9G7EZaY83TpuvCawP/IuYOE5JCvotPcJ6c=;
 b=1ljVV/hSyLq08Gx+hrZftn5e9mALHnzMcU+smzxpkS1aUmXYJhCRO+M2svqmkZhEqdRwnuT93
 EqoEWGq36ppDk2uwvtM3CFyx+U20sjkBdVsrbQhIlVtbIrR/qgaGNdx
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This was original part of a larger series [0], but it was requested to
be split into smaller series.
    
[0] https://lore.kernel.org/r/20250909-tegra186-icc-v2-0-09413724e781@gmail.com

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Aaron Kling (2):
      arm64: tegra: Add CPU OPP tables for Tegra186
      arm64: tegra: Add CPU OPP tables for Tegra194

 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 317 +++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 636 +++++++++++++++++++++++++++++++
 2 files changed, 953 insertions(+)
---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251021-tegra186-icc-p3-3f6454da5ec4
prerequisite-change-id: 20251021-tegra186-icc-p1-8455e61d453d:v1
prerequisite-patch-id: 79b5490cea531a49046c96e8b5240dbbe490e16a
prerequisite-change-id: 20251021-tegra186-icc-p2-864fd8625699:v1
prerequisite-patch-id: 470c94ee34569e507d14e65dd989e708955f1512
prerequisite-patch-id: 64f466efb923428edb27b4360ac41bda5c990311
prerequisite-patch-id: 6a99ee6dbcae73fcbfab52009fd600b2618f3d5a
prerequisite-patch-id: e05146355f318629f1511fa972c1b1f92ee98064
prerequisite-patch-id: 5754b9afa57bdf187d8779a3354fdbc36e539af9

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


