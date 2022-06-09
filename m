Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD17C43334
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Jun 2022 13:09:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234774AbiFINJz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Jun 2022 09:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245422AbiFINJp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Jun 2022 09:09:45 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D453F3FBF2
        for <linux-tegra@vger.kernel.org>; Thu,  9 Jun 2022 06:09:40 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 8ED1820004;
        Thu,  9 Jun 2022 13:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1654780176;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eiW5XX4G6BORWJwBzOF2O2JKl5RR7aPF3IVGmwd6dVg=;
        b=f0WMxsk1YX5fvY6/59I75NnDKeSFKJJEqH/EWG+0+68LSRhxKBfTm+JJXgJ57ajxJkk31l
        g/wEXo7tSsHNRaPXkNUjpJrklbVgJedvuLVsQILQCgny6sa/yQ2jrrU8u49XYwDTSXl2wB
        F+6U/HwtRDlbuNqvKqICCOU67ka69gO00d5jcjS8mfqx6XuJf6MMxsHzlvHRPH+jGTzY22
        jLH+TZKrGh9g2oOja8BrzAq1OThVAZyhGgW5ziR5/iDFamC+sHOVpsQ+u2QJ8PeUB+eDgF
        x04ONmPWXUlPkiVlSIrJv4T3QrhrMJOZV0rCWUbZvpSZtsmZsGzcbbxKN0xWZA==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     kernel@pengutronix.de, linux-mtd@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 10/14] mtd: rawnand: tegra: Don't skip cleanup after mtd_device_unregister() failed
Date:   Thu,  9 Jun 2022 15:09:35 +0200
Message-Id: <20220609130935.293250-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220603210758.148493-11-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'413948cc6208c7b47dd9fc8c56cbb04c3b2381b3'
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 2022-06-03 at 21:07:54 UTC, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= wrote:
> If mtd_device_unregister() fails (which it doesn't when used correctly),
> the resources bound by the nand chip should be freed anyhow as returning
> an error value doesn't prevent the device getting unbound.
> 
> Instead use WARN_ON on the return value similar to how other drivers do
> it.
> 
> This is a preparation for making platform remove callbacks return void.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
