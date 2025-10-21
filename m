Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407D134A3CC;
	Tue, 21 Oct 2025 18:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761071388; cv=none; b=uPScXbwQO4iMCgf7Eii9Zs4ceusdTFx0WGAzj8GQGnymxlafkcInyR8dh+mgtwKD0gbfbD58TlUolFz7LA3tKtfC/nbK5PnKArDGSidYrGhdIrTyzSNyikedoXTTa2deObfN3EorwmnenYa3CaJMp5GJsZe/czrPPf9fAstnMvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761071388; c=relaxed/simple;
	bh=ldF0nGpWAR7TOjezYKVTTUArSP8PCCaKaY6s6ILTcfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MW9xE4plMhCv/6/vbASgvuKJebGNKz+RKX1rLbuyCMAVelJVrIsPbNU99ReHkZ7wZBmj2r3LMEmHu9d6WvZbfhAomldIDDnC927iPV749Z38uQl5ACOBq5dZYASM2V6gZbj/vKB8hCdwWixXw/aekSQFLEg6GKLCt7q2NKqGBn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p5LU1dF4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p5LU1dF4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA0DEC19423;
	Tue, 21 Oct 2025 18:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761071388;
	bh=ldF0nGpWAR7TOjezYKVTTUArSP8PCCaKaY6s6ILTcfE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p5LU1dF4iX0zOqX6aNQwLKF2xSd2jh1itOtfBKHhzf/rFAKLSo9P/14DBatdusE5r
	 Icy2TY0JVSjXPP65Nii5PznicD4XnAX5TSjnzsx6PdSyINbwTnyZpyJwjrp8zR1wzS
	 uSKiTSDEcUIsG6ladgodpk7gwwuLaINQPvjuNjeFcI2+gT0phN5DO45ozgalTeKETZ
	 o3lVfPHtlM/XmR1jYJp7SabDy/nVMryPvWIg2cAIUvFuOJAPJ/TqxNW0LlLF9R+XwM
	 1bMbzTfDlkq04bjZnFhVY4PyuoY0QNV8EFq7+MvdN62ZkqNe6LadCdPoDsOxtdWeQk
	 BlFYHw9YzJ52Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09E8CCD1AF;
	Tue, 21 Oct 2025 18:29:47 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 21 Oct 2025 13:29:44 -0500
Subject: [PATCH 5/5] memory: tegra194: Support icc scaling
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-tegra186-icc-p2-v1-5-39d53bdc9aab@gmail.com>
References: <20251021-tegra186-icc-p2-v1-0-39d53bdc9aab@gmail.com>
In-Reply-To: <20251021-tegra186-icc-p2-v1-0-39d53bdc9aab@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761071387; l=2712;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=LQh6Wx9w2ZA6cjZPbhQTpnWCKJr1fmEA9mYm4DrdFjk=;
 b=QSZ2Q9JQFbPUfVVdQ6u+jnYDhA+rMKvUIywVkiwRFXxy2daq0XAg9PgUJ0BBNdfUprFEKb0Lj
 y/ZhxkJkOEjCZV8K9pmHVq7gltXngduf0UorIYjX3mGw3w4M+IxawG7
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Add Interconnect framework support to dynamically set the DRAM
bandwidth from different clients. The MC driver is added as an ICC
provider and the EMC driver is already a provider.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/memory/tegra/tegra194.c | 59 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra194.c b/drivers/memory/tegra/tegra194.c
index 26035ac3a1eb51a3d8ce3830427b4412b48baf3c..e478587586e7f01afd41ff74d26a9a3f1d881347 100644
--- a/drivers/memory/tegra/tegra194.c
+++ b/drivers/memory/tegra/tegra194.c
@@ -1340,9 +1340,66 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 				.security = 0x7fc,
 			},
 		},
+	}, {
+		.id = TEGRA_ICC_MC_CPU_CLUSTER0,
+		.name = "sw_cluster0",
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA_ICC_MC_CPU_CLUSTER1,
+		.name = "sw_cluster1",
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA_ICC_MC_CPU_CLUSTER2,
+		.name = "sw_cluster2",
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA_ICC_MC_CPU_CLUSTER3,
+		.name = "sw_cluster3",
+		.type = TEGRA_ICC_NISO,
 	},
 };
 
+static int tegra194_mc_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	/* TODO: program PTSA */
+	return 0;
+}
+
+static int tegra194_mc_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
+				     u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
+{
+	struct icc_provider *p = node->provider;
+	struct tegra_mc *mc = icc_provider_to_tegra_mc(p);
+
+	if (node->id == TEGRA_ICC_MC_CPU_CLUSTER0 ||
+	    node->id == TEGRA_ICC_MC_CPU_CLUSTER1 ||
+	    node->id == TEGRA_ICC_MC_CPU_CLUSTER2 ||
+	    node->id == TEGRA_ICC_MC_CPU_CLUSTER3) {
+		if (mc)
+			peak_bw = peak_bw * mc->num_channels;
+	}
+
+	*agg_avg += avg_bw;
+	*agg_peak = max(*agg_peak, peak_bw);
+
+	return 0;
+}
+
+static int tegra194_mc_icc_get_init_bw(struct icc_node *node, u32 *avg, u32 *peak)
+{
+	*avg = 0;
+	*peak = 0;
+
+	return 0;
+}
+
+static const struct tegra_mc_icc_ops tegra194_mc_icc_ops = {
+	.xlate = tegra_mc_icc_xlate,
+	.aggregate = tegra194_mc_icc_aggregate,
+	.get_bw = tegra194_mc_icc_get_init_bw,
+	.set = tegra194_mc_icc_set,
+};
+
 const struct tegra_mc_soc tegra194_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra194_mc_clients),
 	.clients = tegra194_mc_clients,
@@ -1355,7 +1412,7 @@ const struct tegra_mc_soc tegra194_mc_soc = {
 		   MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
 	.has_addr_hi_reg = true,
 	.ops = &tegra186_mc_ops,
-	.icc_ops = &tegra_mc_icc_ops,
+	.icc_ops = &tegra194_mc_icc_ops,
 	.ch_intmask = 0x00000f00,
 	.global_intstatus_channel_shift = 8,
 };

-- 
2.51.0


