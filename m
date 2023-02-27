Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAEAC64ED6
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Feb 2023 14:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbjB0Oyk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 27 Feb 2023 09:54:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjB0Oyj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Feb 2023 09:54:39 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8785211FC
        for <linux-tegra@vger.kernel.org>; Mon, 27 Feb 2023 06:54:26 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id ck15so27178207edb.0
        for <linux-tegra@vger.kernel.org>; Mon, 27 Feb 2023 06:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Hds2TmZdBTtcm+aeUf4lpz2vPdmhZyeVykypny2GYk=;
        b=bb7yyQBYWAp37gT6647fl43Joo4yufTC3vXsRfSTzGnRloIFOWOTWVyQyCT7uWYArR
         Z+MJm2MsTWp2n2i3sgviyP0ZOUWjCGreg1hPG8fqoJSiZ+4HjuZ3QzctnrferVIVQMKX
         gOMNCSdYMKVwXqUs/dAll35h1Uzke53jYZPipTJeUybSzQwMXF/PS8qJwO77uF1kbf2a
         3voukuMRCzvG3nbunBDbHZaLCs+Fw45aZKyYSYl52Q6DjzbprhnwUUiWVqrTu96lpn0q
         pTZ+3LjOffCW+L9WsjXgWz9uwTanI8BEMGD4UflAP3dVyusop/IMbw2I+rrcT7zQHw2I
         IbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Hds2TmZdBTtcm+aeUf4lpz2vPdmhZyeVykypny2GYk=;
        b=CrkEx6VPcjzfbympSMj9wUnDmEZ0PgYYZazeCHLlj1n/KiSxUC9EMF4Pb3J8Ywwz70
         MuG66WjIAwZIFNahSMMaugf+v6Uv/R1DLz0rNa4uXfFfsbDnEwNlvCKwGmtpGGMBjygK
         SxUiF0ulsPLG7fdtEbmnsnzRcMvRaPYv9gsRsokD/hX7PotGDkc+VPnYregqxsiDmAcx
         dHZh5lFd/rs9iis4Iw8D5x1jC/j02hYpPTcXSNEHx4z0PMh7AXKsQSSSjOjeZLn4UgB5
         AFcgIwfoxjFZr1FyXMkonprYb/zXotpDb/sVsCCFw0AECiH4RQxW6422D2HiqDRfZjwB
         XCpA==
X-Gm-Message-State: AO0yUKUzXBBKXOhjPzoUybnsqpX+2wkmb85LZ0GBG5ulvSkwzMwyVb0O
        6JanjwZ31sVt8jS4niXAJ3uBWeDjwNk=
X-Google-Smtp-Source: AK7set/TSfVfJNjDcgGEZgIoJsupPiuoaHRFTHmbM2CXYvWuFeenWiZmBBjUxNUWr+Tfc8PFNwrgoQ==
X-Received: by 2002:a17:906:730c:b0:888:b471:8e46 with SMTP id di12-20020a170906730c00b00888b4718e46mr43238134ejc.50.1677509665174;
        Mon, 27 Feb 2023 06:54:25 -0800 (PST)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id md7-20020a170906ae8700b008bbc4f3bceesm3297117ejb.118.2023.02.27.06.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 06:54:24 -0800 (PST)
Date:   Mon, 27 Feb 2023 15:54:23 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Sushil Singh <sushilkumars@nvidia.com>,
        linux-tegra@vger.kernel.org, vbhadram@nvidia.com
Subject: Re: [PATCH] soc:tegra:pmc: Add wake source interrupt for mgbe.
Message-ID: <Y/zEH9JVRrUwXcMq@orome>
References: <1673864352-17212-1-git-send-email-sushilkumars@nvidia.com>
 <1b8de64a-dc55-8ed4-857b-9d524951760d@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="T8wMgJv1lUfEFL7q"
