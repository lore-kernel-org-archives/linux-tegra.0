Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A3A3A453F;
	Thu, 24 Sep 2026 11:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248781; cv=none; b=CyGqg7iYjoeim73eBv8b5H0g/96iLujIu6p1VrrLBvecyz6s6PVCDYMnYMJDIBVo6Moqbg+fw01VBCKodjlgHKyYUpcMQlFNDkNolheSDIio71ukyIyt58hYH9dQBB54wpmYEZh3hpTElZU4YNFz9wvFmPOqyHi7bgunk5CJIeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248781; c=relaxed/simple;
	bh=B8vWYnZrDLTzwrzCWpoUoJtfR7SitPQNj4/fAwaUPgA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a/E0t8Gjibft21dxST5HMcdzf3EodMeGiYkUMkhQHkWsyOJYj/ar+Al5gTATg8x4iCoJqgb85GtTgmpyTm6rzvq/PIeJJv9q14F3ZOsZrSkm8uQh1j9nqAHtLiVa+idGq/kCx5xtwMJV+1YngJbURW3zd6o8wXD+xeifsFEUYBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NBt/n6J8; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NBt/n6J8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=2a
	X84U/cA5fDGKDqwA38Y9Nh95J9RwDyNaqE1v6TiuQ=; b=NBt/n6J8hpfCm39AmX
	ioim09t5JU4t3RE0PYQetoja322gpsfYQaDxsgNkECkUCTEw1tovmFM4S4vToLVO
	5JRD8iKmZBuHOV1Eu/P43fYftyCSsEMWGapSUohka6YRIxNsRy1FDcxCXDtMZ/RB
	33bwgRYAXeSkGY+AJHmy90V9Y=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3H4YqB7Vqww4oAg--.65098S3;
	Thu, 24 Sep 2026 19:19:12 +0800 (CST)
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
Subject: [PATCH 1/4] pinctrl: sprd: free maps on DT map failure
Date: Thu, 24 Sep 2026 19:18:49 +0800
Message-Id: <20260924111856.622898-2-yaojiale02@163.com>
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
X-CM-TRANSID:_____wD3H4YqB7Vqww4oAg--.65098S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF13uryDCryfCrWDtF1kXwb_yoWfuwb_ua
	yrAryUJ34UGan09w10gr4fZrW0yF4UXr10vr1qqFy3C347Z3WUJrykZF15Gwn7Gr1fArZ8
	Jryjvw1FqryUAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiF4EtUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xDVEGq1BzCiNgAA3G

sprd_dt_node_to_map() reserves map storage before adding mux and
configuration entries.  If a later operation fails, the error path only
frees the temporary configurations and leaves the map allocation reachable
through the output pointer.

Free the partially built map and clear the output parameters on failure.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/pinctrl/sprd/pinctrl-sprd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index 16cf9d15f247..218ac5236e95 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -326,6 +326,12 @@ static int sprd_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 out:
 	kfree(configs);
+	if (ret < 0) {
+		pinctrl_utils_free_map(pctldev, *map, *num_maps);
+		*map = NULL;
+		*num_maps = 0;
+	}
+
 	return ret;
 }
 
-- 
2.34.1

