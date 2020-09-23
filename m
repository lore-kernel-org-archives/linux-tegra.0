Return-Path: <SRS0=J1sk=DA=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81D2C4727E
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Sep 2020 08:12:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7137D238D6
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Sep 2020 08:12:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIp/zIQW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgIWIMt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Sep 2020 04:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWIMt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Sep 2020 04:12:49 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE38DC061755;
        Wed, 23 Sep 2020 01:12:48 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id g4so19938737wrs.5;
        Wed, 23 Sep 2020 01:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=otmHJESTnAoR44wjGuqlkD9jm57kCBapvfu4uRZNUnU=;
        b=gIp/zIQWxUstPlNbr2RKW8+bofSVi0RBJa2ns2rxAYEnUjWJv29+DuXCX2z6JXBSWD
         OsANTujBR/x1EVx14g2CDOPUAgZBAJ/JDkIh22+bbrvhWw2m4WNYzA4ne8Ct1R4ktm34
         Fm3xB9k51iSHeVg1UwcectmEuQcKTgzCUlj2+eqdKWGWMF8xwcbcLHg+egl6R9P0z4w2
         PUNdFRUmCLc+mqufkdgJwWzC6g5djWPrcWhxljAWGHhizPHt/+kyP+16IZFJqy6UREjr
         y6QxkKcGUfszZycUiWR2wj6MtBa4iQ8HKEPBA+Jomr2dPpdzYEZR6Sv2p2+6ngJxVUNw
         kLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=otmHJESTnAoR44wjGuqlkD9jm57kCBapvfu4uRZNUnU=;
        b=jH65f974fZPZ2U85QZIgRs/Gy8Ir727/TzB67r/RavNfdBB8uUzVh56yudrnE2RTdt
         Hx+Q0WWqRwKbwx4wfIIpr4qrRaRZGOwwb9oVh2CPmekZh88EPLvX0sm5DJyZGe4ERiAK
         3NAgjqof8llt9cR50IXphnMCyRHpHRoeitHiCYtUjwhgVWj2v9Yrc/GyRa84cyjsm4+H
         1SSOafPByos+EgnmJioEB+ZW0HBTDDyDGy+f9nor0mN0oBO2beNrEFtnqayfSkFM/7SB
         vv8jWxw08aUoet08e4uuP9p3w8pEqLo5W5FwfwChrxGN2W+KCU2n+OJwonfP8A9IpguS
         aPtw==
X-Gm-Message-State: AOAM533TlUEoy7oXl5XhtXxkvwDRGWygm8MMWBwr+1mx648dwJZ4oN69
        6Ig0Lz1s72uTvrwbnyRZl+jJY6hJZP8=
X-Google-Smtp-Source: ABdhPJw0jbaYApgVm7434GIXpCbxfksfNDbTstDhjGl0KQl92tu2nmgrvv1m/s9YclkytYvJjiyvRg==
X-Received: by 2002:adf:dfd1:: with SMTP id q17mr10621334wrn.347.1600848767665;
        Wed, 23 Sep 2020 01:12:47 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id a83sm7396585wmh.48.2020.09.23.01.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 01:12:46 -0700 (PDT)
Date:   Wed, 23 Sep 2020 10:12:44 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL] clk: tegra: Changes for v5.10-rc1
Message-ID: <20200923081244.GB1110498@ulmo>
References: <20200921121628.3954746-1-thierry.reding@gmail.com>
 <20200921121842.GQ3950626@ulmo>
 <160072205823.4188128.2973025738875931354@swboyd.mtv.corp.google.com>
 <20200922073939.GA3994831@ulmo>
 <160080172593.310579.8671366820158880157@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline
