Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293584;
	b=5MZ5B8ZT5lG+MJBNqxFuC+swugHbg3eJk0fE0qt8eg0LPGHaO24Ld/yd11HKhC+f8JhY
	 LAFPFo8pq6kXo1SHnoVNgrp/EIuvf0WkxLgavLV3ZK9muQAxWhgvoYUWcN8jo2CqttX/p
	 QHPZy3Yv28nhR+R+cMjatd/HaiD61EkH9Z9MxlRLFoAwkeuuAd7YQEuWRrRWg4jP+cuw5
	 neLOHYin+BGODCJxeR41PxEjpznZ7UP2zKByFu1GZ7iq85o5wOHXfutfnDkhXnPjpISdU
	 WTPGtprzVPOayJAUL4+Da2Co1khe87iMm55Gr1yR0EsHrSP4jeq+lOG0+zXijB+WSOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293584;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9SNIwchDrsXwpPR9N0TaR78NWa5hvXjKK5M6PZErRTE=;
	b=gYt5u0NpMuj/BB67/h8/c6kwYfNJOT+V2mfIbkAyKGV+trKhQdABPka62Zqmy48CvQvM
	 v3/shlnkuzj6WilIY+T6nHUlrcCTcI+QADZBIm79Gc0ZNBOkWpLcYpFb3/s27QIhkqkab
	 ecefO3KqPfr3Z/uOLs3wJod1hCV58Glw/laAvIlHFRG3W4eh7Vf4XrDvs5Q+p4MVyIHL8
	 BE4NAF3fjATHGdS6Q08xgjWeCAwtazIq9NMaenizPDd74QTXJTKKztxLuT+AuIBsxLiFl
	 +x8ZlOtJBZSFTlG2Khfl+9hP39jNHcjOM4DpLCIYlUbhVzvQqV78qv2feCxc/u2/+CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Z4Nv7+jP;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEED606A321;
	Tue, 10 Nov 2026 06:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FEED606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Z4Nv7+jP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Z4Nv7+jPP6gxcTSA7Xz6oMFvs00kCWxffxCXEkQKPBpxprVaWQKfttR/hojZ4F0WBk//vTj2ykVYu
	 QvOUIR4XaDIyY9htCvwpLogZqsnzV+eUkdfBsu/fWLJlBjbU7zH482bWdb6RDgk+B0vOIJO4gFkybw
	 3TJ+A/23fpfiNt8k=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af2bf4aa17-6b82d;
	Tue, 10 Nov 2026 14:53:01 +0800 (CST)
X-RM-TRANSID:2ee46af2bf4aa17-6b82d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af2bf48849-aa594;
	Tue, 10 Nov 2026 14:53:01 +0800 (CST)
X-RM-TRANSID:2ee86af2bf48849-aa594
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] drm/tegra: dpaux: Fix VDD supply and AUX channel leak on attach failure
Date: Tue, 10 Nov 2026 14:52:53 +0800
Message-ID: <20261110065254.1211-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_dp_aux_attach() registers the AUX channel and enables the panel
VDD supply, but if the panel never signals a hot-plug detect within
the 250 ms timeout it returns -ETIMEDOUT directly.  Neither the AUX
channel is unregistered nor the VDD supply disabled again, so the
supply stays enabled and the AUX device stays registered after a
failed attach.

The SOR driver does not clean up a failed attach either: it simply
propagates the error, and the host1x bus only tears down clients that
were successfully initialized, so nothing ever releases these
resources and the panel power rail stays on until reboot.

Mirror the cleanup of drm_dp_aux_detach() on the error paths:
unregister the AUX channel and disable the VDD supply.  The
err_disable_vdd label is only reached after the supply was enabled
successfully, and the NULL check guards boards without a VDD supply.

Fixes: 6b6b604215c6 ("drm/tegra: Add eDP support")
Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index e5297ac5c..a1caaa5d1 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -732,7 +732,7 @@ int drm_dp_aux_attach(struct drm_dp_aux *aux, struct tegra_output *output)
 		if (dpaux->vdd) {
 			err = regulator_enable(dpaux->vdd);
 			if (err < 0)
-				return err;
+				goto err_unregister;
 		}
 
 		timeout = jiffies + msecs_to_jiffies(250);
@@ -746,12 +746,23 @@ int drm_dp_aux_attach(struct drm_dp_aux *aux, struct tegra_output *output)
 			usleep_range(1000, 2000);
 		}
 
-		if (status != connector_status_connected)
-			return -ETIMEDOUT;
+		if (status != connector_status_connected) {
+			err = -ETIMEDOUT;
+			goto err_disable_vdd;
+		}
 	}
 
 	enable_irq(dpaux->irq);
+
 	return 0;
+
+err_disable_vdd:
+	if (dpaux->vdd)
+		regulator_disable(dpaux->vdd);
+err_unregister:
+	drm_dp_aux_unregister(aux);
+
+	return err;
 }
 
 int drm_dp_aux_detach(struct drm_dp_aux *aux)


