Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94770C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Dec 2021 10:58:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhLUK6I (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Dec 2021 05:58:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbhLUK6H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Dec 2021 05:58:07 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40DCBC061574
        for <linux-tegra@vger.kernel.org>; Tue, 21 Dec 2021 02:58:07 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id s1so26150461wrg.1
        for <linux-tegra@vger.kernel.org>; Tue, 21 Dec 2021 02:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=obI3r1nbzM0iraW5qRU50M6aT90W8rhVhO6/hztYZ1A=;
        b=N7sRrOs0i4SKE+2dl7grvKCNzlSX7whuGGJGN6uOHeaOfVEsPPNdJxRa+VgOfWqVAr
         EI7/ntGcE+8IyTfhusJMl79m/NxSAn3o9afWnO2g1fkSkyMF2hyWPFg4aH0QHZQKXNSk
         lkqOIZXKq+XoMBpjbkhxf9qipY75M0P4G+5hy4YVbFZGsJ8R3Tejv+dtmzeF95YIEHNO
         LoKt0ZPm/+hrzCMbUn7XW0HrAj0v3vgMiPbg6otqHlYahfFMMwaQvaHcZs28TLwzlENr
         lSVPxzWgOgVFN7KX+Ut1kml4Pyzm4FoeyBY84ZC+TMDyapU8Puzy4GtBUAXS6bV6blOV
         WIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=obI3r1nbzM0iraW5qRU50M6aT90W8rhVhO6/hztYZ1A=;
        b=BQQ7aTOCi/cS7cG52Al7i/W4/XdFg9lnt9PyeSpqjb0z4JyZwCaw8GcJjxCVCSNgIy
         RpOX/0XuR1tgTloFWk7ajky6J+QBdu9AyPK7BOY1lJuFvb0qYMdnJrXKNAZRU4zDwrtI
         yQUbQM4F3ayIBhHfku4x6lWlsZnsV9pZov1iHdzZznM+P3PwlupJs7uIn91fjWqjhDmu
         r2f3sVjIXDiZVtL1Ok+ueSsbkmjAEKESSIvE4KbrzP5RyLzOuYDfXtpsOuxPK8cZu4s9
         F41fE08M0YhTbXyDTramcVUUobB4LQATP9p327TowzZmPvtMzWCRMgY7qU6m5UVN9twH
         pDKQ==
X-Gm-Message-State: AOAM531RJWcTBD5/ETDL5mLpoGkqu5e6u+Pml8Iil65PUXOjcOYVbavj
        OgQ5xQ4koDIvDGS5FgQuRqU=
X-Google-Smtp-Source: ABdhPJx3nBlH0mkdVbGBQjSn1PPOzgpA0j3HWH/tnD2RozrYeh6BjPALNBoyb9X4HwCzmxsMXIjhkA==
X-Received: by 2002:adf:a18b:: with SMTP id u11mr2059051wru.397.1640084285707;
        Tue, 21 Dec 2021 02:58:05 -0800 (PST)
Received: from orome (pd9e51d39.dip0.t-ipconnect.de. [217.229.29.57])
        by smtp.gmail.com with ESMTPSA id b6sm2397205wmq.45.2021.12.21.02.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 02:58:04 -0800 (PST)
Date:   Tue, 21 Dec 2021 11:58:03 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thomas Graichen <thomas.graichen@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
Message-ID: <YcGzO0A/iWzhFjvE@orome>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com>
 <YcCg/xktJ2uShFRf@orome>
 <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="me06PRNfHQeU1eBN"
Content-Disposition: inline
In-Reply-To: <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com>
User-Agent: Mutt/2.1.4 (93ef06ae) (2021-12-11)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--me06PRNfHQeU1eBN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 20, 2021 at 07:12:03PM +0300, Dmitry Osipenko wrote:
> 20.12.2021 18:27, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, Dec 20, 2021 at 05:45:41PM +0300, Dmitry Osipenko wrote:
> >> 20.12.2021 13:48, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> Hi,
> >>>
> >>> this is an alternative proposal to fix panel support on Venice 2 and
> >>> Nyan. Dmitry had proposed a different solution that involved reverting
> >>> the I2C/DDC registration order and would complicate things by breaking
> >>> the encapsulation of the driver by introducing a global (though local=
ly
> >>> scoped) variable[0].
> >>>
> >>> This set of patches avoids that by using the recently introduced DP A=
UX
> >>> bus infrastructure. The result is that the changes are actually less
> >>> intrusive and not a step back. Instead they nicely remove the circular
> >>> dependency that previously existed and caused these issues in the fir=
st
> >>> place.
> >>>
> >>> To be fair, this is not perfect either because it requires a device t=
ree
> >>> change and hence isn't technically backwards-compatible. However, giv=
en
> >>> that the original device tree was badly broken in the first place, I
> >>> think we can make an exception, especially since it is not generally a
> >>> problem to update device trees on the affected devices.
> >>>
> >>> Secondly, this relies on infrastructure that was introduced in v5.15 =
and
> >>> therefore will be difficult to backport beyond that. However, since t=
his
> >>> functionality has been broken since v5.13 and all of the kernel versi=
ons
> >>> between that and v5.15 are EOL anyway, there isn't much that we can do
> >>> to fix the interim versions anyway.
> >>>
> >>> Adding Doug and Laurent since they originally designed the AUX bus
> >>> patches in case they see anything in here that would be objectionable.
> >>>
> >>> Thierry
> >>>
> >>> [0]: https://lore.kernel.org/dri-devel/20211130230957.30213-1-digetx@=
gmail.com/
> >>>
> >>> Thierry Reding (2):
> >>>   drm/tegra: dpaux: Populate AUX bus
> >>>   ARM: tegra: Move panels to AUX bus
> >>>
> >>>  arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
> >>>  arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
> >>>  arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
> >>>  drivers/gpu/drm/tegra/Kconfig             |  1 +
> >>>  drivers/gpu/drm/tegra/dpaux.c             |  7 +++++++
> >>>  5 files changed, 33 insertions(+), 19 deletions(-)
> >>>
> >>
> >> It should "work" since you removed the ddc-i2c-bus phandle from the
> >> panel nodes, and thus, panel->ddc won't be used during panel-edp driver
> >> probe. But this looks like a hack rather than a fix.
> >=20
> > The AUX ->ddc will be used for panel->ddc if the ddc-i2c-bus property is
> > not specified. And that makes perfect sense because we'd basically just
> > be pointing back to the AUX node anyway.
> >=20
> >> I'm not sure why and how devm_of_dp_aux_populate_ep_devices() usage
> >> should be relevant here. The drm_dp_aux_register() still should to
> >> invoked before devm_of_dp_aux_populate_ep_devices(), otherwise
> >> panel->ddc adapter won't be registered.
> >=20
> > drm_dp_aux_register() is only needed to expose the device to userspace
> > and make the I2C adapter available to the rest of the system. But since
> > we already know the AUX and I2C adapter, we can use it directly without
> > doing a separate lookup. drm_dp_aux_init() should be enough to set the
> > adapter up to work for what we need.
> >=20
> > See also the kerneldoc for drm_dp_aux_register() where this is described
> > in a bit more detail.
>=20
> Alright, so you fixed it by removing the ddc-i2c-bus phandles and I2C
> DDC will work properly anyways with that on v5.16.
>=20
> But the aux-bus usage still is irrelevant for the fix. Let's not use it
> then.

Yes, it's completely relevant because it essentially replaces the I2C
DDC. With the AUX bus, the AUX and hence the I2C DDC can be implied from
the bus' parent.

> >> The panel->ddc isn't used by the new panel-edp driver unless panel is
> >> compatible with "edp-panel". Hence the generic_edp_panel_probe() should
> >> either fail or crash for a such "edp-panel" since panel->ddc isn't ful=
ly
> >> instantiated, AFAICS.
> >=20
> > I've tested this and it works fine on Venice 2. Since that was the
> > reference design for Nyan, I suspect that Nyan's will also work.
> >=20
> > It'd be great if Thomas or anyone else with access to a Nyan could
> > test this to verify that.
>=20
> There is no panel-edp driver in the v5.15. The EOL of v5.15 is Oct,
> 2023, hence we need to either use:

All the (at least relevant) functionality that is in panel-edp was in
panel-simple before it was moved to panel-edp. I've backported this set
of patches to v5.15 and it works just fine there.

Thierry

--me06PRNfHQeU1eBN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmHBszoACgkQ3SOs138+
s6GvQw//bsLwp0KnPTFEbrxWV+FH1aNy868Cl8evmrK/43zhvUBXRGM9TYuZ0vFV
pgytpg/Kxrg5zEVu/3F081gsisAcDMi3jsWuVozsddP7DN5v7tuQVRtCRyNjZjXw
o3iTIoYhGVfiSmqC6ecPFolGb2IFkEcxkgzioGkFKiUlgIWhbFv9L/b6MHThx/Oo
U424dwzgsNaDXBKuU+GntZ1ew1dDPQr81fMhm2zHBhweeyCMDZ2SkU9lD1tQSrmw
16JQQfKZoefKEwv7zPh3TbO6r6Xmxn6NXKRoABg9jjwIXhqMfQ4jbd5fs+siEzd+
W/mC75XtcqI1uoemaUxQD5TcQLTTXX8FqD8jl9xdHuVog1oOSswKd4X/ayjGJRI8
4pNVkbA35khe3iNcDd9bL4UwVI0NLpuoz2D5q9fNIy76aO9NZu34kqOkMUowtl/t
kWrH2cx8NBiOXLqEfwiI+yAh+fx8O0Z1+FHKThDwY12yA44tJZ51Ke/3fS0Rkvnw
8ZDd0ORiU55Y9FophkyF3oUwTy9SFv/BG0WoB1o8U2+fm5Sa+86WS7Re5BpyNau5
f5awB/HfaiC6/QPNNN5dU+8/g0SoF4GEEdPw7NngHlutfQK3sc8nILxJtgVvjsrY
51biL+703GRwR/SPMULipycmT6yiGj/Uc735YrRJSluFEcokhtY=
=PYE7
-----END PGP SIGNATURE-----

--me06PRNfHQeU1eBN--
