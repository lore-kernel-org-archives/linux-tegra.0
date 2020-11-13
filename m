Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA2AC388F7
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Nov 2020 16:20:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB2E32078D
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Nov 2020 16:20:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hE9e18jc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbgKMQUy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Nov 2020 11:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgKMQUy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Nov 2020 11:20:54 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401AAC0613D1;
        Fri, 13 Nov 2020 08:20:52 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id a3so8947088wmb.5;
        Fri, 13 Nov 2020 08:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v2BUbjPWELpntgzLOpBZLEM+DZ3TH3PA5zgLm8+iHsk=;
        b=hE9e18jcFeY/0+UMJlrwakHvcywoP2047ydMiv2s0zCFZoDgVeVjxMbOuszZAQa8UU
         j9oZMGJKS95LKfVcYGLqbMg9rK2lswj5rG2J5hQOawr6YFJhuODzo9CRAYCNJve+XqGW
         k7BsyWRlc1O9A8m6+KCGLgYwnDr3U0u841oH9fB+zJHYZoy9FuM5WnYlz5kQ7fieDpx6
         ou3OuWL6skuKjdsIB3VzWNaCG/fPMND6AgkGuLCYGuX5c5ex6ZYkMmtvdvXdUUzhcgwa
         WYl5J1qN5sR/bm4ccg05kyGyxoCwAbGEWgVqZUU4Y5lCDJBovYEhs+Rfjk1p0YPJAAZO
         pJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v2BUbjPWELpntgzLOpBZLEM+DZ3TH3PA5zgLm8+iHsk=;
        b=W93IWirwdKUjoWEi6GEFnkprCwMzlMYInaiwVY9y6qA1NLUsmjvVZqKJ7iAUd5BONN
         9Rpcdr9+4clDZNJc7SGW7dArCDoYGBOD4B8tlfL8N6Vb9F1kplNPTQb4g/16Iz/oGOYC
         OuBAqvD5Hcd3pMKKOBB84USIyCHVj+sm0Fee38cROrSGnQT/h0k4ZqJAdeTZkg5g6C99
         cQfj2tLYTG8VBgb47mBMkYAOzirbNhUZ9CeKhl+4EZZQJT4fc/rphOlcd2FFZylbOyVZ
         tTxjSmNs1uGDH+cqqzwWaI2hC/CR0jF0IqEucgmYUpKocpiyAOhE1KgiUqiktQ6rqDxW
         nIrw==
X-Gm-Message-State: AOAM532rL/GSMjEqoD/E7EzmbiiDbBjYNseI6nVJAQsfFUSRvxTmRr0T
        SoXOB7b+8NR18+DEZXNTQUM=
X-Google-Smtp-Source: ABdhPJx+VaVVcgBrjcP58rSFYp3uO7WL0XP+u1djhkotWYhdyQgg/jjOyJGh7Nv+3hYZobg0N0sgjg==
X-Received: by 2002:a1c:2643:: with SMTP id m64mr3390218wmm.28.1605284446089;
        Fri, 13 Nov 2020 08:20:46 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id f16sm12072389wrp.66.2020.11.13.08.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 08:20:44 -0800 (PST)
Date:   Fri, 13 Nov 2020 17:20:43 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     JC Kuo <jckuo@nvidia.com>, gregkh@linuxfoundation.org,
        jonathanh@nvidia.com, kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v4 10/16] dt-bindings: phy: tegra-xusb: Add nvidia,pmc
 prop
Message-ID: <20201113162043.GD1408970@ulmo>
References: <20201016130726.1378666-1-jckuo@nvidia.com>
 <20201016130726.1378666-11-jckuo@nvidia.com>
 <20201019214046.GA3645734@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bjuZg6miEcdLYP6q"
Content-Disposition: inline
In-Reply-To: <20201019214046.GA3645734@bogus>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--bjuZg6miEcdLYP6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2020 at 04:40:46PM -0500, Rob Herring wrote:
> On Fri, Oct 16, 2020 at 09:07:20PM +0800, JC Kuo wrote:
> > This commit describes the "nvidia,pmc" property for Tegra210 tegra-xusb
> > PHY driver. It is a phandle and specifier referring to the Tegra210
> > pmc@7000e400 node.
> >=20
> > Signed-off-by: JC Kuo <jckuo@nvidia.com>
> > ---
> > v4:
> >    new change to document "nvidia,pmc" prop
> >=20
> >  .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt      | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb=
-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-pa=
dctl.txt
> > index 38c5fa21f435..ea559baeb546 100644
> > --- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl=
=2Etxt
> > +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl=
=2Etxt
> > @@ -54,6 +54,7 @@ For Tegra210:
> >  - avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply=
 1.05 V.
> >  - dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
> >  - hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1=
=2E8 V.
> > +- nvidia,pmc: phandle and specifier referring to the Tegra210 pmc@7000=
e400 node.
>=20
> 'Tegra210 pmc@7000e400' is kind of specific. Going to update this for=20
> every address and chip?
>=20
> If there's only one PMC, you can just find the compatible PMC node. Then=
=20
> you don't need a DT update.

I did advise against doing the lookup by compatible string because I
think it has a couple of downsides. On one hand it's going to create an
additional maintenance burden on the XUSB pad controller driver because
the PMC is usually not compatible between SoC versions, so for every new
SoC generation we'll have to add the PMC compatible string to the XUSB
pad controller driver.

On the other hand, this is new functionality and we can easily gate that
on the existence of this phandle, so it doesn't impact DT backwards
compatibility. That also has the advantage of explicitly listing the
dependency between the PMC and the XUSB pad controller in DT, so if we
ever do get around to come up with an even better mechanism to resolve
these dependencies than deferred probe, we do have the data already
available.

Thierry

--bjuZg6miEcdLYP6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+uslsACgkQ3SOs138+
s6HwiQ//dbTTGapD1Ee9Mkr+c2pCCUsfskWRVv9zi0cNuboN9ivtOxVdVH3TXsVk
j1b/WKqiEVSdhacWRqGwkYwDtYf8FHtfyyS8ljhLYqp5kORoUoZ5hxFQ55BuBCD5
rA0TA+JgCcbXNA68HRBaZpArj57KjFS/qezrZwXnZl856G6yECN97SKgljS+nn7x
vSewLEFWuVuiEeANnKxHHWmm1/PuyQzZNtAYhfC6fZJi2nIeGT8+lh9AlehDcurW
pOpWAvCjJB5GMqfaSsTPV9DRmjSyk2zhvHaFcGKLK4qR/gqGJ3ZYk6Al/yCv3XFI
84wBd3j+EKiEayA+s0XDxVBddtEBPDckjJB6K9oulU5nrbGub2MQNSQl7piRoT1A
0vyhKqe6S7ttjOwOnfFexab8XAm2dseX2Wx/6mbjAM/+KRZnF23Kf2bIFvO4wZrw
SQwo8nWqodBUsr1kkU7ThCN+EJeGaIrQEwpwszwnwdlCSBk84BIAv4tXoI9fx11J
UrovlWcCdAntOpp0imlNr4hroP+NqZJPR36A8SwdO1fyM9MoBKflXBcZdcfiLOE0
5Vdlh43sYxkVEuedYGnqHZhNGLD77xWhbbrB86xxW7JmP6L0WC5GMw6oc/McVOAz
Q5bR1SDsZj5Es9HYlZQNUM0udhd087uBlIW9iSFyUQ981FlexMw=
=HnYy
-----END PGP SIGNATURE-----

--bjuZg6miEcdLYP6q--
