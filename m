Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32F6C38A02
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 14:17:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiJ1ORQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 10:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbiJ1ORM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 10:17:12 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C0A01D73EA;
        Fri, 28 Oct 2022 07:17:11 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id a67so8045455edf.12;
        Fri, 28 Oct 2022 07:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3/GkIErCyzssYh0dHI9LFVDVbU/HUlq9/DKH07MncQ=;
        b=GbEhx6IFXg+Xf9x6uG0h5tHbOXDLTKOPMiGIsyp5BF5gNenpOhdy7F30UCgpdV2w7U
         g1qQHlSPzF3VEkrTpzHswBGZ7XEofJsrPD+i/FZUior3HH+bLNbxcjIK13g/oD4HVOBI
         rEvkq2lZPjQ8YTzjy9xleQwvYlJO4zfCItbxv5tYJSyHLJMY2efvyss+clw5AGHeVcr+
         Y9L0d9gxEPS7z1mjUXLnb8/gM9P8JjMHSESTmJJRB70UVeR099MdfZGCqFnpQpFtQjUU
         XBrgxA5B2iuD3KZlAGqkcckJ2N0ven6NjatRSuQkIye1L6R086ht7svBjVId3FtLfc6W
         ddig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3/GkIErCyzssYh0dHI9LFVDVbU/HUlq9/DKH07MncQ=;
        b=kiaLZ2IKU18iKZXRDn1GwWdkl9Y7g2zggj2kJ1LH/7mRG4/WIe8Tw8z2qsdoBKjQnW
         ZL4Etcd6Pu4tUYJI7/ziMt7IBPHdoGAckcpRuhZ9xaJfHQz0wITUvH8CERYtjmjDAvwV
         BN8NFZ51fk6Y0aom/Zx3c07qkBnEbj+gLFCYO9fKE00FjLQED2C6KzQ10lDAXGNm4/M+
         4lefJp7Btz84AmPwZZUkIxig/4OOgp8SbZkJMbA/qFjLI+BPGzeW5r5ZelnT3tBG/5ln
         vC90Ul7eYKJ0YZ+qTyaEpPEJhDrQHst0mDt1SRU02T1Fz84W1F9A8uQXSDGF4j9x7ucv
         TL6g==
X-Gm-Message-State: ACrzQf04EidJRk5tZGEFbyQF2B4uMOZ+dJhS4KHFCT5QvT4AOTQSqr7X
        7h/1COS2fZaNxYML6ScvQNM=
X-Google-Smtp-Source: AMsMyM7lJm4/7PiwRFn+PDhbJ/FqhLMhs8uSBaHjk3EZyrns4NYIdWr0UlYQfxwVEHwMoaTkk2a5dg==
X-Received: by 2002:a50:fe99:0:b0:45c:329a:40f6 with SMTP id d25-20020a50fe99000000b0045c329a40f6mr51286685edt.425.1666966629887;
        Fri, 28 Oct 2022 07:17:09 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p20-20020a1709060dd400b0077077c62cadsm2225369eji.31.2022.10.28.07.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 07:17:09 -0700 (PDT)
Date:   Fri, 28 Oct 2022 16:17:07 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Update console for Jetson Xavier and Orin
Message-ID: <Y1vkYyuCPoLLCXDO@orome>
References: <20221028123556.134435-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fuEfujF2Fen1v13o"
Content-Disposition: inline
In-Reply-To: <20221028123556.134435-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--fuEfujF2Fen1v13o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 01:35:56PM +0100, Jon Hunter wrote:
> The Tegra Combined UART (TCU) is the default serial interface for Jetson
> Xavier and Orin platforms and so update the bootargs for these platforms
> to use the TCU.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi                | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi                | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

I'm a little confused now. You're certainly right that the TCU is the
serial interface, but then why haven't we seen any fallout from this?
That is, why does console=3DttyS0,115200n8 still work just fine?

Looking a little more into stdout-path (which we already point to the
TCU), that ends up adding TCU as the preferred console already. So I
wonder if we really need to set the console here at all.

Do you see any difference in behavior after this patch? Does it fix
anything? Could you perhaps try to remove this option altogether and see
if that makes a difference?

Thierry

>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra194-p2888.dtsi
> index 3837ebc67c8e..ccdb32c67861 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> @@ -23,7 +23,7 @@ aliases {
>  	};
> =20
>  	chosen {
> -		bootargs =3D "console=3DttyS0,115200n8";
> +		bootargs =3D "console=3DttyTCU0,115200n8";
>  		stdout-path =3D "serial0:115200n8";
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra194-p3668.dtsi
> index 916ea3419ee5..f147324d72f3 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
> @@ -20,7 +20,7 @@ aliases {
>  	};
> =20
>  	chosen {
> -		bootargs =3D "console=3DttyS0,115200n8";
> +		bootargs =3D "console=3DttyTCU0,115200n8";
>  		stdout-path =3D "serial0:115200n8";
>  	};
> =20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dt=
s b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> index df703fb0cfff..96aa2267b06d 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> @@ -2025,7 +2025,7 @@ hda@3510000 {
>  	};
> =20
>  	chosen {
> -		bootargs =3D "console=3DttyS0,115200n8";
> +		bootargs =3D "console=3DttyTCU0,115200n8";
>  		stdout-path =3D "serial0:115200n8";
>  	};
> =20
> --=20
> 2.25.1
>=20

--fuEfujF2Fen1v13o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNb5GMACgkQ3SOs138+
s6FT8Q/9FRGiLl3za9jRfzpxJYQ0zfSvxZKi8+V24dlEff/iTGllZlIaSOJ60njE
+sIbUMlSYWrsNdD7IItW2qwsfdePshtEWyXPvWCe3IsES5UEtXdNASXrbaK3aCq6
DJcOx3AWptP3VgntdljEkcDNbEnyewtdwtVamXZ35leDPfOfor7aHZP/89LdROKf
R8IXLsl2u7CvkrEVXKnh9zLVLTECWcPct50s6kGNXDKqhhGWaFXyAZfNtjHbVFee
1IvhbRLCxr4x3TSpPiHAjqktMX4gj63r3BqmWQIZWe8ZlcuK/IpIi11nnwTEzfb0
nsdYCAqCgiyaWE3XMnwc93NoSu+9JXifFX08o5iyiHiwR8ZyYkBeGDrmrsIva3Oy
A9QiWX0J1trgl5rkY30sR5Omi84LqhvP4KmaDzLF+QTQzdovO8yG3OvsdMbCuowu
sMLEjx2HDyHUpt0rLIk14VSzPXB3W98WyeM8RwUU71ash9aRMLwzHdnuE9dBFT9k
DD68OqBI8Uu1R3YYZZgsntMGlkcz8ae35FnAaYv+o51bnEykmxXcyjynVFZ8bzOo
wLFeImgiCsyI2KMd0GN+mMtvZ6SlkzbR5rQLEGV2zAUJFWwLUpxz4MOH2XFwXfqx
KLGdwtoOO8pppkgAWDHLeP3yKbbq0jDH/6iN3o9Lx1Lpfska2Lo=
=Szkj
-----END PGP SIGNATURE-----

--fuEfujF2Fen1v13o--
