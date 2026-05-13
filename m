Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3710239150D
	for <linux-tegra@vger.kernel.org>; Wed, 13 May 2026 10:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778666958; cv=none; b=rX61J4sMOmbaNyZ4jmMM4/UmcV/IswH9tYiC5ukaYIaePfI7vVpDS3sRwyF9W6ou4NAFuMQ6dlrEvH7L1xXztzqnvOtT0a/jwwDSgpCfmjQO6N5xe/dCa6WLcOcfcUKXe0Ty7PyIFyc83UqBwilRNUpVsGYgaP42ofzcDwk53H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778666958; c=relaxed/simple;
	bh=/dk/MEMytqS+G95GQjJ0SWS1DwuCRh9pquQKcCNNF+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TsafZNOY8CaAxT32ZyvlJrn6daY2O+OKnOFteoKfwu70/NfBIHC5iHBRjcTp+kRCnthVBgVc2R38duzYqDgVSfX5k/x4m/o1FdPpoYvU99NmseI841+bzwmVc7IR71bDE7reJrMyfWflCe0it5rRXT4yFn8ID8hrX7OxnsKtCGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGNrMIsM; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGNrMIsM"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-824c9da9928so3101196b3a.3
        for <linux-tegra@vger.kernel.org>; Wed, 13 May 2026 03:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778666948; x=1779271748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zfvlu5mb61YW6djjjZABEhL76NEylTpLflYnznw7iL4=;
        b=SGNrMIsM4/0MQk9ApVJ0VF9IF+R4X/esJcnStxhBnOdCeFnjqEjSnr1A33hamRuVYp
         beWVfEWvNDoebJ0ijVC/mNoSbuIrT2SlHtfxLiF8ymsLoXUnToHjWrLDgXWY+ZLQUYlH
         miQXda2Z1rpwmfXbw9NUfK3D4ncP9aKdN+/eCembjbrS5sWTnUvxw1Cu974Dss7TD0kg
         SRqz745rNaTEY+YYpw6bfLlgWKQEZxkEYy2tVmTXl0uua2B2B6uzZkQDzNXqw3wEv/JJ
         UQThJNvRnkWGzZ0RZU0xfnFnRY6FADt9WNfMP7+5WZQsSvqnCkdqj0xEhfnGWmAP132m
         B0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778666948; x=1779271748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zfvlu5mb61YW6djjjZABEhL76NEylTpLflYnznw7iL4=;
        b=BThO+621vA3lGFjppqisve/vTjW1BorHocYy/d+DsIzs77ztqniq+NRkUiBNCQEWHe
         9pEKmVANB16PdJBOzpGdnWxdeaKxERDq8lGsZy5lsc7FOyRcX2qi/6R+6z+t7p2HRQG6
         456UxWI9y1st8zN8yXKYpZzE96305M+lkred7scemmGffwsuTjoGK20a7j5v0YTLlvCH
         33MQZvv9N/9Dz8k/Acmu3CSi4ajrSllsV2AKqIvf6m2gCTEwejp1tuj923cAHFVmZ4Y8
         FyVzPE5WYuVr7z50qAK4o+mQ9bnzL+heAmzGttzzChvIu1OyC9QBjSIYo/y23w2VAYDT
         wRvw==
X-Forwarded-Encrypted: i=1; AFNElJ/OCfHByjRov9OzlkVxYuDrEo0r2Zom2oLBy7TYL6Vh8vLtZwVdnuPdJg6TXEK/SKaRedwPMqPX1Bg7Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2upLeHWO+YhtOvn255K6WXchGttxdhNUwFKjGvKeovJL2bHpw
	hR655OwY4XxXOFqjjTIZV2pLALbX4g3nsCxteKD9iEfOgT3tAHRcgQLe
X-Gm-Gg: Acq92OE//Efq70H7vWFET8xJNkT3IOoaFuuQ0ToOrHpBuzTGGCO3X3oDwRbBo/5WSFk
	xaKKF995TO+/qAWJNhoI+V1wKcF/yWugiEc2C+52m8LQVlXfGkJmP2aPXcsbvjjayGznEef+GUy
	nEmdcirv03MMBedlQrZVMVy93ihl3HWNtJS7Jcq3Rs+9ZPcl42cphelrk7d8HusbAuE+iNwdX4o
	4TzjzTbIYgQHANYSwltaTGkxpP+MaiZWYLf30lBKtgs+DXIW1pPjD6wDrkTKqxA9KbMBeJtEk4N
	22hOelMzWFeIs8YbylIsgryMQXDzTvgB/ANmqjs6+DmpECTtulpl3V+inR37zYfblEFtNg/9YYZ
	YePahsrCgFZItvN7jwmTfs7ty8U5JPFoLjZNIbQZRvtsFvOHTE1//BUtX6KQJRCgRqREGXc7xTz
	CofxMvogdK2ICPOwvgILtG+sbE/We78IUQYO4RuzZ5wYM1Fl6cSkptPg==
X-Received: by 2002:a05:6a00:4509:b0:83e:eeab:aff8 with SMTP id d2e1a72fcca58-83f04290259mr2661772b3a.25.1778666947745;
        Wed, 13 May 2026 03:09:07 -0700 (PDT)
Received: from souradipto-das-Latitude-3460.. ([2405:201:8011:1c:5511:5483:bbf3:4c46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965c30ddasm33968239b3a.21.2026.05.13.03.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:09:07 -0700 (PDT)
From: Souradipto Das <souradiptodas6@gmail.com>
To: thierry.reding@kernel.org,
	mperttunen@nvidia.com
Cc: tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jonathanh@nvidia.com,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Souradipto Das <souradiptodas6@gmail.com>
Subject: [PATCH v2] drm/tegra: hdmi: Open-code drm_simple_encoder_init()
Date: Wed, 13 May 2026 15:35:01 +0530
Message-ID: <20260513100501.6468-1-souradiptodas6@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260502143420.7850-1-souradiptodas6@gmail.com>
References: <20260502143420.7850-1-souradiptodas6@gmail.com>
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
v2:
  - Remove stray blank line
  - Patch is compile-tested only 
  - No functional changes.

 drivers/gpu/drm/tegra/hdmi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 0adcd4244a42..068a32be0c13 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -25,12 +25,12 @@
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
 
 #include "hda.h"
 #include "hdmi.h"
@@ -371,6 +371,9 @@ static const struct tmds_config tegra124_tmds_config[] = {
 			PEAK_CURRENT_LANE3(PEAK_CURRENT_0_800_mA),
 	},
 };
+static const struct drm_encoder_funcs tegra_hdmi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
 
 static void tegra_hdmi_audio_lock(struct tegra_hdmi *hdmi)
 {
@@ -1555,8 +1558,8 @@ static int tegra_hdmi_init(struct host1x_client *client)
 
 	hdmi->output.dev = client->dev;
 
-	drm_simple_encoder_init(drm, &hdmi->output.encoder,
-				DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(drm, &hdmi->output.encoder, &tegra_hdmi_encoder_funcs,
+				DRM_MODE_ENCODER_TMDS, NULL);
 	drm_encoder_helper_add(&hdmi->output.encoder,
 			       &tegra_hdmi_encoder_helper_funcs);
 
-- 
2.43.0

