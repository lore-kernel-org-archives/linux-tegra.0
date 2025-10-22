Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9771D1D5CEA;
	Wed, 22 Oct 2025 01:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761095399; cv=none; b=hjntHNh0JmCy5S6GKDg5FOQp6ZLc12Vv8sVxePUz75NBCo89Pe4N7Cjh2MMk+9Xbq/6wR5m3XJ4jyXAL+nByQG2LiON6fqNsdzArIqlQ1t8lmHV4RgNWc64SOOFRCnz1iZIrImdUdC1LMOGiBTa6YTcvW2eiW2ZSFYqIZ30yTCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761095399; c=relaxed/simple;
	bh=xGfi7N756BFoSPrY0lKVBtD8tN6LRZTUKS0ghi9+B4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kjrBmJYY4eR51j6lg6ie2Mo5rlsAgZ3v15eHma5TJs14sukEnbAbEqUwwRATmfsQ20AXn/WfUJNA7LzGis9jimpn2wm9ezXcFVrZi/+k17g4H2YsGtHlQDOBKUAunoz67act4vT9zmLxkvTTtMcAXuedU1GRWTRPMekvhFpGpZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozSYO9pK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozSYO9pK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 317ABC4CEFF;
	Wed, 22 Oct 2025 01:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761095399;
	bh=xGfi7N756BFoSPrY0lKVBtD8tN6LRZTUKS0ghi9+B4U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ozSYO9pKSb0ii4Kxc7j02XGSwZ5ranSwqV0KYTdfVPGqXgEMEb+4+gKJ3mHbNpPz8
	 q41fu6D8DyGi8TePeWBOrPc5BWvs4eAa28R5pA1F+SUKCzQnrFWBk9q1O4EXxRy7k9
	 z59HA85uBU6LOy8b6SN0XYpckbFWVzXeEspa/5xy1COuW+VKYrJNiDzGsxpwI1sqwI
	 UTaJbwfdVdXu8FL6WTROdYZ9z2z0LiChWnX0QKx2vjTHi29U+GvSBBdRsyyd3t5aNM
	 DPJ4FGI7vpVnjZ7xv4auq2GzSCQ6mS1AgVnljzMkXga4hpX06FVPly278yGKEleZg2
	 WHGNARiPyIwHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206B8CCD1BC;
	Wed, 22 Oct 2025 01:09:59 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 21 Oct 2025 20:09:53 -0500
Subject: [PATCH v3 1/5] dt-bindings: memory: tegra186-mc: Add dummy client
 IDs for Tegra186
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-tegra186-icc-p2-v3-1-1a50b526dd40@gmail.com>
References: <20251021-tegra186-icc-p2-v3-0-1a50b526dd40@gmail.com>
In-Reply-To: <20251021-tegra186-icc-p2-v3-0-1a50b526dd40@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761095398; l=816;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=PmMpfHWG2+f6l6AbTUSHWT7B2d2RhnPduQ58vW6+634=;
 b=hJmB/Gxo2ATmMQCkbH8lwMDDgE1IkcWS2KcJwh3LXh2R3q8Sya6o1LEXeoyx4ptbew/KF56u5
 TKkg1YAJzcMA94pMHUTBfpTVRglYyZC5V/FWyXfbWyY7BoPj7uPRmjC
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
 include/dt-bindings/memory/tegra186-mc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/memory/tegra186-mc.h b/include/dt-bindings/memory/tegra186-mc.h
index 82a1e27f73576212bc227c74adff28c5f33c6bb1..8abbc26f3123aad2dffaec6be21f99f8de1ccf89 100644
--- a/include/dt-bindings/memory/tegra186-mc.h
+++ b/include/dt-bindings/memory/tegra186-mc.h
@@ -247,4 +247,8 @@
 #define TEGRA186_MEMORY_CLIENT_VICSRD1 0xa2
 #define TEGRA186_MEMORY_CLIENT_NVDECSRD1 0xa3
 
+/* ICC ID's for dummy MC clients used to represent CPU Clusters */
+#define TEGRA_ICC_MC_CPU_CLUSTER0       1003
+#define TEGRA_ICC_MC_CPU_CLUSTER1       1004
+
 #endif

-- 
2.51.0


