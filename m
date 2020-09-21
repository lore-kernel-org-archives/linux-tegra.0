Return-Path: <SRS0=KKuN=C6=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9702C46466
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 21:01:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 676F623119
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 21:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600722060;
	bh=QTSjmgKEpHfqPNdXGiSsDM8vEUtCR/VOxnF+n7VVrLk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=XkN1wC5lBHDibN9C6uPRC5mox8i9uSPDDDY7F8lPK4FHi9ybVOtEQu5loA5acV2+V
	 PTekYmPz9hnLYKTUkuia4YXhNfNzsDBLcCvWWyy0i4w5FNpX9FlbdFKskU8pVJE6tG
	 BBIlE3CuvAMe/e5l/ssAL1k1t59ckK2ZwE9ImHRo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgIUVBA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Sep 2020 17:01:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:36070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726471AbgIUVA7 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Sep 2020 17:00:59 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 69A3A207BC;
        Mon, 21 Sep 2020 21:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600722059;
        bh=QTSjmgKEpHfqPNdXGiSsDM8vEUtCR/VOxnF+n7VVrLk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SnN/ULS3NF2I6Eg0HYkCPCbOnpqNGZpgFaVImSVJeeUdtS+YtA241P1ZSfGaK3SLd
         egmsm4Ve5JzIPMN1hqRO6QbGIdy4eejS3qnninJy9Ft4D0QP0nIrmMuhFwi+s/ACw2
         nymsWC52qpuTEtsbjts2KxybPTe4655pmUFQTmFU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200921121842.GQ3950626@ulmo>
References: <20200921121628.3954746-1-thierry.reding@gmail.com> <20200921121842.GQ3950626@ulmo>
Subject: Re: [GIT PULL] clk: tegra: Changes for v5.10-rc1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Mon, 21 Sep 2020 14:00:58 -0700
Message-ID: <160072205823.4188128.2973025738875931354@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2020-09-21 05:18:42)
> On Mon, Sep 21, 2020 at 02:16:28PM +0200, Thierry Reding wrote:
> > Hi Mike, Stephen,
> >=20
> > The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80=
bbf5:
> >=20
> >   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/fo=
r-5.10-clk
> >=20
> > for you to fetch changes up to 2f878d04218c8b26f6d0ab26955ca6b03848a1ad:
> >=20
> >   clk: tegra: Fix missing prototype for tegra210_clk_register_emc() (20=
20-09-21 14:09:10 +0200)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > clk: tegra: Changes for v5.10-rc1
> >=20
> > This is a set of small fixes for the Tegra clock driver.
> >=20
> > ----------------------------------------------------------------
> > Thierry Reding (3):
> >       clk: tegra: Capitalization fixes
> >       clk: tegra: Always program PLL_E when enabled
> >       clk: tegra: Fix missing prototype for tegra210_clk_register_emc()
> >=20
> >  drivers/clk/tegra/clk-pll.c          | 7 ++-----
> >  drivers/clk/tegra/clk-tegra210-emc.c | 2 ++
> >  2 files changed, 4 insertions(+), 5 deletions(-)
>=20
> I just realized after sending this out that this is all really tiny and
> minor fixes, so perhaps it makes sense to even apply this for v5.9?
>=20

Is something critical? If so then it's OK to merge for v5.9, otherwise
I'd rather let it cook in -next for a while. Being small doesn't really
make a difference here. What matters is that it fixes some critical
problem, preferably introduced this merge window but if it's annoying
enough that rule can be broken.
