Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB523C2BBD5
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Dec 2020 12:12:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C172923A51
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Dec 2020 12:12:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgLRMMN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Dec 2020 07:12:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbgLRMMK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Dec 2020 07:12:10 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCE4C06138C;
        Fri, 18 Dec 2020 04:11:30 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id o19so4919501lfo.1;
        Fri, 18 Dec 2020 04:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q/bU62CcBcDUEEC+SqfuI7SeeQ/iVy39fG9zlA6evc8=;
        b=OErIWO3YL9Lk+F89USfuwo5+rPktnkjsliFFHO0wcyHgH7bzQu205mNtz6X43k+yOf
         7rZ3GgSHh/WSi9Z60t6j4ciEhdXfYrBz8C+KFksuIIaO5TORq7CD846/AbggsxySnxNX
         xT6RnQGHiVuEmGhigUNI0+x48V1tn+07QcXTMlMatZkc3jNqMcVKDi+3cbakUzzm3DE1
         pYckRe1tYbUN9IjTxiLUonKa7XPFgP1tgHXIJ6woGmkFHP6wqJ0CNz+A/32SD8S+ApGN
         y9yxnV/PlZ2osEHfHlT5rMGHLxqSumpzOZa8CfJ0u1aZzL1lr6p34TIJ2LV72JUb0Nus
         9nMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q/bU62CcBcDUEEC+SqfuI7SeeQ/iVy39fG9zlA6evc8=;
        b=B2vX+ZbLqFtKTTVaB4M/JjuZnGd1OZR0kWsJEX82a3dNGYLGHXb82hcb82CQ5dHfxE
         4Dy0bUu3wMZVyyg1kalOTlT5BSM9nU0N1Uln071eIjYTysTuY+d37eGutk/j8395lB08
         k5soLLE7W+LtVb9l3dWQmPCr5Pm5QvCfZi/WKab6Af/uaiHYxiEkdLame1J4NEesZ0mq
         jmRsJ0VUk1CV/FwjeUBll32kU2fYXVs8gz+/Bvs1DEKiUQJHzTvR3YPAgqHDl3A8mWAq
         9tqR7uiRGDuPNbB0XvblyWOmDjdYNPM/xrcvTzVs2bGfdM4E0FIitbUUClwt5czi3iyW
         vleQ==
X-Gm-Message-State: AOAM5304kL49BNxFPxjw58rr1ISFoKEZOC1/j5hBKikVwFujIpcNKlFZ
        r7eT3BIIfg1QgNSQ4739ei8=
X-Google-Smtp-Source: ABdhPJw0k62mEMl9cAN6Zdf8iOOOYoQmNjlSbG8K5pnh2YS0kXGfuztvkd21qPJOgLqZrRbe9x7uOQ==
X-Received: by 2002:a05:6512:10ce:: with SMTP id k14mr1273984lfg.177.1608293488853;
        Fri, 18 Dec 2020 04:11:28 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id i9sm1036472ljn.18.2020.12.18.04.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 04:11:28 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>, Ion Agorria <ion@agorria.com>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/9] usb: phy: tegra: Add delay after power up
Date:   Fri, 18 Dec 2020 15:02:38 +0300
Message-Id: <20201218120246.7759-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218120246.7759-1-digetx@gmail.com>
References: <20201218120246.7759-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The PHY hardware needs the delay of 2ms after power up, otherwise initial
interrupt may be lost if USB controller is accessed before PHY is settled
down. Previously this issue was masked by implicit delays, but now it pops
up after squashing the older ehci-tegra driver into the ChipIdea driver.

Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Ion Agorria <ion@agorria.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 03a333797382..1296524e1bee 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -784,6 +784,9 @@ static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
 
 	phy->powered_on = true;
 
+	/* Let PHY settle down */
+	usleep_range(2000, 2500);
+
 	return 0;
 }
 
-- 
2.29.2

