Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FB8C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 13:32:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 685FE61A01
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 13:32:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235341AbhCXNcJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Mar 2021 09:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235230AbhCXNbr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Mar 2021 09:31:47 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA5EDC061763;
        Wed, 24 Mar 2021 06:31:46 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id x16so24459584wrn.4;
        Wed, 24 Mar 2021 06:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e8lPC72F11p8PBhBhydD1cx8exsNe0wRkeHr07SpaS0=;
        b=Qd6dhey0+eCqZPgZmDNub1vuPD1DQoapTBwS3wk3+jDCZeWSdnP0Y5AAjbU299drNM
         6kD8jiYya5D/VsfV6Weg5j4hPKGm9NnrPKd43h/URiYNB7GjplubzGCNQhvT6XeIu/kR
         OPiU6wgsG/6NOFJrUMO83IHDmGJIM3lz795bi/EPNfUKPist1Se3v4uPNBe1mZZVrcQL
         hBP9Ih4Ieei7iQ1+D5S4RKYt427BBd9TJ0tMQbvXd+Sxvat4WUzjmkN33pTiW/qUS9ZD
         s7cJ7Cql0fn/+l0Vu3i/GW40D3PvJIvyga3d9WVLBMzrn6xTQXSNiK3Drbp4/tjcFzD3
         7FTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e8lPC72F11p8PBhBhydD1cx8exsNe0wRkeHr07SpaS0=;
        b=hUO60XoOsvfl6TUwzMB4VKUuwvZjJTxQmk3w8khW3mwFlicxaOk3Dw/XU6UKYX7Y9V
         tvIw6q0Zar4J9eDUlVpU1+yjV+rhEbVHsDlhjpvEj+StbiExJx0nAkT0Qm72+ororeAZ
         Xt2FyN4k8hlvSJEJFloXfKsIdrjVbPIaQN9N/lqSlT0ETdE+DkW8TTuMmDQB1NuXLqZb
         dCGsV2A7D2pAbxvQo7rdseOxsbBBW847Fqkawo1nEOBnqC1CN8uyIly9saYQGc5PYFK3
         iV8Djm6PpnbfRbzIyEkasTXJNbZU/y6wXFV+yYH73RChFB7k3KpYWORK/MdnRJ8V0Uyr
         bF1g==
X-Gm-Message-State: AOAM533p7T6y8uBlwc0lHxXvMnC/a7jYcbhxtlufP5wMoTe8l0rzD+Sx
        ZbyisRKGexkJinUMpMAFR5w=
X-Google-Smtp-Source: ABdhPJwQ5C/96loWRd8zxzj/soRRkiEZKgv1bSIwXrCr85ovOzmXRjHk77oA03hDU91UqxWjumjXnw==
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr3588623wrn.174.1616592705153;
        Wed, 24 Mar 2021 06:31:45 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u2sm3322739wrp.12.2021.03.24.06.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 06:31:43 -0700 (PDT)
Date:   Wed, 24 Mar 2021 14:32:04 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, mturquette@baylibre.com,
        sboyd@kernel.org, JC Kuo <jckuo@nvidia.com>, robh@kernel.org,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 00/14] Tegra XHCI controller ELPG support
Message-ID: <YFs/VBZvZo6mBJqz@orome.fritz.box>
References: <20210120073414.69208-1-jckuo@nvidia.com>
 <YB1vGTt0ufzsYBgo@ulmo>
 <YB1wxazg/QpRSJz6@kroah.com>
 <YFszBH1JJmjJmjn2@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="u5Zpz5lsXNY2k1xR"
