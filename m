Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F65C433FE
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Mar 2022 07:45:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbiCGHqv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Mar 2022 02:46:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235910AbiCGHqu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Mar 2022 02:46:50 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3978E5F8D1
        for <linux-tegra@vger.kernel.org>; Sun,  6 Mar 2022 23:45:56 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id y2so13974683edc.2
        for <linux-tegra@vger.kernel.org>; Sun, 06 Mar 2022 23:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=20HpXxzlv/vha1hiIrDHeYxMIE/fbI8WuKBWDXwYios=;
        b=SO8pZ8Et6UYbq9D5Caz72K7EMuCPV6WzZEySUBg6vOLJ3RLL5ZpDe1ab27oo65gGly
         bWpRjyLCFsftzpTBWdtEpdmjbuP2SkfWNw4XYOrF1SR+/OSxvBLrHSCwp8DpMRBrAcFG
         BjmPI3NCbrEEjT8V8XaW4ZWzmuENsGAWyVYERDLlTUNP0zfdXyS6GTWIJk/Ihuje9yUP
         z3uWYgc2C40w0Qkpr+AqW5oMaMH2NP8xWKzvXcHVsmxW8vNyp5kBvGdMNyb4VJlCSBnY
         ez3eVDhTt63jax86S2nZmqX+aNdw4RXUZIaOFH2lEcC4hiAuy1bhsEYfkcsuMBEuVKsg
         jzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=20HpXxzlv/vha1hiIrDHeYxMIE/fbI8WuKBWDXwYios=;
        b=AAMYL0xr9YJItk0SWNoyl8SALpIE9ikV6eT6SBcCGvPA1H5BoLpeUeccWka5Jq7z8c
         3h+ye6z+eP7STWwZm3lYkTVgmTwIqcGFsB9m210dH7UKeKJKliZo6fVJ9quzO1Qnw5wd
         zuKT1FyppmIs6oP1zJLf6z/winArutwajHB95NZeleaL+8Rh3q90V3MuYGZFbYAVGcRm
         dqUsGII6egqan1VhCXilK4b+7fIBwJmBrzEUhlK199KJqyamlY7pROhaEVpCL0EYjFRB
         2KqY23mnj/OzJUH3/yrgqLxH2/5O/p0f5HC+xhbKh+qcYu8uSbDpo06hu8sOb4pzW/Vc
         KYWQ==
X-Gm-Message-State: AOAM531k6gabdKyC5DtOSykK77OUePiu06+AltSuHl3yfTFZ2YTG13Rp
        LQWnhZzxnQfjIipa5DQN2go=
X-Google-Smtp-Source: ABdhPJzISQUfWFp+eOqXqsrKSwMT27ucuh1rOFO+ZGjpmRKTDCqVPTVeAglPHPPbX3GqrHhdZpwMDg==
X-Received: by 2002:a05:6402:cb:b0:410:8094:872b with SMTP id i11-20020a05640200cb00b004108094872bmr10075317edu.378.1646639154668;
        Sun, 06 Mar 2022 23:45:54 -0800 (PST)
