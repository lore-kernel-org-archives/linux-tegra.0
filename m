Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479A1C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Sep 2021 18:14:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 241EE610E7
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Sep 2021 18:14:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350377AbhICSPA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 3 Sep 2021 14:15:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:50856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349959AbhICSO7 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 3 Sep 2021 14:14:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B4C160FDC;
        Fri,  3 Sep 2021 18:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630692839;
        bh=HV5QwvXd+G5X5BE1dhVVGio0bsaKoGZQ54JzrFuQYv0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lciq/IIhEguLoSiuOCa3XnH+5hiXq2Wu1ONakJhGocr7FJdzgxKE4kURLzk4xQ4VB
         Y8/2+KZQSSO3t43Lp8CWIXOzwuPAEnzEp2vJVnsbgEi2aPjZVuwCd+3SZs2hPscwZa
         XoXam/PdM0Bws8VmCfY0b8smn4vrsTBx72sfmECTcSE63UYe+gyPJmlF86RSY27gNs
         JUvcpfmIrjM1PBLHsUOdJLZZUhdNMntp/mgpfmeIbB/OjxuPFfJox82Rk4p6LgLOsN
         WSaPfB8bmkyKOiRk9tMp51gEu3vEPqTurOqCy2h4yWuvBCIdTJxEBp4HWECVcKIKQ4
         MCQw79usdNxrg==
Date:   Fri, 3 Sep 2021 19:13:26 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com,
        sharadg@nvidia.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/13] ASoC: tegra: Add Tegra210 based MVC driver
Message-ID: <20210903181326.GP4932@sirena.org.uk>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-7-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NDuspjMMC1Ui5ypn"
Content-Disposition: inline
In-Reply-To: <1630056839-6562-7-git-send-email-spujar@nvidia.com>
X-Cookie: Darth Vader sleeps with a Teddywookie.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--NDuspjMMC1Ui5ypn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 27, 2021 at 03:03:52PM +0530, Sameer Pujar wrote:
> The Master Volume Control (MVC) provides gain or attenuation to a digital
> signal path. It can be used in input or output signal path for per-stream
> volume control or it can be used as master volume control. The MVC block
> has one input and one output. The input digital stream can be mono or
> multi-channel (up to 7.1 channels) stream. An independent mute control is
> also included in the MVC block.

Looks like it's also got a little bit of other DSP in there (a simple
EQ?).  Not that it really matters.

> +	if (reg == TEGRA210_MVC_CTRL) {
> +		u32 val;
> +		u8 mute_mask;

> +	} else {
> +		u8 chan = (reg - TEGRA210_MVC_TARGET_VOL) / REG_SIZE;
> +		s32 val = mvc->volume[chan];

It's not clear to me why we're using the same callbacks for the volume
and mute settings - there's no shared code on the read path and only a
tiny bit on the write path.

> +	err |= regmap_update_bits(mvc->regmap, TEGRA210_MVC_SWITCH,
> +			TEGRA210_MVC_VOLUME_SWITCH_MASK,
> +			TEGRA210_MVC_VOLUME_SWITCH_TRIGGER);
> +
> +end:
> +	pm_runtime_put(cmpnt->dev);
> +	return err;
> +}

_put() should return 0 if there's no change or 1 for a change.

> +	/* SW reset */
> +	regmap_write(mvc->regmap, TEGRA210_MVC_SOFT_RESET, 1);

What about all the cached values in the regmap, won't they get out of
sync?  Especially things like volume and mute, it looks like the mute
just gets written directly to the regmap and not otherwise saved.

--NDuspjMMC1Ui5ypn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEyZcUACgkQJNaLcl1U
h9AgMggAha/hIL9322l4CAz3Clg/xsZLabDdWCuHA9GA1Ze39XOrtPyBmwNyBOyj
Re3PVvnBfeCzpGooqKXpTcdKaxiqBnF2ewOPcTLNrG3gnuAYR8X2NDbzFHd6rr3e
frclpdZMOypNILokwrytDJG1ssscBTapV5KC3xjwQjqSAp2ckVRGgg+5SE++B1BV
yrZuTVHJtmK3Sk78YYcYizgOndIGAOFHX48tLa81LaiSWUlePraGXtEXa8pzmSN0
uJkPyzGdiTK4bLBJgC75bOMuy/oI2Q+nsG/K6+grY7VjcuZaS94qsjngFJCdgz4U
U3mbKcLaeF8Ov8lIpr4tKJn0THvJdw==
=uPdC
-----END PGP SIGNATURE-----

--NDuspjMMC1Ui5ypn--
