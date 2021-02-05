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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7BCC4332B
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 22:14:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B793464FE2
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 22:14:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbhBEWNz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 Feb 2021 17:13:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232674AbhBEOhh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 Feb 2021 09:37:37 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9596C06178B;
        Fri,  5 Feb 2021 08:15:26 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 190so6476734wmz.0;
        Fri, 05 Feb 2021 08:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mACicL3rE+Kh0IehlID0L8VuwnVf9CB87E6ZMKmgukU=;
        b=PBL7qppo0ij8tdwx68ivvnBR12W0uA9PnbUlNDF4iPl4aRGOW1Ux+UrVSXDgpyQbwS
         mKa+pmVe9gZg7WNyuaI6m7hb066N+EWYyvPBqSCV2a8FrDWBJ5/QPUI1aUI0LquSL+Uz
         XvljK1qhu1BLFIU0x5P4JmHKsOsAKlEe12MH6CNW+8yZWGj1SZp7iD4KqlXtzGiyEWw7
         4BFW5Cdbl+CybT3K0UHwVJ/xSnZA8U1furIBoE6S/pBcp+urgpC7VbZMCxXjmgFCnnLo
         xJZ7yuOH0tGOvEw6EYIuKaDVtyu+jZfJOpM95hYkY442HOmOSJa2zrNbTyukwfhE3MQf
         AfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mACicL3rE+Kh0IehlID0L8VuwnVf9CB87E6ZMKmgukU=;
        b=Cdbyi745bIGCN572JfZyTNP32Xl+pvZ7YUnE2309IDVGxpU9dKSCdHWo9+nRy5BLkG
         IIbZkH8Oj9xbdHfMocidQtr2oJSCJzw8D2xhPz0KyvBJkYtvm/hM4X9VvSA2ZfjUCtPB
         QFUYhUkZrl056imL9ukCb2agO1noAiVJ6N6UT9nvhhnJFI7NsoiRaDXnn8EeQKGqTWr9
         66X06liIVkqGcZVBlxJD7YfzaYQ7lDLhN7cqOkrZWo9MVDgE9UxRaPusu5UAUXZTA6SA
         WYB8mGjwUQL2E5A0YT3ELT1SdIecFZyazDDaowa2AtyEII53ndWTFnwJukk6IoT4SbF/
         GauQ==
X-Gm-Message-State: AOAM533gaqHv/LPYszVI/L5d3rRRYlz0qjQEWtqQCq27cPBqXLz1wgA4
        BI2Xy0uZkAB9a7aXNb21CQk=
X-Google-Smtp-Source: ABdhPJx8X8W0cynwZXl8aKAQ163MTMwsU5DJ+VhIRSM5tIIit2yHBlZDBooRC5fOiOG/QM2ZOpSqDg==
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr4261470wmy.120.1612541725495;
        Fri, 05 Feb 2021 08:15:25 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h15sm13085203wrt.10.2021.02.05.08.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 08:15:23 -0800 (PST)
