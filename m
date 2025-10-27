Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DF8335062;
	Mon, 27 Oct 2025 18:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761591316; cv=none; b=EdZ+HbLIKCrHwD4l3b0xqSbPBcn7QFcShztQmJ4CU0gTn8dtdF5kqbPOx5Vie0lGgbseSmzLGx221IdxltcxbgsDO2coXzWCn4kpyyrpjPasoWB90WKF58JW1PlkxMZTU+qdAvez1OnXwExu87yS/9V6G6qRFjvPIbpNUEgMMm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761591316; c=relaxed/simple;
	bh=xGfi7N756BFoSPrY0lKVBtD8tN6LRZTUKS0ghi9+B4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pS9/Sxswxerp/P2NqGS+5aVXUczXTeSWuYNOAbKnOp4x4UEJ4ySGPUBu/QACC/dlvPnWi7VQfoVXdOodyyHyYIhco7EM/FhNDSfdTiR8SVJfIRjeueBFflp7srZ8vZ03DVcb9+bRmC8v4gmkgaT92RuOgS1UYBNE+sXtgQcAkds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWwoK5zk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWwoK5zk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87EB6C4CEFD;
	Mon, 27 Oct 2025 18:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761591316;
	bh=xGfi7N756BFoSPrY0lKVBtD8tN6LRZTUKS0ghi9+B4U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RWwoK5zkG1Uk9rjU1eip2EZ4xMwEefhKyd81QEpqldxtSWm34eH2Z9ijioKQcqbEK
	 RQk0ZdZxBH6WPcI8p/6vmLjpBscVqrQUpLt5YIqmGaOKx5gs7VtKiyG7hiZCrmAcAy
	 XqBHK5WdBHGdt0Skk5i1txazGxjdXhl+wtjlb50xMUVRs8fbfYeBYaSpsWJQJyyj3C
	 vR19efLlQvgQLl3GDDCkhO36uXVX9wlndcSYlWicseB/mHzavS9Vs1ood4XHaJhnCI
	 9CVrVRc4S8ucR95T2/4+63nRXq2LIcapFYdH+ZnZTfSrW92K2fQpPhp9JvTRW/lzvW
	 vaRsPUwQI43aA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71387CCF9E0;
	Mon, 27 Oct 2025 18:55:16 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 27 Oct 2025 13:55:15 -0500
Subject: [PATCH v4 1/5] dt-bindings: memory: tegra186-mc: Add dummy client
 IDs for Tegra186
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-tegra186-icc-p2-v4-1-e4e4f57e2103@gmail.com>
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
In-Reply-To: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761591315; l=816;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=PmMpfHWG2+f6l6AbTUSHWT7B2d2RhnPduQ58vW6+634=;
 b=DCAwwKCHzR6IuPhDAK5nK2GwE6NsD/XvQZiVIDxHGKZ9oSdjCJGUfI213KG24/chyyZg4nCuX
 UR41CgG/sFuAeePi2WuDQxhZj9ZflKFML4Om+Zwkb+JxvdZjcFBrwuK
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


