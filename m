Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE00AC433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 12:23:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78CD961178
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 12:23:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233196AbhDZMYk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Apr 2021 08:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbhDZMYj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Apr 2021 08:24:39 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B7CC061574
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 05:23:56 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id m9so42921273wrx.3
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8swn70jS2igG/qafgPHRcbPgOFVezO2bodI9Xxqjq4Y=;
        b=n2dCqeqBlAg0pMtEOTGB5EIo/TVLkmAy6hSltDzgtYM6xWf1D4PexXryrMSv7fWcAT
         86W+f7EkH2ppY3XwKexeRAY41adthczkdab7VJYmWydSgeOdzDLwfZjIZWOcnH7adBds
         lvKQKwtMwwXEBYmnRvsfF+SMmN4Kw3x9wF7quesDz+678QntYP9hOy4cu+hXdXfEdHMc
         9nmPmyfl/7IfSJtmEwkoNXu/M0kanjNxCYo6bci24m56Hre4MBQWdSbanNfDD9dLef9L
         lVFwXAhbDAkBEbDCM5iELotGUMq1Pjy7daQfqaEpYscALTJ1/Qt1bNTDt6zy8HWr8miA
         L5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8swn70jS2igG/qafgPHRcbPgOFVezO2bodI9Xxqjq4Y=;
        b=fDz1NDNm0Uo7QNe0BkGbLZEFmkbXGSiqDdRTRoikaMgaCQGZgpeeiYQC2akpv0/qQ2
         UiDqwv9GZbVWXvarvgjb19tuYuN/qAFmLGl7cKhuhNmCBC1ziTUnYzsTunWw/25wSDvC
         pUw7oQ+sZj35nQtntOCDDVtaBlGY5C9B9mBeRoEo8brXmx+0ywdGrc16j4ElZPIjd+an
         AUX0wDswyuowIBoE89QyKK9S2x40yc5rShkFjnz9pr8EMEMNALuzJzCcbwpFWsaXpzF6
         MQS/RQ78Ov1NWBmj/wq1+x4wmgeBbM5dzZ4pLvWd/bO61mzRKHfTHtJgo53lM+5Z1Ffr
         OLjA==
X-Gm-Message-State: AOAM530ou+HtJqSzopFA2v5EE1iU06DxqRQYbhvUoEHB9wHacCqnGXdY
        xtt0xJBDm+EW/nVOa4YRbjI=
X-Google-Smtp-Source: ABdhPJyAAgxwNKwU3lStxhsmsEyrJyTSvAB0OKEg8PdzOwMzxJgVfK5YVC0+XfG86MqA7Z5ETQ0jmQ==
X-Received: by 2002:a5d:6e06:: with SMTP id h6mr22552762wrz.201.1619439835087;
        Mon, 26 Apr 2021 05:23:55 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d14sm10837551wrp.12.2021.04.26.05.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 05:23:53 -0700 (PDT)
Date:   Mon, 26 Apr 2021 14:24:46 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 03/10] memory: tegra: Push suspend/resume into SoC drivers
Message-ID: <YIaxDk39hjMJ6nxA@orome.fritz.box>
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
 <20210420165237.3523732-4-thierry.reding@gmail.com>
 <d1626fd2-90e3-7a26-51b8-497a344aee6f@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QyCVhmrfZDBfN07X"
Content-Disposition: inline
In-Reply-To: <d1626fd2-90e3-7a26-51b8-497a344aee6f@canonical.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--QyCVhmrfZDBfN07X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2021 at 10:47:11AM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2021 18:52, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Continuing the scheme of unification, push suspend/resume callbacks into
> > per-SoC driver so that they can be properly parameterized.
> >=20
> > While at it, also move the ->init() callback into the new tegra_mc_ops
> > structure to keep things clean.
>=20
> Please split this part. This is just moving pointer from one structure
> to another, quite small change.
>=20
> The rest of the patchset is quite different - you now call
> tegra_mc_suspend() from a per-SoC driver and move the code around.

Okay, I think I can split that off into a separate patch.

> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/memory/tegra/mc.c       | 24 ++++++++---------------
> >  drivers/memory/tegra/tegra186.c | 27 ++++++++++++++++++++++----
> >  drivers/memory/tegra/tegra20.c  | 34 ++++++++++++++++++++++++++++++++-
> >  include/soc/tegra/mc.h          |  9 +++++++--
> >  4 files changed, 71 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> > index b7e104bf6614..2b21131d779c 100644
> > --- a/drivers/memory/tegra/mc.c
> > +++ b/drivers/memory/tegra/mc.c
> > @@ -829,8 +829,8 @@ static int tegra_mc_probe(struct platform_device *p=
dev)
> > =20
> >  	mc->debugfs.root =3D debugfs_create_dir("mc", NULL);
> > =20
> > -	if (mc->soc->init) {
> > -		err =3D mc->soc->init(mc);
> > +	if (mc->soc->ops && mc->soc->ops->init) {
> > +		err =3D mc->soc->ops->init(mc);
> >  		if (err < 0)
> >  			dev_err(&pdev->dev, "failed to initialize SoC driver: %d\n",
> >  				err);
> > @@ -867,30 +867,22 @@ static int tegra_mc_probe(struct platform_device =
*pdev)
> >  	return 0;
> >  }
> > =20
> > -static int tegra_mc_suspend(struct device *dev)
> > +static int __maybe_unused tegra_mc_suspend(struct device *dev)
> >  {
> >  	struct tegra_mc *mc =3D dev_get_drvdata(dev);
> > -	int err;
> > =20
> > -	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_GART) && mc->gart) {
> > -		err =3D tegra_gart_suspend(mc->gart);
> > -		if (err)
> > -			return err;
> > -	}
> > +	if (mc->soc->ops && mc->soc->ops->suspend)
> > +		return mc->soc->ops->suspend(mc);
> > =20
> >  	return 0;
> >  }
> > =20
> > -static int tegra_mc_resume(struct device *dev)
> > +static int __maybe_unused tegra_mc_resume(struct device *dev)
> >  {
> >  	struct tegra_mc *mc =3D dev_get_drvdata(dev);
> > -	int err;
> > =20
> > -	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_GART) && mc->gart) {
> > -		err =3D tegra_gart_resume(mc->gart);
> > -		if (err)
> > -			return err;
> > -	}
> > +	if (mc->soc->ops && mc->soc->ops->resume)
> > +		return mc->soc->ops->resume(mc);
> > =20
> >  	return 0;
> >  }
> > diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/teg=
ra186.c
> > index 8e77567d1378..9d3fdb609d55 100644
> > --- a/drivers/memory/tegra/tegra186.c
> > +++ b/drivers/memory/tegra/tegra186.c
> > @@ -45,6 +45,17 @@ static void tegra186_mc_program_sid(struct tegra_mc =
*mc)
> >  	}
> >  }
> > =20
> > +static int tegra186_mc_resume(struct tegra_mc *mc)
> > +{
> > +	tegra186_mc_program_sid(mc);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct tegra_mc_ops tegra186_mc_ops =3D {
> > +	.resume =3D tegra186_mc_resume,
> > +};
> > +
> >  #if defined(CONFIG_ARCH_TEGRA_186_SOC)
> >  static const struct tegra_mc_client tegra186_mc_clients[] =3D {
> >  	{
> > @@ -701,6 +712,7 @@ static const struct tegra_mc_client tegra186_mc_cli=
ents[] =3D {
> >  static const struct tegra_mc_soc tegra186_mc_soc =3D {
> >  	.num_clients =3D ARRAY_SIZE(tegra186_mc_clients),
> >  	.clients =3D tegra186_mc_clients,
> > +	.ops =3D &tegra186_mc_ops,
> >  };
> >  #endif
> > =20
> > @@ -1909,6 +1921,7 @@ static const struct tegra_mc_client tegra194_mc_c=
lients[] =3D {
> >  static const struct tegra_mc_soc tegra194_mc_soc =3D {
> >  	.num_clients =3D ARRAY_SIZE(tegra194_mc_clients),
> >  	.clients =3D tegra194_mc_clients,
> > +	.ops =3D &tegra186_mc_ops,
> >  };
> >  #endif
> > =20
> > @@ -1961,22 +1974,28 @@ static const struct of_device_id tegra186_mc_of=
_match[] =3D {
> >  };
> >  MODULE_DEVICE_TABLE(of, tegra186_mc_of_match);
> > =20
> > -static int __maybe_unused tegra186_mc_suspend(struct device *dev)
> > +static int __maybe_unused tegra_mc_suspend(struct device *dev)
> >  {
> > +	struct tegra_mc *mc =3D dev_get_drvdata(dev);
> > +
> > +	if (mc->soc->ops && mc->soc->ops->suspend)
> > +		return mc->soc->ops->suspend(mc);
> > +
> >  	return 0;
> >  }
> > =20
> > -static int __maybe_unused tegra186_mc_resume(struct device *dev)
> > +static int __maybe_unused tegra_mc_resume(struct device *dev)
> >  {
> >  	struct tegra_mc *mc =3D dev_get_drvdata(dev);
> > =20
> > -	tegra186_mc_program_sid(mc);
> > +	if (mc->soc->ops && mc->soc->ops->resume)
> > +		return mc->soc->ops->resume(mc);
> > =20
> >  	return 0;
> >  }
> > =20
> >  static const struct dev_pm_ops tegra186_mc_pm_ops =3D {
> > -	SET_SYSTEM_SLEEP_PM_OPS(tegra186_mc_suspend, tegra186_mc_resume)
> > +	SET_SYSTEM_SLEEP_PM_OPS(tegra_mc_suspend, tegra_mc_resume)
>=20
> What's the benefit here? You basically define your own suspend-resume
> ops, on top of PM suspend-resume ops... Before it was quite obvious code
> - the Tegra186 MC driver had very simple suspend/resume which did simple
> job. Now it feels like trickier code to follow - Tegra186 driver calls
> it's resume (with the same name as others - another confusion) which is
> a simple wrapper calling somewhere else (need to jump to assinment of
> resume()).

This confusion is merely temporary. The idea here is to make the
Tegra186 driver the same as the "legacy" driver in this regard so that
the unification patch becomes just a removal of this code. If I didn't
first make this the same, I would've had to push this set of changes
into the unification patch, making it more difficult to understand.

Thierry

--QyCVhmrfZDBfN07X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCGsQ4ACgkQ3SOs138+
s6HBKA/8CInhxbN7i16ucd8J8UklQ/GmGaA2S8RUt/wHUCnR7DZhty0ysl7tSApS
xlj0D+VLkT21+FLiEaFcyGdOtEVguSHJzfdi0gqpvzLFESSq77Jc1pWpVc2qakYp
IdhyoHx2ytgwAyThVSG4I0Os2P2Nle+6x+ZvyK/YtFErSIE6iSLLUXs1jinBT9Fi
0RIpX/j5Rs28XCmO6Gb0+3rJJyPWwXotwMmciobPwjkdpmDi6EsZX1KWNSxZ1LNh
XhQY6fAS5dWawAWadQCJ+Zy2PGeFUEnpkHKiiZxa1+WvhRmu5jbyX8sZgNSkql97
HWBrqf6x5mkgEP5GYKhuJGI3x6LzrCHVCYXZvgSLI6yWPsFOY38Z6NaTEpo56/0d
7DTzICiIQ+uB4QOmbmjmJaWmEEg2v8ltPShBqxekvIXKgrdFxUf6cjfMtyf0FW4Z
AlqJvzLXhi20IZfZkc7VZZwMz3JaVThSkjnwqdjoxrfTM7x6vedbAw87YZtBnnlY
KOVR3WLasuPAsbBsG5NI6OPuBtK8EHnO2tLPcoyqXaO/YqpoX8waalZcfRbYxtlj
+MFjuhuXs8BmAr4KWwdTfwq/XkiaxkPA9LqBueYLSrLmritAAP2sOvjn44SV/LZ3
aPkvwEl9npIR2mXPyZrIYbwkvemRGO8/Vz4GS211kMK4NmgTfko=
=SmRg
-----END PGP SIGNATURE-----

--QyCVhmrfZDBfN07X--
