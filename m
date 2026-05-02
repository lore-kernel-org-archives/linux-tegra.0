Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54710280A51
	for <linux-tegra@vger.kernel.org>; Sat,  2 May 2026 14:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777732478; cv=none; b=qO0xAOBosztNeVqgQH7i0Ai/W82989Q8Dh3axfNoLmzGZknM6ZRB6H8WCgcev21d0uqaaOGfYHUCCQ7SBTlZ96GQguVQf/pqGHYkHhgYoMuoMI72mdCxlyBqBLIDm4px9aAiGbxP5eLvQJLINHnofa1eLvKN+GaIBRPzCQ9jca0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777732478; c=relaxed/simple;
	bh=eEeE0oNR80mHya+aWkGyNY+uI7r9RV0WFRDsmDZcpns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q7ye0xEtU3x4hXvpwdSY4qvOrJCeFzUPdA3/VJtJ0jIVIClTjdNB3U5Fo7/DSoApMD9txlysyL/L5UEBog94CAyNyNYZQ5bIiJDbWAdTvQalC7KAChMX6bpK6li3viQhYIYxbv2w1qtAHNDQrMIfXY2TXgK8EfEI6RrD/JGewIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4TeVp/8; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4TeVp/8"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c736261ee8dso944502a12.1
        for <linux-tegra@vger.kernel.org>; Sat, 02 May 2026 07:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777732477; x=1778337277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tgjXwJez3aZR9MFJ8OuPUlwHGqmX5qrc95kELET/7Ac=;
        b=g4TeVp/8aV3geegVVKukCT8RG+bW/+y0ImxzsBIhZkw2Lc9eYjdmOLwz568qLglXEy
         w7VrM5zvNWne8cl7J6ZQw2YyYMHliMPTIHZArYVA+li832ljCPdf7dywg05lRW0CDNTZ
         IcHn71jaZat9nWuNnfyOcQaDx4hLqQhCZKoLiDzOHmIS+DeXi4gP86lhIMEEYsnJSPu8
         6I6YYbd18Klxvm2/Eff2W4vTqVDA9FT83RuUanGyYOae8nywcG8d4x1fK+tumMCSZr+b
         myTqDBp7ecCzN4osB7TSJERR8P+5seZSpKrcntz92QPYquYEHob2RGQFklrLPBZKeKho
         5qDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777732477; x=1778337277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgjXwJez3aZR9MFJ8OuPUlwHGqmX5qrc95kELET/7Ac=;
        b=Tyfeuc0k6KXLIKUMFKvG1wgl26wcEEyKoPFV5rFnmd6YDs1kHcptekhC3n3NXvrMUi
         cppwQ0pYS62zUdNK+Ixo0HOJoXU76/8Ui3mQxz/kNwYvEIMiNs8qXJYSYJDIYO3quLIv
         vR7/xx54E9IrCuPHQ6Uy7CKe6bN/5dohU027+DxMG/OfOimsfqtYF12WpN3ivj9MTuRV
         oiAJqfXg2b7G7cyBqOLT90AgItstzUr6Qnl86y610k4CbnTMp9+7bkfgBvkJNFpeUQWE
         WLnga8jVqfwLtxGPo9CE7srfK4lkwR72zTFUzbCW2u1HUkJGzCzlxRz5doEClu55Pr30
         iQQw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZF8Y//flq7pqOTovLXu+ariKNQ5+QvIoaupNrcvOF1ID8g8eO+I2mFzs9ppKcvtc02qSZlT9f5ZRV+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUwLOwIxLIyWrp1gLjwutpeJSkw5t6E18e4KqJFTHKu5MLh5kj
	k81cAcNzFJD0ZwqxsM9qj0mopnwLdW9kPdrOPAyPQcD4fz4csYji5WG+
X-Gm-Gg: AeBDievct2QPNqZlMmULk7eS0LQoeRMz4yzl5YY5KgpGaWZu568psYNNAHAM/+2uGr1
	Z3yUTjXC3N5mDlOwvGM8Oi0QxOJHKRATn2XgKRh4pSESEwz0HoolpNoc/o/avdQ2ODn7JuSY4EE
	tcazkYPL4QEqHDpO0IyzxF5v5jw+QeE/C2JsW5hIr0dGKY6iUb+IUNZBeK8vtixKtis09iuXWHf
	huY3BLp17GKCmhk/vCvbw+Vi3fuWPvckUhUGoXMoOHJ30aUaKaNJ5mBn2RhvrI5SONQFjupuk7k
	eXGfY0qiV8a/533wk/R4CPX4fviSzK4CXr6HJPorLqEKTJMIbygeHdBxQfx9tiq+TEAQthNMzBM
	c7wqoY6YUPlz2wcoAFJ25vd99vwaSrTdWMsINC+7r1kvYeFWnEg1ucPlLh2tihGlbRBkn42a+R9
	105VlyrOhZhTWNZ5cUtp6IBgt7A+HiNXsGadyes1m9DxFcsbeRH9Qqlm7W6qX4b0bS
X-Received: by 2002:a05:6a20:e291:b0:3a2:dabf:fefe with SMTP id adf61e73a8af0-3a7f1bc2302mr3579543637.19.1777732476507;
        Sat, 02 May 2026 07:34:36 -0700 (PDT)
Received: from souradipto-das-Latitude-3460.. ([2405:201:8011:1c:b259:847f:f774:53b4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad0176sm5714230b3a.39.2026.05.02.07.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 07:34:36 -0700 (PDT)
From: Souradipto Das <souradiptodas6@gmail.com>
To: thierry.reding@kernel.org,
	mperttunen@nvidia.com
Cc: jonathanh@nvidia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Souradipto Das <souradiptodas6@gmail.com>
Subject: [PATCH] drm/tegra: hdmi: Open-code drm_simple_encoder_init()
Date: Sat,  2 May 2026 20:04:20 +0530
Message-ID: <20260502143420.7850-1-souradiptodas6@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The helper drm_simple_encoder_init() is a trivial wrapper around
drm_encoder_init() that only provides a static drm_encoder_funcs with
.destroy set to drm_encoder_cleanup(). Open-code the initialization
with a driver-specific instance of drm_encoder_funcs and remove the
dependency on drm_simple_kms_helper.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Souradipto Das <souradiptodas6@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 0adcd4244a42..a45c19d1631b 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -25,12 +25,13 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_eld.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
+
 
 #include "hda.h"
 #include "hdmi.h"
@@ -371,6 +372,9 @@ static const struct tmds_config tegra124_tmds_config[] = {
 			PEAK_CURRENT_LANE3(PEAK_CURRENT_0_800_mA),
 	},
 };
+static const struct drm_encoder_funcs tegra_hdmi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
 
 static void tegra_hdmi_audio_lock(struct tegra_hdmi *hdmi)
 {
@@ -1555,8 +1559,8 @@ static int tegra_hdmi_init(struct host1x_client *client)
 
 	hdmi->output.dev = client->dev;
 
-	drm_simple_encoder_init(drm, &hdmi->output.encoder,
-				DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(drm, &hdmi->output.encoder, &tegra_hdmi_encoder_funcs,
+				DRM_MODE_ENCODER_TMDS, NULL);
 	drm_encoder_helper_add(&hdmi->output.encoder,
 			       &tegra_hdmi_encoder_helper_funcs);
 
-- 
2.43.0

