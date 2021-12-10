Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D892C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 14:51:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236337AbhLJOzV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 09:55:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242426AbhLJOzV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 09:55:21 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13543C0617A2
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 06:51:46 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id d24so15470760wra.0
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 06:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s+MWkAoyvoQ4OlHbPUOnOmEO4hkW6+k5FpJVqSI1YF4=;
        b=ipBCwOnOlZiWudRGvFyrpNy12GiQ7wNf8g5b4Aj+yHjddKSJ/7dIh6p3mmJXxFeZms
         czKzzpbEdkkgAtjd7e/ab3xbH+PJ6ot6SuFVD5RFtaVN8nszPRBXaxJDLmO+h0/Ou64B
         D4LQeI+5gytkFzU93v7IWcJEWJRmvELUvlMdmNCuK7H/DgHN5yKFjpgv30jQVSE2JRya
         hssugzcBBdNjRC+bcy8rT6sll1BXzYPba0RQw+EIYiztClx2xqPYYVsfQSQwThFGnaei
         JQ/KqrxNrpUKHMloWkO+FvBDyEWpKWPXFEy4VdQIe0MoeI+AV8MMTxnHO3OBPa5d0C/1
         OZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s+MWkAoyvoQ4OlHbPUOnOmEO4hkW6+k5FpJVqSI1YF4=;
        b=QB62aRDwLgf46Yl8tyjwTIAGfKrwFFLmO9/VqFj9RjYdH9SlfHPH0fqml+ntfAnx2e
         yRLmBZqBPpWtoUO/6nGR9V5bzmZ55qxB7MJJItaTAz+XYsFFxeHjXWlHVrOEZZZ8iK8Y
         /Tq0R7tl9W27vJOMAQjV7CdjbYNj5m3QT7AN4BTRCin1bTBo1bQC9tAeqPOKDBem0ETA
         GOcHuVxeLaWdjMfk3/3wP9KKyH9EjXnp9WB0ogySVHF8+e/bC2SpEoUxa4eguTWEW0s4
         1mskga9U3HN4sD3oiFUCu+NZ1X7OOTw2+TMXJl7JShIl6nA3q0iQUcJsF3yd97lHp6/p
         DSOQ==
X-Gm-Message-State: AOAM533Wd0Vvyrezue8jvakDzBCsOkRE0iS81MnQsp21i9ISZoCJL+jO
        qzPr1LsfXyrGR2p89VwQUQo=
X-Google-Smtp-Source: ABdhPJzUfx01mU+3b+9Ir8rxZE6W8gEv1qkk0gfFCyaCqJD8Ym8CdsOvlDITQx0K/k1O5nm2OY8h/g==
X-Received: by 2002:a5d:40c8:: with SMTP id b8mr14436196wrq.610.1639147904531;
        Fri, 10 Dec 2021 06:51:44 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id c4sm2676450wrr.37.2021.12.10.06.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 06:51:43 -0800 (PST)
Date:   Fri, 10 Dec 2021 15:51:41 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     David Heidelberg <david@ixit.cz>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 19/25] ARM: tegra: Add dummy backlight power supplies
Message-ID: <YbNpfQDM7an5UYn2@orome>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-20-thierry.reding@gmail.com>
 <77ab734b-2fbe-385a-0805-087b64d515be@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ED6eVd09N3MERi4v"