Date:   Fri, 5 Feb 2021 17:15:21 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     gregkh@linuxfoundation.org, kishon@ti.com, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     JC Kuo <jckuo@nvidia.com>, robh@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        nkristam@nvidia.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 00/14] Tegra XHCI controller ELPG support
Message-ID: <YB1vGTt0ufzsYBgo@ulmo>
References: <20210120073414.69208-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zgswFb86aj1T/vHg"
Content-Disposition: inline
In-Reply-To: <20210120073414.69208-1-jckuo@nvidia.com>
User-Agent: Mutt/2.0.5 (da5e3282) (2021-01-21)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--zgswFb86aj1T/vHg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 03:34:00PM +0800, JC Kuo wrote:
> Tegra XHCI controler can be placed in ELPG (Engine Level PowerGated)
> state for power saving when all of the connected USB devices are in
> suspended state. This patch series includes clk, phy and pmc changes
> that are required for properly place controller in ELPG and bring
> controller out of ELPG.
>=20
> JC Kuo (14):
>   clk: tegra: Add PLLE HW power sequencer control
>   clk: tegra: Don't enable PLLE HW sequencer at init
>   phy: tegra: xusb: Move usb3 port init for Tegra210
>   phy: tegra: xusb: Rearrange UPHY init on Tegra210
>   phy: tegra: xusb: Add Tegra210 lane_iddq operation
>   phy: tegra: xusb: Add sleepwalk and suspend/resume
>   soc/tegra: pmc: Provide USB sleepwalk register map
>   arm64: tegra210: XUSB PADCTL add "nvidia,pmc" prop
>   dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop
>   phy: tegra: xusb: Add wake/sleepwalk for Tegra210
>   phy: tegra: xusb: Tegra210 host mode VBUS control
>   phy: tegra: xusb: Add wake/sleepwalk for Tegra186
>   usb: host: xhci-tegra: Unlink power domain devices
>   xhci: tegra: Enable ELPG for runtime/system PM
>=20
>  .../phy/nvidia,tegra124-xusb-padctl.txt       |    1 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |    1 +
>  drivers/clk/tegra/clk-pll.c                   |   12 -
>  drivers/clk/tegra/clk-tegra210.c              |   53 +-
>  drivers/phy/tegra/xusb-tegra186.c             |  558 ++++-
>  drivers/phy/tegra/xusb-tegra210.c             | 1889 +++++++++++++----
>  drivers/phy/tegra/xusb.c                      |   92 +-
>  drivers/phy/tegra/xusb.h                      |   22 +-
>  drivers/soc/tegra/pmc.c                       |   94 +
>  drivers/usb/host/xhci-tegra.c                 |  613 ++++--
>  include/linux/clk/tegra.h                     |    4 +-
>  include/linux/phy/tegra/xusb.h                |   10 +-
>  12 files changed, 2784 insertions(+), 565 deletions(-)
>=20
> v5 "phy: tegra: xusb: tegra210: Do not reset UPHY PLL" is moved
> into v6 "phy: tegra: xusb: Rearrange UPHY init on Tegra210"

Mike, Stephen,

could you guys take a look at the two clk patches here and give an
Acked-by? There's build-time dependencies throughout the series, so it'd
be good if they can all go through either the PHY or USB trees.

Kishon, Greg,

any comments on these patches? Unfortunately, the USB patches in this
series have a build-time dependency on the PHY patches, so this should
all go through one tree. Since this all culminates in the XHCI driver,
merging this through the USB tree might be best, provided that Kishon
provides his Acked-by on the PHY patches.

Alternatively, I can create a set of branches with the correct
dependencies and send out pull requests for the three subsystems if
that's preferrable.

Let me know how you want to handle these.

Thanks,
Thierry

--zgswFb86aj1T/vHg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAdbxUACgkQ3SOs138+
s6HPWA//bsqVHuTYuYpOfFyr9+CAEKLUWRjjySBwjp2J0wzqbpAm1VJZqxGyCP2n
C1rHW7FNBhXcH1fy68JWC9fovri9TtEXmmNusF4BPnnqacJeQ8FpGKxVi7wqlzBf
FgkqEdFWbtjVY+Pb9roDzEI3pp6V0dN2133j/9Z278ushVoPg21eqPnY2mAnOZBQ
lyU9JIEbR3Zos1fb9/Hhi2vNhk4sbJsviktAi/OYmFj2NlDGHxg8JMHA7Xk8e5P6
9MuFqxclirj7bwhkRgCH/BmiHqhO1rmLhGi+Hfrd/VKDeF9srcY8J5eAUHRtaibt
bg9tCbnLk4dN/JXAZgTly4obqxx2WayLZhxXuG18otd0sX9vis+dFnO/dw78TVET
Nmm3zUcqvSvA0X/pEH9ijC7YT3lbpcWvVnCuRCjJt8FF4O0ecXUyqqA2wIRd4+I5
7xPkIubuvOZsERheGrQoTSlD43Yt8ky/IiyNz3z/RNa4uj5DxK90BpXQtppr3lE3
PKngxHkeeAm3DTstpr1z4IAglFuOnhh7H9Cc/leD3mnJDfwzs7qp9cTg0Lg50V4V
dukwQV06CFWWA+TpyJkRjrBJw2Tw6pnFALrWzeT61Zg9KsoAVcTZI4so+BjaEPPg
MsGzpg0gcHVGdFzfAI1LU/MuFDdkZwQ4Rtjv28ZAko7NcR7eoUQ=
=+est
-----END PGP SIGNATURE-----

--zgswFb86aj1T/vHg--
