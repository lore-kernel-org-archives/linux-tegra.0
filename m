Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04011C433E0
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 19:28:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1FBF64E3E
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 19:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233327AbhBERpj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 Feb 2021 12:45:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:56522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232889AbhBERnb (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 5 Feb 2021 12:43:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B46764E2E;
        Fri,  5 Feb 2021 19:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612553113;
        bh=slBMzILp9QgXeNYRnY8ojvq0IafhxVVhPZ1aE5vU+Kc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OxHxDOIgvp3x8FVmE9kU1x7oe2zAFmrx8UskZnRa7Sz+btX8Qjxvug4SpUWoXH4rW
         rkRb8c3XNTvSfb+xXyPW3LgdPzda7JAVTqxepJ2ohReRhIqML8R0711TioSOXpHxH2
         9A+i5cx6jSysjyLvACKhZThkDYxzM6VpXd868q25/XiqVgZNM6Ilf+AJgpe+dZQFhI
         yaya6ALMw22278pArjmoCLRwUSBcAguAyhzuOMnpD9THg3s49Xr+OpgBcTx7HNFqCJ
         ptlAwQtkOHabiS58p88EBnUlOuRwlEgPaKFLWkKK0qlknRpTFtoTh8kZ/APHLdQnt2
         KoOsyeLgKNaLQ==
Date:   Fri, 5 Feb 2021 19:24:24 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Sameer Pujar <spujar@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        sharadg@nvidia.com
Subject: Re: [PATCH v2 0/3] Rename audio graph export functions
Message-ID: <20210205192424.GK4720@sirena.org.uk>
References: <1612446612-32613-1-git-send-email-spujar@nvidia.com>
 <875z37scr8.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NqNl6FRZtoRUn5bW"
Content-Disposition: inline
In-Reply-To: <875z37scr8.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--NqNl6FRZtoRUn5bW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 05, 2021 at 07:20:42AM +0900, Kuninori Morimoto wrote:

> > This series renames exported functions from audio graph for a better
> > global visibility. In doing so update the references in audio graph
> > and Tegra audio graph card drivers.

> I guess [1/3] and [2/3] should be merged/squashed ?
> Otherwise, there is git-bisect error.

Yes, and I'll complain because I have automation to test every patch
individually!  Otherwise this does look fine to me too.

--NqNl6FRZtoRUn5bW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAdm2cACgkQJNaLcl1U
h9Cjjgf/YHn+MjPCdow32NDrJsA500L+9pHXNUNT68r7wTkbBQbkR5vVW2x+xnCW
IpI5PWFNS1ziAIAuxc6hWVK4VDVA5PVQkoEw/RQXoC7JbproJ6+6QHuFi1ZpZ2Hq
Q1UoSu82H0g4gx86WqsyqN0sJHIMptniLFQvk830RnDA28iX+N/IXsIh1QBArkZm
0A1lu77XKKGNFLcOt8xSyXA94aEvAzZYltWROVgdSAOK8e1eAX75ocgeI/uj+eiY
/yoD6PECteaO6iJLirDAEy5DS/vIW6HBHcIqutdNYc6Z8qrIHWGXqKOJgDQtmvvl
Rdqyg7VPac3KKd/kcCRjNq/Hi3dbZQ==
=y6/g
-----END PGP SIGNATURE-----

--NqNl6FRZtoRUn5bW--