Content-Disposition: inline
In-Reply-To: <YFszBH1JJmjJmjn2@orome.fritz.box>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--u5Zpz5lsXNY2k1xR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 01:39:32PM +0100, Thierry Reding wrote:
> On Fri, Feb 05, 2021 at 05:22:29PM +0100, Greg KH wrote:
> > On Fri, Feb 05, 2021 at 05:15:21PM +0100, Thierry Reding wrote:
> > > On Wed, Jan 20, 2021 at 03:34:00PM +0800, JC Kuo wrote:
> > > > Tegra XHCI controler can be placed in ELPG (Engine Level PowerGated)
> > > > state for power saving when all of the connected USB devices are in
> > > > suspended state. This patch series includes clk, phy and pmc changes
> > > > that are required for properly place controller in ELPG and bring
> > > > controller out of ELPG.
> > > >=20
> > > > JC Kuo (14):
> > > >   clk: tegra: Add PLLE HW power sequencer control
> > > >   clk: tegra: Don't enable PLLE HW sequencer at init
> > > >   phy: tegra: xusb: Move usb3 port init for Tegra210
> > > >   phy: tegra: xusb: Rearrange UPHY init on Tegra210
> > > >   phy: tegra: xusb: Add Tegra210 lane_iddq operation
> > > >   phy: tegra: xusb: Add sleepwalk and suspend/resume
> > > >   soc/tegra: pmc: Provide USB sleepwalk register map
> > > >   arm64: tegra210: XUSB PADCTL add "nvidia,pmc" prop
> > > >   dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop
> > > >   phy: tegra: xusb: Add wake/sleepwalk for Tegra210
> > > >   phy: tegra: xusb: Tegra210 host mode VBUS control
> > > >   phy: tegra: xusb: Add wake/sleepwalk for Tegra186
> > > >   usb: host: xhci-tegra: Unlink power domain devices
> > > >   xhci: tegra: Enable ELPG for runtime/system PM
> > > >=20
> > > >  .../phy/nvidia,tegra124-xusb-padctl.txt       |    1 +
> > > >  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |    1 +
> > > >  drivers/clk/tegra/clk-pll.c                   |   12 -
> > > >  drivers/clk/tegra/clk-tegra210.c              |   53 +-
> > > >  drivers/phy/tegra/xusb-tegra186.c             |  558 ++++-
> > > >  drivers/phy/tegra/xusb-tegra210.c             | 1889 +++++++++++++=
----
> > > >  drivers/phy/tegra/xusb.c                      |   92 +-
> > > >  drivers/phy/tegra/xusb.h                      |   22 +-
> > > >  drivers/soc/tegra/pmc.c                       |   94 +
> > > >  drivers/usb/host/xhci-tegra.c                 |  613 ++++--
> > > >  include/linux/clk/tegra.h                     |    4 +-
> > > >  include/linux/phy/tegra/xusb.h                |   10 +-
> > > >  12 files changed, 2784 insertions(+), 565 deletions(-)
> > > >=20
> > > > v5 "phy: tegra: xusb: tegra210: Do not reset UPHY PLL" is moved
> > > > into v6 "phy: tegra: xusb: Rearrange UPHY init on Tegra210"
> > >=20
> > > Mike, Stephen,
> > >=20
> > > could you guys take a look at the two clk patches here and give an
> > > Acked-by? There's build-time dependencies throughout the series, so i=
t'd
> > > be good if they can all go through either the PHY or USB trees.
> > >=20
> > > Kishon, Greg,
> > >=20
> > > any comments on these patches? Unfortunately, the USB patches in this
> > > series have a build-time dependency on the PHY patches, so this should
> > > all go through one tree. Since this all culminates in the XHCI driver,
> > > merging this through the USB tree might be best, provided that Kishon
> > > provides his Acked-by on the PHY patches.
> > >=20
> > > Alternatively, I can create a set of branches with the correct
> > > dependencies and send out pull requests for the three subsystems if
> > > that's preferrable.
> >=20
> > I have no objection for the usb patches to go through your tree as they
> > are hardware-specific.
>=20
> Kishon,
>=20
> I haven't heard back from you on this yet. We missed v5.12 but I'd like
> to get this into v5.13 since it's the last missing piece to get suspend
> and resume working properly on a number of boards.
>=20
> Are you okay if I take this through the Tegra tree to satisfy the
> interdependencies between clk, PHY and USB patches? I've already got
> Acked-by's from the clock and USB maintainers.
>=20
> I want to tentatively take this into linux-next to give it a bit of soak
> time before the ARM SoC -rc6 cut-off. Please let me know if you'd prefer
> to apply these to your tree so I can back them out of the Tegra tree
> again.

Also adding Vinod for visibility and in case Kishon's too busy.

Thierry

--u5Zpz5lsXNY2k1xR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBbP1EACgkQ3SOs138+
s6G5sBAAh0Lkrr0lTVpTOBr3PZOfIjNoSUKj3pElbX7MikbUbfAwbA6Q5kQsS/6U
Cl0wrHoCeWPnYGxN8tJtB0p2KgvIxocNryeIZEahFkf+dXzJLX+gi3q7I26G9t0c
KQdsu40RA28kYoUPeNiwMUyueeimHMt0R9neLagCh0NPjUXhFybPtA8fcynT7psm
dPFdqBRJL4E49dkcT0pZRdFiISqMDGo+b4xy/iyIMUGHrdINshI1NMdRQgYZ2A50
EB72FmS8nvxEWHO7U7fcRg2qBFqwp/YjCHmzz5eePMXMYttY8buYG2SjmnsXPHTe
TQWJhs4pa1Jpadjr40bwz76Zt8PbAC1OHTi9l0N4iGUaa1FIw6hoieD8iFLSyjS5
DbNqawgDUDXFuu1/idLzFccSNU24CALZT1xhy32cT3DqtHIP09aI5LBpu8sFyjCj
zjpx8IoO1Nk4UHWspb6RycyBGVNU880RjtrMT2ip5roy10Ff00ryeX7KZu4CGdkZ
IgvxegtSq0wIkq3JstCK7TuGLxuDii8HeGYip2HkmZ19tguNU0Imn+2f8IhErW2K
OVPaqa8hsI0Jd7eXvedMWOfUk8DAfRn7gXdQiBQPcHy4Pz08piNBmedeyfdeZetO
H998/kewk+3bMPDdxi/6zADUcwUXdMC/88XWKa5be6uDIO3jzMI=
=AbYf
-----END PGP SIGNATURE-----

--u5Zpz5lsXNY2k1xR--
