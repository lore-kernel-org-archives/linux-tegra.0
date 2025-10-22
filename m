Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977741DE4DC;
	Wed, 22 Oct 2025 01:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761095399; cv=none; b=qp1mfuvi+MN7H8gerxu+AutV/zyylf76+f4c3Q3MjZC/nvw0Smhxj03wGdM+5wSbet2dOxdMaN+FK/EY0PJWJBPXKMqcymE7G/rgySDoIn0kzIzTk1cYRbJ2eB6Ut2wBdEJHekAvaQqYIE4vWggeLECNs66q6K0d1YKQcrgFfBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761095399; c=relaxed/simple;
	bh=iEZ3/OOtUYpUWb/Hmkq01MLpHrlFJVXHuEpAh10U1PU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gIXwrDYmq5vreh6Cy3OLF30jgfMa/Mpnz3m0+1k9dymrq/RNiO1QWaq+ADWh8FktGbhZJvs6mHo9Ug8xBKuKRO7FCW/6Jm4Z3+yfclZU7ilRE3q7ftsntT4eclDPFZNjOZ18G0tipay3pu0VwOEKyPuBIjkQUFXFIlx7P5Y/ADw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8+9eeGg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8+9eeGg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C2E3C4CEF1;
	Wed, 22 Oct 2025 01:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761095399;
	bh=iEZ3/OOtUYpUWb/Hmkq01MLpHrlFJVXHuEpAh10U1PU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=H8+9eeGgF8sRWzYXczPNXrsOTw6ScL0xfDA8iI5HunDBaB0WkfAlld0/JB+uUKhNj
	 BY4Uli72KDUGbZISUqviEbm0NX2UfGzT3o02IT/6R1529baZrhMVaIlRgVYUUY2gY2
	 In88KHW+md+/3qnJlhKbdNXLeupFLDK5yZGCF1Pmqp37htsXSoMCLNmRTQodJxMnGs
	 m48PTfauMYAbq1MizJKNbWdqcs/fHFad2ZJ0D0i7bfgVdZuKiWx94h9MnF/F+T6dNU
	 M4rZii/VaBzQAgx/rYDaGTxENKMbnaIt+RsuEmRWVHL5Ojv1Fm6UES/mBsjA5Qa1Y1
	 xLzQuFXUb9YNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E95CCD1A5;
	Wed, 22 Oct 2025 01:09:59 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v3 0/5] memory: tegra: Support EMC dfs on Tegra186/Tegra194
Date: Tue, 21 Oct 2025 20:09:52 -0500
Message-Id: <20251021-tegra186-icc-p2-v3-0-1a50b526dd40@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEu+GgC/3WNywrDIBBFfyXMulPUVNGu+h8lC6PGDDQPNEhLy
 L/XZt/lOXDP3SGHRCHDvdkhhUKZlrlCe2nAjXaOAclXBsGE5Exw3EJMlmuF5ByuArW6DV4rIZU
 xUFdrCgO9z+KzqzxS3pb0OQ8K/9n/rcKRYWu8bHvvjLX9I06WXle3TNAdx/EFWgQ8N64AAAA=
X-Change-ID: 20251021-tegra186-icc-p2-864fd8625699
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761095398; l=1563;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=iEZ3/OOtUYpUWb/Hmkq01MLpHrlFJVXHuEpAh10U1PU=;
 b=mkiUirVqrWeYiSErGm6C0HNaMXUx+3pFokbiZZExtqkZXd9vr2J5+pK4nop+RlQSa6GN3nWp0
 vkdg89lOyNrCXdLLQQGIcfbaqYaIAq+AToHDesRUb83qhyRcs2zl1LC
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
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251021-tegra186-icc-p2-864fd8625699

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


