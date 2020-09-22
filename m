Return-Path: <SRS0=69DC=C7=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448E9C4727C
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Sep 2020 07:39:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E723D23A32
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Sep 2020 07:39:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GH/1YIVb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730066AbgIVHjn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Sep 2020 03:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729954AbgIVHjn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Sep 2020 03:39:43 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010F0C061755;
        Tue, 22 Sep 2020 00:39:43 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id r7so21368484ejs.11;
        Tue, 22 Sep 2020 00:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iNB02nMhO/yY3S3WrdWHbEn36nrUty39nxVbBmybPc8=;
        b=GH/1YIVb/RwRait0Z50dxTQFexs4w1fwnq6NzYFAXIJ87jgj9wJpzXNEvSd4LOKovJ
         D4lu5Gign6siYcwqZvIfCT+f1ZChkeLrfFmLovZxEFk0/lQpV/bY6R/WZyMx/Fp25Idr
         tzOXPPkGd/F8ywl+fHxlng9HSvmTv616eU8xqEkZmgCuEH9enGCbHimkXMEZPTz9TAJE
         498A0cqRqxh1lZBWlRnmGtFE1ARCqMXqiWG7VFMLD/cNwzzXhltbDA21o1MU+gdom4o9
         JXXnK8XUOtoZWnkprlHQUWYXcwGgIPH3PkZj1Vd3FYvCdcFVlvlHw1kUeH1QMVTMEa0H
         l6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iNB02nMhO/yY3S3WrdWHbEn36nrUty39nxVbBmybPc8=;
        b=LcFMM6UkliMWHifP4ga1BxSv5f19zsf181qtSNq3SiDWcDWHo3RWkcX2psWODR6Z7u
         wlhEkf8wscw/jTKkytJ7g/V4XYiEPiurQV89e+y4Ewbw9UCwTRvALKrEMhA0Ms1kT0vj
         DH/zPq62n/vMVoeRLW5OawuPnS1HqidGv8l46vVOkWEmzQ8rbjg5DRXwYg4fwdcgv/zw
         A/trt5cVc1dMJKb1KTQgJUB4pHLlofqJRACEHjVCDhaFnHy3AF9fG/AqhCbPk85Vz/CD
         dXn89rF7Sj7lPEYrHBOph/LbuT4VMCn3AnF347xPEYE2dan59UXriOBwhHmr6ZD4E/Uf
         +k0g==
X-Gm-Message-State: AOAM531xoCTkiESVcpV2CgASbLdLee5OU5jgYiZrFZ6LHTozqY+lKduD
        +omoWb/bMj5/0w97C76d0hDGeuN5ZtA=
X-Google-Smtp-Source: ABdhPJxNAQfwpUmcZcdaE8iolL+TMRo6yDI0pQHQslKRtbvdxivNTMXjNUpdr2kUR80nTK/gIVhMwg==
X-Received: by 2002:a17:907:432b:: with SMTP id ob19mr3564676ejb.400.1600760381612;
        Tue, 22 Sep 2020 00:39:41 -0700 (PDT)
Received: from localhost (pd9e51aa4.dip0.t-ipconnect.de. [217.229.26.164])
        by smtp.gmail.com with ESMTPSA id p12sm10784978ejb.42.2020.09.22.00.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 00:39:40 -0700 (PDT)
Date:   Tue, 22 Sep 2020 09:39:39 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL] clk: tegra: Changes for v5.10-rc1
Message-ID: <20200922073939.GA3994831@ulmo>
References: <20200921121628.3954746-1-thierry.reding@gmail.com>
 <20200921121842.GQ3950626@ulmo>
 <160072205823.4188128.2973025738875931354@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
