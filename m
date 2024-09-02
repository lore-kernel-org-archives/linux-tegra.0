Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707E61A2627
	for <linux-tegra@vger.kernel.org>; Mon,  2 Sep 2024 16:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725293617; cv=none; b=uwiVZ7QjfqDQ/GXL1ZJKaZ+7MUaf4wrLqJPV5B2V945yWyod7Bov7pMcnOV6foasRPy/9u0z+EOAEAvt3qAMpqWxZJU4cZkg0cokCFFNz6L/nvxTU54k7TX7qzs9UGi6mMo4k60YfordmZr3jO/28zfWDXXmPIFKQlgosnJ3RHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725293617; c=relaxed/simple;
	bh=y9nzKmp6uHS9PIhToRGVYR3zjbZM7i37a84XGDDhGVE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fYINyTGYWGDbaJcEzkvviifAL0elvQLoATRyIkuxc1nspjifIoizyIgM/8D1jB6GIESeE592Ib51eFyihnt8QAkRjqjzMP+6crWa1WfEQIL27DIe6HT+Qak5oK+li49M5DHWSVMhwu03QYSXM0VcG2ts2w/B8SYfgRUkYtHHCwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWUEX/wk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWUEX/wk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725293615; x=1756829615;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y9nzKmp6uHS9PIhToRGVYR3zjbZM7i37a84XGDDhGVE=;
  b=JWUEX/wkY3knmyStL/WGE1tqPz3IBTk+HyxxpxJ6z4W17h7MddQj1daY
   DH01k3YxaF8JzApJGvj2nBte6XcaHBkJTWsbbnAj6VKi+2jBuosKLXUzp
   kZvvGQX4B8CjHzkMXfm3hqhxk3lyc9pCm+nKMAhFAGGEvvqWdVyjO2rGZ
   dwd2gAiFtBIwUGhoOEufHwsrB/IgMSwHmEEBQ1la8rK3sHQa7SQlVNPcB
   QMVnf+mY7n2n9Y6IpGhtXUIAXE2jpUJlqd2Lzdk2m/BTOegPHZJHV/MTh
   4Ef3TcGk+LIBqBKkYcTc4DK7qxZvdaCfWky0DS1OZ92azWzIMQHsqJUsy
   Q==;
X-CSE-ConnectionGUID: r0sbl02tQf+5NV7DPxSoUw==
X-CSE-MsgGUID: kzTisuccSp67d4OFJdzA0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23447394"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23447394"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 09:13:34 -0700
X-CSE-ConnectionGUID: 680zeTzfQE6Dfo57Si2mUw==
X-CSE-MsgGUID: IJXoQuJgQEeKERmpqflBYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="102098066"
Received: from ltuz-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.4])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 09:13:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	kernel test robot <dan.carpenter@linaro.org>,
	Thierry Reding <treding@nvidia.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: fix potential uninitialized variable use
Date: Mon,  2 Sep 2024 19:13:17 +0300
Message-Id: <20240902161317.2437148-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

It's likely either output->drm_edid or output->ddc is non-NULL, but
avoid the uninitialized variable usage anyway.

Reported-by: kernel test robot <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/ZtXLyXxew7z6H2bD@stanley.mountain
Fixes: 98365ca74cbf ("drm/tegra: convert to struct drm_edid")
Cc: Thierry Reding <treding@nvidia.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/tegra/output.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index e6b5863fec71..49e4f63a5550 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -21,7 +21,7 @@
 int tegra_output_connector_get_modes(struct drm_connector *connector)
 {
 	struct tegra_output *output = connector_to_output(connector);
-	const struct drm_edid *drm_edid;
+	const struct drm_edid *drm_edid = NULL;
 	int err = 0;
 
 	/*
-- 
2.39.2

