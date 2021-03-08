Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F98C4361A
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Mar 2021 14:56:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B47765218
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Mar 2021 14:56:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbhCHOzl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 Mar 2021 09:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbhCHOze (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 Mar 2021 09:55:34 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC3AC06175F
        for <linux-tegra@vger.kernel.org>; Mon,  8 Mar 2021 06:55:33 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id b7so15144380edz.8
        for <linux-tegra@vger.kernel.org>; Mon, 08 Mar 2021 06:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XWoEzbGml88OxuqmQAcHOjUJ4xDFJxJMYhsbSvaYG8g=;
        b=CoZuzgDrGpFtj904f5wOt4pdQ3n8fg5dy/GPRYq1rjTInXfpz2xhI8+8Vv5wPkV1Wo
         wFX3oGQAjFIvlBNmhZJ6fvY9t8B76uKfz9sUj97rgWhDoIbGS6iSPrjfUOlCwHUfbIq2
         K2xcYmyB0aJUZyDJKKQ7UH544n9eeotYnTRliWp+P5UoX8W6F0lJnEflhgMhQNkWhd/s
         jHmpOQSIJXngWEOS0/6cemKhknyqXFEoxIrmGi11LpEyqZFY4UFQrV6uMwKSNbTfyNYK
         y71Ayez3+y21aI3oCrN+NZrk0zuVw2hZTTO0N+2evfe6jGpnUg8nBLo9mqvI+E7W5rOb
         npUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XWoEzbGml88OxuqmQAcHOjUJ4xDFJxJMYhsbSvaYG8g=;
        b=bkVsxo8jpDg6fY6Fr5MGsjxX3DI+6SDL3pcOraIi2g4aOaRsajutMi+f2Q379+tHKL
         GqMrcT1zuMV5rV0YC5WZ1OYCuuNnk9aOo65WzPeTJQW00bvhx6fQHRxS5SOgbLxmyY/2
         kkqSINIgYLEq6uHTx7orQJPD2ZwrlY6EWdKlwqFNjkXLm5bAhjSzum9WVbDsTYbElC5S
         /uH5dqMHKX4gImpQVpABLaQwqFG7WS2RRB2cE3e4Bi7vFThzIXFRC4sfui2KLkOl726S
         3BLb4HDjT0X/Gms+PhMItv4r2OLlQ8YwVoWyX7mNlmhXCaPXCbBfha6unFiW9JC78bh4
         XcfQ==
X-Gm-Message-State: AOAM530dXF8+J1xmEkqE4JidgZ5ccSXuIa19qDB6T5x7ySWw815aWKCj
        UglA3raD7kvVb1kdQ3uIdAcnfg==
X-Google-Smtp-Source: ABdhPJwUcJ3SUmtLrEEaeqoD1Jfg434VvxyQqtPpgiiJeOCIL6JkqcZQQAQ8evRVIMOkpgIhXEKA1w==
X-Received: by 2002:aa7:c1d5:: with SMTP id d21mr21943395edp.167.1615215332510;
        Mon, 08 Mar 2021 06:55:32 -0800 (PST)
Received: from localhost.localdomain ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id bt14sm7411234edb.92.2021.03.08.06.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 06:55:32 -0800 (PST)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
        linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Cc:     broonie@kernel.org, gregkh@linuxfoundation.org, elder@kernel.org,
        johan@kernel.org, vireshk@kernel.org, rmfrfs@gmail.com,
        f.fainelli@gmail.com, ldewangan@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com, linux@deviqon.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH 05/10] spi: spi-tegra20-flash: don't check 'delay_usecs' field for spi transfer
Date:   Mon,  8 Mar 2021 16:54:57 +0200
Message-Id: <20210308145502.1075689-6-aardelean@deviqon.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308145502.1075689-1-aardelean@deviqon.com>
References: <20210308145502.1075689-1-aardelean@deviqon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The 'delay_usecs' field was handled for backwards compatibility in case
there were some users that still configured SPI delay transfers with
this field.

They should all be removed by now. So we can remove the 'delay_usecs'
handling in this driver.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/spi/spi-tegra20-sflash.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-tegra20-sflash.c b/drivers/spi/spi-tegra20-sflash.c
index cfb7de737937..2888d8a8dc6d 100644
--- a/drivers/spi/spi-tegra20-sflash.c
+++ b/drivers/spi/spi-tegra20-sflash.c
@@ -341,8 +341,7 @@ static int tegra_sflash_transfer_one_message(struct spi_master *master,
 			goto exit;
 		}
 		msg->actual_length += xfer->len;
-		if (xfer->cs_change &&
-		    (xfer->delay_usecs || xfer->delay.value)) {
+		if (xfer->cs_change && xfer->delay.value) {
 			tegra_sflash_writel(tsd, tsd->def_command_reg,
 					SPI_COMMAND);
 			spi_transfer_delay_exec(xfer);
-- 
2.29.2

