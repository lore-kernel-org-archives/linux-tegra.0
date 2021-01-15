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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5237C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:35:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 953E523888
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:35:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbhAOPfw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 10:35:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbhAOPfw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 10:35:52 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A160EC0613C1;
        Fri, 15 Jan 2021 07:35:11 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id q18so9717485wrn.1;
        Fri, 15 Jan 2021 07:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ESX6noLsCkIO+iwpxKWPA2ym8CNQ0B0VrfopXTaNMvE=;
        b=FKX7N3zPinoMooJcVVc0Sul+W4MuG3BE0bFE6iGvHrfIiOqkaREXyINpMin1far4Id
         E04bd3N5MYIdx6u8wDKioAevVfC3CvXnTJHsha8bOmtKvjrKlyvzEBpLkie0yoXzeHaL
         w0CV0nBGKymAWXZZQ90gTHGyiwdnAe17/+rAAHKUVkPjN4luBy42B6HAz+1mba5Pn0EQ
         gY5jTM+y/PWCPX4Ex1nS7DDHk4zHyJTVTWJRP9czrQiW7WR3CQuic/cRSl+x9WAXjbrA
         ZdlFr+CO2VKtvapR/Mmgt3Z4YegfYZ2x3GtRD9zDMtK7n6j1oixFpJdfVklhyDlPZMkO
         RN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ESX6noLsCkIO+iwpxKWPA2ym8CNQ0B0VrfopXTaNMvE=;
        b=qL772CTezKnCvJiXjBnYWvVaoSeS+9EhEcQI9lMgzHMVIUwTDfTHvW0VJZwWzldbPy
         dsjdLeT7gq09zyymGmfhr4hWgJi0tDfNdAzEn/iBfCzL1hdh/IT0BFgqrPiHsnTQ3BM6
         10yPPJGSvM2cXaQ+O0Uj9MnyQ+YOiiDA+Pb97Rh3MgR8h9hYhSq38A8c6qUUMRjIHppq
         eAoh4Kb1CfcMnPJOnITrQsEGUHbOzEvIj69HQYe/TPShFCzrFnReoB+8CX+QTwk2JnSX
         eKNN77dqYm/hMOC+sUkGR861hqfMbwpoQkduAasH5/N+2u+J2SlYv5mqvIBMdh+OkfYn
         G5yA==
X-Gm-Message-State: AOAM532pC2d02R9mY0NmjRLmmftcyhrgcJAPndwEnpkHxQ41Esra+9Dj
        i03G1jaJv68wq2NpIRalMdU=
X-Google-Smtp-Source: ABdhPJz/Wu7xnv0xzKek8K70k69xs98gJ80/O6x3djJk4M+rXGYYY30sfdUBjoGV41dBshMXS9edJw==
X-Received: by 2002:adf:fad0:: with SMTP id a16mr14302085wrs.390.1610724910415;
        Fri, 15 Jan 2021 07:35:10 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id w13sm14787841wrt.52.2021.01.15.07.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:35:09 -0800 (PST)
Date:   Fri, 15 Jan 2021 16:35:07 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/5] ALSA: hda/tegra: Reset hardware
Message-ID: <YAG2K4CjtCdSs6P2@ulmo>
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uOznnLuw98Lbh+eo"
Content-Disposition: inline
In-Reply-To: <20210112125834.21545-3-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--uOznnLuw98Lbh+eo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 03:58:31PM +0300, Dmitry Osipenko wrote:
> Reset hardware in order to bring it into a predictable state.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/pci/hda/hda_tegra.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
> index 4c799661c2f6..e406b7980f31 100644
> --- a/sound/pci/hda/hda_tegra.c
> +++ b/sound/pci/hda/hda_tegra.c
> @@ -17,6 +17,7 @@
>  #include <linux/moduleparam.h>
>  #include <linux/mutex.h>
>  #include <linux/of_device.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/time.h>
>  #include <linux/string.h>
> @@ -70,6 +71,7 @@
>  struct hda_tegra {
>  	struct azx chip;
>  	struct device *dev;
> +	struct reset_control *reset;
>  	struct clk_bulk_data clocks[3];
>  	unsigned int nclocks;
>  	void __iomem *regs;
> @@ -167,6 +169,12 @@ static int __maybe_unused hda_tegra_runtime_resume(s=
truct device *dev)
>  	struct hda_tegra *hda =3D container_of(chip, struct hda_tegra, chip);
>  	int rc;
> =20
> +	if (!(chip && chip->running)) {

Isn't that check for !chip a bit redundant? If that pointer isn't valid,
we're just going to go crash when dereferencing hda later on, so I think
this can simply be:

	if (!chip->running)

I guess you took this from the inverse check below, but I think we can
also drop it from there, perhaps in a separate patch.

> +		rc =3D reset_control_assert(hda->reset);
> +		if (rc)
> +			return rc;
> +	}
> +
>  	rc =3D clk_bulk_prepare_enable(hda->nclocks, hda->clocks);
>  	if (rc !=3D 0)
>  		return rc;
> @@ -176,6 +184,10 @@ static int __maybe_unused hda_tegra_runtime_resume(s=
truct device *dev)
>  		/* disable controller wake up event*/
>  		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
>  			   ~STATESTS_INT_MASK);
> +	} else {
> +		rc =3D reset_control_reset(hda->reset);

The "if (chip)" part definitely doesn't make sense after this anymore
because now if chip =3D=3D NULL, then we end up in here and dereference an
invalid "hda" pointer.

Also, why reset_control_reset() here? We'll reach this if we ran
reset_control_assert() above, so this should just be
reset_control_deassert() to undo that, right? I suppose it wouldn't hurt
to put throw that standard usleep_range() in there as well that we use
to wait between reset assert and deassert to make sure the clocks have
stabilized and the reset has indeed propagated through the whole IP.

Thierry

--uOznnLuw98Lbh+eo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABtigACgkQ3SOs138+
s6FeaRAAsz1n0eikp0rj/uwYC3OvRDA8cLTe9YBU9D16waXKHN4oJ+gx0zWhCVj1
9yQQOfnF335Xke/RTeCrv+9Powa81YgGqPdveTuj3MmaP58PsHvIC/22XFnjw2zK
ott21GlSMITx0JMrGjYI3dTSq6rSzRWMAr7YADDgahbpoN/AMnI7Dxh6Inqmu8F0
NdGSS6WPqZ6rDf+ICY0nSd06BjQB5sPuqUleMIK1RGxGWYH7rq5gj51Ovc98z+B4
NfCMZHB1LFI9v/soLABPeTbCRn6SXOyfaLeZFn3a/H34xPF0BZw9CCYWzJq8PWBH
j89p364+whgu210XuppIcGL58u/T2BtjayTJSr1H4YgP2MbUZw1rw5ZvX+KxYdhf
fYr/lkmUvSha4VjBJOM+kymJaVHNWwheHwX9VJtJRiAzet7oKqto4p0X2wWFjztn
mi8ZUngUTKYczi0gXP3Mvy/+95/HVwmW+9qmJQ1gBA9IrWvENmhimH3qa8kQP2/5
1yns9vqGx/N+IAdANR7gzBfyf2rjQxIo1ritAlPiHa0/U+fSPjwp8IeHdJgtpziV
bWRfvo0emWaj8cbZsB4/inTPyiCfhk+hQeYtpYRp9HJodO/1LbE1n/fvwATlMIdA
epFJUgIuI4OlFQ5vGY5Cl73pxHnrJOJjLmOBj/CNjZmgoHoQT9g=
=bc5e
-----END PGP SIGNATURE-----

--uOznnLuw98Lbh+eo--
