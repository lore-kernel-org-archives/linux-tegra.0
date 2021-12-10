Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68230C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 14:38:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242276AbhLJOlk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 09:41:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242259AbhLJOlk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 09:41:40 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D6A8C061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 06:38:05 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id y196so6973637wmc.3
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 06:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kD9OQfqTF7ltLq0Rduoymlaz0wI08kY7EOURxhIvEow=;
        b=Tme4pabvLXoyM2rlI+e9bo7+8RlzRvRWt9hEuUfoh8/NtbVYdMNQtXEM/KuNFjodeV
         JHtKxxzFlh+kaoHDOKe+7i5h0aRdLw+3ZTJXfiba8wHGyComi2d66FS+weNprMG1VDYA
         oA++1//uKtNyOMatZE2fFFMdZoiEJ+O/wJpc4lJe2+5d6ZrZztgQVmo/BKGbmthldDh+
         AnXDS/ervdLwp6equOgdrJWmpeQO9F6lJOXdSs8ZsGPeUd2RCGursHGCiq1hIi0GOt/n
         FKJi8EL8kRrLkZXB+wwwd/u7YpVjsl2KpLYFhZGb87WROU9xZiyd0x+s2oLwGSc+J9Q7
         ILpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kD9OQfqTF7ltLq0Rduoymlaz0wI08kY7EOURxhIvEow=;
        b=Pi5kphJbZCgD6FZZvRFiA8WGenVcVES/5ExF4p1+goL9CMUilIh2J7bY59MTw935e+
         jducGcv0oXYGAsVJNYhVr+KrLKQMd3Eq11nr8srzFJGwgNQXVLr1WD9ERxgbD7TInh2w
         u5SmiEPecOSSIs1Uiezqs8ltwuwpRDNhALJB1ICtgbGJQRI6WG74qHdZCjFoB/owHCIn
         sH0O1RwjlFPC/M5O7imq+Hj6fyTWMDCAZDjdQyP794LMvJcyS6Iz42oZuidjteX0RsKh
         RPcOWRPANyxmMAgklpy7LZO2Awh5HKjIasSmvjBG/q5j38aW0sBhhf+3CtBjEhl5xU5i
         4kGg==
X-Gm-Message-State: AOAM531EUulIa4s0ZOVdYQqwgZrjClA5Y2scI7zz3Gg3tE0Ilqp7cez3
        WNkoDvjXJU7LlOKOQJCE+Wc=
X-Google-Smtp-Source: ABdhPJwMNBnDHpjkP8z4PoZiykBAa3wj5mm4monnLDpgwM1fjEEShj5++UqJiWPDRDGKIkvqiS70SA==
X-Received: by 2002:a7b:c756:: with SMTP id w22mr17135631wmk.34.1639147083913;
        Fri, 10 Dec 2021 06:38:03 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id d1sm2546255wrz.92.2021.12.10.06.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 06:38:03 -0800 (PST)
Date:   Fri, 10 Dec 2021 15:38:00 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 16/25] ARM: tegra: Avoid pwm- prefix in pinmux nodes
Message-ID: <YbNmSIqlzB9A6aGX@orome>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-17-thierry.reding@gmail.com>
 <169a140b-7cf6-7a60-fc1d-e3a9574604a7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+nJSjPQh25U+8a7+"
