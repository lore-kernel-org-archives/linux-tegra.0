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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B19AC433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:00:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11D5961A28
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:00:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbhCYOA0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 10:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbhCYN7z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 09:59:55 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A8CC06174A;
        Thu, 25 Mar 2021 06:59:54 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id b9so2374802wrt.8;
        Thu, 25 Mar 2021 06:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YjKGZLlCtyQB82qBJtWELpC41+tYuhv7momCoRL5qT4=;
        b=S9QtyGwQo+41p9iAUrEHgPuF5EeA74lOYUAjf/ANbIvv2otJllwZLx2i1p9TllU0Ur
         x+AusAq9YqdSZKsOcgxdDprpG4xdADmTL1Ia22nnW6k/3gMTGF0mO7R4sC1Jd/qYIx+k
         3lhA4vhe0KKwFk+RchlCTO1aEfHMGNjWzBI8jTHi5ZgXugU48aHtIsB/07Le7GOuPeXb
         xrFW2s9K20C2U1bta6TTjSuzlzWBq8quRX7FNcGRw+GEZvDqTyZputNiB8aqxOR2qTjA
         ti0zugtzA6KsxJyjbd0wgOGWj+rIO0s7kBz/S9CQBmU/5zpdELOhu9j97XYm1j/DxQZt
         LFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YjKGZLlCtyQB82qBJtWELpC41+tYuhv7momCoRL5qT4=;
        b=ln3YIpTbB+CLvNoONwbj5upr8CePNCo3fJyrdoNwrgYzX/asZDI8MtXpvk9hxgNktJ
         jg8Yz3pKWbMEMObqC5EIFrPWoYaeLYC2w5VpeZEfzPXgjlL51+nIcG51ssWJoYXfUDpo
         1sYGmH2SxixJTP2qGW/K6Dnt158cnp6ixAkK9WLowX0Fjk6t4JPGv+Gwdxsg8t9DK9wn
         yx4wCbrW8qUCm5a7eKxNQHXO9iN29+8UzOeUY/q9fiXjSu+8YXDGpdp2cY2MWhnomNKI
         Gv50c/h0t8iRaQm+EDWY4neXYg265cTBBTOCnaOnyYRM1eGROVbcXxokAGuT0I9YNPdQ
         JQNQ==
X-Gm-Message-State: AOAM531W65SE2afYaGQL+7/1Fpe5iopDiz/i8LmfTqGWaW2CP2HnSAik
        QrtOtVpbNAQfd2BMBEzK3gOO/7e3Yp4=
X-Google-Smtp-Source: ABdhPJwHcUox/5A2lYu1bIefKlEe74vU5Oa15/sCjCff49J5IazfdbhZcgKGFfqI9+beoH1y40UsIQ==
X-Received: by 2002:adf:a703:: with SMTP id c3mr9360689wrd.72.1616680792847;
        Thu, 25 Mar 2021 06:59:52 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id x25sm7110649wmj.14.2021.03.25.06.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 06:59:50 -0700 (PDT)
Date:   Thu, 25 Mar 2021 15:00:12 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>, JC Kuo <jckuo@nvidia.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Greg KH <gregkh@linuxfoundation.org>, mturquette@baylibre.com,
        sboyd@kernel.org, robh@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        nkristam@nvidia.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 00/14] Tegra XHCI controller ELPG support
Message-ID: <YFyXbNXSVSBGqp9i@orome.fritz.box>
References: <20210120073414.69208-1-jckuo@nvidia.com>
 <YB1vGTt0ufzsYBgo@ulmo>
 <YB1wxazg/QpRSJz6@kroah.com>
 <YFszBH1JJmjJmjn2@orome.fritz.box>
 <YFs/VBZvZo6mBJqz@orome.fritz.box>
 <YFwqdNkkcrTRxSkP@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dai2fAX/B7TMT3mf"
