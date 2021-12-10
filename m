Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04631C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 14:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242117AbhLJObK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 09:31:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234548AbhLJObK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 09:31:10 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D400DC061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 06:27:34 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 133so6994619wme.0
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 06:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WVh/2mTH8dAaKZnnoPemRRD9Q4gtEEf9slI8pDG6PJE=;
        b=l029UJZtkZIvGf63tIEshtw5w7OvAvyszwrFpe2ZIEwFWuGCEUsUDpVjgjGknmJ2Cp
         Ao1qxTLeWPykjqezqs9ahdpRN8zvwEb1snhzOlcGacc7NvyFoJ0VR1RN+C4leXUM9xNm
         yaO8954yB3GTAlkKzEmIC/416H7Yh6IVN1BcXJemuMWwz9Y/ENibzwhHZ2q+NfqJRAjq
         o+/Y5pcuxWU3iQyY/2RArJtTvMcErqKdE/TKenDdzMOWEQwZWRyb9DcClqoxZ9gVldPr
         wDTECXwZemxmof+M9UY+XBa2tqVw9/jgGi1tgXZ36I7JTH/AU3ArIzcsWz0YBTT61HQs
         +hhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WVh/2mTH8dAaKZnnoPemRRD9Q4gtEEf9slI8pDG6PJE=;
        b=s5TO4KMa7BUesnbj8IiwursKivtM2v9dlS/NPFfujoakfRXlq4XTNpTiK+IlINYzzg
         QFmUpb8y7cYuPtv6Qe8cI8SYD6S+A0Idl0dkWPJEj9XgVcJ5BOS8qnsb+RlGx7o/IEQD
         Qj1Xwwqo1lw/VUcy5XTXu3Vr9x9ybLLtgs6ol8odClwaUg21SZkfejMriSi75Cxt/KMn
         KgP7zLtk+7Z/KY7CYtmy/2oOjdZCg6Mrgr4zY+dXf7ryY8SbgZhhCJRkGyfb76aUWLKm
         G/NhP/7BNlJGK02zNVAFwdf+Voh46cIxR6xqQvGxk1f34UpG75WPHJO5k7sKyboeF3YK
         pxpA==
X-Gm-Message-State: AOAM533TWm1H1Kk9g4xj0HxM1fIJCoWTybvWop+Siy+QaELH1QP0Xnvp
        c3YqaI5VQui0i/tzOglPmemmyLN4jFLFfA==
X-Google-Smtp-Source: ABdhPJxSrYiYx9BRZXfqgbaeMc1zvSknq5M8zNMv2Gaz6kBxKfGxq7jIPSn9x1zX23QolR/BDCe5Tw==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr17238705wml.119.1639146453343;
        Fri, 10 Dec 2021 06:27:33 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id d7sm2614737wrw.87.2021.12.10.06.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 06:27:32 -0800 (PST)
Date:   Fri, 10 Dec 2021 15:27:30 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 12/25] ARM: tegra: Do not use unit-address for OPP nodes
Message-ID: <YbNj0ifkaDIDEJdn@orome>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-13-thierry.reding@gmail.com>
 <b133948b-1705-b27e-d0fb-b71481148bad@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="t5Mbt099HfhNxRO0"
Content-Disposition: inline
In-Reply-To: <b133948b-1705-b27e-d0fb-b71481148bad@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--t5Mbt099HfhNxRO0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 09:38:06PM +0300, Dmitry Osipenko wrote:
> 09.12.2021 20:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > OPP nodes do not have a "reg" property and therefore shouldn't have a
> > unit-address. Instead, use a dash instead of the '@' and ',' characters
> > to allow validation of the nodes against the DT schema.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../boot/dts/tegra124-peripherals-opp.dtsi    | 142 ++++++++---------
> >  .../boot/dts/tegra20-cpu-opp-microvolt.dtsi   |  82 +++++-----
> >  arch/arm/boot/dts/tegra20-cpu-opp.dtsi        |  82 +++++-----
> >  .../arm/boot/dts/tegra20-peripherals-opp.dtsi |  36 ++---
> >  .../boot/dts/tegra30-cpu-opp-microvolt.dtsi   | 144 +++++++++---------
> >  arch/arm/boot/dts/tegra30-cpu-opp.dtsi        | 144 +++++++++---------
> >  .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 130 ++++++++--------
> >  7 files changed, 382 insertions(+), 378 deletions(-)
>=20
> This patch is wrong, you haven't renamed the delete-node properties [1].

Yeah, I noticed that too as I was reworking the EMC timing nodes as you
requested.

> Please stop rewriting patches and use what already has been sent out and
> tested, thanks.
>=20
> [1]
> https://patchwork.ozlabs.org/project/linux-tegra/patch/20211130232347.950=
-35-digetx@gmail.com/

I've had versions of this in my tree for literally years now, so I
haven't exactly been rewriting these. Rather this is an iteration of
work that I had started over 18 months ago:

	http://patchwork.ozlabs.org/project/linux-tegra/patch/20200616135238.30018=
88-26-thierry.reding@gmail.com/

After that obviously things had to be changed again. The earliest
version that you sent that I can find is from late October which is when
I was already in the midst of this latest effort to get Tegra DTBs to
validate.

What's really been happening here is that we haven't been communicating
and ended up duplicating work.

Stop making this into something it isn't.

Thierry

--t5Mbt099HfhNxRO0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGzY88ACgkQ3SOs138+
s6Hr2xAAsaJ+AJbOfpt3J4XkUbhIsYrppOt/IAfwR8muWmqL6gOinHFVI+6K16AP
JFNWJYIXw+j7jqK/6c+D3WTADg2+wqe+x50B0txq1+lsVFXyrhj1WvzjuCY8zEuW
GZ+dN2W0psHSTUh4l3ugCvfe6BQ9z0m4+NBEQ1xnd3PnSVR7ZFSvIMoBsUhYOhBs
yqhSUTaH/aF21uROuUseziGFo6bCw/IkqNwspE3TPUCdijyj9JhLrWhsnWtvKysc
SHBJTOPbaSUFfeyBEEHzHHea541mghH4pXUjLPA5R3JgPu7pgns5al5gxrYCJO6i
n9PBpEdIer7KxMplAN49Ie2i713ulKExefIWE2/XWKWZHbxfUlv1oAzhEzFr4U3M
nowx7uC/hU3dLVu0yf/YIArbgLurFWvYwwLIzfMNF0WPhPnshTFJv6ZTt+zeCseb
7LD+jgy432R7E9oNQXOihz+f0cMwoWC31nzer60OYaHT4pQB5NA31KP0r8PPZ9Kz
HMC/qe2YB+ydAZbPjlZXMKLf13LY65D1lrIsYuRaZYQ+tGgHTylZrx3ikJWHIUEW
mIfzVkwvSbh+sS1GBy5i3SjFVjrySk9GLcorVqOweoS/e7jO+SvDugskQSR0nFny
gXmMUtHM74Lm5MdXlUMlTB5JohNsqyEmnCV3wUiQ5wTMNFkS1dE=
=QwU9
-----END PGP SIGNATURE-----

--t5Mbt099HfhNxRO0--
