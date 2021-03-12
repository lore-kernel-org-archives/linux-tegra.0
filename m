Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5C6C433E6
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 12:06:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3201D65014
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 12:06:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhCLMGL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Mar 2021 07:06:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:55206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229568AbhCLMGK (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Mar 2021 07:06:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 470F764FD6;
        Fri, 12 Mar 2021 12:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615550769;
        bh=DHmyk8GUReblYUlhSMgM0JiPJvuHbVNLZgcQ4Uqew+8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZMnlJOK4+abTr5z6UYLOMd63xUlgezqJXvqxpjbY9ta+qtcZwgxxfDbPmXKjn9G/x
         fJH3pXeWHvA3lHlndJknsq+TlkHWBGctbcZ81JOI6QsX3ZMv0nto7+QDcim7ArHJOj
         9I2mVhq9wW7bbwMSGLddZUQCee/FnVMFe3vTv7qt+FXXGGY2F6rtrcv+V9DZqtm7t+
         WU6H07eYP7vHhX0lFQfBr6wobUMro6CUc76cwUfvvD82C5sTLKLO/AJOmNRIeBK1fe
         6c/mh7emCx1217+ygNXUp4FTLCvL4uNCNfu0hgYTLvLGOVAiG7NWTlatoHNVIMKJGt
         DeotHYNFPoIhQ==
Date:   Fri, 12 Mar 2021 12:04:56 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Michael Walle <michael@walle.cc>
Cc:     Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, robh@kernel.org, sharadg@nvidia.com,
        thierry.reding@gmail.com
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
Message-ID: <20210312120456.GD5348@sirena.org.uk>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <20210311161558.GG4962@sirena.org.uk>
 <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
 <20210312113544.GB5348@sirena.org.uk>
 <6ed28bb5330879b1919aced5174f319f@walle.cc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2Z2K0IlrPCVsbNpk"
Content-Disposition: inline
In-Reply-To: <6ed28bb5330879b1919aced5174f319f@walle.cc>
X-Cookie: Lake Erie died for your sins.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 12, 2021 at 01:01:41PM +0100, Michael Walle wrote:
> Am 2021-03-12 12:35, schrieb Mark Brown:

> > If the card has a clock API clock as sysclk then set_sysclk(() should
> > be configuring that clock.

> What do you mean by "the card". The simple-audio-card itself?

> Take a look at:
> https://elixir.bootlin.com/linux/v5.12-rc2/source/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts#L29

> Does the card has a clock? IMHO the WM8904 codec has a clock, but not
> the audio card.

The clock on the CODEC, which the card configures.  The CODEC should be
passing on the configuration to the clock API.

--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBLWOcACgkQJNaLcl1U
h9Dr4wf/RvhCgjsXMqQfCMBjIX58G+v9Cg2OPPplcaKKCYDjRg91mNXrL3E80qFQ
HOfZJ33uxBY2xnzXmfnttbMlnRrQys2U0XPqbQXNnJTnHmJu4XqVU/j+c8QJeKJK
DCYp/qmAvUqm3i4KDM/bbqIeNCiXHtVZ6FvLdrEL8smdJhXdMGFA24rOvNMlhCyw
T2/y0+K/70cbhiWTrVFs4LyRnGdlIooLdErAfQ0ZoXnsid0QNObGiS0eOSjssjke
gfwoUWcR5skL2eEzLBkWAOnJM1Am5S56kSpMaF/69BfwwINbfV7GpCZFOHbI+Zy1
0ZPH0ScPMHaRdPcpq9ArImBAxwU+Fw==
=mvjs
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--
