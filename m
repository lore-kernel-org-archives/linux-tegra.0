Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2319CC433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Nov 2021 16:23:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0523861C32
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Nov 2021 16:23:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238991AbhKQQ0k convert rfc822-to-8bit (ORCPT
        <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 Nov 2021 11:26:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238987AbhKQQ0j (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Nov 2021 11:26:39 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF44C061570
        for <linux-tegra@vger.kernel.org>; Wed, 17 Nov 2021 08:23:40 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mnNij-00068w-9D; Wed, 17 Nov 2021 17:23:37 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mnNii-000ItH-Hy; Wed, 17 Nov 2021 17:23:36 +0100
Message-ID: <3975fcc5ebc31761d513f1961ee054f5fe76431c.camel@pengutronix.de>
Subject: Re: [PATCH] reset: tegra-bpmp: Revert Handle errors in BPMP response
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 17 Nov 2021 17:23:36 +0100
In-Reply-To: <20211112112712.21587-1-jonathanh@nvidia.com>
References: <20211112112712.21587-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 2021-11-12 at 11:27 +0000, Jon Hunter wrote:
> Commit c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP
> response") fixed an issue in the Tegra BPMP error handling but has
> exposed an issue in the Tegra194 HDA driver and now resetting the
> Tegra194 HDA controller is failing. For now revert the commit
> c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP response")
> while a fix for the Tegra HDA driver is created.
> 
> Fixes: c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP response")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Thank you, applied to reset/fixes.

regards
Philipp
