Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D656E476045;
	Thu, 24 Sep 2026 11:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248786; cv=none; b=TtdAdBHlwQ8wFXYaVr9Zp4d0xVIosSim6f8BPzn39iBPgGYDTksaADNZ09XdZx+oxM1/ghpTwGT84rYtOt50FK9jwrsCErAyW41y982oMZCDSaRr3mHg22LNXrLIDc6sPKBssy2QLY1RoeF0DKU7rb3o2UU2zoXaGBtpiYo7fx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248786; c=relaxed/simple;
	bh=xne99fIg1eHNEi/3fzizDiVwnWQgKjB/aaKHaEhU60I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eOiIUY575NeUCpKCleABUPKiAV/Cb9IFVO3nprPQuDGAxDdF5McvQxfSpzwVYOCWpG5miWyot11hF6TM98w1FrTAknODl883mEcZF4DcPvBv3gKniY+RiJDtL7fPM/prrTY4ujKEMsEm22omC7xVcMy0UmvIKLx6f56xZ/P+qgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SVcY+xOs; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SVcY+xOs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=M8
	sgqMtKOkJNxptGJB3po9Dr10HGc07N+AeeiZtfcDA=; b=SVcY+xOswBMn8AVKMi
	zJX0Uo52WAMr/Cre1UBSlwoC2jNArh8rXKBu9heQ16WJSqhuMsl3hMIKRGD0/3Mk
	nsWOx095JVpNRIToPzdI6t0/eY4AJtst0PE4TOeckjbOLFJ6wm65DD188pX5Jwxd
	3N6WpDDqmRqEBQmMVoBE4p4RA=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3H4YqB7Vqww4oAg--.65098S4;
	Thu, 24 Sep 2026 19:19:17 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/4] pinctrl: renesas: rzn1: free maps on DT map failure
Date: Thu, 24 Sep 2026 19:18:50 +0800
Message-Id: <20260924111856.622898-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924111856.622898-1-yaojiale02@163.com>
References: <20260924111856.622898-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H4YqB7Vqww4oAg--.65098S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4DJw45KFyUXF1rAFWkJFb_yoW8JF4xpF
	s3GFW5Ar4rGws2gFWftw1xXF9xua97try5W34UK34fZFsIyrn2yF1a9FWYyrsYkFWfAr1a
	vr43Aa4rC3s8J3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRnqXQUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhXWEWq1BzUOXAAA3j

rzn1_dt_node_to_map_one() appends mappings for each DT node.  If a
node fails after map storage has been reserved, the top-level callback
returns without releasing mappings built for the current and previous
nodes.

Free the accumulated map and clear the output parameters on every error
path.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/pinctrl/renesas/pinctrl-rzn1.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/renesas/pinctrl-rzn1.c
index fb874867dbfb..1b977504d26e 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
@@ -411,15 +411,21 @@ static int rzn1_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	ret = rzn1_dt_node_to_map_one(pctldev, np, map, num_maps);
 	if (ret < 0)
-		return ret;
+		goto err_free_map;
 
 	for_each_child_of_node_scoped(np, child) {
 		ret = rzn1_dt_node_to_map_one(pctldev, child, map, num_maps);
 		if (ret < 0)
-			return ret;
+			goto err_free_map;
 	}
 
 	return 0;
+
+err_free_map:
+	pinctrl_utils_free_map(pctldev, *map, *num_maps);
+	*map = NULL;
+	*num_maps = 0;
+	return ret;
 }
 
 static const struct pinctrl_ops rzn1_pctrl_ops = {
-- 
2.34.1

