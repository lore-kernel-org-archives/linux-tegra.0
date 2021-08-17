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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FD4C4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 13:55:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E0A360FC3
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 13:55:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235588AbhHQNz4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Aug 2021 09:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbhHQNz4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Aug 2021 09:55:56 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475ECC061764;
        Tue, 17 Aug 2021 06:55:23 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id h24-20020a1ccc180000b029022e0571d1a0so2193896wmb.5;
        Tue, 17 Aug 2021 06:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e9bZb1YY7FCvBqIDRWVhtfdiTQ+GMJ0iZin/k2ss5zg=;
        b=LD4ux+5TV8ESgevUSUahM4UvfcpJsjjf6xwVHcmHsJCvzFBNCsj4H7/aduW+JxRCE9
         Igw7kGnFd1pI9qtLwzkPGMIIMpgtAv/bDkpXdkdUr9Jbq3kwf7fVxNiFgdoQvGQ+t3lo
         tSTuMespfQYYiUXRBhyI9krFhPzSr0nsquB03gVENfeBgjsw/4A70ejZnt+80uZN9A+g
         SmavQMRRAOLWIfBBJWlPX1tca7ze50AkXkjWxqMe/k46B+DWsPV2S/HJd8B4Y+O8g6cE
         BtV4/whpbu7pI781U2FbLXsKvHEtYWVMb8VmcSAgSCSupxLrhnVsx80RXhTSt3ilpVf+
         pg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e9bZb1YY7FCvBqIDRWVhtfdiTQ+GMJ0iZin/k2ss5zg=;
        b=DRnvG+cA6rYXQ3IOotF7+26Z6G8oKdmhM4qR2PKSRgUMWGsge2RUyJ4V+ghRK+5hJ7
         o9g5NpErDdbHnBLbeQLL7tj7vzt6zdsKkYbbQ2Hz8ON7OWnoICTo14LL3hACtr/PnPmH
         geq3aREfoMJcQSemPrII5b4nevyqLqPU6PcrC8Gw1y1Oug1VB410Qe3G+DUDhOh2SWFq
         lWCmhv0j0ZTMlgol5Gk8gcUQ94kiVklZ4fNiyd/mTjNgmJmrDkEvQYuwc2Dr5mH2yB1z
         EN2965YnRcWl5YwgoDaW61Q7iON5+FgdTZails0XfI4DB5YtQS52zRNaYvmkxc4vwBAP
         21rA==
X-Gm-Message-State: AOAM531PxQ4AP9qul0EZ+ZmacKSqojvlqmK3qpdwE8i/E0+zVLGpRJuB
        4prFPawPsq1020V3Sx/FA5k=
X-Google-Smtp-Source: ABdhPJxTMX6wNNoxC7btDvZ/uZkYsN4Pw2/KsoQIO1+M8o9zy0rayBjARqnXpLWgNKiFHPKLF/ZG3g==
X-Received: by 2002:a05:600c:4149:: with SMTP id h9mr3457199wmm.88.1629208521913;
        Tue, 17 Aug 2021 06:55:21 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id l19sm2335581wmi.4.2021.08.17.06.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 06:55:20 -0700 (PDT)
Date:   Tue, 17 Aug 2021 15:55:19 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Aakash Hemadri <aakashhemadri123@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <bjorn@helgaas.com>
Subject: Re: [PATCH 1/2] ASoC: tegra30: ahub: Fix incorrect usage of
 of_device_get_match_data
Message-ID: <YRu/x+KBHtl3jg3T@orome.fritz.box>
References: <cover.1629148177.git.aakashhemadri123@gmail.com>
 <bb61c41f2ee0cf0d85fecdfea05f23a7205992e6.1629148177.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KPz4+EU8b92H2GEv"
Content-Disposition: inline
In-Reply-To: <bb61c41f2ee0cf0d85fecdfea05f23a7205992e6.1629148177.git.aakashhemadri123@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--KPz4+EU8b92H2GEv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 02:44:51AM +0530, Aakash Hemadri wrote:
> const struct of_device_id incorrectly assigned "match->data" using
> of_device_get_match_data()
>=20
> Instead assign `const struct tegra30_ahub_soc_data *soc_data` with
> const void *of_device_get_match_data(...)
>=20
> Fixes: 80165bb80433 ("ASoC: tegra30: ahub: Use of_device_get_match_data")
>=20
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahu=
b.c
> index 0ac109b32329..ef011a488ceb 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -512,16 +512,14 @@ static const struct of_device_id tegra30_ahub_of_ma=
tch[] =3D {
> =20
>  static int tegra30_ahub_probe(struct platform_device *pdev)
>  {
> -	const struct of_device_id *match;
>  	const struct tegra30_ahub_soc_data *soc_data;
>  	struct resource *res0;
>  	void __iomem *regs_apbif, *regs_ahub;
>  	int ret =3D 0;
> =20
> -	match =3D of_device_get_match_data(&pdev->dev);
> -	if (!match)
> +	soc_data =3D of_device_get_match_data(&pdev->dev);
> +	if (!soc_data)
>  		return -EINVAL;
> -	soc_data =3D match->data;

Minor nit: !soc_data can actually never happen for this driver. First,
tegra30_ahub_probe() will only ever be called if there was a match with
an entry from the OF device ID table, and then all entries have .data
set to a valid point.

It's a pre-existing issue, but since all of the surrounding code is
already getting updated, perhaps it'd be a good idea to fix that up
while at it.

Thierry

--KPz4+EU8b92H2GEv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEbv8cACgkQ3SOs138+
s6G+ig//RyICugt3pq1ORDeWTVSn35BEuD0wrZkvbHA1W0YACkfbgleassIEpLpy
IpOt/8qKXV25aEfNEkQp275Fk2hdwJFK8XVUEVCR4efxGFCFg5lZ8H2aMceLgbKq
xHgI4P1X8bd13/uzfJ1u+75s6TxmCokWuI1o7W8NVpOYSpOJjnH/OGwzDQJJw9AB
DEomquW626ZCYpjPa8/s9nrOsHY23EFGswmCKk5nwnxDsyCFgWB5A0LjrOaWdaPQ
RbZ+1x0EKEbp65R205rziWZcJqSeLOHkv9Mc5RvL+aN9ACJ6EzwFi7ICG+ddrhyR
vE0KjfWOdH5xlLRXJ7elSFl0SbIJXGHZlRsNd6CMQqkz7piIJeiDCVTJM3ZTpwwM
YKq6ax0Dls05mhYA6wpYrWDrBTcbYytYZkUqAum+hHyu7hYrXUJq8WuKXdHyX9Jd
pE8unNgHSTe+emJ1Q6zHh5IEqP9pJKewzsJSxQ0OP9L5tWW7ZN+LjG3UwPBOkQ+v
ik2UiDWFu3NnQuAwO42ok4WtHUvX2m+ogjyusl/2mjhDrupZSBtVKbKCuOmwVfsS
PYETiBrT+SGgy/lOZnibNz537/lWfKH4XjXM0U2eZT5U+GX+vJ0cXMJ5NqwQWwHi
8FFBUYy4EKTUgoaUaN1o5frZyTy9bVqcNVOesBo5JjWVGlzF7LM=
=lOkL
-----END PGP SIGNATURE-----

--KPz4+EU8b92H2GEv--
