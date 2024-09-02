Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCE21D67A0;
	Mon,  2 Sep 2024 11:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725277309; cv=none; b=a96FvpO1tBsOo1Szmc+XR6HoIEQleDTwoCGvbePTjjZDNpBTgt5UCuBKH/+3f3vz3acx4iWMg7vixQYXRIT56+MShxDKNw4bX7w/Qoc1Nqrkjk0jHZvTys6LJ562Je49QgSSqBscARc1DH9lo4/SnnY9e8BoUnb66VyGdyyUIn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725277309; c=relaxed/simple;
	bh=/fuBQlxJd0NJLtZVgdncjwLx5HAYWxFZueKbZgfYZfQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RYl0gg6mT7Skg0Za0vpmwg+AALnXNpqnx7GFBLZQPrdUFw6QZqkzsKOAps2nWtQphnIeiSxJ5wGUqUwMBM2l6d8mC3TPiB8dyuNMjHun9caqEoXTHfxLrK8nuXLlv5O7dqcgEqHd65P8tX0BKiQGOaw4BLCagoeL2YG4Wsz1YwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wy6K068b6zyRMJ;
	Mon,  2 Sep 2024 19:41:08 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id BC93A180087;
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
Subject: [PATCH -next 3/3] drm/mcde: Enable module autoloading
Date: Mon, 2 Sep 2024 11:33:20 +0000
Message-ID: <20240902113320.903147-4-liaochen4@huawei.com>
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
 drivers/gpu/drm/mcde/mcde_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 10c06440c7e7..f1bb38f4e673 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -473,6 +473,7 @@ static const struct of_device_id mcde_of_match[] = {
 	},
 	{},
 };
+MODULE_DEVICE_TABLE(of, mcde_of_match);
 
 static struct platform_driver mcde_driver = {
 	.driver = {
-- 
2.34.1

