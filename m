Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186DBEB64D9
	for <linux-tegra@archiver.kernel.org>; Mon, 10 Jul 2023 15:32:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbjGJPcY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 Jul 2023 11:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbjGJPcX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 Jul 2023 11:32:23 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625B0D1
        for <linux-tegra@vger.kernel.org>; Mon, 10 Jul 2023 08:32:19 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b701e1c80fso69123251fa.2
        for <linux-tegra@vger.kernel.org>; Mon, 10 Jul 2023 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689003137; x=1691595137;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysR6h0x3IStYvYYYSt3JxXl38Mz+KmVD3cCVI5r0rsg=;
        b=igwdVzokAwXEdL3WzQIpj+lW5tWLI2cqhOJwKZItjT5arL1HLwshd/z/r23uV0Q4TR
         HHkL1h6lYetO4J+DTUA41IL+wNILkMwPdpgYTg6MHuFtYGfqJCElqq4WX2u7UbX3jDn5
         2aowk/Tq6p+Trdy49l0zrE4Pc1KLMaDqoczceuoCLNTLe6lIrbdr/Xq0A286lfwSd/6I
         qEq2JnD6t7mQFh3D8oxrXHhUiKMJ8wX0JgwQNFDhu4zt/5BKqh2ruF0mJf3zsGM8cTwf
         Ybo321TcDAM1tFXsATBflCDrEaG7ZaKVFn2Kq91ZPqIqOw20uEx28H3u3lxxyW6C4Yhz
         479Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689003137; x=1691595137;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysR6h0x3IStYvYYYSt3JxXl38Mz+KmVD3cCVI5r0rsg=;
        b=bZQt1sSrWmIZ62sct5m7INIUe6jer+cE/nvM4oihM/7tleQ7ITRy4BYnFHQzF3G0XM
         Ikfjs+cV9BPzLVZhJDDn1gJab5Pt0e7FaFrnzfVt5em+OiKiGVDYg+y7NfOIg3+0ciTQ
         WU0ggku+0A4BL88N05+URF6ylw+Hx6YTjdEsXQQSHz6C4/Wg8F2Gjv9m5tYg7I53SYrD
         yt8Wz3+zYQcMTQ0UVJqhN877gbMXib/kmL3UmrRDAgwj0bPSeCQo79S5OhTxMj+7Y0et
         zeaDIMM/iE3yKmXLvW3YKRztrO2b0hoG3Bp4AnL/rwTGKbD19BiOcD9K1f4PUrTmQ+CY
         1ecA==
X-Gm-Message-State: ABy/qLaUzbSmeWlPTCmdgv9SIsJ0sKADxSHVHfx88/o1fIZGj/sQiXPz
        nW3ng/kG7W/HO+5JZU6nZKY=
X-Google-Smtp-Source: APBJJlGq8InKEDDWqnUaaGzBtlAIeJzKcitiiLl6fxHU3lB2HzuHxeyrJo5nqX2UyQ8+iLGV0FrYMw==
X-Received: by 2002:a2e:6e0e:0:b0:2b6:eb5a:d377 with SMTP id j14-20020a2e6e0e000000b002b6eb5ad377mr10355017ljc.5.1689003137275;
        Mon, 10 Jul 2023 08:32:17 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r2-20020a170906364200b00988dbbd1f7esm6225813ejb.213.2023.07.10.08.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 08:32:16 -0700 (PDT)
Date:   Mon, 10 Jul 2023 17:32:15 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, arnd@arndb.de, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: smaug: Add EMC frequency change tables
Message-ID: <ZKwkf7hJzuR4FEDj@orome>
References: <20230319194255.124589-1-diogo.ivo@tecnico.ulisboa.pt>
 <ZC11H7mXfHX_mGXh@orome>
 <pn6jovxrx7bkxfxq6qarlo357mvsf3ggxznzidz7pfdteefvvd@rqwbx4onwnky>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fFO7o6KWCIbQhKbW"
