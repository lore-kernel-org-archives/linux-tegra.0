Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12072C4361B
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 20:22:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5DA922BEF
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 20:22:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727716AbgLOUWh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Dec 2020 15:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727664AbgLOUW3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Dec 2020 15:22:29 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DBACC0611CA;
        Tue, 15 Dec 2020 12:21:49 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id a9so42739856lfh.2;
        Tue, 15 Dec 2020 12:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bXM4LwkJ8HT8iXKu/PlPSEd39Ex3v5nyldhsjzCJ768=;
        b=LH0JwAtdOlY+Ja2dD1DtqboKj/NzQnUU6e0s5nKxJns2ryvcsYR0dZ7DK6H6aOzl2T
         6B8P4IzjiSRmUQSsEcF069BtMkyHZDDwJ8vqs+5u8lpmaracJzo1hCx+0/PTXJG2LdAZ
         Jdd0qVfHJ5XZOvK8SMxFi9M//iAMYPoocLb8GT37ZS0mg7uVvcXM6IFTzhIrwvOFf6PW
         47au0pEYnVhywaDiO2kuxQ7nFdLj+ZdK724LDjfHsr6t3/pXSikuelwnNDi/VF7qZ4TB
         zrs4WTEyjH5/StmBbKXvXKn+DbBAbbc0qfzNYOlBitgN6pyts3yv6nBUhfYvcYiR4RgB
         YpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bXM4LwkJ8HT8iXKu/PlPSEd39Ex3v5nyldhsjzCJ768=;
        b=ExMbohs45SV3qOE0bjzKNmU1RVLoENNTsmMp/yyHglgyFqDT9m1Fwwpve0Q5kIw4nU
         /OXMU0o7oGolM0BlbYfropSg0GubFbQAClA2NLekQpcgItKQpr0NJUfnv9qGKRQS4rXg
         ZlzPnOhKpk8lIbnEKwpVeOmaYELQKrarqu+u8Zi79TwJvdrLt57/VL+iic8wKyVoWqyr
         0C+j8RgpBwUqsQ6Z3qshX+p1nLyLwbBJlTxBxda3WMYyt9ybyy628iScraLp51m4Jyjg
         d7LdPpKO0v9x+uBvH7KczIUnF6Nfr8ZRMTp1u2WCCkF8Lc994c5aglsfZS8Uxtqh2+SD
         Detw==
X-Gm-Message-State: AOAM531QCrzdTboyXtjsBPmlKei42TXrpIPBhzDZbo4uMbDnswJNuH4+
        2hsXCzXCQkd72WqmTK0mbNk=
X-Google-Smtp-Source: ABdhPJyTEnv06k1CGPf9MsEiaFSy1QK869bBB4Wt5PjWwjN718XpWVs0dau5XagJo03pszy7GlFrfw==
X-Received: by 2002:a05:6512:4d9:: with SMTP id w25mr9509959lfq.199.1608063707647;
        Tue, 15 Dec 2020 12:21:47 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f3sm2873711ljp.114.2020.12.15.12.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 12:21:47 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/8] usb: chipidea: tegra: Remove MODULE_ALIAS
Date:   Tue, 15 Dec 2020 23:21:08 +0300
Message-Id: <20201215202113.30394-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215202113.30394-1-digetx@gmail.com>
References: <20201215202113.30394-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The module alias is provided by the OF core for the OF drivers, it
overrides the alias set by the drivers. Hence remove the unneeded macro
in order to keep the driver code cleaner.

Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Tested-by: Peter Geis <pgwipeout@gmail.com>
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

