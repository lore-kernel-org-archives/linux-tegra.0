Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517F5C3526A
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 09:46:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B09D233FB
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 09:46:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgLQJpu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 04:45:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbgLQJp3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 04:45:29 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3777EC0617A7;
        Thu, 17 Dec 2020 01:44:49 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id m25so55696084lfc.11;
        Thu, 17 Dec 2020 01:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MY1cG7uVHPz9FWtjB6IqvDBgQ3Y86WR5onlr74UtS4s=;
        b=LQlFNXaDge6mBrnicXRsp2uXt62N1+Nr4MRvPeb6mEzGO5E3ErHBgSAbEzUBUEcYCz
         rwAS09qjmZ3v+EzlF8I45GvZakIA3eRj0PNyk0gmIFr+FBHancRgRsu2pHW1SLVJk77q
         egUqlrm81Xk0Jztmew6yAZfpbiGeR9fOzwdMhvnb3ncdTTQR4ww2W+58J8hnDpQy68+P
         uMaecNud2G6LwdEgxJAzKDM6zMy6InHitEY3jzSobKohJ20UBiJ9ARHfKJjM2NH5D6Xr
         eTPXdRvvl0A46P5GFk5WeCq60I2wuQNAhqy5Ljkw3iRbeqiKG3rLc0deOp7xsR/yubjf
         zGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MY1cG7uVHPz9FWtjB6IqvDBgQ3Y86WR5onlr74UtS4s=;
        b=gl6l2G1eUU+bJ2HPCmf4sNrN6GpfUdXJenz0atjQw6RvcSy1dESoD6e58ZgrwI6Soq
         ZTpuNk2K2ktUpdx93T4th8tMmYNZJw4nDlsFyYKjityT9tvuDJCtclpFbunnhNktBKIi
         Ny7zPxcosNLj5oXLQWE0uNgyGnW02oxXiXuCM/aA7iZZ6Q42sXttBULRCSlTL2yuTqHB
         xXpwbg55jzMWfFOdTWnxdF1plDhy4q031A0rQ4UUS00ZM55iMWugnEUuYN6/9g0iD06X
         4CUaI/F3ubBdJUtbzXjx5x6xVtgi0g1DceSwftCco/d/gzTPV7SBlJjotdfwolje25zC
         6TcQ==
X-Gm-Message-State: AOAM530LvIBMDUcpGVuosSVb6HspqzeV0gu1ldZTkaRi+NwsxaN7rVum
        ZMzl+LvfvFNPd0O2ygJLeVY=
X-Google-Smtp-Source: ABdhPJxGGeFt/AJREzAWq2WKn3veQ1nWSCE18c2oOqOWb1RATvcVeCyT7ZNxRusJF5ydJqLwrIU6hg==
X-Received: by 2002:a19:8213:: with SMTP id e19mr13676997lfd.600.1608198287714;
        Thu, 17 Dec 2020 01:44:47 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u19sm613917lji.2.2020.12.17.01.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 01:44:47 -0800 (PST)
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
Subject: [PATCH v2 1/8] usb: phy: tegra: Add delay after power up
Date:   Thu, 17 Dec 2020 12:40:00 +0300
Message-Id: <20201217094007.19336-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094007.19336-1-digetx@gmail.com>
References: <20201217094007.19336-1-digetx@gmail.com>
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

