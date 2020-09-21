Return-Path: <SRS0=KKuN=C6=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04F1C43463
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 10:25:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 605C0218AC
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 10:25:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="piius7Fa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbgIUKZt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Sep 2020 06:25:49 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9299 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgIUKZs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Sep 2020 06:25:48 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e4f0006>; Mon, 21 Sep 2020 03:19:59 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:20:45 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:20:42 +0000
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
Subject: Re: [PATCH v7 32/34] i2c: tegra: Clean up and improve comments
In-Reply-To: <20200908224006.25636-33-digetx@gmail.com>
References: <20200908224006.25636-33-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <5c99c0207a6a475d9c95116ddcc0a494@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683599; bh=7Qt+T6AHmZEBZ265WSQwUhp4FX+mf7LgoZP2GuxxkOI=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=piius7FaY0jfAXWAlzZtTkz/ClzY7ZqRdducbvlxnohnkJW58mzhm02pEOBU6TWGW
         BpZqGWasUuCtn8b5dffZGS8s8Vf+SDcUNbcowm2PfeqD4ywKQrbecT/qixwej0kEM/
         vdUY6CQCI70AHQmyZ9tvxiLX9nof/VPHBNqjRZ+g5iAuFRi3EVnVUq5SbtuetYju/u
         Jzv++ekLrxr+AwYmiYHBS79bh6XXdGen03ukx5E83z6RFD93yDyJvoj77NPtYJJpLH
         wP6GhSVqfXTy1RfVu+N/bKWBB5KO5cZfJfr/JSlCUOVY9WvVRwXYpWtPPG/RH1HtBB
         1RW1qc063If/A==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 09 Sep 2020 01:40:04 +0300, Dmitry Osipenko wrote:
> Make all comments to be consistent in regards to capitalization and
> punctuation, correct spelling and grammar errors, improve wording.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 88 ++++++++++++++++++----------------
>  1 file changed, 47 insertions(+), 41 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
