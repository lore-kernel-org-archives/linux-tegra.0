Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AE3C433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 16:06:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 594F464FE7
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 16:06:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234348AbhCKQCT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 11:02:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:48626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234418AbhCKQCQ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 11:02:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 402CA64FDD;
        Thu, 11 Mar 2021 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615478525;
        bh=k5Mt9Qg9aBLbjUdebuqcA0/O+qs6ydLJzvh3zLJ9niA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=asvfWEmRsr+DqDZNyr2S+UZNW58YvwhqdM66MSke1wE6gY3SsOw3zraq7u+bjslnB
         8hZT7z/PEmV5nT7/PXtFhqDTS4IWH1tMMnl7Raz9XSFsc/nN1qu5zeEy5DQY5ardn9
         gm3a/tSCbRbEnkDFD3x20EXp1YiUlebjGo+3c2DrmVXGC6NBvIfoXNKTgQ8iDgrLsP
         WPTGMzlSUc1KNxK27EX7j5L9K1Iix0nUaVD2hgwu8YMPqXbEvKoeOjUPz33zWpweAe
         Wb2iQ4F8Q298TbIygnWKpPEQS+VuVL5xw+DQbsi0aYAwgKyHlHJLicrGcq/gWl5k3/
         46eigJX9Epi5A==
Date:   Thu, 11 Mar 2021 16:00:52 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Michael Walle <michael@walle.cc>
Cc:     spujar@nvidia.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, robh@kernel.org, sharadg@nvidia.com,
        thierry.reding@gmail.com
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
Message-ID: <20210311160052.GF4962@sirena.org.uk>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eDB11BtaWSyaBkpc"
Content-Disposition: inline
In-Reply-To: <20210309144156.18887-1-michael@walle.cc>
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--eDB11BtaWSyaBkpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2021 at 03:41:56PM +0100, Michael Walle wrote:
> Hi,
>=20
> > If "clocks =3D <&xxx>" is specified from the CPU or Codec component
> > device node, the clock is not getting enabled. Thus audio playback
> > or capture fails.

> This actually breaks sound on my board
> (arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts).

Please, when sending replies format the subject line like normal replies
with a "Re: " at the start so people can tell it's a reply to an
existing discussion and not a new patch.

--eDB11BtaWSyaBkpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBKPrQACgkQJNaLcl1U
h9Bz8wf/TDlUuWpXDfOMG5KASnW4G2LE4KydQVmKQgJJQ9RT3sRl9JYT7iCFpfVx
nROTNxkE6gbvTO8YCwzPOKPqDgTM5GvWjxAgoxAEDf0Zw6RnoWeBxDxp5IeahvRG
e0i0dlSczfB1KOytXcjTSg1l6HMl41kUpsS8mTuEuIQv23rGbLfykAsXFHxvIbIt
y0sZUgwflgw0dC8CtUObQWnYnepiUvCYoCXwv66lvIW7nnLu+gIPjjAlB3SOZDrc
yM9sBXsvhLSAmKiGL3FcvqDV401wrMG2poryA9BHvAH50rVdHgyiaxSEOJWn1weF
AmzzM+gHNpzb5iWKDYON4aX0ZEh+OA==
=z+cv
-----END PGP SIGNATURE-----

--eDB11BtaWSyaBkpc--
