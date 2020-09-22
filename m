Return-Path: <SRS0=69DC=C7=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4160AC4727C
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Sep 2020 19:08:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF84C235FD
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Sep 2020 19:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600801728;
	bh=4J/w3Vkxg+HuqQSVYaDRFa+rb6aMDW8KUCGejb/V2A0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=FsHjWPdOGcn4v/58s9Ywty2QS6drPSchjEd+Zx/n8THz/z4WqoskNPnoK9JxeP7KJ
	 qlCeq9vghb7z4ChgUGIoJDe19aREBe3/NbWK3zZ0EtJbFdfmTl+Skp25h6hJIGhdw6
	 Y9emJoxeAHQladJI8HcKZNXK/gYS5kQMkZpkCgZo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgIVTIr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:08:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:48834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgIVTIr (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Sep 2020 15:08:47 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0FD032311C;
        Tue, 22 Sep 2020 19:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600801727;
        bh=4J/w3Vkxg+HuqQSVYaDRFa+rb6aMDW8KUCGejb/V2A0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=n5+ZnjhvGUjMfCK/7E4TCdk1S6XvvPqu8PeZ4igOaV3VnkLR0HyWjqSnsdYfA5XC1
         HSEWzxMU1RQnxcoVQSJqLwTZr7Ou7PUJ9iY4R91lrrOlhc2+OXi90BFP9XahZuEF81
         NU7iDaLcLuzK5yZ2B3unQL2Vl5hCJRrU8Bcyd064=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200922073939.GA3994831@ulmo>
References: <20200921121628.3954746-1-thierry.reding@gmail.com> <20200921121842.GQ3950626@ulmo> <160072205823.4188128.2973025738875931354@swboyd.mtv.corp.google.com> <20200922073939.GA3994831@ulmo>
Subject: Re: [GIT PULL] clk: tegra: Changes for v5.10-rc1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
To:     Thierry Reding <thierry.reding@gmail.com>
Date:   Tue, 22 Sep 2020 12:08:45 -0700
Message-ID: <160080172593.310579.8671366820158880157@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2020-09-22 00:39:39)
> On Mon, Sep 21, 2020 at 02:00:58PM -0700, Stephen Boyd wrote:
> > Quoting Thierry Reding (2020-09-21 05:18:42)
> > > On Mon, Sep 21, 2020 at 02:16:28PM +0200, Thierry Reding wrote:
> > > > Hi Mike, Stephen,
> > > >=20
> > > > The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c=
2f80bbf5:
> > > >=20
> > > >   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
> > > >=20
> > > > are available in the Git repository at:
> > > >=20
> > > >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tag=
s/for-5.10-clk
> > > >=20
> > > > for you to fetch changes up to 2f878d04218c8b26f6d0ab26955ca6b03848=
a1ad:
> > > >=20
> > > >   clk: tegra: Fix missing prototype for tegra210_clk_register_emc()=
 (2020-09-21 14:09:10 +0200)
> > > >=20
> > > > Thanks,
> > > > Thierry
> > > >=20
> > > > ----------------------------------------------------------------
> > > > clk: tegra: Changes for v5.10-rc1
> > > >=20
> > > > This is a set of small fixes for the Tegra clock driver.
> > > >=20
> > > > ----------------------------------------------------------------
> > > > Thierry Reding (3):
> > > >       clk: tegra: Capitalization fixes
> > > >       clk: tegra: Always program PLL_E when enabled
> > > >       clk: tegra: Fix missing prototype for tegra210_clk_register_e=
mc()
> > > >=20
> > > >  drivers/clk/tegra/clk-pll.c          | 7 ++-----
> > > >  drivers/clk/tegra/clk-tegra210-emc.c | 2 ++
> > > >  2 files changed, 4 insertions(+), 5 deletions(-)
> > >=20
> > > I just realized after sending this out that this is all really tiny a=
nd
> > > minor fixes, so perhaps it makes sense to even apply this for v5.9?
> > >=20
> >=20
> > Is something critical? If so then it's OK to merge for v5.9, otherwise
> > I'd rather let it cook in -next for a while. Being small doesn't really
> > make a difference here. What matters is that it fixes some critical
> > problem, preferably introduced this merge window but if it's annoying
> > enough that rule can be broken.
>=20
> This is actually a subset of a set of patches that I had sitting on a
> for-5.9/clk branch but for which I forgot to send a pull request. This
> was pointed out to me on IRC yesterday. So this should already be soft-
> boiled.
>=20
> The first patch is just a tiny bit of cleanup, but the second patch
> fixes a real problem with SATA that can happen depending on how the
> bootloader has set up the PLL_E. The third patch fixes a build
> warning, which admittedly isn't critical, but certainly nice to have.
> Given that the latter two are the only known issues with the clock
> driver I think it would be nice to have them in v5.9, especially since
> that's going to be an LTS and we'll end up back-porting at least two of
> these patches to it anyway.
>=20

Ok. Is the bootloader problem happening right now?
