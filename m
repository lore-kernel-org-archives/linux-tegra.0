Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDB1C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 16:53:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E761064FC3
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 16:53:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhCJQwm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Mar 2021 11:52:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:40928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230147AbhCJQwK (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Mar 2021 11:52:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8B7B64FC3;
        Wed, 10 Mar 2021 16:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615395130;
        bh=fblKNntOKs+r+Hk8T8EVXTYLBjqZfnQB55Ec28BK85w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UiJhmR9Msd4dJcCAI3JQh5cFCa2RPKi+AAUyhajhmxZx/fdhIvPQvMtRG2/3fHHc9
         HqqPR1e1v/DoDIvPFXMiv+G1I1U3bg8GJtKw7Zz5VCHEByz1fZ8H8zLcuxYRH0m3x+
         DU97IXKJGEJxqgmuP1L7UH6zXbKycS2INQ8lm0DL45TiZe/Wo2tHL65iyN6M099JgS
         W1PdxgMnGZBeBES6UvyxgihEtG6h4Xc457fEisSdpRG/Zy4SPIZB/R/Wj1eg6FfafE
         dxUrzuF28JcgGb+BZem0wdPYmtjrQGjeky8kLhVVAtcNVcrJ0Fq0mfz9PHjeNQ+rxc
         +4KyBWZhgC5nQ==
Date:   Wed, 10 Mar 2021 16:50:58 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        Bard liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
Message-ID: <20210310165058.GC28564@sirena.org.uk>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
 <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
 <20210310133534.GD4746@sirena.org.uk>
 <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
 <20210310161814.GA28564@sirena.org.uk>
 <s5hzgzbvube.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline
In-Reply-To: <s5hzgzbvube.wl-tiwai@suse.de>
X-Cookie: Yow!  Are we laid back yet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 10, 2021 at 05:37:25PM +0100, Takashi Iwai wrote:
> Mark Brown wrote:

> > > did you mean if (!IS_ENABLED(CONFIG_ACPI)) ?

> > Is there a runtime check?

> Well, basically both DMI and ACPI are completely different things, so
> I don't think it's right to check the availability of ACPI as a signal
> of the availability of DMI.

In theory they are only somewhat related, but in practice they're both
part of a holistic system model - ACPI users complain if their system
does not also provide DMI information.

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBI+PEACgkQJNaLcl1U
h9AKhwf/TqggBJ9cnL1UX9G9mZNlGaHbKXQez9oZGubvZ8Ejuhu4f1AUQyMXtX97
N7xUBWv6Tk+rVC3eq7ocQki9aEDHy2mSp7Lraw2/7k3Y94C54oO43n5hOzPiJxhk
VoBOVYEGgC1YHuG9Jyulpq7Q6ERCJTT0cxdLVlrgMosofWkw0osp2UGcCCST8Kjt
tRM6ayTyRWhtIJX62WDKFdzV8EBodR2E8h1WA7kMb5yD0N4fxZEXhdWRPBk7DjMU
YvSFWtTsKQMP2cTRTtxSI5q3QfBOGcx069FteBw40uMkCBdYGq3Eieb8wRnQ3Ip3
K1On2WnwhEx9MDLvlqzkRqvM/X6kGQ==
=7qIj
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