Content-Disposition: inline
In-Reply-To: <pn6jovxrx7bkxfxq6qarlo357mvsf3ggxznzidz7pfdteefvvd@rqwbx4onwnky>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--fFO7o6KWCIbQhKbW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2023 at 10:17:56AM +0100, Diogo Ivo wrote:
> On Wed, Apr 05, 2023 at 03:18:23PM +0200, Thierry Reding wrote:
> > On Sun, Mar 19, 2023 at 07:42:55PM +0000, Diogo Ivo wrote:
> > > Add the reserved-memory regions of the nominal and derated tables set=
up by
> > > the bootloader so that the EMC frequency change code can access them.
> > >=20
> > > Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> > > ---
> > >  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 21 +++++++++++++++++=
++
> > >  1 file changed, 21 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm=
64/boot/dts/nvidia/tegra210-smaug.dts
> > > index 709f3f417a19..a74826ae97b4 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> > > @@ -30,6 +30,22 @@ memory {
> > >  		reg =3D <0x0 0x80000000 0x0 0xc0000000>;
> > >  	};
> > > =20
> > > +	reserved-memory {
> > > +		#address-cells =3D <2>;
> > > +		#size-cells =3D <2>;
> > > +		ranges;
> > > +
> > > +		nominal: emc-table@f67cc000 {
> > > +			compatible =3D "nvidia,tegra210-emc-table";
> > > +			reg =3D <0x0 0xf67cc000 0x0 0xbea0>;
> > > +		};
> > > +
> > > +		derated: emc-table@f67d7ea0 {
> > > +			compatible =3D "nvidia,tegra210-emc-table";
> > > +			reg =3D <0x0 0xf67d7ea0 0x0 0xbea0>;
> > > +		};
> > > +	};
> > > +
> >=20
> > These tables are typically generated by the firmware/bootloader at
> > runtime. Often they'll use heap allocations for these, so the addresses
> > are not guaranteed to be static.
> >=20
> > Can you share a few details about what set of components you've used to
> > set this up? If we add these we want to be as specific as possible that
> > people use exactly the same set of firmware files.
> >=20
> > Thierry
>=20
> In the case of the Pixel C, coreboot takes care of copying these tables
> into a static cbmem region. The actual function taking care of this is
> tegra210_run_mtc(), found in [1], and from here it is possible to
> construct the cbmem memory layout. I have confirmed that the device is
> actually running this version of coreboot from the cbmem_console logs,
> where the commits are explicitly stated. These logs also indicate where
> the tables are located,
>=20
> Wrote coreboot table at: 00000000f66ca000, 0x2c0 bytes, checksum 3601
> coreboot table: 728 bytes.
> CBMEM ROOT  0. f67ff000 00001000
> CONSOLE     1. f67ef000 00010000
> TIME STAMP  2. f67ee000 00001000
> VBOOT       3. f67ed000 00001000
> VPD         4. f67e4000 00009000
> MTC         5. f67cc000 00018000
> RAMOOPS     6. f66cc000 00100000
> COREBOOT    7. f66ca000 00002000
>=20
> and
>=20
> MTC: Copied 0x17d40 bytes from 0000000081008b70 to 00000000f67cc000

Okay, so this sounds good. My only worry is what could happen if
somebody were to run a slightly different version of coreboot that puts
these tables elsewhere. It's been a long time since I looked at
coreboot, but do you think perhaps it would be possible to update
coreboot to update the DTB at runtime to always point at the correct
location?

Alternatively, do we have an easy way of checking that the tables are
valid? Looking at the data structure that we're mapping, there's very
limited data there that could be used for validation, so garbage could
easily be mistaken for an actual table and mess things up.

Thierry

--fFO7o6KWCIbQhKbW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSsJH8ACgkQ3SOs138+
s6EXpw//SZXBsCLgXyaYDeoBoUhdijhWCUF8Xw1jWuUv+r4l063aX13kHuLN1WNZ
q08qI6OTyLOLiVbQLO+y5WBw7L6knySocbkJoq+Xt+JKiPnoEk5IXDwnX14QdhTj
veEAmEqyet+W6AYJeK9kuYrzrI/Jsl3JWMKDV7koI0EPopokpq9j/9oAdLsRaM0z
eP6F0fUmPyRqL2Pv9l2oQyo3pFzykcWcahly/GrWx2eV68c7bnhuUmHrbgX4rSTm
+hhIq9K4PQ432aDmCdYS8H6J+Pl/f9tYKVcbm3MO/aCEOLj11UmYagmzRt2/CnCQ
9mB+cZfxlPi2WwtvUspZFNg7EuKRneEzV50LtWLQbzCPeD9tCgCJEtwt7KQaeB8M
0WJiqrvR1PD+oQjwfunpq4/vmeczkdIUzOYi+c6jgnyh9oqxaVZLhkbZXO6gyT0N
Srhl08hJaqW9UiwCmt3W9kItDvVETiw7Unf3kwSJumeHj6Qf70cOkUBsg3iXJ7rd
r2mTqzO337+HqSsA1v513fG+qLnvQas7Iz8jO+2h8z8FMkNZT5VNJyWaLJITxElH
PMevSNsDR9V3G0VE2ouZoNWl1s3T8oKAtAHvETp9prJO9+MCo5XFIPDkOP/qFE7P
KrutZ8gFc9h0bYcdRTozmRUI0KD4kxy+nxPDoDMieWpxKK2KBNI=
=igAQ
-----END PGP SIGNATURE-----

--fFO7o6KWCIbQhKbW--
