Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C17EC432C3
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Mar 2021 14:56:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D14D6519D
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Mar 2021 14:56:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbhCHOzm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 Mar 2021 09:55:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbhCHOzf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 Mar 2021 09:55:35 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09FC1C06175F
        for <linux-tegra@vger.kernel.org>; Mon,  8 Mar 2021 06:55:35 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id v13so15119223edw.9
        for <linux-tegra@vger.kernel.org>; Mon, 08 Mar 2021 06:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Io9v2GBIlHI+Tmp+Muo2ozOuxnB5JlN/m/peVkSOoQk=;
        b=KN8oqTz03n4iXKtuJ5qi9J7eiFCSjzNROABDY6Gb/MplICzu3i5V03YptgmpTTumx9
         qzHGrgq8fs8JGet9Odv3isiqA2BAEwaSruGVQmS9a+mZpNXFpeE4VcGYKpq2SjITIXEr
         iZu8cMKqFXc0GNaf9S/tP3IfDJqMyEWVlwbxUYbisZoe8tFawpRpLzcdVzwhbtNF+qfh
         oh5qVIsYJBFymQreVC72K8pfrXlBDUp9vpAjjD5DhQNe9vKsYc0LarvZp9YPPAvTNQ6k
         bUkDxp4231M2aHh4lz1mTKmik9470JWb/d4AGTx8NT+lMZyzE4h4Q/QHCx3Q8heZ+6Wu
         Pn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Io9v2GBIlHI+Tmp+Muo2ozOuxnB5JlN/m/peVkSOoQk=;
        b=su/toNF2pdkqdVu//HjOqh5m01/tyfpOVsn9fmC9vs/3tV2MyasB1KOUZz8CUUOgQb
         uA1DJ6UUp2lT/UcEuceLdHmE9Vwe90Gf1W607JrKAoxdLZKqCiM2ZyFORDYaE2jUmMLb
         FRqp3LPGxa0hGojYtfqFOE4LM4SQM/ijnpTEAJBn5wGRdIZo3EdmkZrD4FMhOnPvn2i+
         BTa8j7iGqT8y9TF8eMb8BnLXC7V2XVpdgzrAMb9b21nBWJAnzxfYEhdQf+JQdm91oR6Y
         ufFBzGHtghtcS4603fBsPDtvtXTTxBBz2X2yG3UZpNzS7KG+N9lXAW0JzhpMKprAMZKq
         rTCQ==
X-Gm-Message-State: AOAM53032zhiXsuEOWKIJv54Kzg1SfgdyCA0R17YSjOrTTzlim8WIEI+
        741otRMmiIXvZVjTtgnID26bZQ==
X-Google-Smtp-Source: ABdhPJzOxDsiKTJZFzssNH71mhV3dmH3qpwIBVJVNeEVFcuravA0h+m9Fy72NPjkwyy5NAtefvkZcw==
X-Received: by 2002:a05:6402:2076:: with SMTP id bd22mr22161922edb.378.1615215333831;
        Mon, 08 Mar 2021 06:55:33 -0800 (PST)
Received: from localhost.localdomain ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id bt14sm7411234edb.92.2021.03.08.06.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 06:55:33 -0800 (PST)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
        linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Cc:     broonie@kernel.org, gregkh@linuxfoundation.org, elder@kernel.org,
        johan@kernel.org, vireshk@kernel.org, rmfrfs@gmail.com,
        f.fainelli@gmail.com, ldewangan@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com, linux@deviqon.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH 06/10] staging: greybus: spilib: use 'spi_delay_to_ns' for getting xfer delay
Date:   Mon,  8 Mar 2021 16:54:58 +0200
Message-Id: <20210308145502.1075689-7-aardelean@deviqon.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308145502.1075689-1-aardelean@deviqon.com>
References: <20210308145502.1075689-1-aardelean@deviqon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The intent is the removal of the 'delay_usecs' field from the
spi_transfer struct, as there is a 'delay' field that does the same
thing.

The spi_delay_to_ns() can be used to get the transfer delay. It works by
using the 'delay_usecs' field first (if it is non-zero), and finally
uses the 'delay' field.

Since the 'delay_usecs' field is going away, this change makes use of the
spi_delay_to_ns() function. This also means dividing the return value of
the function by 1000, to convert it to microseconds.
To prevent any potential faults when converting to microseconds and since
the result of spi_delay_to_ns() is int, the delay is being computed in 32
bits and then clamped between 0 & U16_MAX.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/staging/greybus/spilib.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index 672d540d3365..30655153df6a 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -245,6 +245,7 @@ static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
 	/* Fill in the transfers array */
 	xfer = spi->first_xfer;
 	while (msg->state != GB_SPI_STATE_OP_DONE) {
+		int xfer_delay;
 		if (xfer == spi->last_xfer)
 			xfer_len = spi->last_xfer_size;
 		else
@@ -259,7 +260,9 @@ static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
 
 		gb_xfer->speed_hz = cpu_to_le32(xfer->speed_hz);
 		gb_xfer->len = cpu_to_le32(xfer_len);
-		gb_xfer->delay_usecs = cpu_to_le16(xfer->delay_usecs);
+		xfer_delay = spi_delay_to_ns(&xfer->delay, xfer) / 1000;
+		xfer_delay = clamp_t(u16, xfer_delay, 0, U16_MAX);
+		gb_xfer->delay_usecs = cpu_to_le16(xfer_delay);
 		gb_xfer->cs_change = xfer->cs_change;
 		gb_xfer->bits_per_word = xfer->bits_per_word;
 
-- 
2.29.2

