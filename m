Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC773C433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 12:15:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7BF96109E
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 12:15:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbhDZMPs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Apr 2021 08:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbhDZMPr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Apr 2021 08:15:47 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92666C061574
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 05:15:04 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id f15-20020a05600c4e8fb029013f5599b8a9so3023628wmq.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4wpsUOWOD0Ocubs0APm8u84sDnwn2Yt011/bzQRv2wM=;
        b=WqMw0IpOBSKwBCXwRI9ov5gt/BuvGLebTAEhOg0P5Oh7iQAxlgOGdStj2tVDLXcF8s
         ErQF77ws/R+Z843UiOlR1IPLaTIDlgWuYMPEHXfLztz/V4dhsy6Sn8HNFuG7FewMFFZ8
         /T7F28WrfFyigUqef5tbL5XcByiE5e0nLDIysrImyVcq87m+fJUrSLHf4e4xSILDZiLG
         qpZUOzXAseKCnrnMVxU1kTUVHkj1a1dyf0iSkoAVxT4z1+J3DhpQfeAJefyKy1XN6ZlC
         DsYx3VuCvlGE86pIjNtPj06IrqhfiBfb6DIq5CyasVuwP3u0K+IZPILkDfI3/MzQdIFO
         7oUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4wpsUOWOD0Ocubs0APm8u84sDnwn2Yt011/bzQRv2wM=;
        b=EdfDnek1jwvjpqZVf8cPRhqhKWrHkL9z4o/ZxfHy/9Z75ap+HsbOyQEnmSQXJs3lLo
         ItU3Z8TG1uCtlsdT2qxl6dlDjjp3T937pwF5iI5Uzw4QGnIy4xr3grlBn4I85tNvs+iR
         e5eTmxqAe3H6RWSOZq2YB2hxu5QlQ+jaEYCLpLlqAuaG5JFmvbICag5TTo6eQNXwDwz3
         2AHLtFQFs9uH1tWie/ujDzTbwrIfn/KAIez6kDt42qvf84cYGhLCkeUjqE/VBo7SQWJI
         NIkVa5hDxOnzI6UQV5G7bBTB3j8ispJ0IDdbfJyijqMqGFIZyQM8gB2OuSuFHSGDqUPi
         7hSQ==
X-Gm-Message-State: AOAM530l1gvwPOZWTS/9kOvUqBXmbyD9wjQaTmEreB8Cg5VUQfPj2/Y0
        P+is8FfQlNLsDj/ABONZ5dI=
X-Google-Smtp-Source: ABdhPJxqXZuKLqbAqsusZ97EFd4Cjqu517b5L1DL2eJsNwwh75RxKGtPGgnU/QTkyBNleKYAroiK6g==
X-Received: by 2002:a1c:c910:: with SMTP id f16mr21195064wmb.136.1619439303345;
        Mon, 26 Apr 2021 05:15:03 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id s8sm20881104wrn.97.2021.04.26.05.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 05:15:01 -0700 (PDT)
Date:   Mon, 26 Apr 2021 14:15:54 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/10] memory: tegra: Unify drivers
Message-ID: <YIau+hPAXWgDBGRe@orome.fritz.box>
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
 <20210420165237.3523732-9-thierry.reding@gmail.com>
 <a4d73dca-92a3-d5e5-677f-498f84aa0457@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IxlTkvzTj8ImYZdK"
Content-Disposition: inline
In-Reply-To: <a4d73dca-92a3-d5e5-677f-498f84aa0457@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--IxlTkvzTj8ImYZdK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 21, 2021 at 02:46:24PM +0300, Dmitry Osipenko wrote:
> 20.04.2021 19:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > +/*
> > + * XXX The Tegra186 memory controller driver used to be able to do thi=
s. Once
> > + * removing the driver is supported on all chips, this can be uncommen=
ted.
> > + */
> > +/*
> > +static int tegra_mc_remove(struct platform_device *pdev)
> > +{
> > +	struct tegra_mc *mc =3D platform_get_drvdata(pdev);
> > +
> > +	if (mc->soc->ops && mc->soc->ops->remove)
> > +		mc->soc->ops->remove(mc);
> > +
> > +	return 0;
> > +}
> > +*/
> > +
> >  static int __maybe_unused tegra_mc_suspend(struct device *dev)
> >  {
> >  	struct tegra_mc *mc =3D dev_get_drvdata(dev);
> > @@ -834,6 +856,9 @@ static struct platform_driver tegra_mc_driver =3D {
> >  	},
> >  	.prevent_deferred_probe =3D true,
> >  	.probe =3D tegra_mc_probe,
> > +	/*
> > +	.remove =3D tegra_mc_remove,
> > +	*/
> >  };
>=20
> The commented lines shouldn't be in the final version of the patch, IMO.
> These lines either should be uncommented and the remove() callback
> should return -EOPNOTSUPP or they should be removed for now.

Fair enough, I'll drop them in v2.

Thierry

--IxlTkvzTj8ImYZdK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCGrvoACgkQ3SOs138+
s6Gb4BAAgHejMsh5+k1VlGofxEYlIDYWw4+xXCU9RE/onQRU2pJSHzJlW7p36NEd
WDZlp93uSw8MtHqS+FxZlVdcSUjqr896TYTLRqZtZrc40rifxrmJ9OY9KAHzL6sy
llBAHvvkQp3jtIrCqbKOE8KqE0rjJ9bFy7Fcv7dLFD3nNFe+XR/wsz8rm/IQC8mO
qDjrDA7LjEZkIXzxO3YRfzCwOS12gLWELwub6Bjzq/at7sebzPGyS3n9ZmuBM3vO
B7dVqd3JwrhbJ8SocpUS99Eh6WuYMzDnlvdIiWSyMBjhIUHvlNODRg0nUHcgun1r
z/AEOfmdDyyRR7FYerWeGYSScxmaYOTfxecW6vV/F3b6LzTzRMgnoLqxBQx7gfex
IsqpEdmwumRgw1c4H6FiH2w1G9dgHiUDNxX/vCEWW1UPhQrWY9AeJiXReoTbje7Y
Ae9J2vt2WmsHG6XAc2hXl1kXdpp+NJ80JsrDlxyP5uvu2Ae5V0sFhQzyVlnkd2OA
ufJTpQ+jVylSu8tARiyUgHPZe3jOE0Kdom2vpfDzq5arKQNcFBnQRoO3FJUFV22n
TFaMlkHvGJ142rREIhLQ5AtbbqLzjsmF29eVWWEVMpdvQeq0pssJcRADuDPSrXux
XeWxxCziMFkqaQfkGyLXpMQDL6ohRiCAGw2PvI1bb/EcUujrtYk=
=MFr/
-----END PGP SIGNATURE-----

--IxlTkvzTj8ImYZdK--
