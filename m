Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC3F1D67A2;
	Mon,  2 Sep 2024 11:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725277309; cv=none; b=rq1UfiTcotoTuKr/5oYSWXlPhjSKU7h/XXkfSubBa4wf7V/0rTcWzTd609eRXV87gFJqaRTqBXB56KDWiI0teEMv5z2pN1l03rZdEnnpzVU83cVyg2smZcZ78UQlqoeobjOebAwt9DHHCpx1m2rfqsdGiXqNZeogE8+UdEdV8Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725277309; c=relaxed/simple;
	bh=LRTU6NwYh8SvJMmamqmCgEQUmwP75SVobR9GJAa41os=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PuEEjccTsbfw+epfLFEZ78N0mYLTZVzjMGhZAVTNrcGawsTdFZJXbo6OFgQZtcKSWr2B5vX1A4gf6Sqyp7WJi87Qb6gmlM1JovM70XjUR7LPXk7Cyen++ONGB41Ndtg902QL7/itbDWujCX6M2i2UeordrgThKkXRt1tnzBax7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wy6D12r3Kz20nNN;
	Mon,  2 Sep 2024 19:36:49 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 516691A0188;
	Mon,  2 Sep 2024 19:41:44 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 2 Sep
 2024 19:41:44 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
	<rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
	<jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
	<mperttunen@nvidia.com>, <jonathanh@nvidia.com>, <liaochen4@huawei.com>
Subject: [PATCH -next 1/3] drm/bridge: it6505: Enable module autoloading
Date: Mon, 2 Sep 2024 11:33:18 +0000
Message-ID: <20240902113320.903147-2-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240902113320.903147-1-liaochen4@huawei.com>
References: <20240902113320.903147-1-liaochen4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500020.china.huawei.com (7.185.36.49)

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 1e1c06fdf206..eef5ad449c16 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3498,6 +3498,7 @@ static const struct of_device_id it6505_of_match[] = {
 	{ .compatible = "ite,it6505" },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, it6505_of_match);
 
 static struct i2c_driver it6505_i2c_driver = {
 	.driver = {
-- 
2.34.1

