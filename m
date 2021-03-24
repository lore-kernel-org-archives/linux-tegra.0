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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AF4C433E4
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 12:40:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1526361A19
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 12:40:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbhCXMjb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Mar 2021 08:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbhCXMjP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Mar 2021 08:39:15 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16FE3C061763;
        Wed, 24 Mar 2021 05:39:15 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so2637865wma.0;
        Wed, 24 Mar 2021 05:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AZ734CjXzkZxxW7LJ76u2/6BjErh6hqwyWyypNcJoZw=;
        b=G+Jlmg/ALd2lsMKtIHlvZdWKGU6MzG80pmxqLdEYEbINLeYjJgnurKhqJjNy88Shpj
         8vQvMBdvyxusqhDmvAVKgnNpqqTjK+C7sxDKlDMq7jMiU6PDj1qjOPSg7btSTnrD2ZvP
         zfNpk17h3Bsotz7iltdEPaD3tmBhfnCgDSqbwFfUubhhrGsW9vVgOcMRQ72DEYyJOp1Z
         loGI+jCuh1CDaSnqj7TjH12rkIYieWGORG48hsC7/XT8m+YjeH9MuoEMRuQZdgVczChb
         V7zrq3vmjSA5U1cimpMEekfBHv+pSntC5v4uEY420tByZmKCQD5lsibrCx/0iGpoA1L2
         fdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AZ734CjXzkZxxW7LJ76u2/6BjErh6hqwyWyypNcJoZw=;
        b=r6DF6QEOAN89zP++JiilmEWxDjO9J6MHwPfIkpdyo1zwb3UCu0SVHSkVvbmxfu/m4C
         ff/zO6gEj2ytRzIPSo/+r2gYBIakfTQHcQSC4Ao3tpoNGTpnUu+KR7Pc5CXU2c3TdrGM
         W66iLHYyLjFz+5KZJtjgA6kxxZ2iRxByx7yGXTby9aJvUGY86lTvyQXLz8CgoQujUruV
         RG8XxmsCYCU2RALV3Za3/GuoQSZlNHC6MZKy4rnGHe/4cmr/eCBoZvkwTrOmOfKvIS+e
         f+w53DaZ2XXdauVlpcjbIbCWnAUcwvInROMF6NtIL7wg90+wcDCXHy8O6UA7kiXDbUvz
         aAWg==
X-Gm-Message-State: AOAM530XWymL71LHD53AHr9ym3FTIS9zFwLEL/3Fx8Vm6JbW3eIZPmj6
        SB2O/4kV3l4d9J1Wvk1mRKw=
X-Google-Smtp-Source: ABdhPJys5Jrb6PdF4VBtE5c10/wMy5i+PsWuFX7nrooh4zkWIx0qwo0EbEpsVIBILsQXWSszjk4ubw==
X-Received: by 2002:a7b:cc84:: with SMTP id p4mr2798680wma.10.1616589553802;
        Wed, 24 Mar 2021 05:39:13 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u4sm3055247wrm.24.2021.03.24.05.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:39:12 -0700 (PDT)
Date:   Wed, 24 Mar 2021 13:39:32 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, mturquette@baylibre.com,
        sboyd@kernel.org, JC Kuo <jckuo@nvidia.com>, robh@kernel.org,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 00/14] Tegra XHCI controller ELPG support
Message-ID: <YFszBH1JJmjJmjn2@orome.fritz.box>
References: <20210120073414.69208-1-jckuo@nvidia.com>
 <YB1vGTt0ufzsYBgo@ulmo>
 <YB1wxazg/QpRSJz6@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OPsgcSQYCpWKq5eH"
