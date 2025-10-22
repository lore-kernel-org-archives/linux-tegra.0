Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5F9136349;
	Wed, 22 Oct 2025 01:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761095399; cv=none; b=D0p8OaPF9i6ZswO0sfwoMnG3bJUcLaH3MvF2giBP+hIX6dbjJ9T6mQ8fMnB7l+4qIMmJsW53wryIxki//+fLbrB6lNK3MM+ZVL4JJBFmHU/eExMHqpySHcGsVAV7HxCMw80ZT7B+wSqybijov3eHxvu99QVgXhDx+5J0Nx4spwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761095399; c=relaxed/simple;
	bh=/JgzL9VdvfstUomPfZ32E6t/L8VPBz9Fmo+sGuWeS+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFqqumq7UDtQoKPUM2FOOdwwvRnXbaqFQud9ANLH41aYpyRSCwmS+RCwaBxE/cXFlTdI0WLOnWyi5DyXmDALsWUeeofRAVVS5hO6GSczV09K5QvpAda0Wd7E16r4lHzympdRqz/6ja5O/XpMy/1M5G9IWu/L0ZLJ7HmtROyXGT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XsDmbcPW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsDmbcPW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 403CAC4CEFD;
	Wed, 22 Oct 2025 01:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761095399;
	bh=/JgzL9VdvfstUomPfZ32E6t/L8VPBz9Fmo+sGuWeS+8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XsDmbcPWf9PtkZ4+HXuTibHRnuCasneXPr+73qvmeJA8H0gDqiDBLklZg61LOx9LE
	 L50p1bgzRNFd8i+3ktAODe3rq4kSNz+uuY4bqUg2yhYD66Tfonam9bgZ7Bv+iGDm2x
	 GTfqlh3TdDVluWhsY+ubetjn+0syZUVqykTN8RcjtNAZOFZJrIoRFw8Lmy4I8e8DBU
	 Jr1iDNMZsn6qnhFbO8ef6XU5LYyURBP8qgOpGGKCOXMtxfp6uzv8Si4IhI2qTF7gje
	 YnwE4SZQ79/sWfRKQdDnAsoZNxG40n15B+jkjZel4ipslunokkfa4izjcSII4ZfFNv
	 B7Amp2w6yMdww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B86CCD1BE;
	Wed, 22 Oct 2025 01:09:59 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 21 Oct 2025 20:09:54 -0500
Subject: [PATCH v3 2/5] dt-bindings: memory: tegra194-mc: Add dummy client
 IDs for Tegra194
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-tegra186-icc-p2-v3-2-1a50b526dd40@gmail.com>
References: <20251021-tegra186-icc-p2-v3-0-1a50b526dd40@gmail.com>
In-Reply-To: <20251021-tegra186-icc-p2-v3-0-1a50b526dd40@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761095398; l=911;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=7znC8jN7FMo0ABLPSWxCMceZ2XZ3qZ4hFMoMP46i7rM=;
 b=D3kzh+visaH5xzA16ZAhNfW7fT4Giy6y5K/zijJL1uhkaobbVmfO3naTEutehIGYMGEvzF6iS
 2rvx8xZQ/7SBS6kbcCdwe2tpfjtorXBMu8HmTUZSvMYiiPmx02LvWhR
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Add ICC IDs for dummy software clients representing CCPLEX clusters.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 include/dt-bindings/memory/tegra194-mc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/memory/tegra194-mc.h b/include/dt-bindings/memory/tegra194-mc.h
index eed48b746bc94072a6bd0af7f344dbb6f6618859..a7d97a1a470cd3cfb18c7ef45c421426ea3c7abf 100644
--- a/include/dt-bindings/memory/tegra194-mc.h
+++ b/include/dt-bindings/memory/tegra194-mc.h
@@ -407,4 +407,10 @@
 /* MSS internal memqual MIU6 write clients */
 #define TEGRA194_MEMORY_CLIENT_MIU6W 0xff
 
+/* ICC ID's for dummy MC clients used to represent CPU Clusters */
+#define TEGRA_ICC_MC_CPU_CLUSTER0       1003
+#define TEGRA_ICC_MC_CPU_CLUSTER1       1004
+#define TEGRA_ICC_MC_CPU_CLUSTER2       1005
+#define TEGRA_ICC_MC_CPU_CLUSTER3       1006
+
 #endif

-- 
2.51.0


