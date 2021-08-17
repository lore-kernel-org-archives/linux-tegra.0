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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23EDC4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 13:57:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A33416024A
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 13:57:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239973AbhHQN5m (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Aug 2021 09:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239985AbhHQN5m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Aug 2021 09:57:42 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F99C0613CF;
        Tue, 17 Aug 2021 06:57:09 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id r7so28875811wrs.0;
        Tue, 17 Aug 2021 06:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6xL8KKAgtKVXqiY10rauZL3Pjki57neMrGXDUAD5maQ=;
        b=HtrhppfPKGETXKQk7ZaqMpU8WnD19jumtezcpkJu7F1PYATEznnv9VzV2vkGJpKarF
         TovRf0L0/i0XMHMAjP6MENt8v/I0dDM6zCn0VAh+mgT70o2GH9bmNrL+9xZ46UmTD+CN
         RZYlldEZyfaknBqYg6MGwkW+WYeplMANsHFDiEvnpO35Uw/7jf8/L+xPFmDoTZZDEcf9
         UFz1j+4UZAOygrkLGgYDbe046/6VZFMZb2c16C0mBa3gTPI2KxGq7KO7eawuSgqy2q+Y
         +dGgh6gb13YVdhg6dxUGhyer+u8aPHYL3M7oNjgVQWCl95BJ9vHk0ozWHRStypUW3+2m
         6tBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6xL8KKAgtKVXqiY10rauZL3Pjki57neMrGXDUAD5maQ=;
        b=tzOUjiSEohxXI7i6OnC9+g8WELDF7Re2odmUi+15w1NkdWcvt5sGXtVnvpvvd+QOFI
         6Y4wZ2X+R3CMGadtJfIDqCJbedoBGIOIzp25cDNPo2GPNvKbeuzkwgTAHMrZeLQ/R4Xf
         Nsbv2jh9gLrKrFwfguNh3BhafQRzlRmnn98yl9aZajkAInMxhIXoVIuJeRT43oTAh8Sa
         9PhGRbqJnwvBWgNywnT8rl2Ajwa135FnwU2CPUzyX5jhEDZE8aQm7qeH635gPkTtuH2O
         0WmY0U81jSN8+oe8S/ovFGO3yvxaI/X7+IVhvcvEXILd+BOdidCVjBz0W2eMvFhofJHK
         MFPw==
X-Gm-Message-State: AOAM532etbCe8cjRUU2WdfHrP6zxYS45WwTCGhMbq6WOiCst7iVcaR4D
        RzWQZAbAELt8/anTTDhNHCs=
X-Google-Smtp-Source: ABdhPJxXGwy71h9iKKqpMv+kIW8otw6YW0vCZWUHj/3tGNCg758nPBEl8P96su7hyxMb2m+h1ab0Tw==
X-Received: by 2002:a5d:6090:: with SMTP id w16mr4403007wrt.38.1629208627684;
        Tue, 17 Aug 2021 06:57:07 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id z15sm2525314wrp.30.2021.08.17.06.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 06:57:06 -0700 (PDT)
Date:   Tue, 17 Aug 2021 15:57:05 +0200
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
Subject: Re: [PATCH 2/2] ASoC: tegra30: i2s: Fix incorrect usage of
 of_device_get_match_data
Message-ID: <YRvAMfwh9GnaNV7U@orome.fritz.box>
References: <cover.1629148177.git.aakashhemadri123@gmail.com>
 <4805c7fcd35c8deada63d41cb34d40de80f85a13.1629148177.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WXB9ClFJ/LNHhScs"
Content-Disposition: inline
In-Reply-To: <4805c7fcd35c8deada63d41cb34d40de80f85a13.1629148177.git.aakashhemadri123@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--WXB9ClFJ/LNHhScs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 02:44:52AM +0530, Aakash Hemadri wrote:
> const struct of_device_id incorrectly assigned "match->data" using
>     of_device_get_match_data()
>=20
> Instead assign `const struct tegra30_i2s_soc_data *soc_data` with
> const void *of_device_get_match_data(...)
>=20
> Fixes: 356b94a32a75 ("ASoC: tegra30: i2s: Use of_device_get_match_data")
>=20
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>  sound/soc/tegra/tegra30_i2s.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index d4c5594efaf1..084a533bf4f2 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -406,7 +406,7 @@ static const struct of_device_id tegra30_i2s_of_match=
[] =3D {
>  static int tegra30_i2s_platform_probe(struct platform_device *pdev)
>  {
>  	struct tegra30_i2s *i2s;
> -	const struct of_device_id *match;
> +	const struct tegra30_i2s_soc_data *soc_data;
>  	u32 cif_ids[2];
>  	void __iomem *regs;
>  	int ret;
> @@ -418,13 +418,13 @@ static int tegra30_i2s_platform_probe(struct platfo=
rm_device *pdev)
>  	}
>  	dev_set_drvdata(&pdev->dev, i2s);
> =20
> -	match =3D of_device_get_match_data(&pdev->dev);
> -	if (!match) {
> +	soc_data =3D of_device_get_match_data(&pdev->dev);
> +	if (!soc_data) {
>  		dev_err(&pdev->dev, "Error: No device match found\n");
>  		ret =3D -ENODEV;
>  		goto err;
>  	}
> -	i2s->soc_data =3D (struct tegra30_i2s_soc_data *)match->data;
> +	i2s->soc_data =3D soc_data;

Same comment as for the AHUB patch, although there's a bit more
potential to save boilerplate here. For instance, there's really no need
for the local "soc_data" variable here, so you can assign to
i2s->soc_data directly and then leave out the unnecessary check as well.

Thierry

--WXB9ClFJ/LNHhScs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEbwDEACgkQ3SOs138+
s6EYFg/7BlPu/5ug2oVMVdV/HsR+3h9uwCICjMgt8/psvUDjw1SU6x2Y/Ka2dHhZ
7pLHXfsX5XZ18zrgADT0dDNwJiTBTdDwGRIwdG0hibghfJUnqIsHrI+/6EDOjm0w
3HwhNpy4vwLxcV9IVR7p/w5TRvV/rAXFnrYjo9awsvcp+9OPvZXdWtfiXiiMlpa9
PQbkq/YN6WnQO4R223jvsoHKWmG2g2+Uk8ZZ0kCmsCnip4ZAJ+IDnNGxoqACSIYu
VxKUNr6a1K9ul0YKpKjm9hZu+B8q5d1n8498VdAVIrqeM6zj31dmArDXX6klPVMY
X0aZ7I7YutW3k2YLLWwviyTM+j9RX2pGTVJQf8EvmUMrb5YmrOy3R961c4Zl6YCU
l+byT2Fto23pJvbZp9Ao/y/YpAQFjZze0zSrg/cJGCcPql3O13CA3qgEiEEsLfss
g35mfxJlcKTn+uxZDl/psbV2/ATnHtKc9Iwfve4XpNd7qsBAlfyRHbURQj/wp2O9
YU/Zk44m29ytiWDNXJr8ShWmrF7IhghQvQ4bzpsDbPwaZ5x3rQR8caKeBX7gAgKA
/NaV3BGzyhRYPXEVZFn1s+XFXVgm9BHZNLUJ54McTAaBPiMYMRzD1O6I7mWeErwf
id6v4FxkCJxR8N8Y05b89bwndyaDxLWSp+8rkTRoOx/CGqEb1+g=
=f3kI
-----END PGP SIGNATURE-----

--WXB9ClFJ/LNHhScs--
