Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A79E270571;
	Wed,  9 Jul 2025 07:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752046653; cv=none; b=rBqQguLY3LOC4uLcu3Wz7klEiCxLHbkcje0E/2eVY9g4xCxgZm5fUF1lygIQy4v+0tel1bWy/MGJisowyaFN7NHQCZv+Gp7GQcw+2AFxB5+2/L6q9Z1DPOJMvDIMzdoem0VZqlr9USOLa6xqHC4pW20ybjV1xb8aG3X95/xmgIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752046653; c=relaxed/simple;
	bh=5Hw8uxVpG1hL8S1/m9wGfNL7FjeTsp4wejtoaL7KFio=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SwboTMP76FF/AOhLlH3NnzmAAdTCCIlZ7+NFIosds84LWEndd0LpZAQ0XT88qhxYh3E3jMW+XOmpFouECRYbXN2Z7XavV35O3SpjLqdqvR+E64sutTOoyT3be6X6B2hONfo3/pxOa+BtQO3tYOe42bUGThqKIzsohYXcINCfFTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8d86ccde5c9711f0b29709d653e92f7d-20250709
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:f5b0fa55-d4f5-4f00-b4f2-17c5ae71e058,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:6493067,CLOUDID:66fff60b5285348d44b45525df5bbab8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:5,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8d86ccde5c9711f0b29709d653e92f7d-20250709
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 718022128; Wed, 09 Jul 2025 15:37:23 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: pdeschrijver@nvidia.com,
	pgaikwad@nvidia.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 2/2] clk: tegra: periph: Make tegra_clk_periph_ops static
Date: Wed,  9 Jul 2025 15:37:14 +0800
Message-Id: <bda59ad46afae6e7484edf8e2f7bf23ceafe51e9.1752046270.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1752046270.git.xiaopei01@kylinos.cn>
References: <cover.1752046270.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce symbol visibility by converting tegra_clk_periph_ops to static.
Removed the extern declaration from clk.h as the symbol is now locally
scoped to clk-periph.c.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/clk/tegra/clk-periph.c | 2 +-
 drivers/clk/tegra/clk.h        | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index c9fc52a36fce..fa0cd7bb8ee6 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -132,7 +132,7 @@ static void clk_periph_restore_context(struct clk_hw *hw)
 	clk_periph_set_parent(hw, parent_id);
 }
 
-const struct clk_ops tegra_clk_periph_ops = {
+static const struct clk_ops tegra_clk_periph_ops = {
 	.get_parent = clk_periph_get_parent,
 	.set_parent = clk_periph_set_parent,
 	.recalc_rate = clk_periph_recalc_rate,
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 5d80d8b79b8e..9ea839af14bc 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -629,7 +629,6 @@ struct tegra_clk_periph {
 
 #define TEGRA_CLK_PERIPH_MAGIC 0x18221223
 
-extern const struct clk_ops tegra_clk_periph_ops;
 struct clk *tegra_clk_register_periph(const char *name,
 		const char * const *parent_names, int num_parents,
 		struct tegra_clk_periph *periph, void __iomem *clk_base,
-- 
2.25.1

