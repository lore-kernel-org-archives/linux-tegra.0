Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD7D39FCC4;
	Sat,  3 Oct 2026 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791016362; cv=none; b=oYv5Bi1hL7IScvlwDLHND59G7KkUCTP7qZbyn1JBLvG+TTeZW5AEkG90ks/fOPR9KgPPD2q8xeY47bFgVE8U3uMiagBkoWlCX6VuDiQVYkZEDHxJA7r06apBrUUqsCkQ3cUdiR71MpGIXpcaj3zsAf9H13tJHjYlzlgsSM9vAms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791016362; c=relaxed/simple;
	bh=8qOSFA2sJUv+KWHHvj42fQUNUgEEifG6QWugdgJf2bk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iKQhqajQWXPKc/Mb9OmX6XJ6WS3n/7GCebh+qNPxdmktK+zzo7xQb//met1VjanafkVCdkqNDxgNGXicJFryzsY18Ik2QcBLSeEW4oMWosPLR9IwfyXCGODyP+CKTtQ7wyUACm4xM7yXYQeJext1o69cYgb5C+FIMnJTpXagmwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dyZ6hlmR; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="dyZ6hlmR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=/u
	TRQAtLsELjQBXidvufTqqYcCEYm891ddHU7+TMhqc=; b=dyZ6hlmR8+xRnyV0w4
	r2XSqDobmjswlaPlC5SOzec8ffLlhp/GZlXj9HgMyjZTlWe4onXQiGNzR9Z66VF5
	6E9w/v0RGXsosQBkcRomNzMmzSH1psMdOlSFkHDjihHuXOVzaW+D2qpe9iu37m/X
	8lPuzi03AuptAuUJfHQD4vyv4=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3dzGDvcBqKMk7CA--.47308S5;
	Sat, 03 Oct 2026 16:32:11 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Linus Walleij <linusw@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2 3/4] pinctrl: tegra: xusb: free maps on DT map failure
Date: Sat,  3 Oct 2026 16:31:56 +0800
Message-Id: <20261003083200.459705-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261003083200.459705-1-yaojiale02@163.com>
References: <20261003083200.459705-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3dzGDvcBqKMk7CA--.47308S5
X-Coremail-Antispam: 1Uf129KBjvJXoWrtr1fAF1UCF17Ww4DtF1DJrb_yoW8Jr17pF
	4fWFy5Jrn8Jw4fGF9xJw47ZFy3Can3A34Uua4rK342vFs8CryDtF1UKFy8ZFWkCrWktr13
	ur15AFy7uFy5uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi8wIDUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQxdl2rAvYz8VwAA37

tegra_xusb_padctl_parse_subnode() can append mappings before a later
child or configuration operation fails.  The top-level callback currently
returns the error while retaining all mappings allocated for earlier
children.

Free the accumulated map on failure.  The caller ignores the output
parameters when the mapping callback returns an error, so they do not need
to be reset after freeing the map.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index c6a51bb21215..fb70f8aee56b 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -248,10 +248,14 @@ static int tegra_xusb_padctl_dt_node_to_map(struct pinctrl_dev *pinctrl,
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
+	return err;
 }
 
 static const struct pinctrl_ops tegra_xusb_padctl_pinctrl_ops = {
-- 
2.34.1

