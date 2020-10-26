Return-Path: <SRS0=h/hb=EB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F75EC4363A
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Oct 2020 12:06:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CD8922284
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Oct 2020 12:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603713999;
	bh=k/lA6Dkda+6vd6SRahMsDzJ+uJdsADh3oKw7p28hhps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=K4jTNTlXejZtMbGTtieu8ulebnlLSzZy8NJfYLtLKf4GUwit8LnQerbJbOem1MTQV
	 XUdDDILGNG4JdueCadszSBkiIPFDh4p2biMLa2Xzb2bx3Ev9WKC9f2x3L/JaXJg6pu
	 7OgbLbYSxQ01c2Dqb6KUzo8Z7Anxb8+VsUYOIlmY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1774717AbgJZMGi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Oct 2020 08:06:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:47926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1772859AbgJZMGi (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Oct 2020 08:06:38 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6044E22281;
        Mon, 26 Oct 2020 12:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603713997;
        bh=k/lA6Dkda+6vd6SRahMsDzJ+uJdsADh3oKw7p28hhps=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=akE2NGKii2ZnovqzsJkTwwqEs2qwcaC50pS828uzpgJDyQpFoaTuGLPyhs00oV2tD
         ta59UUokKoDcKKRS040UbeWrbwuHxv7hFreIPZzg6qy6kJ1n4iFf/fkR4EWZ6w/F/g
         IJJrnZkMoK+r+LUOS1bzd6IVRE0AcFFcoJiuoN3g=
Date:   Mon, 26 Oct 2020 12:06:33 +0000
From:   Mark Brown <broonie@kernel.org>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Stephen Warren <swarren@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [RESEND v2] ASoC: tegra20-spdif: remove "default m"
Message-ID: <20201026120633.GA7402@sirena.org.uk>
References: <e6e89abff9004e8ed2e79a9ccf1377eeac9e4134.1603542719.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
In-Reply-To: <e6e89abff9004e8ed2e79a9ccf1377eeac9e4134.1603542719.git.mirq-linux@rere.qmqm.pl>
X-Cookie: Safety Third.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2020 at 02:34:14PM +0200, Micha=C5=82 Miros=C5=82aw wrote:
> Make tegra20-spdif default to N as all other drivers do.
> Add the selection to defconfigs instead.

Please send defconfig updates as separate patches, they are merged via
arm-soc.

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+Wu8UACgkQJNaLcl1U
h9BsEQf/bJ8JpSs01wcZxMpvZJtL2CZcnbcK2LRCO/xTGEM1bQa9z/NzruQ83TDf
3Mfn8UafejS24D1FYRylHRGvxPQb4fJmkINXRT/qGar1cgDKW3V+l53/o5WMuwwR
44qb4iTj1KaN0lZKR0D9u8aviRxqN2nmVWX1bjDxoqFLSSeQMqmUio0ovqsRf9WQ
RuPKzsNoXlL9xM/kfjtRgTM1/4uyhy2pHuCnH4EFDV8QJC1CVEyhVqNnu4+z+v/X
FV/CpiBbMR64UanqL56ehez0qeS8s4uobivn/MjkeNKchQF+ZFeB7cZlJVRq16XX
OECo4aEGG/F0a3Pwa4c6L05BRLts0A==
=jdIz
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
