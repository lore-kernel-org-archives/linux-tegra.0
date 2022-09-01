Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFCBECAAD3
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Sep 2022 12:48:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233368AbiIAMsT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Sep 2022 08:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbiIAMsH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Sep 2022 08:48:07 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3DBE40574
        for <linux-tegra@vger.kernel.org>; Thu,  1 Sep 2022 05:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662036483; x=1693572483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZNbVjn0emFWA6qjDO1tFmsrKCgCOOTKbwxx+l4Ra70A=;
  b=bDsNBlTWgaasmzPlrFEYn9KeAnYayVWwfTwO+qOQtaIcHvlcnysnMs+u
   v9YVNIHtVva8xX2E0s0tpq9wI+d+bw60yvSjV7o2jX7C7YFWH8gCR9L3X
   G7nj2dw9WeqJE1B9GVZ9PVJ/QUBtyoPRL85OniSP7eIBjBweqM7tkEIAd
   zQKUHFS/E3rmWk9IUJcZNBjcHXEjyatG6CBl6V+cbLMfQqnwc7Fk9vcKM
   n3k13F7de907MX7zUpDX3CBePO+FBk3sc8mgOxc0pGtUckvy/FFByQvV9
   jWiUWYmRbu7nnRjLMB/G8+TOa39CWbaLAqHRucguJvApnALouYP9ZQBs7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="357422389"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="357422389"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 05:47:54 -0700
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="940836961"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.142])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 05:47:52 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 4/9] drm/tegra: convert to using is_hdmi from display info
Date:   Thu,  1 Sep 2022 15:47:06 +0300
Message-Id: <1bdb744bc1079affdd108b34206efd2f21adf7c7.1662036058.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1662036058.git.jani.nikula@intel.com>
References: <cover.1662036058.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Prefer the parsed results for is_hdmi in display info over calling
drm_detect_hdmi_monitor().

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index bf240767dad9..40ec3e6cf204 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -867,14 +867,7 @@ static int tegra_hdmi_reconfigure_audio(struct tegra_hdmi *hdmi)
 
 static bool tegra_output_is_hdmi(struct tegra_output *output)
 {
-	struct edid *edid;
-
-	if (!output->connector.edid_blob_ptr)
-		return false;
-
-	edid = (struct edid *)output->connector.edid_blob_ptr->data;
-
-	return drm_detect_hdmi_monitor(edid);
+	return output->connector.display_info.is_hdmi;
 }
 
 static enum drm_connector_status
-- 
2.34.1

