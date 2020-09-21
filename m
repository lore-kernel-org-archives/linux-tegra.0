Return-Path: <SRS0=KKuN=C6=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F88C43464
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 10:23:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5585C207BC
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 10:23:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="TEHYAQs4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbgIUKXf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Sep 2020 06:23:35 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18631 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbgIUKUt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Sep 2020 06:20:49 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687e240000>; Mon, 21 Sep 2020 03:19:16 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:20:48 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:20:46 +0000
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
Subject: Re: [PATCH v7 33/34] i2c: tegra: Clean up whitespaces, newlines and
 indentation
In-Reply-To: <20200908224006.25636-34-digetx@gmail.com>
References: <20200908224006.25636-34-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <7979398231b1412b8560d0732aa3b714@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683556; bh=PDdBF4E9myBYoPsVXJZW7L4bfPu8/xVYxTduVBjvjsM=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=TEHYAQs4UdwQwKKVxddABc1fMKuKpqkOOYQGJg37Zvai1gvSamccbDSP+tKozv3JL
         6Xle884WvN9yVFQfSJJPPS2YHV/M28NOU1g27INf/Nq5IoHiJroaMF0oh3oAlbvPBW
         hoeIOEPbVOnkUDk7nO/Su/wSUGb1XnoAFphu0FpKi4zO+mmUgZfcU2CC+i8jHyYsAZ
         cdUVj5d2QZ1m93mUgRX30+Z/TWhtR09OpipZ4k/5QBMeB8zvKDg/vgJmLvZt2JLDdq
         B3epuW5RNqNKgqntlZqDD0fUmZ18IqfoR2+Vpbv63WSLGajCdyZSJEAc9IsVCAOZcL
         LR9j/5RBt+8Sg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 09 Sep 2020 01:40:05 +0300, Dmitry Osipenko wrote:
> Some places in the code are missing newlines or have unnecessary
> whitespaces and newlines. This creates inconsistency of the code and
> hurts readability. This patch removes the unnecessary and adds necessary
> whitespaces / newlines, clears indentation of the code.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 72 +++++++++++++++++++++-------------
>  1 file changed, 45 insertions(+), 27 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