In-Reply-To: <160080172593.310579.8671366820158880157@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 12:08:45PM -0700, Stephen Boyd wrote:
> Quoting Thierry Reding (2020-09-22 00:39:39)
> > On Mon, Sep 21, 2020 at 02:00:58PM -0700, Stephen Boyd wrote:
> > > Quoting Thierry Reding (2020-09-21 05:18:42)
> > > > On Mon, Sep 21, 2020 at 02:16:28PM +0200, Thierry Reding wrote:
> > > > > Hi Mike, Stephen,
> > > > >=20
> > > > > The following changes since commit 9123e3a74ec7b934a4a099e98af6a6=
1c2f80bbf5:
> > > > >=20
> > > > >   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
> > > > >=20
> > > > > are available in the Git repository at:
> > > > >=20
> > > > >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git t=
ags/for-5.10-clk
> > > > >=20
> > > > > for you to fetch changes up to 2f878d04218c8b26f6d0ab26955ca6b038=
48a1ad:
> > > > >=20
> > > > >   clk: tegra: Fix missing prototype for tegra210_clk_register_emc=
() (2020-09-21 14:09:10 +0200)
> > > > >=20
> > > > > Thanks,
> > > > > Thierry
> > > > >=20
> > > > > ----------------------------------------------------------------
> > > > > clk: tegra: Changes for v5.10-rc1
> > > > >=20
> > > > > This is a set of small fixes for the Tegra clock driver.
> > > > >=20
> > > > > ----------------------------------------------------------------
> > > > > Thierry Reding (3):
> > > > >       clk: tegra: Capitalization fixes
> > > > >       clk: tegra: Always program PLL_E when enabled
> > > > >       clk: tegra: Fix missing prototype for tegra210_clk_register=
_emc()
> > > > >=20
> > > > >  drivers/clk/tegra/clk-pll.c          | 7 ++-----
> > > > >  drivers/clk/tegra/clk-tegra210-emc.c | 2 ++
> > > > >  2 files changed, 4 insertions(+), 5 deletions(-)
> > > >=20
> > > > I just realized after sending this out that this is all really tiny=
 and
> > > > minor fixes, so perhaps it makes sense to even apply this for v5.9?
> > > >=20
> > >=20
> > > Is something critical? If so then it's OK to merge for v5.9, otherwise
> > > I'd rather let it cook in -next for a while. Being small doesn't real=
ly
> > > make a difference here. What matters is that it fixes some critical
> > > problem, preferably introduced this merge window but if it's annoying
> > > enough that rule can be broken.
> >=20
> > This is actually a subset of a set of patches that I had sitting on a
> > for-5.9/clk branch but for which I forgot to send a pull request. This
> > was pointed out to me on IRC yesterday. So this should already be soft-
> > boiled.
> >=20
> > The first patch is just a tiny bit of cleanup, but the second patch
> > fixes a real problem with SATA that can happen depending on how the
> > bootloader has set up the PLL_E. The third patch fixes a build
> > warning, which admittedly isn't critical, but certainly nice to have.
> > Given that the latter two are the only known issues with the clock
> > driver I think it would be nice to have them in v5.9, especially since
> > that's going to be an LTS and we'll end up back-porting at least two of
> > these patches to it anyway.
> >=20
>=20
> Ok. Is the bootloader problem happening right now?

Yes, SATA (and in some cases apparently Ethernet as well) is currently
broken on at least one platform (Jetson TK1). See this bug report for
details:

	https://lkml.org/lkml/2020/3/19/82

Thierry

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9rA3wACgkQ3SOs138+
s6EJthAAra8vgTPu5Z9stLiVOpnXA8jHVxJgZRx3s6CUOpD+2dJ7XfKsVaWjP+u9
6QSMMZVjbWguqtocS24WsCl6p1wXq50JE3pfivNE/YKV6iurg8a64LOSKEmV3kOE
t0R1CW+PtPWZMbUJzcpg61AZVDgG04oe2rRS8cocc+vreppmkrE7ZB9BDjnE+D2+
BB7wFL55HG+CBCd3llbc7gQ16WLqiy+T6UNbezpdE3s06N/Y3IxxWMuRKBMOWpWr
IP2NAZOz7bryiQHlBXlwv8m5i5zi+d+J6XJamwLj9sL3i5CAbNVX5J918/TWjb9u
vUBckeUF6lnwDMx2Dll80XIvFzLIqatPQ412V//e/mrkHUF7zm93v4BZThyc2yWB
qQJ4ieQ/FzkegNCpp1LipyT1/qDpP6MXuc/DpdTLA+sNyKT3xqmtPRFG9xZI0609
pgwdPvMXk4h6y4JE5aWjyAZIKJVzTmqWBXoHQrvEIg7lG4gEXrthj3nIyJKU/g6e
rAECDsrMvbGxuTxVph1wi1bAfuMSiKdeBRu5Au8Xgx9sxGbIpkOi6tlmKmTU9xFM
EnVmZ2r29luU0qJ38btUictdDd1zlbaHKB5fmvVTc5QnN34gl6xPGQ+YjqhrO+9z
pnMPA6fBp/g9NwAgZaQzZ6/vT8FKLMLPFAiR5GmWJqHNJz6zv5Q=
=Zams
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
