Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD0AC43381
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Mar 2021 14:56:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3DC6651DC
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Mar 2021 14:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbhCHO4N (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 Mar 2021 09:56:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbhCHOzk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 Mar 2021 09:55:40 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BCFC061760
        for <linux-tegra@vger.kernel.org>; Mon,  8 Mar 2021 06:55:40 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id r17so20904176ejy.13
        for <linux-tegra@vger.kernel.org>; Mon, 08 Mar 2021 06:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lLj7Gp4AXNBIRfM05Fb/npNKmdzGnIj+j8T+QIUmIp0=;
        b=GYwAt5N11Htctvk5vaStUU1oMV8AcHJat8k+JeWcUlAP6NIzKfpP2octcY7sipgk3Q
         q2JbUqobc5/wdXMc3ss58YGJM1/dfaYyxxVtxbzbXRmGPABKNLCY4f8p9dE17XRZWR4P
         G4eWbUvaydrHkOhcAKITzQ4XatIdcCRogDyorfkg9j9xZPTLwSBwVpPrx36/8lCWs64y
         AmnbbHYZYZRjlVXrAFO8UFbyNEm3nAGU280MlSxCdKPqrVn6TGqZM6/tk9WeB3xyULdp
         duSPWwZG4Bs2YEcTeTv9hOjWQC+g8vtDuFJLHkEArTfM+f7c3u1IiTVgSOgSM1mvqH1E
         MAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lLj7Gp4AXNBIRfM05Fb/npNKmdzGnIj+j8T+QIUmIp0=;
        b=EPnycycqaFfduR5WWelsRg9yga7pQbjIB6G984EBgxWUAje5pXntEbwaCZh+gbIVKt
         Gno6Rmeycb+q9a6414Agzx6aUPD10/fqngoECW5446fJvqqyGAOg4tjLcnTWwDpwE23C
         Y3e8uw9xnHs1mSACYoivcPvZED6MSKlNn9P/dsrOVBNd3w2J9T3US2z+b1rBKwsDmXcs
         ogJEcMYfCmnHs+iLHAOSYPSAohwExu5KjdD8g/6/YDVdHtnGTGfFrJeFmFpGWvgDocMQ
         aN3QaUFA4Zs0f5NLJpddylcy0cxqzYqXQuAwQ9HG/K/t7H+tqrDQH/BR1SZl0OEDrelf
         aGDg==
X-Gm-Message-State: AOAM532z1IUur+L7dSEVNHu7Usn0piReuLI9vKN4VOStT/LOXZySkTeh
        Z8Yje9R27ZFlspkNklsW7IeNMg==
X-Google-Smtp-Source: ABdhPJwujoxKBULC2TiDF0uTmZ725nCMJDdNLnOASHbIowxRxu7/T7o0BEees1GbdUH3W536CdvnxQ==
X-Received: by 2002:a17:906:2804:: with SMTP id r4mr15241523ejc.521.1615215339299;
        Mon, 08 Mar 2021 06:55:39 -0800 (PST)
Received: from localhost.localdomain ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id bt14sm7411234edb.92.2021.03.08.06.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 06:55:38 -0800 (PST)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
        linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Cc:     broonie@kernel.org, gregkh@linuxfoundation.org, elder@kernel.org,
        johan@kernel.org, vireshk@kernel.org, rmfrfs@gmail.com,
        f.fainelli@gmail.com, ldewangan@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com, linux@deviqon.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH 10/10] spi: docs: update info about 'delay_usecs'
Date:   Mon,  8 Mar 2021 16:55:02 +0200
Message-Id: <20210308145502.1075689-11-aardelean@deviqon.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308145502.1075689-1-aardelean@deviqon.com>
References: <20210308145502.1075689-1-aardelean@deviqon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The 'delay_usecs' field is no longer present on the spi_transfer struct.
This change updates the doc to mention the usage of the (relatively) new
'delay' field.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 Documentation/spi/spi-summary.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/spi/spi-summary.rst b/Documentation/spi/spi-summary.rst
index f1daffe10d78..d4239025461d 100644
--- a/Documentation/spi/spi-summary.rst
+++ b/Documentation/spi/spi-summary.rst
@@ -411,8 +411,11 @@ any more such messages.
         duplex (one pointer is NULL) transfers;
 
       + optionally defining short delays after transfers ... using
-        the spi_transfer.delay_usecs setting (this delay can be the
-        only protocol effect, if the buffer length is zero);
+        the spi_transfer.delay.value setting (this delay can be the
+        only protocol effect, if the buffer length is zero) ...
+        when specifying this delay the default spi_transfer.delay.unit
+        is microseconds, however this can be adjusted to clock cycles
+        or nanoseconds if needed;
 
       + whether the chipselect becomes inactive after a transfer and
         any delay ... by using the spi_transfer.cs_change flag;
-- 
2.29.2

