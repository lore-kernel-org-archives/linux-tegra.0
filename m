Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F201CC7619A
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Apr 2023 12:38:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237148AbjDEMiz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Apr 2023 08:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234940AbjDEMiy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Apr 2023 08:38:54 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457501FD2;
        Wed,  5 Apr 2023 05:38:53 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id eh3so140658584edb.11;
        Wed, 05 Apr 2023 05:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680698332;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4K2LKX1I/lpH9z36xVqg4K3J7Cq4KIfhLzcdDFePTjg=;
        b=fgTMGHyFXa1qgCs24AWiAtsKN1GUERIpL7hx0zAr43ZhQsScAvqCWhDhb4vrNpcH7I
         B00YCVw5JO2C9zfFbuGtjhKKEOe4XXjDUDAKckyIwZGzLeS4ACxr1+QGi9zkom0q31+V
         WivyZrXYrJ/7QRIxJO5kyX6gju292ueuvZMnaUeNiQhIwHoaEzpsZ9C+DK1PjtVqtXwH
         1orftxS1c26RldkzVJ9i3L1LPEHRorwADG788OCL0Np17WVJyEfWLu/i5t3lrlXxIhJc
         ulrvSC1o8eaxcKOu8JCYS2nHKF6CwVcXxGiSH41qVS5mE+hShgqSG2tbsG+bNFQKWFM9
         Xvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680698332;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4K2LKX1I/lpH9z36xVqg4K3J7Cq4KIfhLzcdDFePTjg=;
        b=yowHhc23/4pgx7MC6ZIuhSmEVmn9TWJMxCYOe0WhP5D3lM9dK+BZkrJf9iihJGOYF2
         IpKrLfKjhNo474Fitag9x2EOZTT8NNZ2lNsHYelSMaPIaWMPiv5OfBYpqLyLXCcw3SZl
         Kt8jhlzyCRJEQpQ+j1wo5xfDCOcNdINdu/DVgLeKjOqNlViMafKJcgW5V0kC+U75Ql21
         YT7kjRJEJ4PzvyxhusHgx/hP4p/IUXo60wG9NbBVHvWYYfCWojY7h1HlAfmZWmxY70sX
         8Y4BSvWaQ2KWdyNj1wOg65CemaaJVksjutl+JjCYscGA4AltXIhuiLYzJuwLEstdUi1o
         E5/w==
X-Gm-Message-State: AAQBX9fa59kqi5rRuI1mz76sVOJBtDHyV2z30TsIwCiqBmAbCU6B5z36
        FvnwHeLp8fr7tdL4aCNj7JAAb+vhl8o=
X-Google-Smtp-Source: AKy350b9tUVv6KbsM0u4XCKcvjKrck+Twvgfz4UZM0jkzyar0vGjPwXlE8UB9UWvaAeZWbWOVWYfiQ==
X-Received: by 2002:a17:906:a38f:b0:932:a14e:4c57 with SMTP id k15-20020a170906a38f00b00932a14e4c57mr2900292ejz.76.1680698331643;
        Wed, 05 Apr 2023 05:38:51 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id y7-20020a1709064b0700b00946be16f725sm7338185eju.153.2023.04.05.05.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 05:38:51 -0700 (PDT)
Date:   Wed, 5 Apr 2023 14:38:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Yuan Can <yuancan@huawei.com>
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        mturquette@baylibre.com, sboyd@kernel.org, jonathanh@nvidia.com,
        mperttunen@nvidia.com, tomeu.vizoso@collabora.com,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: tegra124-emc: Fix potential memory leak
Message-ID: <ZC1r2esSZkqEjRVr@orome>
References: <20221209094124.71043-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iA7IswaSxcKGbw9g"
Content-Disposition: inline
In-Reply-To: <20221209094124.71043-1-yuancan@huawei.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--iA7IswaSxcKGbw9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 09, 2022 at 09:41:24AM +0000, Yuan Can wrote:
> The tegra and tegra needs to be freed in the error handling path, otherwi=
se
> it will be leaked.
>=20
> Fixes: 2db04f16b589 ("clk: tegra: Add EMC clock driver")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/clk/tegra/clk-tegra124-emc.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk=
-tegra124-emc.c
> index 219c80653dbd..2a6db0434281 100644
> --- a/drivers/clk/tegra/clk-tegra124-emc.c
> +++ b/drivers/clk/tegra/clk-tegra124-emc.c
> @@ -464,6 +464,7 @@ static int load_timings_from_dt(struct tegra_clk_emc =
*tegra,
>  		err =3D load_one_timing_from_dt(tegra, timing, child);
>  		if (err) {
>  			of_node_put(child);
> +			kfree(tegra->timings);
>  			return err;
>  		}
> =20
> @@ -515,6 +516,7 @@ struct clk *tegra124_clk_register_emc(void __iomem *b=
ase, struct device_node *np
>  		err =3D load_timings_from_dt(tegra, node, node_ram_code);
>  		if (err) {
>  			of_node_put(node);
> +			kfree(tegra);
>  			return ERR_PTR(err);
>  		}
>  	}

Don't we need another kfree(tegra) in case the clk_register() fails? We
could do that as a follow-up and this patch isn't wrong, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--iA7IswaSxcKGbw9g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQta9kACgkQ3SOs138+
s6HSag//eS09lcEbbY1RShWxt8Hi4ee6/NG5MgmyiRmF1ZwyUXAA9E/pRi66LofB
9+cf6f1AlhXhV3V83n+gOxi3XqZi5xCgiH0KstvdEJ0BxpFP6rCjdFJHsZ92FBqx
uyFJqkV9yp+dknyvz46NXnqPgJLIn+3dA6JUMj+XyZSiaCghQ5CqH17radn5RrlN
RjSO2KUJeZO86HEYL4uaQuyPIbEKiNcInZry4dVRTsfRxzxLe+1wJoF/GY1HUWip
nuk10yhksKYeJv0ckJahbTU6DDFXghKVm2TtpJn0mJExnZuqNn4M/+8G0e7twvo6
JB/Y1mpGJSR8pEsENw42l79ILWPJB29beH8eYPrJ5ddJPTGFF1pdj/XiUBtcJ5Dn
BoJjkBCpLdE5yz0evXRJOaBws0msXr0qt8QFetyc9theNGjsBSX0rgh+RfJExd4N
SAAUUimciaYVDz5q7GkPC/KU295hRskK8mKTJA166n17Di7mI3A4WDM0l+2vUZV0
+FbhL1+zRnEcOc4IlnyGLsaBuTQsQPoYE+I5Iqhso8/5DxB9CXH4n5xZ/T8VK1mg
B1jSaQyTuuj5f111QrMkJlJm0K47zwkCuj8ztlf1/pnbaYI5nEn06OlxOrvyYeMC
bID+AGG6BhwNN1HHpOjtgtsTsAbYRiNcK6//rba4VWn27LOAMX0=
=e6mM
-----END PGP SIGNATURE-----

--iA7IswaSxcKGbw9g--
