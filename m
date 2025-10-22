Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ECC1EEA31;
	Wed, 22 Oct 2025 01:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761095399; cv=none; b=PpjQazka5MdmMnXKsHIZoL8oeUTiB5T3n/odPiXvp3QFLUGwjIuXEeKiSY4XcoxV3jJ8m2dbSXYbn0bDRCbSp/N1Z50BnJSTObSKzezTzCY1NhC83HTuJGL+b1nAGFiqVwEG2qTp3NsQOQQokMpmqzKyt3te1dEdFjeflYNUAXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761095399; c=relaxed/simple;
	bh=g2mmajcxbCrl4r+56yYrwyyJINURxPSPFab71xwisCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TSuILzCI8I9IFgcmVTyGJYjOul0Gilj7Jr1iSSc/t1s79QMQDdYWsFY/+EGg1nVFh1k+v7OA9wVnriSx8PYP3xBpkWI+NtSR7BFpJS5L7Yd0AfzNRjFNUHDXf+UuL4k3Q+gEn1rEkt372Y8dmcwCqXYvZuLUXTvwLqC3Xw50sGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YH8TU+sx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YH8TU+sx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6044FC19421;
	Wed, 22 Oct 2025 01:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761095399;
	bh=g2mmajcxbCrl4r+56yYrwyyJINURxPSPFab71xwisCM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YH8TU+sxkBoYm96QxliVTx9+0HsD7MlJuDo5jsNdFgmVtHMMPEcKjbcumJWDNO6Ds
	 +fo3UlUojJGIjP9zQOmR5XCcDKT7MsmxHdl+yZfq9oizL15mSazwRfMe+57QDvURcC
	 yb/wAyXhVQk5RnOxQVo9IXxS6VtGoZkmgepqdyZuIE5hmIeZd3doY7FdikoBrV7dVf
	 4tf1/UOG/VJ5r3KliNN2+KG1TToV81WFLTSusKtqtkK+ir1xCV4A8HE1C9858vt9fe
	 4K10owpguhbCDb40lHcInnlivHIbF41q+B5/AfHy58k/z9Sh1LMkA+/T5pFdD5qrm2
	 dtKE2MoCWiyzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57487CCD1BF;
	Wed, 22 Oct 2025 01:09:59 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 21 Oct 2025 20:09:56 -0500
Subject: [PATCH v3 4/5] memory: tegra186: Support icc scaling
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-tegra186-icc-p2-v3-4-1a50b526dd40@gmail.com>
References: <20251021-tegra186-icc-p2-v3-0-1a50b526dd40@gmail.com>
In-Reply-To: <20251021-tegra186-icc-p2-v3-0-1a50b526dd40@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761095398; l=2383;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=a/aaiaGuHyMc5nlB9Xe5+rxhKDOKwn8mtxYy/DM7ELQ=;
 b=Yk5YsCNB6DiGET9qss2G+OM4WNG9CCpvOykJIfkiuDJjupA84uwgWW/mnIG1ZA8bGtI2rbJIQ
 iUoAGxnJLSvDkzHOF2CCMybUIf5iIx/DjAN61yKHYxiIqvT7GARcEWv
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
 drivers/memory/tegra/tegra186.c | 48 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index aee11457bf8e032637d1772affb87da0cac68494..1384164f624af5d4aaccedc84443d203ba3db2c6 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -899,9 +899,56 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 				.security = 0x51c,
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
 	},
 };
 
+static int tegra186_mc_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	/* TODO: program PTSA */
+	return 0;
+}
+
+static int tegra186_mc_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
+				     u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
+{
+	struct icc_provider *p = node->provider;
+	struct tegra_mc *mc = icc_provider_to_tegra_mc(p);
+
+	if (node->id == TEGRA_ICC_MC_CPU_CLUSTER0 ||
+	    node->id == TEGRA_ICC_MC_CPU_CLUSTER1) {
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
+static int tegra186_mc_icc_get_init_bw(struct icc_node *node, u32 *avg, u32 *peak)
+{
+	*avg = 0;
+	*peak = 0;
+
+	return 0;
+}
+
+static const struct tegra_mc_icc_ops tegra186_mc_icc_ops = {
+	.xlate = tegra_mc_icc_xlate,
+	.aggregate = tegra186_mc_icc_aggregate,
+	.get_bw = tegra186_mc_icc_get_init_bw,
+	.set = tegra186_mc_icc_set,
+};
+
 const struct tegra_mc_soc tegra186_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra186_mc_clients),
 	.clients = tegra186_mc_clients,
@@ -912,6 +959,7 @@ const struct tegra_mc_soc tegra186_mc_soc = {
 		   MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
 		   MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
 	.ops = &tegra186_mc_ops,
+	.icc_ops = &tegra186_mc_icc_ops,
 	.ch_intmask = 0x0000000f,
 	.global_intstatus_channel_shift = 0,
 };

-- 
2.51.0


