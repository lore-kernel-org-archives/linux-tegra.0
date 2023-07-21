Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B00EB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 06:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbjGUG0M (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 02:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbjGUG0K (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 02:26:10 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7881BDC;
        Thu, 20 Jul 2023 23:26:09 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso2494158e87.1;
        Thu, 20 Jul 2023 23:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689920767; x=1690525567;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMTlYYHgKUFYrPYOcInw2lMvT7R3+MV1/I/kdo90khA=;
        b=ArpKhygVDGljLqU6TfjMwFC5k0xCYWEveKD0AgvZ8e3ep12C8Q7TGKsbb6dUN00NMR
         GwfoelbqnekpOyc/6FreGxakVpZdLfiFbJS3Hjz++0k4Vp0PQZt3urx+2ZSMjFaDgkVg
         O/TosvPlTCqFNPfCLKEY4yzapQnoShW3jUY4KoAWLQOBW+Xt0FdcCW/QZVTxoZ/Vlqzh
         mgab3FkuKuzaDBFGNBExllD3LY/DiwcIMYvrZMHYeYh1sbfH6PXoSmRp6ILtH2XsMIbK
         Vc8bPOfacsBZfihi2srPaF8uSk45dcOMjhYqel0S6op1dfULK+GfNo7C3m+vElwsyZqW
         pfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689920767; x=1690525567;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMTlYYHgKUFYrPYOcInw2lMvT7R3+MV1/I/kdo90khA=;
        b=cusNA9w4ChU0e+4c7Q+s55ZwevhapvAtV/AYgZ6hZa+5R+p+3yCOnIeLNdAmDmk98V
         fc+WDwz7wdjVX1e9MdSXfY6GO0bNs7BS7QT4z3CWvwgSWhJkcnG4sts822Lo3jyIVG9C
         sJ6xot4ZKXYSdhANyjA6+dxcZ6ZJnJ+5JNsPDVQWuQwXmvXywyyCdcaUwI8TaoxQWrAG
         t/7js/Vmq/VLxLEH0Oz1t4yWqSiem5bR+Ede1IlEmWOoUpMXRsd52pvxAxJM93jZMPky
         MpxMNCIrle1wuX/DNrkozb0WtKuwP/EG0l36Ehlv6TKJo/atOHZ41c0swJX6uBm9FELq
         eIcQ==
X-Gm-Message-State: ABy/qLZy7MjSzD0iW3dC7xWwxzKVmXGDymh4liS+5xisl8oCq839viQt
        4MENhiPtk08JXtKJJah1l2E1f6iF4AA=
X-Google-Smtp-Source: APBJJlG+6nCjpTSlxDyjAhyBeiz3WZJZ2nv1aiu1aioALiZiqSCUkv52bDCQMNjavxsP/fpR+eqdzA==
X-Received: by 2002:ac2:4db5:0:b0:4fd:c399:eb25 with SMTP id h21-20020ac24db5000000b004fdc399eb25mr502530lfe.50.1689920767266;
        Thu, 20 Jul 2023 23:26:07 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g26-20020a50ee1a000000b0051e2549c4f9sm1682516eds.47.2023.07.20.23.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 23:26:06 -0700 (PDT)
Date:   Fri, 21 Jul 2023 08:26:04 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Brad Griffis <bgriffis@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: tegra: fix p3767 QSPI speed
Message-ID: <ZLok_Lg6B_ggDzR9@orome>
References: <20230626180920.318774-1-bgriffis@nvidia.com>
 <20230626180920.318774-2-bgriffis@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="T5KJ6+6g4DwwNEek"
Content-Disposition: inline
In-Reply-To: <20230626180920.318774-2-bgriffis@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--T5KJ6+6g4DwwNEek
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 06:09:20PM +0000, Brad Griffis wrote:
> The QSPI device used in Jetson Orin NX and Nano modules (p3767) is
> the same as Jetson AGX Orin (p3701) and should have a max speed of
> 102 MHz.
>=20
> Fixes: 13b0aca303e9 ("arm64: tegra: Support Jetson Orin NX")
> Signed-off-by: Brad Griffis <bgriffis@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This was originally copied from the downstream DTB and I see 136 MHz for
both P3701 and P3767 there. So now I wonder which one is correct. Should
perhaps the P3701 be updated to 136 MHz instead if that's what is being
used downstream?

Thierry

> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra234-p3767.dtsi
> index 831a553ec387..980f15ac674d 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
> @@ -28,7 +28,7 @@ spi@3270000 {
>  			flash@0 {
>  				compatible =3D "jedec,spi-nor";
>  				reg =3D <0>;
> -				spi-max-frequency =3D <136000000>;
> +				spi-max-frequency =3D <102000000>;
>  				spi-tx-bus-width =3D <4>;
>  				spi-rx-bus-width =3D <4>;
>  			};
> --=20
> 2.25.1
>=20

--T5KJ6+6g4DwwNEek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS6JPwACgkQ3SOs138+
s6FMZw//fcfN/m8XheePjOs1wJLGh8XuaC6qGInAlcZWucfqXOjdoZrWt4QncepE
wAYKM6AW47p0wFA2NSrtYLi/sCTuEBbi9HkjrHPpD4PpEvjyTgK8xzJ87cngorPM
tHXCmJJ2igwU7z9gUA7PFEb0coDjy3b5TFyFvilQc+DNG9LvYRjY0g9b1HYYpqeu
sP7V3wtpGr/cGTw7C0DMq+IwI36EPdfDv5e73vpvwB2I5lu/KMi/p2p6OFpuS+o/
3d3eyGbyMVWQf7zpOJpJzwqbb8zCLYrYmwAqqnjRed3VKHn/4asLffzjAhkBhO0I
7u99DOPbXfJKtxUbBxMO0rvLAcs2nqlcKbZOuMRooAbTF/mD9vcrBYKdQPnGPckn
ES+MFT2oVbC5foFuZmnroAd47t90uJ8Unw9sXBxdfyrqmbtgOiijKsqecUkhYBdu
GoTWkrD3J58pdfXEeR3URrkvmapbV9EKT3MqFkHGljfaI4ZZbnGDMy/WcUZ8wFsO
3huVzQYsOJHegi6CKHH68TaNmgFYnbERJXDEPKYIQa9y2Ks7Mw3S3uOe/Cm52AsU
8vBubPJeeIMZnQl/KR8xR99Bhn0keXJR6OIoWD0gPE++mEvS6sbLff+qXyYiHNOb
oRVe3UDsUXUDTyLjSh2DprEIHnp1TfXJ+ufxu4TaU+F8h7ExFXc=
=TKGC
-----END PGP SIGNATURE-----

--T5KJ6+6g4DwwNEek--
