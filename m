Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D497C1E50E;
	Fri, 29 Aug 2025 01:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756430200; cv=none; b=Al0MR3AJrtSNQB0sT1xGGxOpzzS4vRd31AY40j+pVR71jA0onWAvAiaJU/XJZgyYIByY+hzaZTJMIHD8BlpElGTfEO7zyMwZc5V0X2ZWMErhIH/gKNRCqliCIK1VJX/OsHxqeASehRMLcfnjINyWwgcLKUAor26sW/8MqEmLJI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756430200; c=relaxed/simple;
	bh=jyNEnstPpCxpbVZvmvw4NKKFu1d004FKb28fyp+CFGs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lD2tA21EayqmgzBYeEOtCt/KTxiN8bG8paTSVhK1YuPJ8Ng+yt3AApRpJTXWNyhcPIAPb2flsbGpf7awU88IJoC2/4tAdZuJEu+eD7p6apyRYO8DrJkM/WbTV7GPD2Tmdow9prILfasXis5kF6U3rltl6Rvp4f/I5joGyuPqszM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ca8b0a90847511f0b29709d653e92f7d-20250829
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:c6144118-40f8-4290-a542-c021c54fe52c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:6493067,CLOUDID:c35cdfd2d88bc5c26236ec2aee26221b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|50,EDM:5,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ca8b0a90847511f0b29709d653e92f7d-20250829
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1134852438; Fri, 29 Aug 2025 09:16:29 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: sboyd@kernel.org,
	thierry.reding@gmail.com,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] clk: tegra: super: Fix error handling and resolve unsigned compare warning
Date: Fri, 29 Aug 2025 09:16:24 +0800
Message-Id: <03d0c47832c7a0fdc19733d15077197ad2c54946.1756430095.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

./drivers/clk/tegra/clk-super.c:156:5-9: WARNING:
        Unsigned expression compared with zero: rate < 0

The unsigned long 'rate' variable caused:
- Incorrect handling of negative errors
- Compile warning: "Unsigned expression compared with zero"

Fix by changing to long type and adding req->rate cast.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/clk/tegra/clk-super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index 7ec47942720c..643b3cb83cd0 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -147,7 +147,7 @@ static int clk_super_determine_rate(struct clk_hw *hw,
 {
 	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
 	struct clk_hw *div_hw = &super->frac_div.hw;
-	unsigned long rate;
+	long rate;
 
 	__clk_hw_set_clk(div_hw, hw);
 
@@ -156,7 +156,7 @@ static int clk_super_determine_rate(struct clk_hw *hw,
 	if (rate < 0)
 		return rate;
 
-	req->rate = rate;
+	req->rate = (unsigned long)rate;
 	return 0;
 }
 
-- 
2.25.1

