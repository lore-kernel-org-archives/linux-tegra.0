Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363BEC43381
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Feb 2021 17:04:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E83BF64F86
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Feb 2021 17:04:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237175AbhBBREg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Feb 2021 12:04:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:38608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237143AbhBBRCR (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 2 Feb 2021 12:02:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 920B464E08;
        Tue,  2 Feb 2021 17:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612285297;
        bh=2fSQyZ1WwQMOhHMDn+OXb0hQdFVNjom2QI2jlsjZH+c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hBnSneqPCbcn4MDYUjXnlwCTeaC/3qf7ky/i9cIkSa2sLWIm9llZQeOlDCOjtvew1
         uz+qMMCmkOpFnamO0juf94Lm4quU+vhWHoOJ4r6CN3z0A9RrRFcovtAzWXWLjOPqh0
         /s7VHQmP61+1iinWR+nN07sVuP4nyxEq3daoUQ7POdgIfTUx4CSspCN2l5Y6NGBK2V
         UrCOLGGlKA/HXW4Uetqk4wuZ1jB/jDisIp4trWiXLXzK+RjF4SLQt2SZ+9kIW11J6C
         GV1moa9zw0lW5M1oI0yfkzkQTJjPNP+yQbkt8H/OcdFjZt0Mg1eChqehOsqmnvetYf
         n4bVXEPOsApRg==
Date:   Tue, 2 Feb 2021 17:00:49 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Ion Agorria <AG0RRIA@yahoo.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Stephen Warren <swarren@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ion Agorria <ion@agorria.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Add RT5631 machine driver
Message-ID: <20210202170049.GE5154@sirena.org.uk>
References: <20210131184101.651486-1-AG0RRIA@yahoo.com>
 <20210131184101.651486-3-AG0RRIA@yahoo.com>
 <7f4eb8f7-215e-ab3d-fcef-9243037cf246@nvidia.com>
 <8d0bc6f3-45ce-565d-d80f-b50fb75e7c55@gmail.com>
 <51571ec9-780b-ba71-c81d-dd01ebcefbb8@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Content-Disposition: inline
In-Reply-To: <51571ec9-780b-ba71-c81d-dd01ebcefbb8@nvidia.com>
X-Cookie: Only God can make random selections.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 02, 2021 at 04:24:31PM +0000, Jon Hunter wrote:
> On 02/02/2021 15:25, Dmitry Osipenko wrote:

> > These codecs require individual configurations and those
> > "../codecs/rt5631.h" and  "../codecs/rt5677.h" aren't compatible at a
> > quick glance.

> Right but not all of that is needed. What is actually needed from the
> header files?

Right, and if it's just a case of having a different hw_params() or
something then the majority of the driver could be shared with just a
few bits being handled differently.

> > The tegra_rt5677 also uses outdated GPIO API and etc. Hence the new
> > driver should be a better base anyways.

> Sounds like a good time to update it :-)

Yeah.

> > Overall it shouldn't worth time and effort trying to squeeze these
> > drivers into a single one, IMO.

> Not sure I agree when these drivers appear to be 90% the same.

It's certainly worth considering - given that it's the same silicon
vendor working with the same SoC vendor's reference designs it seems
likely that things will look pretty similar at the system integration
level.  It's possible that it's more trouble than it's worth but it'd be
good to have a more concrete understanding of why.

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAZhUAACgkQJNaLcl1U
h9Br/AgAhxDJhXD92Ou/rbXrbVCd+giU1RLOL08mfRERugF5Ne5z4JmWhbHxgh17
iNAtHsuofQ+vFiHBD+gyGdKDpcJPI1PBoVFmU480078igsYqvZnPaZ6zwdhoRKOf
D9Sp1czdSfnNiIR+Ug8y5yjnsTUt/c4qCfjZWa/vvGuw8VQ6hALooYvAnkrZoFZi
VEKHvYgNgUOqRnIOqdPg5NVqX0dEndIpIQcN+3kV5Yu0xwdi9EFv2dSXp29kye8w
PPdeIP3YTwr9g/AuTKRuSABzvWjVIacsMBfN1osWjX4PflCz96f0lBtqvhJi4qEV
4OE3cy3Aen4lJJXG13rcFEESBokpzA==
=6RSX
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--
