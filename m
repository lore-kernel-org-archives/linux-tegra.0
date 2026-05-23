Received: from mail-yx1-f67.google.com (mail-yx1-f67.google.com [74.125.224.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11892175A6D
	for <linux-tegra@vger.kernel.org>; Sat, 23 May 2026 01:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779499730; cv=none; b=kPwqZNsMcjZOz7W4otv4WhbG1eglzk5F0En8qWJ7WJIOzFeGriubvEehssa0hv2U1nhGzNmhhs9Y98NHKLNDxyH6iXWs4kbjIo7Wzk1EWleNW6UE1I1DP38u2NCavPPPn/ud/CDGzRTK2fGpIYIp2NxW+pIz4CdJQxaf7SVGSdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779499730; c=relaxed/simple;
	bh=8tQw0ctbfgxohRnxdCfPVthGybcB7qTjpQBeozkyHFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bcr/euk8NFukmmYmvqBfnuUyCq+3lujY2E6M697/wVd3ZSnJyUC8lSU9elYAZ9LuCOn2kKVIPBkXajVPcZJ4iKgpct8CEfmZ7jjg1BDAUy+pa8GrNGvLwu+COzQt6DLK0VVhCcJga4+3b2u2yd6QEC0IqKEuRoZAz+VEKaB03FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KpPSY0XU; arc=none smtp.client-ip=74.125.224.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KpPSY0XU"
Received: by mail-yx1-f67.google.com with SMTP id 956f58d0204a3-65c396d3b36so7986055d50.0
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 18:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779499727; x=1780104527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ELJsuqJw2+MUMy5nRR3yUJhv+8XiKjY5EbNN+zpf1Y=;
        b=KpPSY0XUkFNznR1DVllJs9lJUVNsCtdpe4jc3AqyAnbTERRxCz8qEpaGlezH+AzKqR
         PSRXzG++Xzz4EA4W7XU20gkJnNkBDN6M++hDa9eduOYbKtfTdEZ+HT/QhbLOVcSrs6fx
         QF2blxR/vXBiMbJHNiR/hwnVJBFuAvo8UmEb/PH9MEE7JjnU1MObnR06AsM+2yI+694r
         t2ZAq1FWw3nAxojF03UHws5MXte1mPAJp/wY0EpYCTVN4MlOkgzQ+X7nM4FPgwPvwbCm
         NK7gwfllOt1rw9bN4IOTbxTXRgNoxmQmgmJm6fQE1ipGYSczK0W1RemwmxOvL44bS7Az
         SLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779499727; x=1780104527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ELJsuqJw2+MUMy5nRR3yUJhv+8XiKjY5EbNN+zpf1Y=;
        b=dvXxJhIA4oLxVaWwvgAAFGfvk4bfXVLG5NfQBm8MI8KsXAXZyLrziKp04qEHYBFgr7
         H0FuUxoF3T5QQUWzBi6pfs1OZBC9/IKmgY8pvQEyjH2aaPULDKr8s8TX57uncvOppK9k
         pGilnnjyLN4F1jN9+7n4zeBlPnQVYfDcp5t10n8/kgjX3fhqDECOfom9X32UWXadLjLR
         4Q9xlYp0ZFTWBxQDAV4mTip0uqsAaSG1nQT4NWIBsgyX/eyncHrjLfsjgtAleUQUGuYP
         F2E2ahY4g4OJ8k6iAH17sH3cu6zujHq70g29YWIDTpg+kQt/6dNwt2egthF/40xAMZOB
         of7g==
X-Forwarded-Encrypted: i=1; AFNElJ+VDZq661eG+LlomFTtuphXNJAga8jLJpZxEFDCSjPFgFxRk20GU1wUDMo10E0ZVcH7Rvi5Szsu++sqhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWSPRuzd4xdDOG5tfjbk+kmQuUkBCCkQCWBUGtqTsapt9X9mZ/
	pjMgS4o+kk8+FNSyLYmJac7/Q62mzLmvtQ7CKCBKmq3ebsHE+rRVyHSteT3ZVQY7SdBFYQ==
X-Gm-Gg: Acq92OGRZiiytRIPGXZja094caUC553LNQEIL8vq47s0Lcn9rxaRoMGu0TdVXfwPwTN
	bfXMl30rzBKaCB7pqH96+gGv5jaU50d9fbBu/KNIKzrtm5T8eYu1XU0yYpdHvjt+MkRyzM+4GO6
	1BF735iEVgT0aPY7gS/LPDqaQMBCrdm4Y8C2DwP2PGCK8YiRuOkPo6tf8QDJtQQ2Yr3aCR7hfyz
	7Nhz+UxJzhca8IrvmaTklRbSqcxCfcNaIYomR562QOPoSQlVnRrXhnl8w8PgxRyK+2JInJT9X+Q
	MqLBzSDqsGYXvlMizIbYd9fsxvs35A9mW5k+IxGuvYFLsx4O3iAmAApk3FqAXbQM5Fsw5DNqkYL
	B2DBpGPyce6xhGAMAeCV6iJvVcumW8KHMmSEaaAE6CGBRuM1emjDRghRNhC7L0yY5PL/C1M+PjL
	5a0ywQwgyDVhMyZCmiv9PJluZlBYtY
X-Received: by 2002:a05:690e:440b:b0:651:c29e:f0b0 with SMTP id 956f58d0204a3-65ec963a356mr4605847d50.4.1779499727046;
        Fri, 22 May 2026 18:28:47 -0700 (PDT)
Received: from flagship.lan ([136.58.14.109])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65ecfda36bdsm1446622d50.16.2026.05.22.18.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 18:28:46 -0700 (PDT)
From: Jacob McLemore <jmclemore.lkml@gmail.com>
To: jmclemore.lkml@gmail.com
Cc: tzimmermann@suse.de,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tegra: sor: Remove usage of drm_simple_encoder_init()
Date: Fri, 22 May 2026 20:26:24 -0500
Message-ID: <20260523012824.81043-1-jmclemore.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the deprecated trivial helper drm_simple_encoder_init(). Inline
the call to drm_encoder_init and add instance of
drm_encoder_funcs.

Signed-off-by: Jacob McLemore <jmclemore.lkml@gmail.com>
---
Saw this was a good first task in Documentation/gpu/todo.rst.
This is my first patch, so apologies if I've set up anything wrong
in either my email client or gitconfig and the patch ends up invalid.
---
 drivers/gpu/drm/tegra/sor.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index de8b2dfc4984..4ac23aedb682 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -25,7 +25,6 @@
 #include <drm/drm_file.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "dc.h"
 #include "dp.h"
@@ -3038,6 +3037,10 @@ static const struct tegra_sor_ops tegra_sor_dp_ops = {
 	.probe = tegra_sor_dp_probe,
 };
 
+static const struct drm_encoder_funcs tegra_sor_encoder_funcs_cleanup = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int tegra_sor_init(struct host1x_client *client)
 {
 	struct drm_device *drm = dev_get_drvdata(client->host);
@@ -3081,7 +3084,7 @@ static int tegra_sor_init(struct host1x_client *client)
 				 &tegra_sor_connector_helper_funcs);
 	sor->output.connector.dpms = DRM_MODE_DPMS_OFF;
 
-	drm_simple_encoder_init(drm, &sor->output.encoder, encoder);
+	drm_encoder_init(drm, &sor->output.encoder, &tegra_sor_encoder_funcs_cleanup, encoder, NULL);
 	drm_encoder_helper_add(&sor->output.encoder, helpers);
 
 	drm_connector_attach_encoder(&sor->output.connector,

base-commit: 79bd2dded182b1d458b18e62684b7f82ffc682e5
-- 
2.43.0

