Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B9E47532F;
	Thu, 24 Sep 2026 11:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248802; cv=none; b=WPAcaHur+NJ4kLnVLHDfyFN5yUpaWA8BhAQmUb/k3hIlyYFDwdexooEKCp36cSj24Gb6B8OpnWzvUgYczcuHgG6pJ0HZU/3wnfjphUuVcxUQvvgQx4OKRjEuvYNH/XyopzOLD/x5V6W8DeKZKhXGJPEeJqdOo56eIyQiph/Oxkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248802; c=relaxed/simple;
	bh=Vysm+icGgK7H4xcGeRUT6Ch0LBzrulaifTQ3FyHrP3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=brUNNbaXjsr2HxWVD4mKejDxeLSre+beb6xkhFuftaNk7iXWgRowOM/PqMG/T6I6Hb64D6L5x425zVR3Amv11mHeT8kQtQ4rYm7rgSOio37KMMpoOdUib0+wOoe96EcAD7IcwqE9fUreXWOHDb8Tesv08FPSXm6JT91B1llUV/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QfuNysFB; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QfuNysFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Lb
	x9oOJe1vCt74S61mr2+KNKZUBRXoORtffgn7/9dpc=; b=QfuNysFB0RpLuj8h9T
	9jmEx2jeP5//DPVPjeOBrJLAt6f/MmGHgHlCz+7L0Tx7A+XZFEvwdrIfkWF10JQQ
	tXYY1MO+R2/yRwYxsppdQMRpRTdP4Ui2HAnxrZK78LxZ2jlFVJZfkqEMKHSknbZD
	2MKnvsuylfq1qkTLopSMwLT8c=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3H4YqB7Vqww4oAg--.65098S5;
	Thu, 24 Sep 2026 19:19:21 +0800 (CST)
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
Subject: [PATCH 3/4] pinctrl: tegra: xusb: free maps on DT map failure
Date: Thu, 24 Sep 2026 19:18:51 +0800
Message-Id: <20260924111856.622898-4-yaojiale02@163.com>
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
X-CM-TRANSID:_____wD3H4YqB7Vqww4oAg--.65098S5
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1fAF1UCF17Ww4DtF1DJrb_yoWkArX_CF
	W5ZryUJryUKFWUua4UKF1fZFyIkayjqr1S9rZYqF9xC34xXw1DArykZr43uw4xWw4DJFyf
	Jry3ZF1fZr4xujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRQXo2JUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BrXEmq1BzqmBgAA3t

tegra_xusb_padctl_parse_subnode() can append mappings before a later
child or configuration operation fails.  The top-level callback currently
returns the error while retaining all mappings allocated for earlier
children.

Free the accumulated map and clear the output parameters on failure.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index c6a51bb21215..8873d7068867 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -248,10 +248,16 @@ static int tegra_xusb_padctl_dt_node_to_map(struct pinctrl_dev *pinctrl,
 						      &reserved_maps,
 						      num_maps);
 		if (err < 0)
-			return err;
+			goto err_free_map;
 	}
 
 	return 0;
+
+err_free_map:
+	pinctrl_utils_free_map(pinctrl, *maps, *num_maps);
+	*maps = NULL;
+	*num_maps = 0;
+	return err;
 }
 
 static const struct pinctrl_ops tegra_xusb_padctl_pinctrl_ops = {
-- 
2.34.1

