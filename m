Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3856F6D1A7
	for <linux-tegra@vger.kernel.org>; Tue, 14 May 2024 12:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715691386; cv=none; b=Pmoyw3A5ktvHPS+6ZfV7KIEcbqx9/v2CthmWFlpHQ2pEV73t439a1H0ME0kWSd15UxzUPjvjj7+CUkoxE0pOvxxiNDqZTPLRSukal4evhcrOnLSU96d8AlhwFVfDSIgr1qg/8bIFwMC80mIFll8C7vBLn1m0PCLlhQmfc/p0uHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715691386; c=relaxed/simple;
	bh=O3WR6uh8GZmy2rdXUJXqCpt0BQUtQN00jH3P5Gn5m4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i/P40dbytrOVsmKW2Ft1ZkXZ4UTHeuGBN1o2Bw1DxQeB86JCCrv5Hf+wKtmTKf4uhbDB3lCrOM5ZV+vjDqLiTGsvhQfc0mkrTN1/p1nPFF/1oC5UC0as7FTK410pZcpU5JgEbMHLsNaclxWKGWd1KeG8CCS5zSuGxGG2f6RBQGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dek77Fgp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dek77Fgp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715691385; x=1747227385;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O3WR6uh8GZmy2rdXUJXqCpt0BQUtQN00jH3P5Gn5m4E=;
  b=dek77FgpaSoCOCszmS8TV7zHFbikvaqISjpeSCZj0XmJkFbk98G3xwo3
   Dyx7jYGf/cghngnsZpc/u35SaVr4w27cORhvvCvCwIiXr22coRqPJVOVP
   2CML+SkqxcJfbfpr8CtPoeEIXYC3j2DyoO1ja9L4KcCvJMUQ2S4hUq8GA
   Gjggnqw5JElF2Q1nlGl8uJpPJxeNRV/fBifX1xfd3uMT7jadp+Tnct0gK
   UMMWf/T2d8Qv2xMd7MFgA9oSU398++gxzd7mwL7fZbDfcY2IIhovM8AKL
   tAsV0ay+KLQ/l3kuHN2hqMRJmbi6vRR5sBei5ndd3F052LRKfe7srSETU
   g==;
X-CSE-ConnectionGUID: FGRjNTKqRDWx+PJ/hfrNwQ==
X-CSE-MsgGUID: YoVWDvYYTjCnjL1U1WT1mg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22270727"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="22270727"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 05:56:25 -0700
X-CSE-ConnectionGUID: hhZRhLesSbiCjuDXCXvH7Q==
X-CSE-MsgGUID: EcLCTva4To+gJY8/rwZ1dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="35140874"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.91])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 05:56:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH 09/11] drm/tegra: convert to struct drm_edid
Date: Tue, 14 May 2024 15:55:15 +0300
Message-Id: <e037667dfc325925bdeabff539df1e708d7c3c64.1715691257.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715691257.git.jani.nikula@intel.com>
References: <cover.1715691257.git.jani.nikula@intel.com>
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

