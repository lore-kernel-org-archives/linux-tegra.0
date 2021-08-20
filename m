Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560FDC4338F
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Aug 2021 11:34:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38A4561053
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Aug 2021 11:34:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240027AbhHTLfG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Aug 2021 07:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239870AbhHTLfF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Aug 2021 07:35:05 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE10C061575;
        Fri, 20 Aug 2021 04:34:28 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id q11so13800364wrr.9;
        Fri, 20 Aug 2021 04:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aYreJVAauYrX+ezNPrkL/5dX1XbepU/zPicOABM56GM=;
        b=C1KPwtardY//ZR6TIIdKZW8haq6Np6BHtMhVyL3sPhcM/EQTZRjtVY/Ddr5cuzsE9u
         55PCVLyrzcjoygzjk0mqM1lJm40NlmgiDHYoq6N/lnIBr5GNkKNEY/uB1aqsAIL732nU
         /BUyIghhwAGh9KcByyHXw7XTFQEBmxrW3fulfF4bgOtnlLlxbBfcaelxzLre8DBXcLc8
         F42DSV4gVTnNT6sC6cprrrvkfY82pH+qGVRmvoWWya7bTu3Xx3NFH3YF9FWWhlL1yQzU
         oyPMR5sKjtwRKxAvH7JJSBIVJGFw2dE9jKSQpcRRSTJni4t1fpVXqE/CecxdXtDB3fTK
         cpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aYreJVAauYrX+ezNPrkL/5dX1XbepU/zPicOABM56GM=;
        b=SbBBfVFWPaHmZDHH+OJ68qrHxYxUUweScsMoAr4pJ0i2ElZ+UgT1nAXO7pxGpUlgaK
         fvukhrTn3/ZOJs/faqa1T7mcDSVR5SrpXjC0OQToFP2vQGzAsEWq9nXvVDOstnpoqt3Y
         +ydXiTEaXo578/yvGqxgmfr7WM7UF82UdgAneP/SruCcc+FvY4yZpGTFyhyXrg5+avsW
         ud7k0+d0a5+FwkJpmY5Wysqv/klFKmwiN5AmsMCEpF8bqeRu+RfJ5abTqypIWL7Uk2UR
         +JnTyc+F53xt0PIGgRkI5xBoyjy1CSdqK2atDv8VWUYbjnZp5I50pes/z3GhjgJ+OfO8
         VSEA==
X-Gm-Message-State: AOAM531krR7Y7Ll2m9V7MDyayEtSB3LgpUoj11888LCS2vI5whp7eALT
        e7j1sBFP29sqlYnHUZF3wK8=
X-Google-Smtp-Source: ABdhPJztkPXb/OhVmR0IeJTnOnumTOXpjXtCJN4r5VeuY6u7I+sDcVShVRY2NdJpI3X7vre6USOQeA==
X-Received: by 2002:adf:a556:: with SMTP id j22mr9782758wrb.268.1629459266680;
        Fri, 20 Aug 2021 04:34:26 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id a3sm5618061wrx.38.2021.08.20.04.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 04:34:25 -0700 (PDT)
Date:   Fri, 20 Aug 2021 13:34:24 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     jing yangyang <cgel.zte@gmail.com>, Mark Brown <broonie@kernel.org>
Cc:     JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jing yangyang <jing.yangyang@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH linux-next] phy/tegra: add put_device() after
 of_find_device_by_node()
Message-ID: <YR+TQP3wWV+91fn2@orome.fritz.box>
References: <20210820024633.11757-1-jing.yangyang@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TTcOaYS9NXqfGScp"
Content-Disposition: inline
In-Reply-To: <20210820024633.11757-1-jing.yangyang@zte.com.cn>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--TTcOaYS9NXqfGScp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 19, 2021 at 07:46:33PM -0700, jing yangyang wrote:
> This was found by coccicheck:
> ./drivers/phy/tegra/xusb-tegra210.c:3174: 2-8:ERROR:
> missing put_device;call of_find_device_by_node on line 3167,
> but without a corresponding object release within this function.
>=20
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-t=
egra210.c
> index eedfc7c..f26eb5a 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -3170,8 +3170,10 @@ static int tegra210_utmi_port_reset(struct phy *ph=
y)
>  		goto out;
>  	}
> =20
> -	if (!platform_get_drvdata(pdev))
> +	if (!platform_get_drvdata(pdev)) {
> +		put_device(&pdev->dev);
>  		return ERR_PTR(-EPROBE_DEFER);
> +	}
> =20
>  	padctl->regmap =3D dev_get_regmap(&pdev->dev, "usb_sleepwalk");
>  	if (!padctl->regmap)

I think we also need that put_device() after getting the regmap because
we loose the reference to the platform device after that.

On the other hand, I suppose we might have to hang on to the reference
until tegra210_xusb_padctl_remove() so that the platform device that the
regmap is provided by doesn't suddenly go away.

Mark, I couldn't find how the lifetime of regmaps is getting tracked.
dev_get_regmap() seems to only return a pointer to the regmap if it
exists, but doesn't actually increment a reference or anything. So do we
need to hold on to the struct device that we get it from until we no
longer need the reference? Or is there some other way to make sure the
regmap doesn't disappear on us?

Thierry

--TTcOaYS9NXqfGScp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEfk0AACgkQ3SOs138+
s6GzRBAAwq7pyeoXCM9Nd6z/M71iuupaNSZdW83r+xe0LPD7u9N35c+bQ+I9jcnb
hsE6r/lfH3n4Ulm55kl28CDF05Jdd7m44FegC5c8/66GTWwND2gvcqMmZ0vrXs0i
yU+opheZnOOi5PoOhPH3MwELm6pGR5Mi8xEAvChMHBx/qJHWRSdl5MfIRZ7xIWO3
zsDN7ytxtmiFrk9bzphi7VY5WuZGEcgbkluE4bJkMDodRaPUklhGLnhxYvknMwMi
78+p2sIyAiw6IJzOYpI4A5Nj8V7I3SzPu5LjgZS4QlavXb78pKn1IFzJfPlo45zd
zaVHiYaDlTkk3MN7TOiljG4ojCbAhHJydZbaS+Oz/yEWjYWGy+ktLDwTydKFKlAb
17vCdCUZYTi0ybJg2Rv0h6gp5YJi3wWNSd1Wh7QhmlT5D/cqn9PXcUKceN5n+YFv
SClivpgTgbteBKb+ZYcFfqqfYqoyaN+AOirYUSwLEqwEAbzlUNs6AtMRU9Zg+3vS
U1028VXMd7tpRokplUSR/78qTO4Q/HmAFGGIlRFAecXtt6mTua2Y/cK2Dadl8PzN
+jsptI83jS9z5zZMiNoX2d/BPeaSj4FfEPvKhYhPnJsNaVjNs0Dhv8wnejbMa+Rz
Gu9YmGlh3eMmmFh2biaMEmhOjL9DjoYkI978L10odWCNI9ZKhb0=
=UxBb
-----END PGP SIGNATURE-----

--TTcOaYS9NXqfGScp--
