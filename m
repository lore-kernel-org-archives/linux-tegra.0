Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2953C433E9
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Feb 2021 17:26:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 632DC64FA2
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Feb 2021 17:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhBCRZ4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Feb 2021 12:25:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:47570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232116AbhBCRZo (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 3 Feb 2021 12:25:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B16764F68;
        Wed,  3 Feb 2021 17:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612373104;
        bh=/yhI2spPcVGMBVmOZvUkwECDxBhVNdZcA9Cpql60alQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q5Psc9RErW69hu2Tr1n6s+KkTUj4xSf0zHcNvDJdxOyrw2F+Ipb905Dw68xwg+Dgc
         MEV6TVp32DMji47F1WpFteX8ZGBp1IGmR618GmlHPSrzDCYEkiftCGGJrSv0G27gN7
         A9QHaPGatDcFj+TvMcu19I/IEb+Ir6zRkuXUSgJScgaIbS7pKL2C4Er1G4c8vTrC9n
         C676XaaTFguU4XtUWtn1fWuiVSmw7RVsZLByOKsuwhkjiMv6hUC9GE1BC/lZv6ao8y
         ZhTt2fUOJ/l3dIieaH9J1oc9yMqPzu1Y5ctN9/LaFRZw+387zMPWzuow+pTOPdr8EX
         tehoZ7/GrxRSg==
Date:   Wed, 3 Feb 2021 17:24:15 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        sharadg@nvidia.com
Subject: Re: Re: [PATCH 1/2] ASoC: audio-graph: Export graph_remove() function
Message-ID: <20210203172415.GH4880@sirena.org.uk>
References: <1612368575-25991-1-git-send-email-spujar@nvidia.com>
 <1612368575-25991-2-git-send-email-spujar@nvidia.com>
 <20210203161951.GG4880@sirena.org.uk>
 <64b65aaf-9971-e071-5d52-02286fe0cacc@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZYOWEO2dMm2Af3e3"
Content-Disposition: inline
In-Reply-To: <64b65aaf-9971-e071-5d52-02286fe0cacc@nvidia.com>
X-Cookie: Who was that masked man?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ZYOWEO2dMm2Af3e3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 03, 2021 at 10:09:01PM +0530, Sameer Pujar wrote:
> On 2/3/2021 9:49 PM, Mark Brown wrote:
> > On Wed, Feb 03, 2021 at 09:39:34PM +0530, Sameer Pujar wrote:

> > > +int graph_remove(struct platform_device *pdev);

> > I think this needs better namespacing if it's going to be exported.

> audio_graph_remove() can be a better choice?

Yeah, that looks reasonable.

--ZYOWEO2dMm2Af3e3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAa3D8ACgkQJNaLcl1U
h9DgsQf9GzN3MtpiKxC9z9VC6D/VDCcjNVKfBH4n8AsORm22h3JUl7Y5j1VQE1aO
feY09SDZ/Xyfu868hB3PC2NhljwRUkkA0s8gnCTMvgprT08OjHZDqzi0nQd2Z0BH
2V5vO7RgGB0jFXEWwIvFM0AqtcufWjUUDKnlbVGSi/rbOrQCiT6zoUC3BJmGmQLP
DVPeklIGLqLzbwu+OkWzp0ZImxtonyE07PDnuek2MaH/41HoBRbPRrzfgREgzTt3
+QSL8GQecG+2Ia0+4LnCy7g528weLNEFB7HDBtqx4SGMct1lD7xhWTPM89sxNq65
fIRzGZOE8p1RYsstGe04kKxpHBxB4g==
=qMSx
-----END PGP SIGNATURE-----

--ZYOWEO2dMm2Af3e3--
