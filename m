Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E961ECAAA1
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 14:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbiJ1Oa2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 10:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbiJ1OaZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 10:30:25 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F6087AB20
        for <linux-tegra@vger.kernel.org>; Fri, 28 Oct 2022 07:30:24 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id m15so8097506edb.13
        for <linux-tegra@vger.kernel.org>; Fri, 28 Oct 2022 07:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXYuPH+/fvo3+Np/ca95kuaCiZqCDI0a2biOrHk3oHs=;
        b=ptCsryUCsLwh/VBF0xLTeElrbWwQbXt7fzMm6X/5GwQzHy+pOmwJmP54cKjsn85v0s
         RLbIgEkwNK+qA+wahQRFh7a/hVFeKRyXZ8gSrSlsbgM9mk6VnWM3bcu00vawO4BWRg+t
         xwjQhf3twt6qyWP9TW624/3JhwfELV6M4v/MvcAo++wK6j9/eTA3WAf5r1wCCXMjxfbs
         5fqZVVymBlP9XPfyZXDRw0Mwqo7toxDnoEr+FRa35ijisI+dH42+f14Li4Mrx1b72oUR
         j0/F/BNz2M0leilNMTcQi8YZMhOOOiEsXUQOd3roxQhl/tAWp0V+ToUhNSpGFPnokf6M
         +zpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXYuPH+/fvo3+Np/ca95kuaCiZqCDI0a2biOrHk3oHs=;
        b=EZYhIEYpENAGo50ybxEutrznhNGCTCKWwIjGgxHv1kpBrMZ4J/J22b3PP+yvbUm8wr
         OH7LO7sOtN8im47zBA4Q4Da2R7sPt8ZxEFTyw2+mRMjPdBVPnh1nx6LsB2IJwMqGlZtu
         BSxKVhei9ZB/ydlR59tUtVhAsk8ycYm0/h50kwAnxcMSDjAhHQa31Lwo2P5HK6XXOGvc
         Axl6Wint7st695ELqGI4y+PXPJu+Gx9T9XPbmhB6rh30Z3CUTLhKgft1a5MG6e3jY8e+
         m7KPGqhahwiigBh0VlPT6ep0+5Tq375KaePn3tJXkPqLPqfwUp7ITXBpTUfdZs1kjRRL
         2HHg==
X-Gm-Message-State: ACrzQf1Xa4sl1u1Xc3Mr9gUSCoQMj+0gMhl3dwTK40oN1f3+ASNzHiAb
        1xqvFn86yyFLGtlBAI7QwEzyHEJdsxo=
X-Google-Smtp-Source: AMsMyM6Il1sFxsSqxv8e9+acbyNtZxzU0VJyKCAFRoz2GPd26nOnSomYokLr/ByeIu5liVsxOcVgFw==
X-Received: by 2002:a05:6402:42c6:b0:462:1abc:e576 with SMTP id i6-20020a05640242c600b004621abce576mr18370778edc.223.1666967422411;
        Fri, 28 Oct 2022 07:30:22 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d7-20020a170906304700b007ad4a555499sm2206076ejd.204.2022.10.28.07.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 07:30:21 -0700 (PDT)
Date:   Fri, 28 Oct 2022 16:30:19 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: Enable Tegra186 timer support
Message-ID: <Y1vne5gJMezqSyr1@orome>
References: <20221025154131.43418-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TpPYbbjeMLojHex5"
Content-Disposition: inline
In-Reply-To: <20221025154131.43418-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--TpPYbbjeMLojHex5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2022 at 04:41:31PM +0100, Jon Hunter wrote:
> Enable Tegra186 timer support for Tegra186, Tegra194 and Tegra234
> devices.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/soc/tegra/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)

I realize that we have the same construct on older SoC generations, but
we really shouldn't be selecting user-visible symbols because that can
lead to conflicting configurations. The correct way to do this is to
enable via defconfig, even if that strictly allows people to disable
this driver again.

Thierry

>=20
> diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
> index 5f5324294636..e49409b85a39 100644
> --- a/drivers/soc/tegra/Kconfig
> +++ b/drivers/soc/tegra/Kconfig
> @@ -99,6 +99,7 @@ config ARCH_TEGRA_186_SOC
>  	select TEGRA_BPMP
>  	select TEGRA_HSP_MBOX
>  	select TEGRA_IVC
> +	select TEGRA186_TIMER
>  	select SOC_TEGRA_PMC
>  	help
>  	  Enable support for the NVIDIA Tegar186 SoC. The Tegra186 features a
> @@ -115,6 +116,7 @@ config ARCH_TEGRA_194_SOC
>  	select TEGRA_BPMP
>  	select TEGRA_HSP_MBOX
>  	select TEGRA_IVC
> +	select TEGRA186_TIMER
>  	select SOC_TEGRA_PMC
>  	help
>  	  Enable support for the NVIDIA Tegra194 SoC.
> @@ -125,6 +127,7 @@ config ARCH_TEGRA_234_SOC
>  	select TEGRA_BPMP
>  	select TEGRA_HSP_MBOX
>  	select TEGRA_IVC
> +	select TEGRA186_TIMER
>  	select SOC_TEGRA_PMC
>  	help
>  	  Enable support for the NVIDIA Tegra234 SoC.
> --=20
> 2.25.1
>=20

--TpPYbbjeMLojHex5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNb53sACgkQ3SOs138+
s6HsYA/+N1nt0z1HfZGJ8AH0ulcAFq43elngKh2QNpyPFHoFg9VKI5jDsLnSGlhN
ETNqiRX8aRQerzGGs1ClhkAVyAkg4KbEjUYTtPZEpEXTVZYR6ytWOgmBHLCMWFut
TXU3xXletdsxIcXrlzy4uBcU8ka2dZxUBUMhLa8kkKjS0GZq99xDk8wNgRngZSRJ
UgjUOQVTI2UANorpBmhNFyQ9b5E2kjN96k/Wy9VfcSErCqa6LDFcDL5zaUXkjdt+
GSHIeOFkbcufE12elEbQj83WeemFSqVC1CO18pdKfu0p2iZTpCOZfHtfiN9dueTm
3w5nHDolr4XZVGLawfC2m3FpyNzAnXutU6W24NSGtF+t5LH4Gw8cV8P1STSohpwK
EBZQgUB0whRGErWGDvM10uYL0W+VmxDynTK1N/UR1hMrqRbWAM3G77l751Mue/LG
I0gP6gZ4GfHr7yBCoz3aDMQrBl8ufKmq8Cx+KH2yRYRvcqwGYBfWNzs124Ndt6LD
s84Rp7pm/ZcW3xj2EyMJ4jUPTqyfOq6dZdESGblRrgco+JFR6IoaecrQo+3oJjmH
2SvvA7rPAPxnGyFE/c7yPFEjWMfw/qV5J+AdI442fpTLODk0IGuvdHcHsMkUEMMH
YFXpJITF9Fza3BbNk2qjcaX0S/8kX0ZGVUBYkFJzNE8shbNt6G0=
=uyzp
-----END PGP SIGNATURE-----

--TpPYbbjeMLojHex5--
