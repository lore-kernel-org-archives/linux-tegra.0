Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255E7C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Nov 2021 16:36:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378709AbhKZQjz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Nov 2021 11:39:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238315AbhKZQhw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Nov 2021 11:37:52 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A27C061759;
        Fri, 26 Nov 2021 08:19:55 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id b40so25473299lfv.10;
        Fri, 26 Nov 2021 08:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J2ouOYArYTiGPyKjaLg9beinXsL+bwxgMLfVEklW094=;
        b=X6Qoj4ZhOaFBVDQNFBnNR3t7hp3vEEwXxbZern/ZQbYxgqUJYv4AScqsBuJ73e8Iby
         b6E0g8zTh8Ng/vTEY3BcjX16mLYX382sMlU9jXdUYddolleHq7Xju1SpglbeiuhvA9ec
         YuZLhkDakLWze9cNl+YPU/YT1VzdtplEB2NEecWCDsIYOxqpDO2ha7KDmSIcqIAJXUZp
         OhOaJr1GcLXGkqwtQVVaCapj+6ctuujv2PmNvSXgoPxH2/bpqFnV4sapVVWlOLXy9URc
         tvfjGlP59XQiI5qHUcO12udjNLUkgbj3u/sElqUWZ2aOK3TJPibHLClSyKI+Ge6ZeyCS
         n1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J2ouOYArYTiGPyKjaLg9beinXsL+bwxgMLfVEklW094=;
        b=6UL6uyw3lmTlcgMWQL/OqV7W6fVd3456fLx+ZKzcU5FhwUNhmjNxy8pVW2cbyAW0Kj
         /qQc+BqLE4ENs14nvvIqAYa5MhWQTnSXtmG98kfB6PFMnAKBTJduseg54M2Xw0yOKaDt
         pQbrZrl230B46d/Bnc7GfvD3eR70bF31r8g0cW1XSN2lVvudMAaZ4hDhu9m2P272908F
         dbyvoQ2nCtKK//nIRomS+fdPEmPCQvS/AMf2uJmKVs+gVw3UmstAGooXzf0OxD+wT0sN
         Q3N30HwIeWkLYVAMi202uMWD6MDrNzpGNb47pSl/u238yDUNJiNLVjKI8Ydf9oOGeT0D
         vCUw==
X-Gm-Message-State: AOAM532liIhm7yrF9RfwAmsb5+v74EUvsWLwt+QIQcmnufjAx4ZJ0qTi
        BcmYP65BiG2oknNCdFYPgbpjdD343vU=
X-Google-Smtp-Source: ABdhPJx1S5VSCeVt+lhrxJEnN4E3jZNeyvTZuhJ0KfH/4BlVMHy6qUL8X955jzS+e6Uo1LAS9fS4Qw==
X-Received: by 2002:a05:6512:1296:: with SMTP id u22mr30661465lfs.296.1637943594114;
        Fri, 26 Nov 2021 08:19:54 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:19:53 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 14/20] drm/tegra: hdmi: Unwind tegra_hdmi_init() errors
Date:   Fri, 26 Nov 2021 19:18:01 +0300
Message-Id: <20211126161807.15776-15-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add missing error unwinding to tegra_hdmi_init(), for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 9a87d351a828..142ad696426f 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1456,22 +1456,31 @@ static int tegra_hdmi_init(struct host1x_client *client)
 	if (err < 0) {
 		dev_err(client->dev, "failed to enable HDMI regulator: %d\n",
 			err);
-		return err;
+		goto output_exit;
 	}
 
 	err = regulator_enable(hdmi->pll);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to enable PLL regulator: %d\n", err);
-		return err;
+		goto disable_hdmi;
 	}
 
 	err = regulator_enable(hdmi->vdd);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to enable VDD regulator: %d\n", err);
-		return err;
+		goto disable_pll;
 	}
 
 	return 0;
+
+disable_pll:
+	regulator_disable(hdmi->pll);
+disable_hdmi:
+	regulator_disable(hdmi->hdmi);
+output_exit:
+	tegra_output_exit(&hdmi->output);
+
+	return err;
 }
 
 static int tegra_hdmi_exit(struct host1x_client *client)
-- 
2.33.1

