Return-Path: <SRS0=KKuN=C6=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB56EC43464
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 10:18:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 730E4218AC
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 10:18:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="nh80Wb8r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgIUKS6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Sep 2020 06:18:58 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18405 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUKS6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Sep 2020 06:18:58 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687db50000>; Mon, 21 Sep 2020 03:17:25 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:18:57 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:18:55 +0000
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
Subject: Re: [PATCH v7 07/34] i2c: tegra: Runtime PM always available on Tegra
In-Reply-To: <20200908224006.25636-8-digetx@gmail.com>
References: <20200908224006.25636-8-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <ea6d5580a0f040caac30d70533814c40@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:18:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683445; bh=ie8rGEINW3MKCgc0UrTv0/7rjOA56FJ+kaUHyLL1zms=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=nh80Wb8rQ0RWHlDqFjPTpRrAYMlcrnqNqyOvTqzXQBUKCQW7ogUv3uGxvPotud8Gv
         ddCbCrZJoNDymsogIHKeMOEdLHZGXWUD9jwpiMms+frzdjiZ062jG2eewDwVC2okOZ
         ofsxvu4D2/Oi99a2XkUa//HqZldeB47TdwDBy4gg5TvQjnWjUdy4eICXx21FWP6cBs
         Z6S9ZiuQdwduwHX4Lq8b2NWxvhkSrJAr4LJwS2L0cxheWQ/PulI5iGnMOR4hDDEeks
         vq6O4tDkof2nIT337TWmEyxvbNsVghS6DUv/dWGEY8hAfpx3eZ2GmLn2jE0MwnorNA
         gcr+YW0R3k6xw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 09 Sep 2020 01:39:39 +0300, Dmitry Osipenko wrote:
> The runtime PM is guaranteed to be always available on Tegra after commit
> 40b2bb1b132a ("ARM: tegra: enforce PM requirement"). Hence let's remove
> all the RPM-availability checking and handling from the code.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 29 ++++++-----------------------
>  1 file changed, 6 insertions(+), 23 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
