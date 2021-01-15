Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215C6C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:23:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C94862389B
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:23:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731623AbhAOPW5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 10:22:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731334AbhAOPW5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 10:22:57 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB22C0613C1;
        Fri, 15 Jan 2021 07:22:16 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id d26so9637090wrb.12;
        Fri, 15 Jan 2021 07:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Tnfm7gtEx0dAkvKQ5TuqitkxF+T0R813w6cmMs8GDJo=;
        b=utqjm9qz9J3H29otHUpKGdu8lVrAt8+InF3X8ZZ/LGCQ0AV83RVue+M0xUaRGbiLXq
         u0aTdRK8SX3cLjGzLe+CVUzoON1DTM8vSFJCljdw1DDF0+yNdx4Id5OgYn8K7NI6CEsM
         64JdJkwMlsrHUrcxzrF3CvrySSprZfrw+bl3X4ZBwthSVtWFeXRhY9b3+ejEwwJcutPv
         B5udzGuwhebNP2LAawPaz0Xh5bqwOcikTQTKp12SKL/MGfHuXgjXYZUbXIu3ZH3OPCVH
         +K/m3Iw618n5JXyp8mmkum8DktQ9U9I+Y3RDY2c+oQ7iFP4cXs1t5EP3WVa/5aHRwBxJ
         d8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Tnfm7gtEx0dAkvKQ5TuqitkxF+T0R813w6cmMs8GDJo=;
        b=EEBeJ+iKqy61bf41m4qY7D8QunSHoccEvDP3ZsSuBywsS10neyGN7kmxhpbSMmYkW5
         GqxQvAYkSTIOxncyloIESgOcdrAFroMFt0ndTNERxIHado2vvg8rtu0ltZYUD8ERMW4x
         P3WZI3Mc0PwaDRb8FhBOpIutD8AOlktvfWpzKo3XORnwYwNtxTcXgcrXy+k8/7Q0Dht1
         vbM/MZZP5FQkUIxJwYBrAf09U5O0rSeXuOhaVj1YqRddWcxVNxTst7pDgahhKv30A7mt
         gk393lpJFmON35co9eyjNgy76QKcpa7BCOyL4kOp+bk1DHAYrCIsLQ1iI2u6AYlHbiBG
         2QdA==
X-Gm-Message-State: AOAM530dmbhhBDgcC7vYw5ntKEwc86v8Q0PH1g7M4Co7w9YoS/2g6NBe
        jbuiYGE6Wa2aYqM3goCMv78=
X-Google-Smtp-Source: ABdhPJypwvseEG8WGwKHgyd9YL/CM33D3wv7YiExANdkO1CSjgs9Zmr28/I0ns+6zYRhg0NAKWT7Aw==
X-Received: by 2002:a5d:5049:: with SMTP id h9mr14168287wrt.404.1610724135173;
        Fri, 15 Jan 2021 07:22:15 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f9sm17020621wrw.81.2021.01.15.07.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:22:14 -0800 (PST)
Date:   Fri, 15 Jan 2021 16:22:12 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/5] ALSA: hda/tegra: Use clk_bulk helpers
Message-ID: <YAGzJM7BJqLV0xxY@ulmo>
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Au/hUgr6VFbvitZL"
Content-Disposition: inline
In-Reply-To: <20210112125834.21545-2-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Au/hUgr6VFbvitZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 03:58:30PM +0300, Dmitry Osipenko wrote:
> Use clk_bulk helpers to make code cleaner.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/pci/hda/hda_tegra.c | 68 ++++++---------------------------------
>  1 file changed, 9 insertions(+), 59 deletions(-)

Heh... I have a branch samewhere with this same patch. Glad I can cross
that off my list. One thing jumped out at me, see below.

> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
> index 70164d1428d4..4c799661c2f6 100644
> --- a/sound/pci/hda/hda_tegra.c
> +++ b/sound/pci/hda/hda_tegra.c
> @@ -70,9 +70,8 @@
>  struct hda_tegra {
>  	struct azx chip;
>  	struct device *dev;
> -	struct clk *hda_clk;
> -	struct clk *hda2codec_2x_clk;
> -	struct clk *hda2hdmi_clk;
> +	struct clk_bulk_data clocks[3];
> +	unsigned int nclocks;
>  	void __iomem *regs;
>  	struct work_struct probe_work;
>  };
> @@ -113,36 +112,6 @@ static void hda_tegra_init(struct hda_tegra *hda)
>  	writel(v, hda->regs + HDA_IPFS_INTR_MASK);
>  }
> =20
> -static int hda_tegra_enable_clocks(struct hda_tegra *data)
> -{
> -	int rc;
> -
> -	rc =3D clk_prepare_enable(data->hda_clk);
> -	if (rc)
> -		return rc;
> -	rc =3D clk_prepare_enable(data->hda2codec_2x_clk);
> -	if (rc)
> -		goto disable_hda;
> -	rc =3D clk_prepare_enable(data->hda2hdmi_clk);
> -	if (rc)
> -		goto disable_codec_2x;
> -
> -	return 0;
> -
> -disable_codec_2x:
> -	clk_disable_unprepare(data->hda2codec_2x_clk);
> -disable_hda:
> -	clk_disable_unprepare(data->hda_clk);
> -	return rc;
> -}
> -
> -static void hda_tegra_disable_clocks(struct hda_tegra *data)
> -{
> -	clk_disable_unprepare(data->hda2hdmi_clk);
> -	clk_disable_unprepare(data->hda2codec_2x_clk);
> -	clk_disable_unprepare(data->hda_clk);
> -}
> -
>  /*
>   * power management
>   */
> @@ -186,7 +155,7 @@ static int __maybe_unused hda_tegra_runtime_suspend(s=
truct device *dev)
>  		azx_stop_chip(chip);
>  		azx_enter_link_reset(chip);
>  	}
> -	hda_tegra_disable_clocks(hda);
> +	clk_bulk_disable_unprepare(hda->nclocks, hda->clocks);
> =20
>  	return 0;
>  }
> @@ -198,7 +167,7 @@ static int __maybe_unused hda_tegra_runtime_resume(st=
ruct device *dev)
>  	struct hda_tegra *hda =3D container_of(chip, struct hda_tegra, chip);
>  	int rc;
> =20
> -	rc =3D hda_tegra_enable_clocks(hda);
> +	rc =3D clk_bulk_prepare_enable(hda->nclocks, hda->clocks);
>  	if (rc !=3D 0)
>  		return rc;
>  	if (chip && chip->running) {
> @@ -268,29 +237,6 @@ static int hda_tegra_init_chip(struct azx *chip, str=
uct platform_device *pdev)
>  	return 0;
>  }
> =20
> -static int hda_tegra_init_clk(struct hda_tegra *hda)
> -{
> -	struct device *dev =3D hda->dev;
> -
> -	hda->hda_clk =3D devm_clk_get(dev, "hda");
> -	if (IS_ERR(hda->hda_clk)) {
> -		dev_err(dev, "failed to get hda clock\n");
> -		return PTR_ERR(hda->hda_clk);
> -	}
> -	hda->hda2codec_2x_clk =3D devm_clk_get(dev, "hda2codec_2x");
> -	if (IS_ERR(hda->hda2codec_2x_clk)) {
> -		dev_err(dev, "failed to get hda2codec_2x clock\n");
> -		return PTR_ERR(hda->hda2codec_2x_clk);
> -	}
> -	hda->hda2hdmi_clk =3D devm_clk_get(dev, "hda2hdmi");
> -	if (IS_ERR(hda->hda2hdmi_clk)) {
> -		dev_err(dev, "failed to get hda2hdmi clock\n");
> -		return PTR_ERR(hda->hda2hdmi_clk);
> -	}
> -
> -	return 0;
> -}
> -
>  static int hda_tegra_first_init(struct azx *chip, struct platform_device=
 *pdev)
>  {
>  	struct hda_tegra *hda =3D container_of(chip, struct hda_tegra, chip);
> @@ -495,7 +441,11 @@ static int hda_tegra_probe(struct platform_device *p=
dev)
>  		return err;
>  	}
> =20
> -	err =3D hda_tegra_init_clk(hda);
> +	hda->clocks[hda->nclocks++].id =3D "hda";
> +	hda->clocks[hda->nclocks++].id =3D "hda2hdmi";
> +	hda->clocks[hda->nclocks++].id =3D "hda2codec_2x";

Originally the code did this in this order: "hda", "hda2codec_2x" and
"hda2hdmi". I don't expect the exact order to be very relevant, but was
there any particular reason to change it?

In either case, this should be fine:

Acked-by: Thierry Reding <treding@nvidia.com>

--Au/hUgr6VFbvitZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABsyQACgkQ3SOs138+
s6FoyRAAkCUvQ9bydbIYbQCgIODgmtk4NEpFc9gLUNSaSU1q6Rosi0xLJ73jJw2q
8w4X6TL9a1kc91y4DuIt+iMfP35eG/OY1fz5FsWfHZkGSwytqKZeiOZWq6mlOJ47
KT2LXeqiuDao04vW5USXuhvp9kNLlGOwDFZ32suVw1cOfKZYBG3gYTzMZetHfd2g
Ey+/quceJjpaOOPqCja7Fzysz0xTMfPuLZjy533q/qOwpLH1HSiiOQZXlEzruU1w
niOa7lo9z5kYplb+ubMq2JD3nP2oFMQ1BjZxPQeaZwFWtrCKUTDRa4upv3fEyDB1
l+v9loObsYuLxJrVTTIKaOh1vXr875Lv2DItLCXj+qPd1r+dvHwz3Ccf7XxlK0/n
XdWXa+CTUHY6DAGHlg3EWaaeYUcRfLP/v8Kw1Ydm6SCKIh8XapVNrfxqaEmDRSV9
yzJI0VTQw8ZHDAJ4W9Rb+vRiUcOeXiuJSbvoEW+72/5asspEiJIMyQfUtQUyibqS
eYgLmYk9Lp88dobozS9DexoP7xVwE9S66+alZ7k3+MxymWimmBoyRDwFUh2NatxB
9f3/aGwQ1+q0PZti2vpmUZfpPbB3xJxv1w1WnNAvA6Rpcef1RoRpkwXXiTt4lFVs
1OTsiV1mbKlCRos1I7DR+d7BIG8UhtBEBFw/EK2wBEA/J1uM7Ic=
=AaZO
-----END PGP SIGNATURE-----

--Au/hUgr6VFbvitZL--
