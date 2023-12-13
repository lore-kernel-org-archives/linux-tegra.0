Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bughmRQV"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC97AC
	for <linux-tegra@vger.kernel.org>; Wed, 13 Dec 2023 02:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702462796; x=1733998796;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=IH2FdGE4NUSK2FxuYO6GsfwFcJicp3jgO7olFptwvLo=;
  b=bughmRQVqhElVtwxh3FBSrHhmbOVmlZCj+Cmb03fjEtNLSRRyi/zEguH
   AlOQBAmAFBVhSPmj/1L5SNK7e7rIXBVoBJ1F9mk4SXuL8TVyd06YK6Z8x
   oyZ2vWlfbWh9o4uK1ks1J5sAuQ9Wh1jkXFiuseD8WulAee9AKd3Jw/MS4
   ybqwAtrjU1TRoz6A5jvj60t9fzqg19Hkc/TtzCjukhnLnN9BJfm7aBIyu
   71XuSZBBwruVXMyf0XLrjtnHwo1EIFYNvrCfMtyaD0QulgM5DThL31W0U
   hno4+peUW/1P9RSnYRT9nx5u4Jhfmv0j/eBzRGXmqu34xI+Lh9oUpIyou
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="8330846"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="8330846"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 02:19:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1105263673"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="1105263673"
Received: from oostoia-mobl.ger.corp.intel.com (HELO localhost) ([10.252.50.15])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 02:19:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/tegra: include drm/drm_edid.h only where needed
Date: Wed, 13 Dec 2023 12:19:51 +0200
Message-Id: <20231213101951.3932273-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231212142409.3826544-1-jani.nikula@intel.com>
References: <20231212142409.3826544-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Reduce the need for rebuilds when drm_edid.h is modified by including it
only where needed.

v2: Fix build (kernel test robot <lkp@intel.com>)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/tegra/drm.h    | 2 +-
 drivers/gpu/drm/tegra/output.c | 1 +
 drivers/gpu/drm/tegra/sor.c    | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index ccb5d74fa227..682011166a8f 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -13,7 +13,6 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_probe_helper.h>
@@ -26,6 +25,7 @@
 /* XXX move to include/uapi/drm/drm_fourcc.h? */
 #define DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT BIT_ULL(22)
 
+struct edid;
 struct reset_control;
 
 struct tegra_drm {
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index dc2dcb5ca1c8..88af956ad0e7 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -8,6 +8,7 @@
 #include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_simple_kms_helper.h>
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 83341576630d..bad3b8fcc726 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -20,6 +20,7 @@
 #include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
 #include <drm/drm_file.h>
 #include <drm/drm_panel.h>
-- 
2.39.2

