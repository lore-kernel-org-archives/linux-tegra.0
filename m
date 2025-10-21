Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD3F34A3AB;
	Tue, 21 Oct 2025 18:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761071388; cv=none; b=FvumKZNGOcT8S/obtKfdnB2JqGfJZxzYGZNCfekvSTKoafiSoZkW3Sq7S8Nypmq7BbbArcAuMyPXjTu1Y10woY17v3emACLxDYSl5tcO8wB4h4/OQr6Y5rnYxs32PzlLlkF/W2l5m2F5DkpBKqw5xvP0qoh9mC8Fu/r9YtQRcgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761071388; c=relaxed/simple;
	bh=daEGchRbrB82O1mBoWQ5N40AQ1EPwEMYN8krVbdjopo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QkBSdyCcDYiDoWIYXfksT7ZWG7ZRresnkSCZAQ4VWWP7ICcFYRB1kooMN3uuPIRoiT+oh4VxwNv+CN+dFqe1GVenpBGlFxcZgr90xQm+NfmsOG4sHjzr2v2IG2qFrxrYUMKmpeUrt8nNOoUNIxnvnQaPJaQ0RP+QCMW4KzrmXuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsGKt5pP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsGKt5pP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A6ECC4CEF1;
	Tue, 21 Oct 2025 18:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761071387;
	bh=daEGchRbrB82O1mBoWQ5N40AQ1EPwEMYN8krVbdjopo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JsGKt5pPP4c+LwHwMsImsngWt2sRFv84Q+XezXHCKiWuYS8Gt1wbKO6LqCpzK/bh6
	 4VbcYnW6PMrq1Sbjhge7J39BACtR5QCDAJzoAIku5h1ECg8n3ccCRqpW074BXiYAtv
	 RjjY6At9MMR88GCoulBrqrKxchUoYjxwQLguvh8t4HAANICqx4cjd5YVqkpZDbCxKC
	 EuMD3h6MtYofcpaz+S6zAF9rHw7kdDzGwivVLJvQ9qdWmApljiAQYPufl7xw6YZ0kN
	 6neHENZuIr3+I4jNFtPZZhOCsHgtkwTxkgeczBbQyGWTJ0pwIhZOMaQti3TdttrhNf
	 lDx4HJCA7Zb/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90034CCD1A7;
	Tue, 21 Oct 2025 18:29:47 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/5] memory: tegra: Support EMC dfs on Tegra186/Tegra194
Date: Tue, 21 Oct 2025 13:29:39 -0500
Message-Id: <20251021-tegra186-icc-p2-v1-0-39d53bdc9aab@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABPR92gC/x3MQQqAIBBA0avIrBvIIcW6SrQIHW02FRoRhHdPW
 r7F/y8UzsIFJvVC5luKHHuD7hT4bd0To4RmoJ6M7knjxSmv2lkU7/EkdHaIwVkydhyhVWfmKM9
 /nJdaP/Euh21hAAAA
X-Change-ID: 20251021-tegra186-icc-p2-864fd8625699
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761071387; l=1375;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=daEGchRbrB82O1mBoWQ5N40AQ1EPwEMYN8krVbdjopo=;
 b=ILWchI7y7cIlEiR6AA5tMPVLbFCIYiAPQLyfq+4Ktw+krK5CNPab8D2fnm/VrLzJjZkBY9QuE
 X0tkMdOO9ROCfQ+vmW9peQOJ+rfjsbQjW759arw3dqL5l2x8K6qVUTz
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

This was originally part of a larger series [0], but it was requested to
be split into smaller series.

[0] https://lore.kernel.org/r/20250909-tegra186-icc-v2-0-09413724e781@gmail.com

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
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


