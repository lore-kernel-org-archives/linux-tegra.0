Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B998C2D5412;
	Mon, 27 Oct 2025 18:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761591316; cv=none; b=RcpQVzqE0A908vNDcOZ8n0/P2EaarpDU8GoT4SlxjXi2V3el6LIV1SQA9XzOKPZsp8KHuEyR1+Y/W3MoIMaZtEjdcKsSEmuD0MBbkyDK6BQkUfsgSvnQdpmIldK72v2XhxORiEOJHM0p4bt8pBv4XiYYEG6MUYTrezGbljkmHWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761591316; c=relaxed/simple;
	bh=/JgzL9VdvfstUomPfZ32E6t/L8VPBz9Fmo+sGuWeS+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9gRFL+hb6OGGf2ylBuSAjxAANkLIStIi1NnTrfuS8HA+MAAn6fVeqNpJ6XJSM4D3SOCDIh8nOsYoyECgbGjln8nNYkp3Qsi9CcrInMfhkNBRWmMpc9IzSt1muIqipMvUJfk6bjf0MKM543TfUBux/k6Anev7V2SdIgXNk2OnqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubVARB1N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubVARB1N"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E7E4C116C6;
	Mon, 27 Oct 2025 18:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761591316;
	bh=/JgzL9VdvfstUomPfZ32E6t/L8VPBz9Fmo+sGuWeS+8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ubVARB1N1cC5DCPMes3iFI6FUhFu48KtuLTjdhD+8kC7wRUNqciEECyp+S+f69rtv
	 8pj9uqO9r9LGQ6yxtfD5Y/mSpUJ0gjPlFdSGTuwj3XAU3KcOby9ZpgX5r+53BVX0nz
	 LpGQNbUAQ+exzXikFFONkrO7aBStVDbhu1e6BaJB0TpEY0aIb1nYj1+hMMXVMOZlIx
	 ez5XZv/mAhxPxgW/TSrXS3wpRDdMUb3cimk0azCWoD80yC7gbiHDyLZv8VUesElSBW
	 mdgZPqB5y0DQOVPqKzbU4KgGPIH7Z1JbWdkUjTRjLHKfkkQ+GyJyPSe0QuCL3QjwPY
	 tDYJzaNkd0XNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDD1CCF9EE;
	Mon, 27 Oct 2025 18:55:16 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 27 Oct 2025 13:55:16 -0500
Subject: [PATCH v4 2/5] dt-bindings: memory: tegra194-mc: Add dummy client
 IDs for Tegra194
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-tegra186-icc-p2-v4-2-e4e4f57e2103@gmail.com>
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
In-Reply-To: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761591315; l=911;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=7znC8jN7FMo0ABLPSWxCMceZ2XZ3qZ4hFMoMP46i7rM=;
 b=oryh/jK+ksBPgI6VSObtoe4KCUaO7ft7IuD8IPULagCDjjkYuvzb7vyOCDkex8WU5EyIc41mj
 iFg9Ln6T2s4DScGt58Ju30dSVzFEQtLLIy6zko5QOIkMMMj5S48JXpP
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


