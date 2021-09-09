Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1631AC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Sep 2021 14:21:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E29626113E
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Sep 2021 14:21:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240936AbhIIOWt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Sep 2021 10:22:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:42332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238592AbhIIOWT (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 9 Sep 2021 10:22:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 428C860F13;
        Thu,  9 Sep 2021 14:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631197269;
        bh=heHynoj7FuQ/EekMQjdA/gQDFx7jHjFfbtl7ofgNyfk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eBTEsj9ocm33fRUCfeTHqJ7jhF1FKA1FvELYw096R4lHQxbyYe//yJgNUjSsPw3xG
         wl1rDk9JmbEu2LmPE8I0d/+HfuZu5hHBPy+8WHeG5ot/9LSgV7gNfDDye4XD9+xUHb
         GMSVjZb2EdgQm14Cz4QrFMToifK98NGmhUpFX4PvzH50e4wih02u3BnZqObb8u/0xK
         73KbmWXAMByGz+pz9Q1RrGvi1lGvgpuoK/WIwsAonPgZEtu2x0K1r9/loIyQsAhZuq
         j8Jw+XQbU2GrYn5mTdFeoYkut4I0eo9/sE4j5+xeJKXb93Y50L9zmeuwMKQu0xiJB1
         pdzX0PH+RbuVg==
Date:   Thu, 9 Sep 2021 15:20:33 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com,
        sharadg@nvidia.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/13] ASoC: tegra: Add Tegra210 based MVC driver
Message-ID: <20210909142033.GD5176@sirena.org.uk>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-7-git-send-email-spujar@nvidia.com>
 <20210903181326.GP4932@sirena.org.uk>
 <7b248062-9a62-524c-4c96-295685e211b1@nvidia.com>
 <86fc49a3-4cac-78c7-2c0c-eaee8e49d387@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n2Pv11Ogg/Ox8ay5"
Content-Disposition: inline
In-Reply-To: <86fc49a3-4cac-78c7-2c0c-eaee8e49d387@nvidia.com>
X-Cookie: I have become me without my consent.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--n2Pv11Ogg/Ox8ay5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 09, 2021 at 06:33:33PM +0530, Sameer Pujar wrote:
> On 9/7/2021 1:35 PM, Sameer Pujar wrote:
> > On 9/3/2021 11:43 PM, Mark Brown wrote:
> > > On Fri, Aug 27, 2021 at 03:03:52PM +0530, Sameer Pujar wrote:

> > > > +	/* SW reset */
> > > > +	regmap_write(mvc->regmap, TEGRA210_MVC_SOFT_RESET, 1);
> > > What about all the cached values in the regmap, won't they get out of
> > > sync?  Especially things like volume and mute, it looks like the mute
> > > just gets written directly to the regmap and not otherwise saved.

> > 1. I think original idea was to disable MVC (forcefully) before new
> > configurations are applied and eventually it gets enabled via DAPM path.
> > DAPM path handles disable also, but sometimes MVC may get stuck in
> > enable state (due to a previous usage) when all the data in pipeline is
> > not processed. My understanding is that reset is restricted to this
> > alone. The volume/mute registers seem not to be affected by reset.
> > However I will confirm with HW about the reset behavior and affected
> > register map. Thanks for pointing this.

> I confirmed the behavior with HW folk here. The reset above clears all FSM,
> flushes flow control of FIFO and resets the state registers. It also brings
> module back to disabled state (without flushing the data in the pipe). There
> is no impact on the register cache, as state registers are anyway volatile
> and module disable is applicable only when it was hung in previous usage.
> Otherwise DAPM would disable the module during session close.

This needs to be *much* clearer in the code, it looks like a bug at the
minute.  It's very surprising that some of the registers wouldn't be
affected by a reset.

--n2Pv11Ogg/Ox8ay5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE6GDAACgkQJNaLcl1U
h9AErwf/dUIV5ky5V7rYG8vSOHqnakwsifmmMQZYE2LWJin2yMRUQ6KiIKeMw9FT
wJLtCvmicBifDOZ38iM33eWFjmAT/HHZFDUA8hJXSxUJSProYTh/HDA9G8lA4I1j
YyR+Rm54XbIbGozaWHJr0vCXb7WwfWemnPs9n5ce5TtTho/kfAg29M0qm5tCRyh3
bfRNlPCrDbmRD/B2zweo1aMjXhKFMZ8gJl6t/N3b5qyEcdnsIrwWoYmblaPiC7e4
2qHjPTsSvpuo0cA4qkOsa8MTrU5/TNPgo1G/5e7CBHmRP0Rg3/Ne5qRBThlEITUp
PmpTI0J4XNF0rilJfwFWPD76dwl7tA==
=cVFn
-----END PGP SIGNATURE-----

--n2Pv11Ogg/Ox8ay5--