Content-Disposition: inline
In-Reply-To: <169a140b-7cf6-7a60-fc1d-e3a9574604a7@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--+nJSjPQh25U+8a7+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 10:13:56PM +0300, Dmitry Osipenko wrote:
> 09.12.2021 20:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The "pwm-" prefix currently matches the DT schema for PWM controllers
> > and throws an error in that case. This is something that should be fixed
> > in the PWM DT schema, but in this case we can also preempt any such
> > conflict by naming the nodes after the pins like we do for many others
> > of these nodes.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm/boot/dts/tegra20-colibri-eval-v3.dts | 4 ++--
> >  arch/arm/boot/dts/tegra20-colibri-iris.dts    | 4 ++--
> >  arch/arm/boot/dts/tegra20-colibri.dtsi        | 4 ++--
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts b/arch/arm/b=
oot/dts/tegra20-colibri-eval-v3.dts
> > index a05fb3853da8..d2a3bf9d28bd 100644
> > --- a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
> > +++ b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
> > @@ -70,11 +70,11 @@ mmccd {
> >  				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> >  			};
> > =20
> > -			pwm-a-b {
> > +			sdc {
> >  				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> >  			};
> > =20
> > -			pwm-c-d {
> > +			sdb_sdd {
> >  				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> >  			};
> > =20
> > diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot=
/dts/tegra20-colibri-iris.dts
> > index 425494b9ed54..00ecbbd5e9e1 100644
> > --- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
> > +++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
> > @@ -70,11 +70,11 @@ mmccd {
> >  				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> >  			};
> > =20
> > -			pwm-a-b {
> > +			sdc {
> >  				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> >  			};
> > =20
> > -			pwm-c-d {
> > +			sdb_sdd {
> >  				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> >  			};
> > =20
> > diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts=
/tegra20-colibri.dtsi
> > index 80e439003a6d..2350fda3be6a 100644
> > --- a/arch/arm/boot/dts/tegra20-colibri.dtsi
> > +++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
> > @@ -113,7 +113,7 @@ bl-on {
> >  			};
> > =20
> >  			/* Colibri Backlight PWM<A>, PWM<B> */
> > -			pwm-a-b {
> > +			sdc {
> >  				nvidia,pins =3D "sdc";
> >  				nvidia,function =3D "pwm";
> >  				nvidia,tristate =3D <TEGRA_PIN_ENABLE>;
> > @@ -242,7 +242,7 @@ cif {
> >  			};
> > =20
> >  			/* Colibri PWM<C>, PWM<D> */
> > -			pwm-c-d {
> > +			sdb_sdd {
> >  				nvidia,pins =3D "sdb", "sdd";
> >  				nvidia,function =3D "pwm";
> >  				nvidia,tristate =3D <TEGRA_PIN_ENABLE>;
> >=20
>=20
> Should be a bit nicer to add the 'pin-' prefix, like I suggested to
> David [1] sometime ago.

We don't use the pin- prefix anywhere else, so it would just look out of
place. We've used this kind of notation where the node name is composed
of the concatenation of the pins defined within elsewhere, so I prefer
that.

Thierry

--+nJSjPQh25U+8a7+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGzZkYACgkQ3SOs138+
s6GAQQ/8DDZgzPcUm+avCJL3pGb7km61wpg11ZGnjPD/S/bVDOjWNSo3+j/3iYQm
1Bl6dlJiuiO7FckHDAPsjUC0U6NPcZm7Wo32w1MuaX9XvNINrSw1iBKoOPbThJcE
jYtt6o9MHQ+LvXVCm0NvSS4fqrClI3bV6/CO8tbJTgT+JfsZ4bukiqOrxfRryuAC
HNyvN+JctXusZsZR5ZCph8UBnjG0aB2n+G4S3zrog7mjDk3DhVhFAg/JSKKfZfRk
2zAM8eVMkuAbfxlUdAoR3xjRTnkqzqilXpM5CI9EtdInQGdKUeHAtHe6YJFXD+N9
5Lr9DbwSl0OymTeCJw2pN0BtLUQo7l54scKSCOPbeLrSiqJRXytWu9ZCu2RLEBvX
w6LxfkAdtFpJ+bZ68MR0qDmAZyjsMYc86nmTAVnwYt5tQpInr33UbN3qGOiuajkd
Nb8qDVaviZvyYmqLDPKaLYtPH72SQUtZ7a0XI85A8tY8lxsZ0uA8sfNfXKnNJVkC
uJlj2BiChtpi4nJYp/mhC/BTOzezXOAqGmFATF0Lgg3g2S7bK7610VYMI0px/0kc
PHvY/fYk33gX+OXeF3q3n4eY6JUzesd+Wuw7p3ioI9DJUazm74ozjbjaY5FdrHAL
aIWr/eK8bFgb1y54djhfB8OHxuyEqqOgHptVIu55SVe9/nlOSGs=
=+WEC
-----END PGP SIGNATURE-----

--+nJSjPQh25U+8a7+--
