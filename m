Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D3734A3BA;
	Tue, 21 Oct 2025 18:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761071388; cv=none; b=sn1m0OziO099NUbL4T7DcbsbperzQzsstqLlromiBrpWoiRgSPqc/rXt2I9AY37y52hZGggWGyqtPjXf9tnrVybR+0HGe55MQJ3nTDJ5YaQ6gFnuFpz0J1R3XIKQPQGxY2mM13p4MTSTnZc/PupnTXYuyl8yXQ0/O5EPmQkG9ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761071388; c=relaxed/simple;
	bh=xGfi7N756BFoSPrY0lKVBtD8tN6LRZTUKS0ghi9+B4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IwjyYEFmyAfsDeJ33gNA0By6bI7FAoI7+mZnnMdtbF9ouj990jGew4os155/TAI+C1WmmNmGRHnk4OR1QbNA+SqJHJXDtXDwG6F0cmon3KZxPR80PL4du617jdU/wCI5htCNjTvPJh8R1i1Mz/shSUZ1vMQKMVqUGSkA0pYir+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPtaE92m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPtaE92m"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3EA7C4CEF7;
	Tue, 21 Oct 2025 18:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761071387;
	bh=xGfi7N756BFoSPrY0lKVBtD8tN6LRZTUKS0ghi9+B4U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aPtaE92mwRazhWUYAp6vS6dkdm+YzDDP7yUmqBtFNjuhWWOV3xVcGPm8QtMcIcP0H
	 BAMpfTFNhwMJSOqyY1bevz3Lbrp7MX2sQ9pqqSYyQ7Is+Frp5Cb1cZbSbeAWlvfkoi
	 dhZGC5iowAMsjj+hwoDf++rlkgiEukVGV62eeM5NZrCyrhnTllPe64Gkuz6PZUCy3u
	 9HEgVQlXw7GNaxRgDFXxCcy+TKGYdmDXBaDXgQSM5gXsXeLkkOXoFCNMHYvR1bzaj/
	 jRbD+NedCkRGxYl+FxpUX4LoJiT//jB2S3Jp2bDEyQEuqBh771zF26AW+4rq54w6L+
	 tQLBt64wmQ0Iw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0247CCD1AF;
	Tue, 21 Oct 2025 18:29:47 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 21 Oct 2025 13:29:40 -0500
Subject: [PATCH 1/5] dt-bindings: memory: tegra186-mc: Add dummy client IDs
 for Tegra186
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-tegra186-icc-p2-v1-1-39d53bdc9aab@gmail.com>
References: <20251021-tegra186-icc-p2-v1-0-39d53bdc9aab@gmail.com>
In-Reply-To: <20251021-tegra186-icc-p2-v1-0-39d53bdc9aab@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761071387; l=816;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=PmMpfHWG2+f6l6AbTUSHWT7B2d2RhnPduQ58vW6+634=;
 b=D8ljeun3vfFLelIQsNfoHL3K30Pvz7Pw1rG/qOKJSSontzCyHz5w8fte/uNxZTLxARSDTiju3
 sQdi+hN3lGKDhgzD7Xz9uYdSbcyKclfoR/RoxGKtcqiccqIEiAKJCLG
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


