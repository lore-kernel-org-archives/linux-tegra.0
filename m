Return-Path: <SRS0=iMCN=CY=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D57C43461
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Sep 2020 12:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A516620936
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Sep 2020 12:40:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUQOtu4B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgIOMjY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Sep 2020 08:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgIOMjF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Sep 2020 08:39:05 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2D1C06174A
        for <linux-tegra@vger.kernel.org>; Tue, 15 Sep 2020 05:38:51 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id r7so4770296ejs.11
        for <linux-tegra@vger.kernel.org>; Tue, 15 Sep 2020 05:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6+eIisxgi/7DBd67MZsvWapYN3hNHSpdCq4Nuq8Zaw4=;
        b=qUQOtu4BEYo53sNLoAc7L0JBG5WnrTDBsFfcD71gMXqja9EOliFXddaW0sv1SBFmPY
         rtsp6xgyZQf+WkXAdirmvAwlrE0wt+Vw7pWsji5m4qIeS056mtqqAC/l+XuZDFW1LVUq
         Fm0qVHMqvZUWe/8q7ZYmP7KwpWLneG8JBXy426AcKhuAMCn3lAGrh01YjOLCI5b3m/dm
         Wg4O37K7A/SMjIQ0invcjZb9m7aA3Dc5ebGyEB4FX3/OUDNWWbZxcDlzn5+B48fgPUYg
         9LnDjNUOLPX4OYDpvF7Y3ADEw9/I35+iudQ2hoJ5zMtpeXeQsEVbn/yiE7xc9JkQODgy
         ZSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6+eIisxgi/7DBd67MZsvWapYN3hNHSpdCq4Nuq8Zaw4=;
        b=NyVxH9QlJ9esL8Gvw9s/LG49SBZhXMkjdIQ7VmtLjnRRwjsC/+0OGUK9rXz7PRMsjR
         cGWUpRYqBhvVrkiy2uvz6TGq1t9dCYnd9HQlkB29TSA2hqFSMOzvmh+v97HVv/YKxN1k
         O/dgNy+jrjCO2OBKESu89g514ZsZoLyESz7NACK3+OL+lucDAYEoyaDyhAJeJmpWQZlj
         zBPn3bWKmtJGh4c35xiTUHG6v0ZTlrOOyq5l/7Q6BabqU6TB1KP5/lPXTdLytphqDasM
         IVy3rXDtIE1NfmJTYnEHYSPM/H5P9ZDh/hZ+B+uSO1M/HcgCD3+ZSWYf8q7KRSznkBjV
         hnCg==
X-Gm-Message-State: AOAM533H11+MM1WRFV1S1ofvdNtNJoNvkBFQHoXZZzoglNVfCGoZ2IQ6
        /xWDAlALGi3AVa4OIkSsZn4=
X-Google-Smtp-Source: ABdhPJz+iUVGNrROwyyTpilZTJ+fbR5p4UvHc/91zVSLl18UTG9E3EySpa91bwVGTxGl0L9MoPeYBg==
X-Received: by 2002:a17:906:4101:: with SMTP id j1mr19152895ejk.473.1600173530064;
        Tue, 15 Sep 2020 05:38:50 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y9sm10049215ejw.96.2020.09.15.05.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 05:38:48 -0700 (PDT)
Date:   Tue, 15 Sep 2020 14:38:47 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/9] soc/tegra: fuse: Implement tegra_is_silicon()
Message-ID: <20200915123847.GB3496938@ulmo>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
 <20200716141856.544718-7-thierry.reding@gmail.com>
 <c3bff9d8-7b74-3614-177a-09efcc05982f@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline
In-Reply-To: <c3bff9d8-7b74-3614-177a-09efcc05982f@nvidia.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2020 at 08:32:08PM +0100, Jon Hunter wrote:
>=20
> On 16/07/2020 15:18, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > This function can be used by drivers to determine whether code is
> > running on silicon or on a simulation platform.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/soc/tegra/fuse/tegra-apbmisc.c | 13 +++++++++++++
> >  include/soc/tegra/fuse.h               |  1 +
> >  2 files changed, 14 insertions(+)
> >=20
> > diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra=
/fuse/tegra-apbmisc.c
> > index 89f1479b4d0e..be6b7fc169ca 100644
> > --- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
> > +++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> > @@ -52,6 +52,19 @@ u8 tegra_get_platform(void)
> >  	return (tegra_read_chipid() >> 20) & 0xf;
> >  }
> > =20
> > +bool tegra_is_silicon(void)
> > +{
> > +	switch (tegra_get_chip_id()) {
> > +	case TEGRA194:
> > +		if (tegra_get_platform() =3D=3D 0)
> > +			return true;
> > +
> > +		return false;
> > +	}
> > +
> > +	return false;
> > +}
> > +
>=20
> Should we do this the other way around and default to is-silicon?
>=20
> For devices prior to Tegra194, this will always return false.

Yes, that's definitely a bug. I'll address that in the next version.

Thierry

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9gtdYACgkQ3SOs138+
s6Gxbw/+KNqcheX92OY1gA8LeRlSS8dj1ibpigZe+PkxY2mkyymukGtkGsOf6oUt
1AG7tAha6R0kAhoIMy4i4E9Vi5pFxPTN1Jii0BCkGbWpi6QrqwfPWLFDq8v7cUdX
Iv00w9zMcO4wPNvsao5tvs3x/71Wbt7H9aLJl7WomVrfFYKLYPgeP7eA3Fmu2VHz
dBxckr4sA2xqonEK4Di6PnIEI9AlvKYZHgd7FWYI1HWzpnMYaiMWyvPoJLvip/D1
/pwr2/GTvTYQz3G4YJPVrtDa6Ufcha4TKWGaKJRu/IilCjDzs9qt8XS5EUPmcRn/
Y/BVxv5V3XkxJQfxCUtZ2nLnMJk9cUcsckcG5IvYPBKn83f3IUh7fz/pNv6Ec68u
ih2ygolVsa6LoiWOW1UFPow2Lh7yB2fZo6F6f68upMPgOBHSjt6xKKkFQSkkEuZi
H9UHVwlpBaSQeI/bLR+VhAiE3dUMlK+0Im1bC/6ToX9OOTZZXLoCCARzOHFGB8Dz
UhTPXHEq/FLYjL13m7De4zn6CUV0EJYb3o6WaDUsnJEcHOrMwwUUs0DbohEyzBAC
n2aOY+vSdSvX5xyQj33Ug6LIKHGr/wuJG77NV50xiq8dBI9ckkA1OvIUm+Alj4r5
GwspJgJyVIJBHvookw2/wvorsNPsSQEEngL91sV5BRkUx0HuGS0=
=oREA
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