Content-Disposition: inline
In-Reply-To: <YB1wxazg/QpRSJz6@kroah.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--OPsgcSQYCpWKq5eH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 05:22:29PM +0100, Greg KH wrote:
> On Fri, Feb 05, 2021 at 05:15:21PM +0100, Thierry Reding wrote:
> > On Wed, Jan 20, 2021 at 03:34:00PM +0800, JC Kuo wrote:
> > > Tegra XHCI controler can be placed in ELPG (Engine Level PowerGated)
> > > state for power saving when all of the connected USB devices are in
> > > suspended state. This patch series includes clk, phy and pmc changes
> > > that are required for properly place controller in ELPG and bring
> > > controller out of ELPG.
> > >=20
> > > JC Kuo (14):
> > >   clk: tegra: Add PLLE HW power sequencer control
> > >   clk: tegra: Don't enable PLLE HW sequencer at init
> > >   phy: tegra: xusb: Move usb3 port init for Tegra210
> > >   phy: tegra: xusb: Rearrange UPHY init on Tegra210
> > >   phy: tegra: xusb: Add Tegra210 lane_iddq operation
> > >   phy: tegra: xusb: Add sleepwalk and suspend/resume
> > >   soc/tegra: pmc: Provide USB sleepwalk register map
> > >   arm64: tegra210: XUSB PADCTL add "nvidia,pmc" prop
> > >   dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop
> > >   phy: tegra: xusb: Add wake/sleepwalk for Tegra210
> > >   phy: tegra: xusb: Tegra210 host mode VBUS control
> > >   phy: tegra: xusb: Add wake/sleepwalk for Tegra186
> > >   usb: host: xhci-tegra: Unlink power domain devices
> > >   xhci: tegra: Enable ELPG for runtime/system PM
> > >=20
> > >  .../phy/nvidia,tegra124-xusb-padctl.txt       |    1 +
> > >  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |    1 +
> > >  drivers/clk/tegra/clk-pll.c                   |   12 -
> > >  drivers/clk/tegra/clk-tegra210.c              |   53 +-
> > >  drivers/phy/tegra/xusb-tegra186.c             |  558 ++++-
> > >  drivers/phy/tegra/xusb-tegra210.c             | 1889 +++++++++++++--=
--
> > >  drivers/phy/tegra/xusb.c                      |   92 +-
> > >  drivers/phy/tegra/xusb.h                      |   22 +-
> > >  drivers/soc/tegra/pmc.c                       |   94 +
> > >  drivers/usb/host/xhci-tegra.c                 |  613 ++++--
> > >  include/linux/clk/tegra.h                     |    4 +-
> > >  include/linux/phy/tegra/xusb.h                |   10 +-
> > >  12 files changed, 2784 insertions(+), 565 deletions(-)
> > >=20
> > > v5 "phy: tegra: xusb: tegra210: Do not reset UPHY PLL" is moved
> > > into v6 "phy: tegra: xusb: Rearrange UPHY init on Tegra210"
> >=20
> > Mike, Stephen,
> >=20
> > could you guys take a look at the two clk patches here and give an
> > Acked-by? There's build-time dependencies throughout the series, so it'd
> > be good if they can all go through either the PHY or USB trees.
> >=20
> > Kishon, Greg,
> >=20
> > any comments on these patches? Unfortunately, the USB patches in this
> > series have a build-time dependency on the PHY patches, so this should
> > all go through one tree. Since this all culminates in the XHCI driver,
> > merging this through the USB tree might be best, provided that Kishon
> > provides his Acked-by on the PHY patches.
> >=20
> > Alternatively, I can create a set of branches with the correct
> > dependencies and send out pull requests for the three subsystems if
> > that's preferrable.
>=20
> I have no objection for the usb patches to go through your tree as they
> are hardware-specific.

Kishon,

I haven't heard back from you on this yet. We missed v5.12 but I'd like
to get this into v5.13 since it's the last missing piece to get suspend
and resume working properly on a number of boards.

Are you okay if I take this through the Tegra tree to satisfy the
interdependencies between clk, PHY and USB patches? I've already got
Acked-by's from the clock and USB maintainers.

I want to tentatively take this into linux-next to give it a bit of soak
time before the ARM SoC -rc6 cut-off. Please let me know if you'd prefer
to apply these to your tree so I can back them out of the Tegra tree
again.

Thanks,
Thierry

--OPsgcSQYCpWKq5eH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBbMwIACgkQ3SOs138+
s6EVZxAAtadd18gHHhsUYyV3OGqDMG+1Y6bGQIcRaAfgqF+SctUTzdCGHkVvyuO5
sShSqOUZBQeYmbeih8zierPXi0FgGCKf9jjN2J3EPLtgNZG8XrdEl82igowsQVoA
mTE8WuaEIvJ2A8ffLECTS4oXZcjkSRfEH4YgaBuWMvMx/YjRicjfJzUHM6UIxUdq
ajqMCLXwfr9ckZ6idNZKcH7kXipIgV5+G+4YXrIX9fl5lc4uV1rg2xU5B5z2Nz6y
TGzmcWCtO8ns4ls8fJ8ofYKWFWNCcKsAHRn7H8yZmu1vGWYoIgpjxikoJnJdAlM6
1Jl87sAxHwLgalVkinsCjGWcbWaYiaJnxV4bkXx0QDwMfDAYR/UbLUuU5pJ+ZNsQ
174ElKGin/GUtz6qX2Ylm/5m4l+E/eP1NJgFTPILBjitaqOekHOVOJwHuZZJK04x
VlBCobbia0U6N05BE+yqniU3CponP1XgaB7nm1nsk3YW7T/Vnoy05x5sfmSBZ7+S
4ZbTLXUQSeaJhVrLynDqGQkj/yb7UM3Z9VJyVIk+ZbtTC164SgxprDyGtesNYNry
pnqaLPtK9weDG09Dh/inyBXvIAhDTq3kLzEcewE/ySdjc+Sc7WC9RObM8d94IIlw
xRYFZ3OcLfWhTE2LkoYrD8G2YuORb7KXYZM3PfEW0VHEQLmI7rQ=
=wSm7
-----END PGP SIGNATURE-----

--OPsgcSQYCpWKq5eH--
