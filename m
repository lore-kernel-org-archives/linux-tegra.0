Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B03EC433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 18:18:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4602E64FB3
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 18:18:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbhCJSRe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Mar 2021 13:17:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:36682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233679AbhCJSRZ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Mar 2021 13:17:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 066D564DC4;
        Wed, 10 Mar 2021 18:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615400244;
        bh=seX8IHJ8PXMUIRxGxRB5hNS0RqETp5JirlEF/xT6KjY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hcCOJA3udo3Mgm3NqixPmgYiFXxPg0m3SKW6TtBCx+zFNLB5iBWqXECCQvI4FsBNW
         nMtqzstKw2DDsGCBkVMDtOhDLFoon2gpixwHm+UuanSzFlecBEHt9xS+kH/bM1Y76f
         2cJMcZuOW0OmqmZdKlgj2odBWupbStSQrpdBSVcVJntM17Hh+Ixp9lgGpV44yJCfjJ
         cGgj21wTcBYc05AbrNrbMGs+097PD+4xcNPtOkGPPl7omM+18OolZO/UMiaH9HWae0
         CRvtU4j2a6jObwLc42QU/MyOMfwthRp5uu2wPVgAJ+W3noJSZQsLvngNaWGDiAzceO
         Cz1rAxazj1ttA==
Date:   Wed, 10 Mar 2021 18:16:11 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        Bard liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
Message-ID: <20210310181611.GE28564@sirena.org.uk>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
 <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
 <20210310133534.GD4746@sirena.org.uk>
 <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
 <20210310161814.GA28564@sirena.org.uk>
 <s5hzgzbvube.wl-tiwai@suse.de>
 <9b073d01-f2fe-a99b-e53c-4a0b3f95ca05@linux.intel.com>
 <20210310165235.GD28564@sirena.org.uk>
 <cf03ce61-1501-e0e7-6887-d921c7d1af62@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TD8GDToEDw0WLGOL"
Content-Disposition: inline
In-Reply-To: <cf03ce61-1501-e0e7-6887-d921c7d1af62@linux.intel.com>
X-Cookie: Yow!  Are we laid back yet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--TD8GDToEDw0WLGOL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 10, 2021 at 11:50:13AM -0600, Pierre-Louis Bossart wrote:
> On 3/10/21 10:52 AM, Mark Brown wrote:

> > Build time dependencies aren't going to help anything, arm64 (and to my
> > understanding some future x86 systems, LynxPoint IIRC) supports both DT
> > and ACPI and so you have kernels built with support for both.

> well, that's what I suggested initially:
>        if (is_of_node(card->dev->fwnode))

> I used the of_node test as a proxy for 'no DMI' since I am not aware of any
> means to detect if DMI is enabled at run-time.

Can we not fix the DMI code so it lets us check dmi_available either
directly or with an accessor?  I don't understand why all the proposals
are dancing around local bodges here.

--TD8GDToEDw0WLGOL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBJDOoACgkQJNaLcl1U
h9D+lQf/cbnPJjsJ3ygPrp1tnP/Rp54Yib+fQFY62oCWapnvaBTHjolxWqtrddTO
wswX/BLf4uVVueVQ7AUTuaARx+aan0MAK1/xWU+lyeHcGk0fGy+mV9LFnhGUEEv5
Rke4xQJOwGazHSMb0IBGlfILV9cIJ+G7VTh5pLWvGMrFPT+yw1T35LacGOFwQFvX
gCCwqVqJ70jKVcKqD6BFb/YxsceAAmcp5UgzIs2+fa9UUVF5TxDxXO5EDKAh37Ru
0bedE12aOkCKMoS/UVosteXqppBn5If4QhZGZKojq38ueWyBxZ2Mg3/ZKhHPydgo
W+aXdVobyPhQPKWXhA9GZoFSVwoVAA==
=NWjC
-----END PGP SIGNATURE-----

--TD8GDToEDw0WLGOL--
