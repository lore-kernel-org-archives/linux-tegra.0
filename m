Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CDFC77B60
	for <linux-tegra@archiver.kernel.org>; Mon,  3 Apr 2023 12:37:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbjDCMh4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 3 Apr 2023 08:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232167AbjDCMhz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Apr 2023 08:37:55 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3501A7
        for <linux-tegra@vger.kernel.org>; Mon,  3 Apr 2023 05:37:53 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id er13so75743389edb.9
        for <linux-tegra@vger.kernel.org>; Mon, 03 Apr 2023 05:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680525472;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5obv6WT29L0mAMWTpZ3ufXGWWlSAHiIXix9VBnKx4y4=;
        b=JqGV2tEuOHVrULHZTKRDxmGBXUUuucXEJ6zyqDA4folv5PnQc6selWSmPY6X3CF8av
         Rmf68yOVGD0u5pU9+4Ems+4J2fuC0UQv3zN0/eSZoQM4tz2handsqt3217GjQApACF/m
         Y/+8HzHTkD57j5E3W5pY6ODDaI5HcMllxtgD1GCR9z2uwpAVEyyuVrKsvXTg35//mqbl
         l8wC+AkclDkLKckIVqW9zG4WwrfZ5h3sU3OVSKEOhJ+qOOBnpNqrMzqU8CgNIh5GFsJN
         8lqdBA4pVzvtQO0tKF5I7TpWq6UVcDzLSwFNY6mUjh8bw30M5EMbImFAobBG/BV837eK
         r43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680525472;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5obv6WT29L0mAMWTpZ3ufXGWWlSAHiIXix9VBnKx4y4=;
        b=NQZAMP1xakQQRLUgx1NZ2U1QYLMAkBBxWg7z6QTthyZpi5MQi1ZSJryAyVN3bfjbEC
         ZHzluOBVWLq/LiVc19ODJpmo48iP/dgA/Xl5FSzbIgukTqEYvFf0NpX+J3VVvZW5wg3H
         IS5SBDvCB+FN0tREuk7Q6r5BpPxOUxTgiMdvgjYG0OiXHC+3xsGxMtOQmU9hOl5XM84D
         5ECfQ3kYJNIf95NmtYFrjgL47i1Crmwk+W3OaiUA0ufXXwZm9ZKvON7jqzdFNK+Hh+tx
         TPWvvku6F5neiwqjozRTGnW75FBvgZBpeV4qZfV/QaVMuYHN78ljRgTE1bUyGAM1rlWO
         cdsg==
X-Gm-Message-State: AAQBX9c0DpzHdfcQdx1eo4ybn4E8Pc38/Z/bsTqZLwK1bUSfiG7KdQhs
        BV1yd5XQzvFpYjDnTDlDGywS7i0+MUc=
X-Google-Smtp-Source: AKy350ZCfNff5yi+3IfCxU/maqaLgzd+4cD1ilySxy25SMeOHIt4CMPj+bbP87x+CpI8gd6olXqWSg==
X-Received: by 2002:a17:906:2547:b0:931:e5de:d28d with SMTP id j7-20020a170906254700b00931e5ded28dmr34649786ejb.33.1680525471777;
        Mon, 03 Apr 2023 05:37:51 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n7-20020a170906700700b009324717b9f3sm4511091ejj.71.2023.04.03.05.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 05:37:51 -0700 (PDT)
Date:   Mon, 3 Apr 2023 14:37:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sushil Singh <sushilkumars@nvidia.com>
Cc:     treding@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, vbhadram@nvidia.com
Subject: Re: [PATCH V2] soc/tegra: pmc: Add wake source interrupt for MGBE
Message-ID: <ZCrIna6vM7T4m-wc@orome>
References: <1679577204-8304-1-git-send-email-sushilkumars@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bzyncVIyFKtKrh1S"
Content-Disposition: inline
In-Reply-To: <1679577204-8304-1-git-send-email-sushilkumars@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--bzyncVIyFKtKrh1S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 06:43:24PM +0530, Sushil Singh wrote:
> Add the GPIO wake interrupt for MGBE ethernet controller on Tegra234 SoC.
>=20
> Signed-off-by: Sushil Singh <sushilkumars@nvidia.com>
> ---
>=20
> Changes in v2:
> Address Jonathan's comments
> Rewrite the commit description
> Use "mgbe" instead of "mgbe_wake"
>=20
>  drivers/soc/tegra/pmc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index cf4cfbf..0f3c472 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -3,7 +3,7 @@
>   * drivers/soc/tegra/pmc.c
>   *
>   * Copyright (c) 2010 Google, Inc
> - * Copyright (c) 2018-2022, NVIDIA CORPORATION. All rights reserved.
> + * Copyright (c) 2018-2023, NVIDIA CORPORATION. All rights reserved.
>   *
>   * Author:
>   *	Colin Cross <ccross@google.com>
> @@ -4227,6 +4227,7 @@ static const char * const tegra234_reset_sources[] =
=3D {
>  static const struct tegra_wake_event tegra234_wake_events[] =3D {
>  	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA234_AON_GPIO(EE, 4)),
>  	TEGRA_WAKE_IRQ("rtc", 73, 10),
> +	TEGRA_WAKE_GPIO("mgbe", 56, 0, TEGRA234_MAIN_GPIO(Y, 3)),
>  };

Applied, though I did sort this into the right place (these are ordered
by wake number).

Thanks,
Thierry

--bzyncVIyFKtKrh1S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQqyJ0ACgkQ3SOs138+
s6HmSBAAm7xQszCPgQM5TQvrgCrPlHEj1KCJWiVcZVmVE5GOo0M7/2YoTm5sIUiT
psenDPX40w657L5x73M+whdLde1OUZmDCxEUcr2xrF2YFpVZkwX4aA/iPHjGckC5
8n8U3JQSosSBlqY7jNfDbXyPRG9TEzBa7BEFReqabZ1Q4CD3NoLeHrCJzyiwbydo
4qHfDAGj8BrGswmFDdjZCiok8h7G2Ylu6MtUGMzZuNfiBTiXiXgrk1CK6BVn/Daq
U/u+loLoLgDvcv5dgmySnDTZRvGRilKTR1PzvG1SsHnt6SAfoPCH87RmXA/sSXvt
SrMLphzUcHGGS2eFOldgKQWsw4Pz0gwCzzi0luMNYXybF19GFPhAZA3/0RqXL3u3
OZil8icWSs5x9awBBkRPDVcWYIyR9QVmIrDNig9JsmeXGLEzqRrq2gh+TtlSobly
SbxcIzOdCBLst7EIZXWQ3AJAUPf3kaZLfWSBVsefvcnaI93eU09fFKP3FlFCuvAv
ZxIL0KbypmwgKXJ7XPb4QHhc0Ksz6uEeuH4md9uQmF69glwK3PIxdxddXina91v4
r3VK+mokwtGjBySTQQgLr1xuPP8muwihl9KynFidZ+CHJp7Op/DGMo6OZs/cnOuW
QYqMkcSmTT5CSJpmCp5jWlGfCcTz3sQRJOfj5AEertuOzl3nwsM=
=Kzp1
-----END PGP SIGNATURE-----

--bzyncVIyFKtKrh1S--
