Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5356AC433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Jan 2021 02:39:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0313922AAA
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Jan 2021 02:39:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730855AbhAYQrV convert rfc822-to-8bit (ORCPT
        <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 25 Jan 2021 11:47:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730860AbhAYQrL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Jan 2021 11:47:11 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41834C061786
        for <linux-tegra@vger.kernel.org>; Mon, 25 Jan 2021 08:46:31 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1l450Q-0001bl-4B; Mon, 25 Jan 2021 17:46:22 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1l450P-0002UF-Dm; Mon, 25 Jan 2021 17:46:21 +0100
Message-ID: <8432b6e84b2a4acd500c88228c37ba573330b235.camel@pengutronix.de>
Subject: Re: [PATCH v1] reset: Add
 devm_reset_control_get_optional_exclusive_released()
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 25 Jan 2021 17:46:21 +0100
In-Reply-To: <20210123163445.24474-1-digetx@gmail.com>
References: <20210123163445.24474-1-digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

On Sat, 2021-01-23 at 19:34 +0300, Dmitry Osipenko wrote:
> NVIDIA Tegra DRM and media drivers will need a resource-managed-optional
> variant of reset_control_get_exclusive_released() in order to switch away
> from a legacy Tegra-specific PD API to a GENPD API without much hassle.
> Add the new reset helper to the reset API.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> 
> Hello Philipp,
> 
> This patch is a prerequisite for a power domain enablement using
> GENPD API on NVIDIA Tegra20/30 SoCs. The hardware resets are acquired
> by a Tegra PMC (Power Management Controller) driver until device is
> RPM-resumed if GENPD API is used, and thus, device drivers need to
> request resets in a released state. The resets are also optional,
> depending on hardware and DTB versions. This is why we will need the
> new helper. Will be awesome if you could pick up this patch for v5.12,
> this will help to avoid inter-subsystem dependencies for the driver
> patches that will target v5.13. Thanks in advance!

Thank you, looks good to me. Applied to reset/next for v5.12.

regards
Philipp
