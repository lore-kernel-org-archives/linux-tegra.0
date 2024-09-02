Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ACE1D67A1;
	Mon,  2 Sep 2024 11:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725277308; cv=none; b=El+qxiIs1PHm+2qgeDwgM9Ox6dltft9HKbKpYyyfm+VEKaZjHmQ5PYWttrt2rOUafgBEpRTePHZK19tE10oGlsq2WsCfxjl0agMAzeQyfPMAaGnE5JOpiS6Xlh2VMLqJUdJfO6EOHSzemeES/+6m2Zky2A/9AB9ELbUvuARS1h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725277308; c=relaxed/simple;
	bh=jQ+IE85YGJySd6W7Gf6ApbtTYBXCkkdelbGfWU7wMQU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CKPBuBV9ETSICllrXc+QtRWchdd3Ql7cYWMOV6Pt5IyHyM8/lQnOc3fKrv1QKe5x2eDzN82itpRnY2e7z7t4ej1lr4NNaW+oz8fhwbeT6e1uPo+MtUr4jhiq6mDyfKZQq3so8efsaJaUgu5uE6OWk1vy5UzXIomvbBkd5nBUVOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wy6HF5sfczgYvY;
	Mon,  2 Sep 2024 19:39:37 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 1F89D1800A7;
	Mon,  2 Sep 2024 19:41:44 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 2 Sep
 2024 19:41:43 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
	<rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
	<jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
	<mperttunen@nvidia.com>, <jonathanh@nvidia.com>, <liaochen4@huawei.com>
Subject: [PATCH -next 0/3] drm: Enable module autoloading
Date: Mon, 2 Sep 2024 11:33:17 +0000
Message-ID: <20240902113320.903147-1-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
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

This patch enables the autoloading feature of drm module. By registering
MDT, the kernel is allowed to automatically bind modules to devices that
match the specified compatible strings.


Liao Chen (3):
  drm/bridge: it6505: Enable module autoloading
  drm/tegra: Enable module autoloading
  drm/mcde: Enable module autoloading

 drivers/gpu/drm/bridge/ite-it6505.c | 1 +
 drivers/gpu/drm/mcde/mcde_drv.c     | 1 +
 drivers/gpu/drm/tegra/drm.c         | 1 +
 3 files changed, 3 insertions(+)

-- 
2.34.1

