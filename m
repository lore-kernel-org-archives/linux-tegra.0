Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B143F334C3A;
	Mon, 27 Oct 2025 18:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761591316; cv=none; b=pbz+Qw15fNVEzq70zjLUX4VI8B4BZxaYHScE9CepdndvJwiC6JXzznPfeQ7xVCQ6AxyZFRaISAMR1Nk1zcD7lIeCWq5Fyjmd7/+qArPwmVM8OOaM5V91nNTNU+K57oFVjGnorcsMjApHMAMQE3c/6pLxgrRo0fL6cKUcn/Z3mNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761591316; c=relaxed/simple;
	bh=OPvt99F5DI8O+iT4BI17Dc+l14b1OznNR3VbnyeaqsQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gtr/fFmkatQFnd3Odk4P+MOnAdG9baLplznIyxpIjoEwoQHBGCJ7G8na54emCUFkD8Qt73whhhiE24qLlSkV0UiVi16y2MUG/HyyH13KnGpctwXbNAL1cBR7aH0XkAxEEMD6lOlTZ0MK0A0NcRMi0zyKgtNY1XHyN5u2od84qjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSspyrFq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSspyrFq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7345AC4CEF1;
	Mon, 27 Oct 2025 18:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761591316;
	bh=OPvt99F5DI8O+iT4BI17Dc+l14b1OznNR3VbnyeaqsQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tSspyrFqHSQjyera2zEcDcXoed9TKHiW1qezLwVUy0tkDqcbOt32+SpP1vB1obOgg
	 TaZC1r6/fS2v5jdCipDy0x+B780hz2jKYZmfjPG8KRNZBBJ74eqjQWkup/CI53ipMT
	 /Vxniiyj9kTfDLlKW6ZSLs3k0oFg5JmPTJsGWgIx/FZYsCYoSSMtw2iJ/mhPYYNGa+
	 3KVp0tTUnKpAWEX2nGSMjy+pBXVL3+aPBW/joSXlG3FP+jJkiZvnG7ntUkFLQIazfu
	 8YYWCynzBqxprcnyrU0exrql+XrSP4yJPaIK/Y6ENZUZOwClHIXuWp0Fv884k4746E
	 R+Rt88Gki6Y/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BB6CCF9EB;
	Mon, 27 Oct 2025 18:55:16 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v4 0/5] memory: tegra: Support EMC dfs on Tegra186/Tegra194
Date: Mon, 27 Oct 2025 13:55:14 -0500
Message-Id: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABLA/2gC/4WNyw6CMBBFf4XM2jF90Ia68j+Mi9IWmESEtKTRE
 P7dwsqNcXlucs5dIYVIIcGlWiGGTImmZ4H6VIEb7LMPSL4wCCYUZ4LjEvpoeaORnMNZYKPrzjd
 aKG0MFGuOoaPXUbzdCw+Ulim+j4PM9/V3K3NkKI1XsvXOWNte+9HS4+ymEfZWln98WXxuFWuV0
 N7X7Nvftu0Dn+4t7u4AAAA=
X-Change-ID: 20251021-tegra186-icc-p2-864fd8625699
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761591315; l=1748;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=OPvt99F5DI8O+iT4BI17Dc+l14b1OznNR3VbnyeaqsQ=;
 b=Nr/n+yY1mjz/exTaiaY8ZA9IqIn6PaykqB7k53hUVq5gQzhNArGrGAjrx78BVSCGw5OWYCi7M
 VpZiGUC9KcgDC8o/k6j879bXB+/7Ic0tyTQSXSpEEBp6pDhJpG5cGS1
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This series borrows the concept used on Tegra234 to scale EMC based on
CPU frequency and applies it to Tegra186 and Tegra194. Except that the
bpmp on those archs does not support bandwidth manager, so the scaling
iteself is handled similar to how Tegra124 currently works.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v4:
- Rebase on next-20251027
- Track naming convention changes on patch 3
- Link to v3: https://lore.kernel.org/r/20251021-tegra186-icc-p2-v3-0-1a50b526dd40@gmail.com

Changes in v3:
- Split series
- Link to v2: https://lore.kernel.org/r/20250909-tegra186-icc-v2-0-09413724e781@gmail.com

Changes in v2:
- Use opp scoped free in patch 3
- Cleanup as requested in patch 3
- Move patch 3 to the start of the series to keep subsystems grouped
- Link to v1: https://lore.kernel.org/r/20250831-tegra186-icc-v1-0-607ddc53b507@gmail.com

---
Aaron Kling (5):
      dt-bindings: memory: tegra186-mc: Add dummy client IDs for Tegra186
      dt-bindings: memory: tegra194-mc: Add dummy client IDs for Tegra194
      memory: tegra186-emc: Support non-bpmp icc scaling
      memory: tegra186: Support icc scaling
      memory: tegra194: Support icc scaling

 drivers/memory/tegra/tegra186-emc.c      | 132 ++++++++++++++++++++++++++++++-
 drivers/memory/tegra/tegra186.c          |  48 +++++++++++
 drivers/memory/tegra/tegra194.c          |  59 +++++++++++++-
 include/dt-bindings/memory/tegra186-mc.h |   4 +
 include/dt-bindings/memory/tegra194-mc.h |   6 ++
 5 files changed, 246 insertions(+), 3 deletions(-)
---
base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
change-id: 20251021-tegra186-icc-p2-864fd8625699

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


