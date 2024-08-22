Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB731CEAC8
	for <linux-tegra@vger.kernel.org>; Thu, 22 Aug 2024 17:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724348608; cv=none; b=g5xnHNGRhajVpHHUP/33Na5pi2Fndyk+jv9vro543KIJXlAqj445tVV/HrtB2od5hC2rbIZV9D7WnXMKbtUz8IFuLJ2FuoBG8Asjem1puunKnG+TMLBlbcPWjGWFgK7ujuMcOzS3LAFn+yy1JFpjEyYvGfYPZTyIzqrVrwmdu8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724348608; c=relaxed/simple;
	bh=O3WR6uh8GZmy2rdXUJXqCpt0BQUtQN00jH3P5Gn5m4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nj4goStv1PBVeTzyFBIAY4jlZP1dQfTlC7UxswGuxrpxqa9c9mHMOOIYhvTTGQt3ZnfXWswzcfC/6XCUe/v5SOBm5K54MlxNlW5ZE8Ix3qJ34Ketqo5HjW5KgHgMLBGwlFJTGcRu81ogGx2r8B4FMCK1tBHagGHbLJWFbzLzWQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3P3hGBy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3P3hGBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724348607; x=1755884607;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O3WR6uh8GZmy2rdXUJXqCpt0BQUtQN00jH3P5Gn5m4E=;
  b=V3P3hGByPqMNHJ4DM9D/UtaZTrmUTj2zy+ZGRHuKU764+S0jVqU1HQ6p
   KhGlB8KhLkXfzxy7hwUb6yRF6GFyJyU5+7j7rp5ULxDQwvFYeIZEsaC9P
   QallOaH+H95VR3yENmxkVlOVIxBYXS3t1lnv1TTkuRhn7xzfUbhHh8HFQ
   JQciMT2ZeJt1QraioEmlUNPZZtU1/9duTihitl0sh5o+eHMbcnLcRx1Fu
   mV+hvYGbZ6dqMT4uZiFd2ZXY0Tc7l6A7OD7fwjVE76SPxiR2o8duD63bZ
   s5zjX1JFLZHkms2VMgUsqjLdowNK1fUqMJzTZN3MzjbzMJE+kr/OXSMPq
   g==;
X-CSE-ConnectionGUID: OKpMwOibS1ipcmLDEu+mkA==
X-CSE-MsgGUID: NNWzZ7sOSlGUNMrwx6ZhCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22955408"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22955408"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 10:43:26 -0700
X-CSE-ConnectionGUID: dosRNWu1TVOX/pP4hlZY+A==
X-CSE-MsgGUID: oizmzXj2T7OMj3F4t2sUhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="65862389"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.121])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 10:43:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH 4/6] drm/tegra: convert to struct drm_edid
Date: Thu, 22 Aug 2024 20:42:50 +0300
Message-Id: <e764b50f4ad2de95e449ccb37f49c3f37b3333fc.1724348429.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1724348429.git.jani.nikula@intel.com>
References: <cover.1724348429.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Prefer the struct drm_edid based functions for reading the EDID and
updating the connector.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/drm.h    |  2 +-
 drivers/gpu/drm/tegra/output.c | 29 +++++++++++++++++------------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 682011166a8f..2f3781e04b0a 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -133,7 +133,7 @@ struct tegra_output {
 	struct drm_bridge *bridge;
 	struct drm_panel *panel;
 	struct i2c_adapter *ddc;
-	const struct edid *edid;
+	const struct drm_edid *drm_edid;
 	struct cec_notifier *cec;
 	unsigned int hpd_irq;
 	struct gpio_desc *hpd_gpio;
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 4da3c3d1abbc..e6b5863fec71 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -21,7 +21,7 @@
 int tegra_output_connector_get_modes(struct drm_connector *connector)
 {
 	struct tegra_output *output = connector_to_output(connector);
-	struct edid *edid = NULL;
+	const struct drm_edid *drm_edid;
 	int err = 0;
 
 	/*
@@ -34,18 +34,17 @@ int tegra_output_connector_get_modes(struct drm_connector *connector)
 			return err;
 	}
 
-	if (output->edid)
-		edid = kmemdup(output->edid, sizeof(*edid), GFP_KERNEL);
+	if (output->drm_edid)
+		drm_edid = drm_edid_dup(output->drm_edid);
 	else if (output->ddc)
-		edid = drm_get_edid(connector, output->ddc);
+		drm_edid = drm_edid_read_ddc(connector, output->ddc);
 
-	cec_notifier_set_phys_addr_from_edid(output->cec, edid);
-	drm_connector_update_edid_property(connector, edid);
+	drm_edid_connector_update(connector, drm_edid);
+	cec_notifier_set_phys_addr(output->cec,
+				   connector->display_info.source_physical_address);
 
-	if (edid) {
-		err = drm_add_edid_modes(connector, edid);
-		kfree(edid);
-	}
+	err = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	return err;
 }
@@ -98,6 +97,7 @@ static irqreturn_t hpd_irq(int irq, void *data)
 int tegra_output_probe(struct tegra_output *output)
 {
 	struct device_node *ddc, *panel;
+	const void *edid;
 	unsigned long flags;
 	int err, size;
 
@@ -124,8 +124,6 @@ int tegra_output_probe(struct tegra_output *output)
 			return PTR_ERR(output->panel);
 	}
 
-	output->edid = of_get_property(output->of_node, "nvidia,edid", &size);
-
 	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
 	if (ddc) {
 		output->ddc = of_get_i2c_adapter_by_node(ddc);
@@ -137,6 +135,9 @@ int tegra_output_probe(struct tegra_output *output)
 		}
 	}
 
+	edid = of_get_property(output->of_node, "nvidia,edid", &size);
+	output->drm_edid = drm_edid_alloc(edid, size);
+
 	output->hpd_gpio = devm_fwnode_gpiod_get(output->dev,
 					of_fwnode_handle(output->of_node),
 					"nvidia,hpd",
@@ -187,6 +188,8 @@ int tegra_output_probe(struct tegra_output *output)
 	if (output->ddc)
 		i2c_put_adapter(output->ddc);
 
+	drm_edid_free(output->drm_edid);
+
 	return err;
 }
 
@@ -197,6 +200,8 @@ void tegra_output_remove(struct tegra_output *output)
 
 	if (output->ddc)
 		i2c_put_adapter(output->ddc);
+
+	drm_edid_free(output->drm_edid);
 }
 
 int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
-- 
2.39.2

