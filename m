Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C477C04E69
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Aug 2023 16:18:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344600AbjHPQS1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Aug 2023 12:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242230AbjHPQRy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Aug 2023 12:17:54 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8873FC1;
        Wed, 16 Aug 2023 09:17:51 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4ff8f2630e3so1659497e87.1;
        Wed, 16 Aug 2023 09:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692202670; x=1692807470;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PAVSZT5Z2htTTNjrhnf+Z2MKuavZ4UtWBo5jcpkMFM=;
        b=YMgfP8Jp7nj/MZQDyO02za9YZgREqSUiEaOeG+vac26LGOmaykYOKrt7BsZ56yKTCc
         woSwA115oBRggBCn5ZXihmFQn1xTXjd5vpf7lzT7kaCkH4nwicAQUl7iX3aWgAs1O5np
         6TMW9cJac9n77S1nrwOZDYHVx0Y1BtYK71gwY2yWjMMyHWHIB6KDEe7ciOLW6m6kxfv/
         qM0cX/RzV2qxNg+vjnvItLlym9AVgdpBlTlzFYZpF1sn4NNo1y8G1VI6coOpepaPWPv/
         yhCxf4c3xp+fzQX/jV1c/nNRRDUUe5sM+FToHxT0KLyoeSbcek7v+6rc5aQbZwORcmd0
         RUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692202670; x=1692807470;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PAVSZT5Z2htTTNjrhnf+Z2MKuavZ4UtWBo5jcpkMFM=;
        b=Y5PZjVW1Obg8qBEomoVWTwBvS76H+iytv4Jh3BUWqTmfyhfi+bo9FqthjUGFFZPdP8
         k7eRdg6sWUGbZxf0wKcsCv0D2KYH4hwDtzQsMYkfXVUi2UbeebdRDrnJ/SxOKVnUnrtl
         3zYHJ0b3VdBb8xMoj3TYDv3MY+4t5bg9d/A7g7gIitJDYHvoe1NpgDw2bFMUHGAe8sv9
         xWA3vpld0gnqj+X3HC4+k7EA/zEW1NbkT8397GS4F6ZSnvf29QyUMM4qQWI1e4l5esUR
         +tQQeqCOmYnN1hm1uny1kXIcAXLI3r+l521N9It4r9dDTaFCQv1TWKU0NPV94cM77saG
         wQOQ==
X-Gm-Message-State: AOJu0YzkI6uU92J25ehB9WC2HTPLCi+x10E4mYCuLP4drWtB1yY4kdo2
        sgeg7Y1Gr/QpoDagr/Q/N0A=
X-Google-Smtp-Source: AGHT+IHZ6NlO4wMNuX1Hn6doBt+pKGym/5ScAD23LLcf6RWhbib9p2zRIvbeAmmDyyCs4dheerx6Iw==
X-Received: by 2002:a19:6745:0:b0:4f9:586b:dba1 with SMTP id e5-20020a196745000000b004f9586bdba1mr1682016lfj.4.1692202669391;
        Wed, 16 Aug 2023 09:17:49 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g26-20020aa7d1da000000b005256d80cdaesm3336881edp.65.2023.08.16.09.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 09:17:48 -0700 (PDT)
Date:   Wed, 16 Aug 2023 18:17:47 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Brad Griffis <bgriffis@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: tegra: fix p3767 QSPI speed
Message-ID: <ZNz2qzVsDBVgdXA9@orome>
References: <20230626180920.318774-1-bgriffis@nvidia.com>
 <20230626180920.318774-2-bgriffis@nvidia.com>
 <ZLok_Lg6B_ggDzR9@orome>
 <CH2PR12MB427838F14EA7C962C97C4B9CAC14A@CH2PR12MB4278.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1+3UwKwcc8t9JZzq"
Content-Disposition: inline
In-Reply-To: <CH2PR12MB427838F14EA7C962C97C4B9CAC14A@CH2PR12MB4278.namprd12.prod.outlook.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--1+3UwKwcc8t9JZzq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 15, 2023 at 01:38:35PM +0000, Brad Griffis wrote:
> On Fri, Jul 21, 2023 at 6:26 AM +0000, Thierry Reding wrote:
> > On Mon, Jun 26, 2023 at 06:09:20PM +0000, Brad Griffis wrote:
> > > The QSPI device used in Jetson Orin NX and Nano modules (p3767) is the
> > > same as Jetson AGX Orin (p3701) and should have a max speed of
> > > 102 MHz.
> > >
> > > Fixes: 13b0aca303e9 ("arm64: tegra: Support Jetson Orin NX")
> > > Signed-off-by: Brad Griffis <bgriffis@nvidia.com>
> > > ---
> > >  arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > This was originally copied from the downstream DTB and I see 136 MHz for
> > both P3701 and P3767 there. So now I wonder which one is correct. Should
> > perhaps the P3701 be updated to 136 MHz instead if that's what is being=
 used
> > downstream?
>=20
> Downstream we have changed both p3701 and p3767 to use 102 MHz.  That is
> the max speed for Quad I/O DTR reads.=20

Alright, I must've looked at an older version of the downstream DTB.

Applied, thanks.
Thierry

--1+3UwKwcc8t9JZzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmTc9qcACgkQ3SOs138+
s6H+gw/9FzZfp8D4P1iJgbOm3Q9EQ6mmJrgc+cIb858yX+xhUHJuhhQBryUk0XGG
VtkTsCrDkYC4M2+SnC8ZR00PwWuy0esW9qQsdSuMHih7yfpGEShm42KSWfF6hasw
TadFPK2b1k8XW6Y6xDt0n68/VqdgiHSJha6/0M4iQwPfXFzC4oBAq9buOev8FIad
L2IVc7H68uTSnmI4BRzxYjlBfxHpqXkory1d/8MrNKhMorMP/fRmaOBonHw2TfXY
lsfT41Z0JToO5f3W5tsrl5F+nDoMazWNjHB93t4enVXQhHbzDFYpshZdbh/Gzmo8
8c8vhLm+/6+41ftwzBq3cJW9L+ZpIx8hRn9ybGzoFyifaPvz0DKT+B2aW5RmU3QE
NrBefBfhVadZ7DU9iSpNcT80gFBwXMcbP0QkonuoCtAb1an04GssJkdv+RKSVn/2
yLKGLyLQYOA1uRz3s7zva37unu7DrDai/S4XA6SUdhWXrqlmeITLikF1eeTElZFp
DqT2PEzZPxFgXeikUBwBVa6TsaeGJBKfvde4gonvFFC+XVYcJX6YLutPa2xup//P
hT/bVa7jOyv23LM3uaarII8cgV7hovNj1foDqib4wlxQ0c0pxkLKRPbF21aUqMyb
c5g2YBSbiS2sCqgFjHlaDHj0Rx0137I5Z303H8b1+lOCe/I/C7g=
=ExiM
-----END PGP SIGNATURE-----

--1+3UwKwcc8t9JZzq--