Received: from orome (p200300e41f032400f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f03:2400:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f20-20020a056402355400b00415c7147a20sm5891707edd.26.2022.03.06.23.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 23:45:53 -0800 (PST)
Date:   Mon, 7 Mar 2022 08:45:52 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thomas Graichen <thomas.graichen@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: tegra: Move panels to AUX bus
Message-ID: <YiW4MBlLkjMHhFGb@orome>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <20211220104855.428290-3-thierry.reding@gmail.com>
 <47a01cd9-c3ee-912b-fa9d-73449990a7d9@gmail.com>
 <1cded859-d3ce-f285-3b02-5d81fbfdeafc@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MBBniTf9y8n83j9B"
Content-Disposition: inline
In-Reply-To: <1cded859-d3ce-f285-3b02-5d81fbfdeafc@gmail.com>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--MBBniTf9y8n83j9B
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 06, 2022 at 08:59:13PM +0300, Dmitry Osipenko wrote:
> 22.12.2021 22:30, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 20.12.2021 13:48, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> Move the eDP panel on Venice 2 and Nyan boards into the corresponding
> >> AUX bus device tree node. This allows us to avoid a nasty circular
> >> dependency that would otherwise be created between the DPAUX and panel
> >> nodes via the DDC/I2C phandle.
> >>
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >> ---
> >>  arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
> >>  arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
> >>  arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
> >>  3 files changed, 25 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/d=
ts/tegra124-nyan-big.dts
> >> index 1d2aac2cb6d0..fdc1d64dfff9 100644
> >> --- a/arch/arm/boot/dts/tegra124-nyan-big.dts
> >> +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
> >> @@ -13,12 +13,15 @@ / {
> >>  		     "google,nyan-big-rev1", "google,nyan-big-rev0",
> >>  		     "google,nyan-big", "google,nyan", "nvidia,tegra124";
> >> =20
> >> -	panel: panel {
> >> -		compatible =3D "auo,b133xtn01";
> >> -
> >> -		power-supply =3D <&vdd_3v3_panel>;
> >> -		backlight =3D <&backlight>;
> >> -		ddc-i2c-bus =3D <&dpaux>;
> >> +	host1x@50000000 {
> >> +		dpaux@545c0000 {
> >> +			aux-bus {
> >> +				panel: panel {
> >> +					compatible =3D "auo,b133xtn01";
> >> +					backlight =3D <&backlight>;
> >> +				};
> >> +			};
> >> +		};
> >>  	};
> >> =20
> >>  	mmc@700b0400 { /* SD Card on this bus */
> >> diff --git a/arch/arm/boot/dts/tegra124-nyan-blaze.dts b/arch/arm/boot=
/dts/tegra124-nyan-blaze.dts
> >> index 677babde6460..abdf4456826f 100644
> >> --- a/arch/arm/boot/dts/tegra124-nyan-blaze.dts
> >> +++ b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
> >> @@ -15,12 +15,15 @@ / {
> >>  		     "google,nyan-blaze-rev0", "google,nyan-blaze",
> >>  		     "google,nyan", "nvidia,tegra124";
> >> =20
> >> -	panel: panel {
> >> -		compatible =3D "samsung,ltn140at29-301";
> >> -
> >> -		power-supply =3D <&vdd_3v3_panel>;
> >> -		backlight =3D <&backlight>;
> >> -		ddc-i2c-bus =3D <&dpaux>;
> >> +	host1x@50000000 {
> >> +		dpaux@545c0000 {
> >> +			aux-bus {
> >> +				panel: panel {
> >> +					compatible =3D "samsung,ltn140at29-301";
> >> +					backlight =3D <&backlight>;
> >> +				};
> >> +			};
> >> +		};
> >>  	};
> >> =20
> >>  	sound {
> >> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dt=
s/tegra124-venice2.dts
> >> index 232c90604df9..6a9592ceb5f2 100644
> >> --- a/arch/arm/boot/dts/tegra124-venice2.dts
> >> +++ b/arch/arm/boot/dts/tegra124-venice2.dts
> >> @@ -48,6 +48,13 @@ sor@54540000 {
> >>  		dpaux@545c0000 {
> >>  			vdd-supply =3D <&vdd_3v3_panel>;
> >>  			status =3D "okay";
> >> +
> >> +			aux-bus {
> >> +				panel: panel {
> >> +					compatible =3D "lg,lp129qe";
> >> +					backlight =3D <&backlight>;
> >> +				};
> >> +			};
> >>  		};
> >>  	};
> >> =20
> >> @@ -1080,13 +1087,6 @@ power {
> >>  		};
> >>  	};
> >> =20
> >> -	panel: panel {
> >> -		compatible =3D "lg,lp129qe";
> >> -		power-supply =3D <&vdd_3v3_panel>;
> >> -		backlight =3D <&backlight>;
> >> -		ddc-i2c-bus =3D <&dpaux>;
> >> -	};
> >> -
> >>  	vdd_mux: regulator-mux {
> >>  		compatible =3D "regulator-fixed";
> >>  		regulator-name =3D "+VDD_MUX";
> >>
> >=20
> > You should add stable tag for 5.15 and also add separate patch to update
> > the new arch/arm/boot/dts/tegra124-nyan-big-fhd.dts which we have in
> > -next now.
>=20
> Thierry, are you going to address this review comment? I see in
> linux-next that you picked up this incomplete version of the patch.

Ah, shoot. I've got this in my local tree but forgot to squash this in
with the other changes. I'll send out a follow-up.

Thierry

--MBBniTf9y8n83j9B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIluC0ACgkQ3SOs138+
s6Hapg/+NGPAEvdFBjFdPYhfiDgTO07O1AQbF0rxyPzn9krpXjCqy1J48/25oHbc
MZKHu49En/pAiYOgkmUElH62j1M9JqKOA0p3z+O74NnYirfSRom8yDVNeTP8xrtg
RxZq3Nlx+vMnv5AZzA/ue16+LrebWWkUg3RFMl8IQxL38UbtOZ20Uct7S4+FlZbv
S63eY+Y4lizPJFE07DI4/T83+7kPPOCt6rTOtyizgdCB7gO/ydK6w/akcapOwdkQ
sXlFFi/dAyNLonUU4Hm5rb3xUytjnZmGXIOn8ygt3K/qQnlVcFRkvRGJaJhC5hV9
S7HCzLx9F5A9U7vUvrBBu3Mn8RpWbIujW54kVdPteJYIbgSuTTFk/27Bi6TJD+ex
e8WKTLejjqdyKb5TfKDyRwacpEXeLMpqrrQ96htz7shAudn+k9J8Bf0LCvdwg5gc
4ngTY+7d5wRrG28uSvVZMuLBqWseVQt/CVItWdfIwUc3Ngto1buVqzTYapYeuSRv
uFeZtlVjwwM4lyPVqxD8kXBjcnNgL50z/hl53N0tJFSFR8KdvdE21v/G9v/WF8bp
cSpuZb1/zjLMYxtXK4s22KaiJlPKrf7bGm2ClmKB390QWS3xnKtOuWk3wZ8Ogj2I
KwJA5fd6FzZnClqq4G9NpF37ta0E1oOn6WgVAtmSRVNJJ16atl8=
=RTqv
-----END PGP SIGNATURE-----

--MBBniTf9y8n83j9B--
