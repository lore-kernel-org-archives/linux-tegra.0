Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17357C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Nov 2021 13:20:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355306AbhKYNXc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Nov 2021 08:23:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:49902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345435AbhKYNVc (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Nov 2021 08:21:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79F5660FDA;
        Thu, 25 Nov 2021 13:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637846301;
        bh=G4Ukn/b5c1T+AuSM1FTdqCvx9jCZBV2FLRjFUs53/W0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QU42zxeh/pKtlyvxJo4mEs9HvKp4fpDMi/rlFIO0nkdJX4aY7JWw4v7gXTRNRTPdZ
         y3XigqZtABLGhjrT8JMCVtDH5GrHUytHGriHuRnGo4haiHB4pSHut/p4+UkQ1rnpTw
         T2tQZhpyyx//Sec5g6mXz5B3Zhm8yR+Ri4OU/C/+fQd/rDetGee6pAJkjP4zmmNgOr
         w4K0uSdmJU+xkrfm7bLyHtTPYHhAWxIzTpRckI7LBHQdlBt5HyrkB70BSNQhZ2S0lv
         E3cT0XIEBeo6+9NZeOIg51yeaIK34IP+yDsLRmZfozFPvHbKP9QfEGoaPAezAnzCrs
         8taMzHLBPptTw==
Date:   Thu, 25 Nov 2021 13:18:15 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>,
        linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 07/20] ASoC: tegra20: spdif: Set FIFO trigger level
Message-ID: <YZ+NF8zHqGYfL9eF@sirena.org.uk>
References: <20211124220057.15763-1-digetx@gmail.com>
 <20211124220057.15763-8-digetx@gmail.com>
 <YZ97Qo500CrSmhXu@sirena.org.uk>
 <5670741a-1517-fc64-e390-b01c53947f25@gmail.com>
 <YZ+BZRB0sUC08lCs@sirena.org.uk>
 <d0748829-5f42-2ab3-5620-6949b4139e59@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Yc4PA3Fb6bymYqMX"
Content-Disposition: inline
In-Reply-To: <d0748829-5f42-2ab3-5620-6949b4139e59@gmail.com>
X-Cookie: This bag is recyclable.
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Yc4PA3Fb6bymYqMX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 03:53:52PM +0300, Dmitry Osipenko wrote:
> 25.11.2021 15:28, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Nov 25, 2021 at 03:04:35PM +0300, Dmitry Osipenko wrote:

> >> This driver never worked before this patchset, hence there is nothing =
to
> >> backport, this is explained in the cover letter. But in general you're
> >> correct.

> > That's not going to stop the stable people backporting things, and I'd
> > guess it might've worked at some point on some systems - I'm not seeing
> > anything that jumps out as making the driver completely unworkable in
> > your patches.

> I can change commit message with the "fix" word removed, this should
> prevent patch from backporting.

I wouldn't count on it TBH.  In any case, definitely no need to resend
for this alone.

> This driver never worked in mainline because S/PDIF device was never
> created, thus driver was never bound. Driver doesn't work properly
> without this patch. Nobody used this driver as-is before this patchset.

Someone might've been using it with an out of tree board file, I guess
on an older stable at this point.

--Yc4PA3Fb6bymYqMX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGfjRYACgkQJNaLcl1U
h9Bx7wf+IH0uFtFw8XHJBygQQZfPIGC/I0RKdNAOdzI5gNPtsLXskguJJdKyxKRr
//4+NF79CccUZr3163B2pMRwNqHF72DDGcpk2C6xqUq9Z8pCcbcBP5leFuPWBZKr
UWMp3+y6k/Jvg9fNxUOzTBd2LC8YO6c3kXmeaL1yob/Lch3IijEhueWwXfvASZ9W
VMJLN6hckmC8yYHp9crlVauWckl3jciIbcG4D5O48JYzjMhSmS4zOi164iHGHjcI
EbNgU+BoqEjA2IryHrCzFgPXOQsPpeb+7EVcAuqYDGehbdqaYsBPFKVxMmMuXuci
L706uuk1oJWwtN2l2JR5WlrCLVYkwg==
=PgTE
-----END PGP SIGNATURE-----

--Yc4PA3Fb6bymYqMX--
