Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47242701CF;
	Wed,  9 Jul 2025 07:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752046651; cv=none; b=mc+cXppSSO4BCexXku9ipRv9D1Nzln/4HcucpX283PA5VUsyLiu8C7XoHWh7Cd+ChgoF+ZcoGQdx81LCnm5GdPlcpp6AjKyaWMvvgO1rvRxUzB/SZFRkKpSTGrb6Or/cCsUsCejBsYGYH0hhpGL/Qf24CnujxO+XMaRuKy7TSSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752046651; c=relaxed/simple;
	bh=IjSrjdNtmHL+N2O99cfJAn4xL9zLPbOT/G/24/kQF2g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KqJuKHJyOjjZkDis4+OjGZqxBzPFUlGLc0cszug8/DQTQyu4qckdIy+inyqjnH+TuotsAumR4aujr0r+V0h9RRrZn2nNlm1cQwYpm1cmSN/ajt3qu/90n6bSGwmj8mBVBpppMxb+QyrB730CgLwfPBt2QxsrnukYn3El/KGbjhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8b232ad25c9711f0b29709d653e92f7d-20250709
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:671cc0ad-07af-4dc5-93c7-30c2cc216fa8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:c4ef1a4188eeeec107fe2f569979e5e6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8b232ad25c9711f0b29709d653e92f7d-20250709
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 228079291; Wed, 09 Jul 2025 15:37:19 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: pdeschrijver@nvidia.com,
	pgaikwad@nvidia.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 0/2] clean up in tegra clk
Date: Wed,  9 Jul 2025 15:37:12 +0800
Message-Id: <cover.1752046270.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1.Fix error handling and resolve unsigned compare
2.Make tegra_clk_periph_ops static

Pei Xiao (2):
  clk: tegra: periph: Fix error handling and resolve unsigned compare
    warning
  clk: tegra: periph: Make tegra_clk_periph_ops static

 drivers/clk/tegra/clk-periph.c | 6 +++---
 drivers/clk/tegra/clk.h        | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.25.1