Content-Disposition: inline
In-Reply-To: <YFwqdNkkcrTRxSkP@vkoul-mobl.Dlink>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--dai2fAX/B7TMT3mf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 11:45:16AM +0530, Vinod Koul wrote:
> On 24-03-21, 14:32, Thierry Reding wrote:
> > On Wed, Mar 24, 2021 at 01:39:32PM +0100, Thierry Reding wrote:
> > > On Fri, Feb 05, 2021 at 05:22:29PM +0100, Greg KH wrote:
> > > > On Fri, Feb 05, 2021 at 05:15:21PM +0100, Thierry Reding wrote:
> > > > > On Wed, Jan 20, 2021 at 03:34:00PM +0800, JC Kuo wrote:
> > > > > > Tegra XHCI controler can be placed in ELPG (Engine Level PowerG=
ated)
> > > > > > state for power saving when all of the connected USB devices ar=
e in
> > > > > > suspended state. This patch series includes clk, phy and pmc ch=
anges
> > > > > > that are required for properly place controller in ELPG and bri=
ng
> > > > > > controller out of ELPG.
> > > > > >=20
> > > > > > JC Kuo (14):
> > > > > >   clk: tegra: Add PLLE HW power sequencer control
> > > > > >   clk: tegra: Don't enable PLLE HW sequencer at init
> > > > > >   phy: tegra: xusb: Move usb3 port init for Tegra210
> > > > > >   phy: tegra: xusb: Rearrange UPHY init on Tegra210
> > > > > >   phy: tegra: xusb: Add Tegra210 lane_iddq operation
> > > > > >   phy: tegra: xusb: Add sleepwalk and suspend/resume
> > > > > >   soc/tegra: pmc: Provide USB sleepwalk register map
> > > > > >   arm64: tegra210: XUSB PADCTL add "nvidia,pmc" prop
> > > > > >   dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop
> > > > > >   phy: tegra: xusb: Add wake/sleepwalk for Tegra210
> > > > > >   phy: tegra: xusb: Tegra210 host mode VBUS control
> > > > > >   phy: tegra: xusb: Add wake/sleepwalk for Tegra186
> > > > > >   usb: host: xhci-tegra: Unlink power domain devices
> > > > > >   xhci: tegra: Enable ELPG for runtime/system PM
> > > > > >=20
> > > > > >  .../phy/nvidia,tegra124-xusb-padctl.txt       |    1 +
> > > > > >  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |    1 +
> > > > > >  drivers/clk/tegra/clk-pll.c                   |   12 -
> > > > > >  drivers/clk/tegra/clk-tegra210.c              |   53 +-
> > > > > >  drivers/phy/tegra/xusb-tegra186.c             |  558 ++++-
> > > > > >  drivers/phy/tegra/xusb-tegra210.c             | 1889 +++++++++=
++++----
> > > > > >  drivers/phy/tegra/xusb.c                      |   92 +-
> > > > > >  drivers/phy/tegra/xusb.h                      |   22 +-
> > > > > >  drivers/soc/tegra/pmc.c                       |   94 +
> > > > > >  drivers/usb/host/xhci-tegra.c                 |  613 ++++--
> > > > > >  include/linux/clk/tegra.h                     |    4 +-
> > > > > >  include/linux/phy/tegra/xusb.h                |   10 +-
> > > > > >  12 files changed, 2784 insertions(+), 565 deletions(-)
> > > > > >=20
> > > > > > v5 "phy: tegra: xusb: tegra210: Do not reset UPHY PLL" is moved
> > > > > > into v6 "phy: tegra: xusb: Rearrange UPHY init on Tegra210"
> > > > >=20
> > > > > Mike, Stephen,
> > > > >=20
> > > > > could you guys take a look at the two clk patches here and give an
> > > > > Acked-by? There's build-time dependencies throughout the series, =
so it'd
> > > > > be good if they can all go through either the PHY or USB trees.
> > > > >=20
> > > > > Kishon, Greg,
> > > > >=20
> > > > > any comments on these patches? Unfortunately, the USB patches in =
this
> > > > > series have a build-time dependency on the PHY patches, so this s=
hould
> > > > > all go through one tree. Since this all culminates in the XHCI dr=
iver,
> > > > > merging this through the USB tree might be best, provided that Ki=
shon
> > > > > provides his Acked-by on the PHY patches.
> > > > >=20
> > > > > Alternatively, I can create a set of branches with the correct
> > > > > dependencies and send out pull requests for the three subsystems =
if
> > > > > that's preferrable.
> > > >=20
> > > > I have no objection for the usb patches to go through your tree as =
they
> > > > are hardware-specific.
> > >=20
> > > Kishon,
> > >=20
> > > I haven't heard back from you on this yet. We missed v5.12 but I'd li=
ke
> > > to get this into v5.13 since it's the last missing piece to get suspe=
nd
> > > and resume working properly on a number of boards.
> > >=20
> > > Are you okay if I take this through the Tegra tree to satisfy the
> > > interdependencies between clk, PHY and USB patches? I've already got
> > > Acked-by's from the clock and USB maintainers.
> > >=20
> > > I want to tentatively take this into linux-next to give it a bit of s=
oak
> > > time before the ARM SoC -rc6 cut-off. Please let me know if you'd pre=
fer
> > > to apply these to your tree so I can back them out of the Tegra tree
> > > again.
> >=20
> > Also adding Vinod for visibility and in case Kishon's too busy.
>=20
> Yes please CC me on all things phy (MAINTAINERS should have told you so)
>=20
> If you can resend me and cc linux-phy@lists.infradead.org, I would take
> a look. FWIW since this goes thru Greg, the window closes earlier than
> merge window