Content-Disposition: inline
In-Reply-To: <1b8de64a-dc55-8ed4-857b-9d524951760d@nvidia.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--T8wMgJv1lUfEFL7q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 01:34:55PM +0000, Jon Hunter wrote:
>=20
>=20
> On 16/01/2023 10:19, Sushil Singh wrote:
> > Add mgbe ethernet GPIO wake interrupt
>=20
> Add the GPIO wake interrupt for the MGBE ethernet controller on Tegra234
> devices.
>=20
> >=20
> > Signed-off-by: Sushil Singh <sushilkumars@nvidia.com>
> > ---
> >   drivers/soc/tegra/pmc.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> > index cf4cfbf..f4abc7f 100644
> > --- a/drivers/soc/tegra/pmc.c
> > +++ b/drivers/soc/tegra/pmc.c
> > @@ -3,7 +3,7 @@
> >    * drivers/soc/tegra/pmc.c
> >    *
> >    * Copyright (c) 2010 Google, Inc
> > - * Copyright (c) 2018-2022, NVIDIA CORPORATION. All rights reserved.
> > + * Copyright (c) 2018-2023, NVIDIA CORPORATION. All rights reserved.
> >    *
> >    * Author:
> >    *	Colin Cross <ccross@google.com>
> > @@ -4227,6 +4227,7 @@ static const char * const tegra234_reset_sources[=
] =3D {
> >   static const struct tegra_wake_event tegra234_wake_events[] =3D {
> >   	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA234_AON_GPIO(EE, 4)),
> >   	TEGRA_WAKE_IRQ("rtc", 73, 10),
> > +	TEGRA_WAKE_GPIO("mgbe_wake", 56, 0, TEGRA234_MAIN_GPIO(Y, 3)),
>=20
> Just 'mgbe' is sufficient.
>=20
> >   };
> >   static const struct tegra_pmc_soc tegra234_pmc_soc =3D {
>=20
> Please check the subject prefix for the subsystem by looking at the git
> history ...
>=20
> $ git log --oneline drivers/soc/tegra/pmc.c
> 0474cc8489bd soc/tegra: pmc: Process wake events during resume
> 1ddb8f6d44ff soc/tegra: pmc: Fix dual edge triggered wakes
> c9c4ddb20c42 soc/tegra: pmc: Add I/O pad table for Tegra234
> 74f7f183d81c soc/tegra: pmc: Check device node status property
> ...
>=20
> So the subject should start "soc/tegra: pmc: ". Also remove the '.' from =
the
> end of the subject.
>=20
> Finally, please use 'MGBE' in the subject and description.

Also, for these kinds of highly Tegra-specific patches, there's no need
to include the netdev mailing list. This is entirely about integration
of the MGBE in some Tegra-specific IP, so I don't expect anyone from
netdev to have any interest in this.

Thierry

--T8wMgJv1lUfEFL7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmP8xB8ACgkQ3SOs138+
s6GGBA/7BKh+LVMPZgY+kkT5meIHsUP+CVlDBWK++hO79wLLzjjDft/w/LicIJW/
fuWNx4bL08I2rQRr3FCWu58Bf5ZvBTs0vXJRurXK2vwinUHH0qnOCJ0SGyDKkIPx
bku4GzCTrWmXUzR1hzM9U4cN8JW/xqlCACMoU+wqlDOmxMIFUeIKK8Nof3uKquhf
1I35Yxts1QTs/bj7w1TiIt2Gyb0WRc18UutZiifdpprOp05LJXarZSp0wv8Cw04M
CVy+P69QaL+qTyR0kMY1Z4BR5eLSw7xdQxjysRpVuGqJlwiKFOEHQrKGjc+nGolO
7W+McobMxbGih6TRaCxwmfNMAdNnVOhqGDZzbA0CUGyrfOVs5G2uKmicjBXgoH/W
ENE1VwzvOCBzTx+j7ZeB/goLnqmnyuGMkz+Zuyjm3SESfam6F6DSLqT/ftM5FsrW
S+GGT0dZpbnCZrK2s3xylOC6TeBUZcHb2OqT7hBbYDZxNfoWt4mPaBNG/fQlHTO/
5A5zhflmTOZ+p0SJPe+xgwOAjAS4lPb2NueePyoy39l1Z1cbAUzX76XZqgpiHpmj
ba2VTndUlfLrY0TPxYOTHRCR9KN5gkcG235oAme53GwQXYwzBFhV+PPL7/XPnK5j
bVm3GWoIQb3s7VGOlw72E0NHUQemdN+IO5AKf6/iIVU+9jEOGvE=
=zU82
-----END PGP SIGNATURE-----

--T8wMgJv1lUfEFL7q--
