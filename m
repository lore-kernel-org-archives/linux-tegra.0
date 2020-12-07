Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65FDC0018C
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Dec 2020 12:32:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81790233F7
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Dec 2020 12:32:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgLGMcS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Dec 2020 07:32:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:47524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726851AbgLGMcS (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 7 Dec 2020 07:32:18 -0500
Date:   Mon, 7 Dec 2020 12:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607344298;
        bh=ulIWSf4fu0+15UAYDWnox9feOF++im/0KyFh/WPgyL8=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=WGKKjDz4bvE/H1goWqMdH74Vdm9C+N+78Q8HLgaCX+L91VkwYRKARNpCtSkM4H74M
         jh/DtsrNfJXeZUF/RUbvq+/GQdVFD7QaqjP2zUSS2DOJkweCqBbXw8WlBtZVMKmewn
         F5p4h6Vs0Bi6qhRvxOeOHjwWMvdR7R5mWiWI7r/T4dKqMOzVQS6NIEbdAC4mbwEqHs
         4afPuls5Efdf/ngfEa2IZKA3v8MKCHHVo42X7+9INGwtzvirwsJ0KM8o5q7LK9A1yC
         cvMwvje+8xslOTIhZ1C9WuPwggAPp596Szi2RWi6g5QVts/R1pqQTZhKVjU3UgN/q2
         eIgGqsCrdkEJA==
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     thierry.reding@gmail.com, robh+dt@kernel.org, sharadg@nvidia.com,
        jonathanh@nvidia.com, kuninori.morimoto.gx@renesas.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v6 0/6] Tegra210 audio graph card
Message-ID: <20201207123131.GB5694@sirena.org.uk>
References: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
 <160683107678.35139.14772386553150233276.b4-ty@kernel.org>
 <a3541d83-1f2e-c60f-05f8-4fdd8c8f4175@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline
In-Reply-To: <a3541d83-1f2e-c60f-05f8-4fdd8c8f4175@nvidia.com>
X-Cookie: Absinthe makes the tart grow fonder.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 07, 2020 at 10:22:38AM +0530, Sameer Pujar wrote:

> > [1/3] ASoC: dt-bindings: tegra: Add graph bindings
> >        (no commit info)
> > [2/3] ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card
> >        (no commit info)
> > [3/3] ASoC: tegra: Add audio graph based card driver
> >        (no commit info)

> I don't see above patches in linux-next yet. Should I wait some more time
> for this to appear?

No, this was sent by a b4 bug - notice the "no commit info" there, they
weren't applied.

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/OIKMACgkQJNaLcl1U
h9Bergf/R2n7B5AV+c3qA138O8l+XMSdm7bZ8noJM7ZoaPj/A1jX9Br56e38tOjq
QfofOwv/rAGQG82FVgB9rPGHZRFzz3kvQwb35JO1eQV+TLbSOnGkYFpC28buXymj
SGYm9ncc7OeN30WV4e3NymMTcOFe8ggwR05zMzc6amXV2163NQl1sN64tlkKbFSA
yAcctZJeDD5B3TlcILu+yZp5SidHHV7gdk57QDd+A3Ut6sggbj9EBcQamZsKUmkJ
LwQPdeqesq/WJqs33a3sFL1xDXMLwISR7isCX/6CRO1cd6evcivRf+Wmcgr7k0MJ
6yR+VP1OIr+ecpxbGAm4CMYD++Cntw==
=r0dO
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