In-Reply-To: <160072205823.4188128.2973025738875931354@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 02:00:58PM -0700, Stephen Boyd wrote:
> Quoting Thierry Reding (2020-09-21 05:18:42)
> > On Mon, Sep 21, 2020 at 02:16:28PM +0200, Thierry Reding wrote:
> > > Hi Mike, Stephen,
> > >=20
> > > The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f=
80bbf5:
> > >=20
> > >   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
> > >=20
> > > are available in the Git repository at:
> > >=20
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/=
for-5.10-clk
> > >=20
> > > for you to fetch changes up to 2f878d04218c8b26f6d0ab26955ca6b03848a1=
ad:
> > >=20
> > >   clk: tegra: Fix missing prototype for tegra210_clk_register_emc() (=
2020-09-21 14:09:10 +0200)
> > >=20
> > > Thanks,
> > > Thierry
> > >=20
> > > ----------------------------------------------------------------
> > > clk: tegra: Changes for v5.10-rc1
> > >=20
> > > This is a set of small fixes for the Tegra clock driver.
> > >=20
> > > ----------------------------------------------------------------
> > > Thierry Reding (3):
> > >       clk: tegra: Capitalization fixes
> > >       clk: tegra: Always program PLL_E when enabled
> > >       clk: tegra: Fix missing prototype for tegra210_clk_register_emc=
()
> > >=20
> > >  drivers/clk/tegra/clk-pll.c          | 7 ++-----
> > >  drivers/clk/tegra/clk-tegra210-emc.c | 2 ++
> > >  2 files changed, 4 insertions(+), 5 deletions(-)
> >=20
> > I just realized after sending this out that this is all really tiny and
> > minor fixes, so perhaps it makes sense to even apply this for v5.9?
> >=20
>=20
> Is something critical? If so then it's OK to merge for v5.9, otherwise
> I'd rather let it cook in -next for a while. Being small doesn't really
> make a difference here. What matters is that it fixes some critical
> problem, preferably introduced this merge window but if it's annoying
> enough that rule can be broken.

This is actually a subset of a set of patches that I had sitting on a
for-5.9/clk branch but for which I forgot to send a pull request. This
was pointed out to me on IRC yesterday. So this should already be soft-
boiled.

The first patch is just a tiny bit of cleanup, but the second patch
fixes a real problem with SATA that can happen depending on how the
bootloader has set up the PLL_E. The third patch fixes a build
warning, which admittedly isn't critical, but certainly nice to have.
Given that the latter two are the only known issues with the clock
driver I think it would be nice to have them in v5.9, especially since
that's going to be an LTS and we'll end up back-porting at least two of
these patches to it anyway.

Thierry

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9pqjkACgkQ3SOs138+
s6GmJQ//fnWhzFOGe3z9wN686sMGqACLkOBLlADl3u8Im1ELojq8IB/swUUJdYen
IMJZG6ZXRNPm0HWh7GWkzYYhsivbwvJpFtZUqgcGIvLb++iH8cMNR0RObN+iQ8Qs
5RBs8hU8oRXXOsQXsJ7HzUziQNDRhCy2Kd47VHzWnbEbVaNSDgBdmFgd3livmh1v
U2Igk8kWGWBZEnGArG2tRnYRWiHSfeu9UknTgjI4lPDi5diGDA1TI8QOOD8ZPo7V
OeyP/5Fbz4RX7MutIPCx5l/hZZyIiDbsqcYz0q+atDGHdW7QtL5X5p9+xfpKX1IG
sO9KuxPF7hW/sBK3OtnU/kW7S7rdpIlfNmwQ4CNvOAzoAZd5hi2Uicaj9G6KzICk
S3KEE3EzgtXgA7JiF90zC5pnWgv010vJqB31tlTEUmJCFMlTWEX6j7DHC4MQ/7C0
4H8cMo/6RRanD0Yp1hJuf3fqDnS+QH8lbsy6rLNHT9aGZIGHjvCaiPNFol1ek3ry
udhM4JUhRQH8qAQWwuGovWnUV6z2uYZv/JLeIVMqH42cikLNkrIqj9OcOj3qYkhv
P8MCBkmUb/jmkG7ZSLHwolgWTa7vQZkyTdZMcVxwWYkN+7SuOm8X7MHPjZlBSfBE
fIIlsTGLn8InGIaeoupXPOf1ISQ07KgDYc1ZLNLuardKTikiZEw=
=B6Rr
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
