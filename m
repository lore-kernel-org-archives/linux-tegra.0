Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F9A46C833;
	Thu, 24 Sep 2026 11:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248799; cv=none; b=X844HrJFxSzMYIqFQ9Ks3rdJFqEJCYtJo+3528FPeiV6ILwIO/OOO2JS8Y13l5t0dcNdGxBg6SlYWSkNJmJwrM+4Ip+3FeNl7wvaHeqsB32NnZOictHuP/hnRqZJZHvOPbxG3JVr/Z7R9sEilKOZKzIwGa8CujSuFDFSdnDHgcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248799; c=relaxed/simple;
	bh=0HaiMLi3iRqkvKg5aqAv5bHM6NSjIqCJV1383n4k4Kc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A7x6HKs/Ju1OA5rrt38qPJ+vxsUYBK33W6NSYAFMdVxoiLAj6lwB6IZyNBGuvQuEyiirjD21JfW+acnhnsOrq2ZFSV3Gyc+wp5fx85/MfPmI06YiTI8jvnWwSAI8qwUxpMNxyc5Ti7U9ELWg5YbWFojRhIN7L1hbP51xWJhimv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nqVpby7e; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nqVpby7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ld
	hAs+yvQCDCAj/pdbHyJFW+HDyheD6368bwSEWyNfY=; b=nqVpby7elU6t/s6OQg
	TnK3n7WbZqAwHO8Qydbgi/g9lOkKmj8OA87JAH0IlVz3Rlk3muxpbzIp/YVKt2d2
	+vB1SOoZwYOdrIqGjj5IwQGMTOWqSj8i+bCUWF03Qw85OrddHKBUdd5S5PVBfRtQ
	6UlU93T8YmSCjVYUXPBsQgpzY=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3H4YqB7Vqww4oAg--.65098S6;
	Thu, 24 Sep 2026 19:19:26 +0800 (CST)
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
Subject: [PATCH 4/4] pinctrl: samsung: free maps on DT map failure
Date: Thu, 24 Sep 2026 19:18:52 +0800
Message-Id: <20260924111856.622898-5-yaojiale02@163.com>
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
X-CM-TRANSID:_____wD3H4YqB7Vqww4oAg--.65098S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7KrWrJFWkWr48Aw45Zw17trb_yoW8Ww4Dpr
	s3WFZxJF4rJFn3GFWft345ZFy3Za1ftrWUWayjg34UZFs0yFnrZ34UKFyUZF1qkrZ5Xr4S
	9rZxCFyYkayYq3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRvApnUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzR7YE2q1Bz6VTwAA3k

samsung_dt_subnode_to_map() can reserve map storage before adding
configuration entries.  The no-child path returns its error directly, and
the child path frees mappings without clearing the output parameters.

Use one error path that frees the accumulated map and clears the output
parameters for both cases.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 26 +++++++++++++++--------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 5ecc9ed4c44d..4b202fbbcb80 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -259,22 +259,30 @@ static int samsung_dt_node_to_map(struct pinctrl_dev *pctldev,
 	*map = NULL;
 	*num_maps = 0;
 
-	if (!of_get_child_count(np_config))
-		return samsung_dt_subnode_to_map(drvdata, pctldev->dev,
-							np_config, map,
-							&reserved_maps,
-							num_maps);
+	if (!of_get_child_count(np_config)) {
+		ret = samsung_dt_subnode_to_map(drvdata, pctldev->dev,
+						np_config, map, &reserved_maps,
+						num_maps);
+		if (ret < 0)
+			goto err_free_map;
+
+		return 0;
+	}
 
 	for_each_child_of_node_scoped(np_config, np) {
 		ret = samsung_dt_subnode_to_map(drvdata, pctldev->dev, np, map,
 						&reserved_maps, num_maps);
-		if (ret < 0) {
-			samsung_dt_free_map(pctldev, *map, *num_maps);
-			return ret;
-		}
+		if (ret < 0)
+			goto err_free_map;
 	}
 
 	return 0;
+
+err_free_map:
+	samsung_dt_free_map(pctldev, *map, *num_maps);
+	*map = NULL;
+	*num_maps = 0;
+	return ret;
 }
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.34.1