Greg already agreed that it might be best to take this through the Tegra
tree because there's a bunch of dependencies. For Tegra the patches go
through ARM SoC and that usually means I have to send pull requests by
-rc6.

JC, do you have time to resend this batch this week? If not I can do it,
too.

Thierry

--dai2fAX/B7TMT3mf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBcl2kACgkQ3SOs138+
s6FJpRAAh/KdrFYeA+5w0LDmn1v40Lbh3XKBhiRlvmtkwquVdcVyNFT0ZVZQUvA5
bG5Ruvj3YbKufmVGXx5f9Sz2QnfSg+A4x7snLN2NYgCxx/ENsQvvLsnTJwKhFghK
NaqBfZ9kiZtmZjFjobzMTqu75saE78+KyuA3uahrKrpxKMhSqqrZ5opdN4k3Q5iQ
QLcul4xFNiJ9Yn93S9lc0I5f+Hm4GL5SMR0oOsPVHoUL5g1YWj4y/MqpZ8gh0HkR
ABuQp0K788del+g1JdJjnMsBG7fQpYBvIAobuBYgnM7a//bLmvSbHM/oGDD7aV3h
vIZhAaC2iaSSQTwB1B+K2rqlcI9t9qww3lphbAKALGeOKGBh1I7XCFHjSVVMcWVE
ZLMRgn4xqIQVomUKTF6tS6Jz+iwuYKpVBQDDo2wJVItTusYfFHM3iUJ0eZgrFBfz
J3JUPhSBWlHU6q6cBlZ90xOipZYseRt1ADunGKhVMfTi+20zxLMiRgRRHXndJ6K/
yQZr4VVHAo+YivfDUGN52vl0OVoe/tBVNNPB4XgYzD0T+Fo+Dfc3ERi30Vj9OWcs
AwScJAB5xi5lahkz4ADe6cY9VngQWOsYHewk7OHgE1JCENVTOyBRggyYb8ldl4rv
a0CHLOsjWBm8OR0w/HujDZhCEWbMe3kLQYky40A/jk3iAQHtecM=
=5lML
-----END PGP SIGNATURE-----

--dai2fAX/B7TMT3mf--
