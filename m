Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0DCC433E9
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Feb 2021 07:36:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EE5D64E65
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Feb 2021 07:36:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhBLHgG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Feb 2021 02:36:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhBLHfY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Feb 2021 02:35:24 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A9EC061574;
        Thu, 11 Feb 2021 23:34:36 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id f1so11808582lfu.3;
        Thu, 11 Feb 2021 23:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y3hGEJAC31/KRNjy0ROs+LaCPxDmfXe9m8Xp8ZPqihs=;
        b=KY8CWmmvhmEQaatRl10NIsd/xWZpEElri4vTuBbzGR3jOEQYF5/lnqnMpFi9JJYTdA
         FHGHbUjv14vmZWRk+Mhg2jOqINdacPBYl7f9X4jItK/hzKj6pE/PynwWW3bGtPMQOF3M
         SJ2jBwnmHztFCww+zZ/B6f/aQOiJxdPNxxnDEPTMsOOhkBpMraQ1na9wnxhVpLiane0q
         pigV+v/6P7L4/ubMyIcSN2wAPmxl7JUxsIvJrLhPP09nYdtQWwMUIt+s+r5kPu7CdaAo
         GJMpGzQH/BDU1C+NAerp58gxeFROcy7Muq2M0PDWft8tEmsjdIq6aVTRUYk1KH0Bvsq1
         PXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y3hGEJAC31/KRNjy0ROs+LaCPxDmfXe9m8Xp8ZPqihs=;
        b=WNjizBw7sm9PM8lnXEBd5r0b1sVu5wbmRgaLHgep1M7xtESQ9gIldwVidCqUa/T6HD
         BqfHcIrtx0ZntBRO9JVHfUWV8FJ4A8BgL/usJZDUs0GPVsgdJ4GruTEP86eIIHXNBNEv
         QMY/czabzXkD3LOJVfIyutA1wqcv40EGZNBa8EFARBytUQg1H+3y7B/gvwgNQQWL7OKk
         FvdNqUNq0Qv7bfsAbSSCsVi6lST3oKWZMqZW5wLdngpnOFII3+sV/wbZmxPlzbI3aCfI
         TRrskoch1MSfaaXc6h66drV4fDc3QHqUZ2KaMMHF8PdI8kP4BtFZD7+Vzj5w7RpeFsW+
         6szA==
X-Gm-Message-State: AOAM5307b764zyQS323ghEnBS9BFLIa+0qXFn63VA/evnpPnaFgMwC65
        lledlO5b/HYOpp5hMg6ftSyQov9PU7sXxw==
X-Google-Smtp-Source: ABdhPJzv5Dw2UavQKAtYF4gkGVlRUlW06E5X49hx6/reBkqFu+Q+yooaflQj2bSHIkYwhLI98r1wcg==
X-Received: by 2002:a05:6512:505:: with SMTP id o5mr900612lfb.90.1613115274959;
        Thu, 11 Feb 2021 23:34:34 -0800 (PST)
Received: from TRWS9215.usr.ingenico.loc ([213.143.229.14])
        by smtp.gmail.com with ESMTPSA id z11sm883311lfd.98.2021.02.11.23.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 23:34:34 -0800 (PST)
From:   Fatih Yildirim <yildirim.fatih@gmail.com>
To:     marvin24@gmx.de, gregkh@linuxfoundation.org
Cc:     Fatih Yildirim <yildirim.fatih@gmail.com>,
        ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH -next] staging: nvec: minor coding style fix
Date:   Fri, 12 Feb 2021 10:34:23 +0300
Message-Id: <20210212073423.20562-1-yildirim.fatih@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fix for the below coding style warning.
Warning: Move const after static - use 'static const int'

Signed-off-by: Fatih Yildirim <yildirim.fatih@gmail.com>
---
 drivers/staging/nvec/nvec_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 0e861c4bfcbf..b1ef196e1cfe 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -338,7 +338,7 @@ static const struct power_supply_desc nvec_psy_desc = {
 };
 
 static int counter;
-static int const bat_iter[] = {
+static const int bat_iter[] = {
 	SLOT_STATUS, VOLTAGE, CURRENT, CAPACITY_REMAINING,
 #ifdef EC_FULL_DIAG
 	AVERAGE_CURRENT, TEMPERATURE, TIME_REMAINING,
-- 
2.20.1

