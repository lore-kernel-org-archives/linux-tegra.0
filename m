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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9A7C4338F
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Aug 2021 02:46:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 808776103A
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Aug 2021 02:46:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237618AbhHTCrd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Aug 2021 22:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234797AbhHTCrc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Aug 2021 22:47:32 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB1EC061575;
        Thu, 19 Aug 2021 19:46:55 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id y144so9477258qkb.6;
        Thu, 19 Aug 2021 19:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mEQvc4tlW06aQJqJP5LbK405G6lgqY4IMl+A4wPSBEA=;
        b=fdhBJocQDNqphrkteBlkeqPku0mlxPINUWl4C8nI4Qr6xfjtjFWLSeIypVajikNdyC
         jnGQLD+Di4+bX+B0FZws/BcD6Rx5DaIpLUgSFx4fEDKGmeawzrDkkfOZ/bshLdK1jF0F
         wMb/hkN5fxq730lM+pnJOUE6eFb1cQVgED2RRbogUO9Kry9v4Kr/xwtwykWpDOOemUwf
         sv4la+9+zD8sU3dT+hdw4qOQDFfmudgDcTWf5d1IPaElYhSsKk8EOsSGptILqUuxkCAo
         UfUR7xJb4oc0OK8dY5jzUN3LZq57q639S4Tn2bg3hrv5FMWYjlNyW8idUXZBMyGd7JY2
         rHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mEQvc4tlW06aQJqJP5LbK405G6lgqY4IMl+A4wPSBEA=;
        b=i4rAE8l9jaFELfTgC6hWyDBlolblOA3W4BRFZzbX5YyRicvdMGkbSwNjsotfpyju6C
         UqT4nuWTnV73P6sJHMhEBUYuh+4X/2/5CLfKEx2BZCqVztI6y4HkepVwKxJIgA3d/chg
         /bdvYAniTx18Pmbzx55zxc3wCDc3m0E1JmM1b1hD9e1weZl6ZzT8r6luKf7afS2l7W6D
         rnL1drIxvhqGbHx4u/M88+chOWWrAKsAj2dxf3YgSL3HMk6JAFI2DtmP+0ivFhwOzuEP
         lemLvwJcSNKNWeRjIdxnNWBZfria8gXPmeiFvFq6ne1eodc4WWstMTLvAbeMJoTqPZUm
         vDMg==
X-Gm-Message-State: AOAM5318xDbIe3/RB8pLO9htOyHKLQcPldxoNqlc/2XS5T1n/7cweqT8
        /5xLwXESPZt1pwvfB3NpaDY=
X-Google-Smtp-Source: ABdhPJyMPt7err59CY9lYfPbUipGcotDfvL8uIT4zyvHaSCmMAXoK153CjrGeS2xi+yTxclElDp2ug==
X-Received: by 2002:a37:de02:: with SMTP id h2mr6565646qkj.411.1629427614352;
        Thu, 19 Aug 2021 19:46:54 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id u27sm2544108qku.9.2021.08.19.19.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 19:46:54 -0700 (PDT)
From:   jing yangyang <cgel.zte@gmail.com>
X-Google-Original-From: jing yangyang <jing.yangyang@zte.com.cn>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jing yangyang <jing.yangyang@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] phy/tegra: add put_device() after of_find_device_by_node()
Date:   Thu, 19 Aug 2021 19:46:33 -0700
Message-Id: <20210820024633.11757-1-jing.yangyang@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This was found by coccicheck:
./drivers/phy/tegra/xusb-tegra210.c:3174: 2-8:ERROR:
missing put_device;call of_find_device_by_node on line 3167,
but without a corresponding object release within this function.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
---
 drivers/phy/tegra/xusb-tegra210.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index eedfc7c..f26eb5a 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -3170,8 +3170,10 @@ static int tegra210_utmi_port_reset(struct phy *phy)
 		goto out;
 	}
 
-	if (!platform_get_drvdata(pdev))
+	if (!platform_get_drvdata(pdev)) {
+		put_device(&pdev->dev);
 		return ERR_PTR(-EPROBE_DEFER);
+	}
 
 	padctl->regmap = dev_get_regmap(&pdev->dev, "usb_sleepwalk");
 	if (!padctl->regmap)
-- 
1.8.3.1


