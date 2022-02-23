Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54F3C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Feb 2022 15:01:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235405AbiBWPCV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Feb 2022 10:02:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233778AbiBWPCV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Feb 2022 10:02:21 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3344531509
        for <linux-tegra@vger.kernel.org>; Wed, 23 Feb 2022 07:01:53 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id m3so38655848eda.10
        for <linux-tegra@vger.kernel.org>; Wed, 23 Feb 2022 07:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cKdmlLRi/lpqNvz3aBijh3BMZlD4v6cH6RqEnL++wr8=;
        b=GtweuR2M0pNustLPSKglfAWm3yzFK7uWHxBNaPIzNqS6UQFJaPSmpFvaHoOtqFt2VE
         SL1BTbs6hAx9ZOZMT59yTZsQQ4u/ahf1pX6zDCzdwnTRSetzlcxafrxvpte+GWLmBtJC
         WhCtqqwXXKaeb5Jkj3Z4RDg2UW4N3QQGe/KSwxZn8Fk67vWjrrO5Jkwi1S+J2swE7RMp
         /KNtBAcvtUg3kkHm94DvUhbWNgL/iIoo7WdrCP8wBBYw35aRMHWLP13MuszjqTjfYpib
         TUhR6U0M0TdATwzItKfzImeJEwDSVZoa5tYQNmPPxl84pw24beMWXmFy27nrl9BQVOns
         gtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cKdmlLRi/lpqNvz3aBijh3BMZlD4v6cH6RqEnL++wr8=;
        b=qNUlfiY+/NJaIFkUrOtylNcaY+Ys37lTDh6hO7k26FDV2ihCqJXJHl31vjB3JYFjlh
         KkXeAdopoReFlSeyzOfCWI+DS4sRPhCbAmdKclkEN3NKETSttMxv6oiCwArL+7LibSuh
         9a5H4mb1c14F7O00mvDBanimIvpLKJ1033E8FQSdP+Exu3O5myhCI9aTWfeLOy7PgeCO
         1zS7Q4LnnyjlXWmMmBOs97LXsgCT5blxux8ERuAmS6oI8pOBI8qhYOLGAQiEgXHCWT2M
         KtFV/xZypREcpFl4npgRdK+PnimwNFWlg4TbuSL1ALNQoRb2y8UqVKzUgA900/ea5U8d
         hlkQ==
X-Gm-Message-State: AOAM532pDI6373GPGLiaYA+eH8CrBzSqDUy02YLpWvoZoNsu1ZfutXnJ
        GGzY/dgsldGYYbQQCxaDdA4=
X-Google-Smtp-Source: ABdhPJyuBtjNcbp6QjCj/suOtCqgD0xiBt2GQAVtSqfCNsJmBan0X2F8LWbNzGHqk0ONtNvIhipmPw==
X-Received: by 2002:a05:6402:2343:b0:413:2c28:ee90 with SMTP id r3-20020a056402234300b004132c28ee90mr6386631eda.413.1645628511454;
        Wed, 23 Feb 2022 07:01:51 -0800 (PST)
Received: from orome (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de. [2003:e4:1f0a:6900::43a])
        by smtp.gmail.com with ESMTPSA id ci16sm7550175ejb.128.2022.02.23.07.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 07:01:50 -0800 (PST)
Date:   Wed, 23 Feb 2022 16:01:48 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH libdrm v2 00/25] Update Tegra support
Message-ID: <YhZMXGIh++50qDEd@orome>
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
 <ed92bf43-1df2-8059-5228-83b98d6bbfae@kapsi.fi>
 <c207663d-7d7e-6c10-6ee4-3dd0378181f9@gmail.com>
 <79444c32-64a7-ff54-95b5-b743cbc0a97d@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VbTUdc1mmA5tNfdy"
Content-Disposition: inline
In-Reply-To: <79444c32-64a7-ff54-95b5-b743cbc0a97d@kapsi.fi>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--VbTUdc1mmA5tNfdy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 10:41:05AM +0200, Mikko Perttunen wrote:
> On 2/21/22 22:29, Dmitry Osipenko wrote:
> > 18.02.2022 12:31, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > On 2/17/22 21:16, Thierry Reding wrote:
> > > > ...
> > >=20
> > > Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> > >=20
> > > Left one cosmetic comment in the VIC4.0 patch, but overall looks OK. I
> > > think it would be fine to have some basic tests in libdrm as well.
> >=20
> > There is a question about who is going to use this libdrm API. Are you
> > going to use it in the VAAPI driver?
> >=20
> > Grate drivers can't use this API because:
> >=20
> > 1. More features are needed
> > 2. There is no stable API
> > 3. It's super painful to keep all drivers and libdrm in sync from a
> > packaging perspective.
> >=20
> > It's much more practical nowadays to use DRM directly, without
> > SoC-specific libdrm API, i.e. to bundle that SoC-specific API within the
> > drivers.
>=20
> I'm not planning to use this in the VAAPI driver -- I don't personally ha=
ve
> any use case for the libdrm API.

As I mentioned, the intention here was to provide a reference
implementation along with a simple API that could be used to achieve
results in an easy way, without having to do all the buffer tracking for
relocations etc. manually. If other projects find this to be useful,
that's great (I was thinking of using this to add a few tests to IGT).
If they want to use their own constructs, that's absolutely fine, too.

Thierry

--VbTUdc1mmA5tNfdy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIWTFwACgkQ3SOs138+
s6FbWBAAi3RxR6vf+BuU1NdgEqaIFrFeXWgZ9r5tkIzmTmIXXJDzBlpAi0JqLgO+
tu2HDQxMUKeAcLdH/6IzbBUGSBr5pgIIcFY6cMuWEI09brEYTLlQ3vU+8g7BIk5o
0pjyDigC1imi1N7rAcxpW6plnr9tVaVU76P/X8/FgnFbRpv4/85Lf36yXGblHl4Z
1cUgMPAWud8YZcB7T6g2voPVRG8BA3E74MmHd+w3LdciBJGxGXmzA3phz32St3sl
fdA/2KzS2LYo/HbjdCaNDtNyVApnwNB6oDZgr7/R2vhZu085j6jzvjerREBDCW/7
bcOx1D+7CT8l0hehqcKqtDV936MrLWR7AkGsXJdeco3rKyqF0eJR4Up5MwR3aqBO
eBheKjteACHi9Htz5ioVIfwiDXBD0gb8dyFeJDnkBN7HaLcnRcwcMXaXlXAuY0GQ
bRd8DBm9zgkO/bfXw3W9DpG5VYMQxl0ZL2ZXPIWbdovRIGetFPHek2WKw184KLwS
i5tI4BwzQXxaWcg9IiU9eCweLInMI/Ue477ZGzYxW26bCYy1/xWTbdSKNQF6R3aK
Z+tgn3xlxR4QKqj0AEVYISoLivmrgnXkVSi16I7AjUtp2teyCGIcGkGogI5yl22x
HuQH4X3gbJXVkCYZ441RLMSpOWhpRljl5hYksVSyU7TORZZ+q54=
=vfql
-----END PGP SIGNATURE-----

--VbTUdc1mmA5tNfdy--