Content-Disposition: inline
In-Reply-To: <77ab734b-2fbe-385a-0805-087b64d515be@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ED6eVd09N3MERi4v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 10:07:48PM +0300, Dmitry Osipenko wrote:
> 09.12.2021 20:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The Medcom Wide and PAZ00 boards don't specify the power supply for the
> > backlight, which means that the Linux driver will provide a dummy one.
> > Wire up an explicit dummy to also make the DT schema validation succeed.
> > Unfortunately I don't have access to the schematics for these boards, so
> > I don't know if a more accurate description is possible.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm/boot/dts/tegra20-medcom-wide.dts | 3 +++
> >  arch/arm/boot/dts/tegra20-paz00.dts       | 3 +++
> >  2 files changed, 6 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/=
dts/tegra20-medcom-wide.dts
> > index ed0e4012e140..b072d715999e 100644
> > --- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
> > +++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
> > @@ -54,6 +54,9 @@ backlight: backlight {
> > =20
> >  		brightness-levels =3D <0 4 8 16 32 64 128 255>;
> >  		default-brightness-level =3D <6>;
> > +
> > +		/* dummy */
> > +		power-supply =3D <&vdd_5v0_reg>;
> >  	};
> > =20
> >  	panel: panel {
> > diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/te=
gra20-paz00.dts
> > index e4c6c1363fc5..dd80108ac72c 100644
> > --- a/arch/arm/boot/dts/tegra20-paz00.dts
> > +++ b/arch/arm/boot/dts/tegra20-paz00.dts
> > @@ -571,6 +571,9 @@ backlight: backlight {
> > =20
> >  		brightness-levels =3D <0 16 32 48 64 80 96 112 128 144 160 176 192 2=
08 224 240 255>;
> >  		default-brightness-level =3D <10>;
> > +
> > +		/* dummy */
> > +		power-supply =3D <&p5valw_reg>;
> >  	};
> > =20
> >  	clk32k_in: clock-32k {
> >=20
>=20
> I think David's patches should be more correct [1][2]. Very unlikely
> that 5v is used directly for backlight. I looked at the AC100 patch
> previously, checking schematics. You can download paz00 schematics from
> the internet [3].
>=20
> [1]
> https://github.com/okias/linux/commit/0a24a3097b2dcb6bb81b13197a2d4836f85=
8199e
>=20
> [2]
> https://github.com/okias/linux/commit/98a2a32c482d0ffd59d96d22ae4169cc3d0=
ff15d
>=20
> [3]
> https://www.s-manuals.com/pdf/motherboard/compal/compal_la-6352p_r1.0a_sc=
hematics.pdf

It's not really clear from that schematic which one exactly drives the
backlight, but vdd_pnl_reg is probably close enough. And yeah,
vdd_3v3_reg on Medcom Wide is likely a bit better. I'll pick those
instead and credit David for it.

Thanks for the pointer.

Thierry

--ED6eVd09N3MERi4v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGzaXoACgkQ3SOs138+
s6FQYxAAt6qVhWKXhW2gN5Grma1dC0dWjpTGsDEeSBRHK11Bs/eiLf+rts4rUiGQ
LRNCNFNecIJyku9GXeQZN2PDYAGm4mVCRl+cXMZru1Pcngybufs6zi/hShY/rrnB
+Knov9uhoVL7MzKUCKwatskq5D+rwlKDY+u6MJeLElpkPi8e3Jtwz/fJ57afovs3
f1rFdQbFyA3BbJznsY6T/KKr7vOMwe9+ISidZG37RjPIbbuKpMJwwgz5q9LDWDKl
K6m2dGNuDZI1Uxz28h6s+IXelA2CJPPVk25gSRWGxNZh8eu5jQu0GnOsVCFv/aov
KYvr0OHuFP2F8aIviCCH5pIz5BlCVBK1wX9R64STuFyd1XSTA1lbGBTa+76QZYxu
8hJIVCPOUvTGikqRuBKh3LHGlQlkLyt3f/ziuthTk8etnO5B6iAGWx/OCbCZejh7
898PKV6zHtuyu4ECkKEZf/SsJ3tfadk52GRJTzphjmHFIme0+ghrUzNZKwH35ceU
PStzpRXIWOMax39+5DKafhWDU9ZkwspRxq9iUl6+aQrnBGuOEdAOrypKDI5qJU3h
4+INzHnKOzbqC2I4uwjpydEvFxHpvRtjB/0ayUXMmqJSdGRwrRsLqRNhAYk37sEr
5F0Jwh3ddOyZ/Xl8sL4chDZT/5iPW+yHC6U84m5c4vhT078jRXI=
=K4Jv
-----END PGP SIGNATURE-----

--ED6eVd09N3MERi4v--
