Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1mV0W5+"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F3799
	for <linux-tegra@vger.kernel.org>; Tue, 12 Dec 2023 06:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702391056; x=1733927056;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+WqteZjNXiXFUqUfy0YtsA4/JhEpKi9URcDUxPzjKr8=;
  b=K1mV0W5+qkxH5/F6vRkl7hX4L8/uBBJoKzYaT0wXEDMFyZ35RTMGGa/3
   mNWHXjbFwAvPgnpDn07+WYN0V1iMNBm5crAeQDYAQKmyKDPqKZBHLPCPO
   SADDfY685o9YlpJGEniRnovZP7Ye8fNC6u94mbys208z7TQgUlJLlmuRi
   2aHY/es9txBlo391DnbIRdvEDlDaNacGOhFKB96bgJlRqqMItsDF74wmr
   GjnCszJb7vH1oc65M9OqcT9B9nW6oIlQiaWCQqNfn2wQ62HVSbzA5KxtE
   Hb9/ZMhYflcC/3C0G4X3XhBDIt11Me2c1n/b3sNsWClNFJKEAd+pcxBYO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1968440"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="1968440"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 06:24:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="891608935"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="891608935"
Received: from ggilardi-mobl1.amr.corp.intel.com (HELO localhost) ([10.252.49.147])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 06:24:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/tegra: include drm/drm_edid.h only where needed
Date: Tue, 12 Dec 2023 16:24:09 +0200
Message-Id: <20231212142409.3826544-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/tegra/drm.h    | 2 +-
 drivers/gpu/drm/tegra/output.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

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
-- 
2.39.2

