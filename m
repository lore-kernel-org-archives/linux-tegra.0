Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0CBC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 15:06:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242621AbhLJPJi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 10:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235073AbhLJPJh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 10:09:37 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EB18C061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 07:06:02 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso9246816wml.1
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 07:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L4pD+iiVtUklR5bHcOrp0J6f/ab+fZCKK7RexyIQQHg=;
        b=Q5MSzSRVTibIYF9VMQEyzG2/ITKptNspS2L471Ffi+hBH2dyMkxRnbfWo9lr5sskPR
         oOeAToliv9e+nAsuayeUPV1nSfW4VY7/RIn4wXnHwi3jpHoLPJDyKpgl0aP1/WFB90wz
         20mWxBLhP6/3dqADVA3y7+rPSgPwNDKvqHoDPxXnA4O7TMZSSk2eLnnUVDP0mBYdV3e1
         VN2YhRRGWb2mcavxOQuEU+DKOn2jbP8KYlu40JD+zPAyxn3nQIzVTQd4NMXTItsQMxMK
         yuhgQob7WHlvgd11DtfZqH/53r5jHP6UXpzR/xvvuDNkOl1VXY/wcwDnP3EvKCbmMgx/
         ossQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L4pD+iiVtUklR5bHcOrp0J6f/ab+fZCKK7RexyIQQHg=;
        b=c+FGbkvi7Fd8U4MQDMFuxdE8JN0uOJaUEyCRTNO5422B4uXDwymFniasIfWKt9GJuN
         CjdWXOcN3y6J+Br55OcRp4/IDtP3jINroKseRNLfZqfcs1k1pYDEw9AO6Q82NRc2Och3
         zuc6W91q1AkABKp9Jk3SOvFwribxDtAmihe3BPHVbI+/v07VmdbZsqwPyJ8CGC6TgfqT
         gZ7/reEnlmn+woUugB08FAKEkFRZlRhzMzmdsOMS/6yE1rx7pYePM9FMe+NvzrRi6Gnp
         LqZLhoXFMs8mirP1uafAqVlLoxZLZLEgeYmBERvGExE4gcfKJY+j3KMWA64e3tNrbRZi
         BhsA==
X-Gm-Message-State: AOAM5302cJe0ALbL434UslQvvkNwYjbvMiyOodOhqrMbbS1QgCbRbxuo
        to62hbCGSI7QHGsHbiS3xMs=
X-Google-Smtp-Source: ABdhPJwaTfPQkCKb6LwbpUWZ7u04M4L/3tu8ajmsF8Gj7SCwVtyf53qp7wM3QJID5G3CMIKicLf9pA==
X-Received: by 2002:a05:600c:3b8f:: with SMTP id n15mr17374486wms.180.1639148760872;
        Fri, 10 Dec 2021 07:06:00 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id z18sm2650268wrq.11.2021.12.10.07.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 07:05:59 -0800 (PST)
Date:   Fri, 10 Dec 2021 16:05:57 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 23/25] ARM: tegra: Remove stray #reset-cells property
Message-ID: <YbNs1SCLclVifFDP@orome>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-24-thierry.reding@gmail.com>
 <9b59ae8b-0c99-c59d-e837-aff49d78cbbc@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RvHoiqZAwus5EfEP"
Content-Disposition: inline
In-Reply-To: <9b59ae8b-0c99-c59d-e837-aff49d78cbbc@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--RvHoiqZAwus5EfEP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 10:24:26PM +0300, Dmitry Osipenko wrote:
> 09.12.2021 20:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The Ouya board specifies the #reset-cells property for the GPIO
> > controller. Since the GPIO controller doesn't provide reset controls
> > this is not needed, so they can be dropped.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm/boot/dts/tegra30-ouya.dts | 1 -
> >  1 file changed, 1 deletion(-)
> >=20
> > diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/teg=
ra30-ouya.dts
> > index 4259871b76c9..fd64aadc472a 100644
> > --- a/arch/arm/boot/dts/tegra30-ouya.dts
> > +++ b/arch/arm/boot/dts/tegra30-ouya.dts
> > @@ -70,7 +70,6 @@ hdmi@54280000 {
> > =20
> >  	gpio: gpio@6000d000 {
> >  		gpio-ranges =3D <&pinmux 0 0 248>;
> > -		#reset-cells =3D <1>;
> >  	};
> > =20
> >  	pinmux@70000868 {
> >=20
>=20
> Can we uncomment the gpio-ranges in tegra.dtsi? I reviewed and tested it
> almost 3 years ago [1].
>=20
> [1]
> https://lore.kernel.org/linux-tegra/20180726154025.13173-2-stefan@agner.c=
h/

Does it still work today?

Thierry

--RvHoiqZAwus5EfEP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGzbNQACgkQ3SOs138+
s6HVpRAAulqnpbutifQ8MqSSR+HloYJ0cj+GVMeQ0q0xB/Ju2l3Y835fgbz9bw+H
lEOKxO9HxMJymyN9+POPH1GIHb/zOXmsHe1QKnlxOtpVLrcFwa/gQNFuZg9tTgVr
TG+xfcEmTynHFYq/FSlq2V1JESE3TdWS2E/9XdFp1lXVM20d4ReraVLGQPtyyfMt
rh0Ax63PN6/gvgwG5Q5DeW5/YWVqahrMBSaYO781/VLtru1TL701SoIERNZgXcjh
LrdY+zCIG5K6ZsrAm9W+nbi+Ftj4C0GYmM6eAIES5a1Vps+2Txz8IxDjImOino4r
6dSr2mVamSbff3kwcMLeaIVSl29PapVcP6HUrt2VpykuDVpVAk8IBoVgL5Wjq9AD
BQj+N/6zH46e6n3QjBehGOaSLJu9CnTITpYXMEsgo3oag3mT5k7Hf8dH0N5SmyKT
QidQg5ldppxgs5gFRlBn4SnAr4epeOwixIbyhLstPAApi7TxSt3DdxxLKpHTDeYx
uAfU3rsZBAIft7aPRWL452tFlALSPli2QsPkqDEPVpVVOqN2O7b8PimWJKryiqKJ
gCcZRwN9CDRs3ni/hHLT35gxGUcxhfMmZvP4psmXfPqQSULlfDI158uel0OD0v53
WuRPBxC2g7r03eeO1CNGU/vDy5S3PtoM+xtXgNcbg622/QAax38=
=k8e9
-----END PGP SIGNATURE-----

--RvHoiqZAwus5EfEP--
