Return-Path: <SRS0=KKuN=C6=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53438C43463
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 10:20:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DC14207BC
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 10:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="YIlbcdmf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgIUKT5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Sep 2020 06:19:57 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18229 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKT5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Sep 2020 06:19:57 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e400000>; Mon, 21 Sep 2020 03:19:44 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:19:56 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:19:54 +0000
From:   Thierry Reding <treding@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 21/34] i2c: tegra: Don't fall back to PIO mode if DMA
 configuration fails
In-Reply-To: <20200908224006.25636-22-digetx@gmail.com>
References: <20200908224006.25636-22-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <c6a6c72998a045398bbd40d7672457ef@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683584; bh=rj4+M6DD6otkwDGZkPtBHSzGMkXryvZLbVWueeLZG8A=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=YIlbcdmfvAOSf6IRQiDvnctM4mFiaFDgvqCZLM+Ie38OJYsafI0u1Zjt3lTXCcfKM
         XwWqIjV6F8LhEEcJoBE6CdisPfp+k7SUe/6MvaMxyB85+qlyUK9u8JePSQNb5Qwynk
         NEpLjRy/g2l6rQL9+XkTazAz9EYh2ApW6OFYirmM7ykmq7cZIbtfLqReGJQeQCnkQi
         rI+mPO7hJRn3iiMP+yYcFPrLCvZhI4H6EN3XmhqpXLx2ILu1gMkYYA/utOZSh3/+wb
         0rZfJfq5h61NFPkqOeuJ4Npo9okSiacxoO6+MJ4JAoAN/nxTWjpxAHdhWkE0sLHjLy
         6g4jKs6bc36QA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 09 Sep 2020 01:39:53 +0300, Dmitry Osipenko wrote:
> The DMA code path has been tested well enough and the DMA configuration
> performed by tegra_i2c_config_fifo_trig() shouldn't ever fail in practice.
> Hence let's remove the obscure transfer-mode switching in order to have a
> cleaner and simpler code. Now I2C transfer will be failed if DMA
> configuration fails.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
