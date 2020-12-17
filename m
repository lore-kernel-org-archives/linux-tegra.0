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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5CFC2BBD4
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 09:46:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BC7A233FB
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 09:46:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgLQJpe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 04:45:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbgLQJpc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 04:45:32 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D714CC06138C;
        Thu, 17 Dec 2020 01:44:51 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id x20so36200655lfe.12;
        Thu, 17 Dec 2020 01:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eb26vIZYqeziwIPNEQ8WVlNQ04/gel37gYLbp0DOH98=;
        b=CtT56gc+5M4adUwSsrFEaOt00vem7rgFlhyIjYSb53AkOAEjSzz0rVb/A7uqBIqkp2
         G4+FGz6V17bjdTnRbf+aowLYIa+gR8wwS3IBQtJ0KfybkXvL4TtoVnn10oHNSMp0pDDO
         07WjuZzqDYPn2AoAvwPpxqYjvHi4rEjyU8ewbCSPEgks1H+u/5MKll5271m1RJzngf1r
         1YHwGObwjYljCcKxh7PBOVbnbUwfdaMqTfDqvtJwYDwsHf1C4WBRXkMh0F8D3FE+w2nK
         zZCCe2k+aBSW5dwBXnJBOVR1802tXW+PU2w454K6bdLhStXmFCRmfu480W6yfIpH9dpT
         LVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eb26vIZYqeziwIPNEQ8WVlNQ04/gel37gYLbp0DOH98=;
        b=gA8eyql+OP1wdpPpeaDazoLN5jFxvGNeeb0X2JMlA4k6X0blLgi3t6aXShj3rVVnwg
         exnCp0vPkkTzVMZH7J2WkvahnZ0N8bGStUgzBPr1A0sMezy7Tuh97pMyJ9UsKMDessZL
         1K/6AjKNcLoOGlf2wd6guCOSjPGtkLPMS/Y4yyE4eiu15qfAEERjzU8auI9ZeU7/eDTp
         DWmYgaa4XfwKywefZT2mygBNF/EBwhQCdT/2/953FM5WTAKwRphKhuPjTvj/AYcEoc0G
         VuYzCwh9OiHXQge7QWseCuLMrrqSfbZljSMYLxdaKERzZ3iq9XrYoXO+pyI7RBW3EqIo
         DR3g==
X-Gm-Message-State: AOAM5316+i5RgMry4yJ0m8W28QdfYyEnKKyeNZUk7bVVSZN6Ucp2GW8V
        C4LI8eG9LERhUMka9+6sYLw=
X-Google-Smtp-Source: ABdhPJz7OFH4nlWPEIGaFyJDHcuifzYyfk78ndUFWaf7cUUV8phnfsRj/Q65x6GpA7riLTj10gU8ZA==
X-Received: by 2002:a19:4c84:: with SMTP id z126mr13679677lfa.69.1608198289522;
        Thu, 17 Dec 2020 01:44:49 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u19sm613917lji.2.2020.12.17.01.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 01:44:49 -0800 (PST)
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
Subject: [PATCH v2 3/8] usb: chipidea: tegra: Remove MODULE_ALIAS
Date:   Thu, 17 Dec 2020 12:40:02 +0300
Message-Id: <20201217094007.19336-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094007.19336-1-digetx@gmail.com>
References: <20201217094007.19336-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The OF core adds an alias based on the OF device ID table, which is enough
to have the driver autoloaded. The legacy MODULE_ALIAS macro was relevant
to a pre-OF board files which manually created platform devices, this is
irrelevant to the modern ARM kernels since devices are created by the OF
core. Remove the unnecessary macro in order to keep the driver's code
cleaner.

Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Ion Agorria <ion@agorria.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 7455df0ede49..10eaaba2a3f0 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -128,5 +128,4 @@ module_platform_driver(tegra_udc_driver);
 
 MODULE_DESCRIPTION("NVIDIA Tegra USB device mode driver");
 MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
-MODULE_ALIAS("platform:tegra-udc");
 MODULE_LICENSE("GPL v2");
-- 
2.29.2

