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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12413C2BB9A
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:37:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1EED2395A
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbgLQNha (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 08:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbgLQNha (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 08:37:30 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C46F8C061794;
        Thu, 17 Dec 2020 05:36:49 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id r4so1855335wmh.5;
        Thu, 17 Dec 2020 05:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5CRO4FUtq0sCZEnT1huEajDQ5nORtucKY9OtwSA93+c=;
        b=OUwvfsJDlTFH3NVScDvxwySVRCCdqXWQn2gnulj6dTGEy0K66Qd5pffEBsMkq23Sph
         CFeHvRm4DNyFpbsJQtxH/KBU0R+dvhXR2cnXX61bageQHV+RWzqP85paF8iElqeG6d6E
         u6HunBPlmgmo8F63qvf4yVoKcQI5WhsAzzba5rA/P/3Kcm3P5Ows25sNDpC2idlsqe80
         jdWOkh5Pc4wgI+3W1FUBd5+/R2xX9G/xN9ag1u7u/eWkpWDAEPqVAbFEu0Ork10Yw1x0
         X4SiJI34sLUhOCLzA5IOpNjGdloVPLbGGoX2cLztoV/todXbtXM/hkrzC+APjjWAtk+i
         7aCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5CRO4FUtq0sCZEnT1huEajDQ5nORtucKY9OtwSA93+c=;
        b=mrDf5Zd9aHwTs+Qpuwuu+H9ka5+c76VO1sg+m7Ivx3erOMTs0cILiOvcPB0HOIuNq8
         Iilu6mTLI28MvaJ4vHaccb0o0cI7jrvi8SkoICc1wnlM6UTCM4IErrY2TyoxwZR3rvsh
         u60tDio6neG6BT0Z1u6PF5GjtPqSyEBekt9KgZ79kqgZrlrx5lYvSzq7CVaocNUt9ytc
         +AFzivIaHzSFALg/xBju/1oPk+KJQ9ayRBkrL1Y0lB79+SXK6GCEJUtJrYaPuM1RGerK
         01tgSdoAMbGSos/ZRLGNPIkc6LgF1ahVDydALMkY7xvKDy+kyFXKRCxcaj4dDpajnncD
         Nk2Q==
X-Gm-Message-State: AOAM532DpvllaasawwRF5qbRNTcZ6/a0yjh8x2XBvimdp1QeLhB0wTEC
        5a6JPLbFMqBVfft4LV/clMw=
X-Google-Smtp-Source: ABdhPJwqqtN1jhnli6wK+Pq5dDDPT6Byc5wprmfaD1IS1+vn3OzcjD8eMZUicw3W+oYuJBa1Mkc/lg==
X-Received: by 2002:a05:600c:21d1:: with SMTP id x17mr8571783wmj.160.1608212208560;
        Thu, 17 Dec 2020 05:36:48 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c190sm7699161wme.19.2020.12.17.05.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 05:36:46 -0800 (PST)
Date:   Thu, 17 Dec 2020 14:36:44 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Ion Agorria <ion@agorria.com>, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] usb: chipidea: tegra: Rename UDC to USB
Message-ID: <X9te7ObUU1Fcy2ut@ulmo>
References: <20201217094007.19336-1-digetx@gmail.com>
 <20201217094007.19336-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2QB7O1hFTgaD5tHU"
Content-Disposition: inline
In-Reply-To: <20201217094007.19336-5-digetx@gmail.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--2QB7O1hFTgaD5tHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 12:40:03PM +0300, Dmitry Osipenko wrote:
> Rename all occurrences in the code from "udc" to "usb" and change the
> Kconfig entry in order to show that this driver supports USB modes other
> than device-only mode. The follow up patch will add host-mode support and
> it will be cleaner to perform the renaming separately, i.e. in this patch.
>=20
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/chipidea/Kconfig         |  2 +-
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 78 ++++++++++++++--------------
>  2 files changed, 40 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
> index 8bafcfc6080d..8685ead6ccc7 100644
> --- a/drivers/usb/chipidea/Kconfig
> +++ b/drivers/usb/chipidea/Kconfig
> @@ -53,7 +53,7 @@ config USB_CHIPIDEA_GENERIC
>  	default USB_CHIPIDEA
> =20
>  config USB_CHIPIDEA_TEGRA
> -	tristate "Enable Tegra UDC glue driver" if EMBEDDED
> +	tristate "Enable Tegra USB glue driver" if EMBEDDED
>  	depends on OF
>  	depends on USB_CHIPIDEA_UDC
>  	default USB_CHIPIDEA
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/=
ci_hdrc_tegra.c
> index 10eaaba2a3f0..d8efa80aa1c2 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -12,7 +12,7 @@
> =20
>  #include "ci.h"
> =20
> -struct tegra_udc {
> +struct tegra_usb {
>  	struct ci_hdrc_platform_data data;
>  	struct platform_device *dev;
> =20
> @@ -20,15 +20,15 @@ struct tegra_udc {
>  	struct clk *clk;
>  };
> =20
> -struct tegra_udc_soc_info {
> +struct tegra_usb_soc_info {
>  	unsigned long flags;
>  };
> =20
> -static const struct tegra_udc_soc_info tegra_udc_soc_info =3D {
> +static const struct tegra_usb_soc_info tegra_udc_soc_info =3D {
>  	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA,
>  };
> =20
> -static const struct of_device_id tegra_udc_of_match[] =3D {
> +static const struct of_device_id tegra_usb_of_match[] =3D {
>  	{
>  		.compatible =3D "nvidia,tegra20-udc",

Do we perhaps also want to add a new tegra20-usb compatible string here
and deprecate the old one since this now no longer properly describes
the device.

In either case, this looks fine:

Acked-by: Thierry Reding <treding@nvidia.com>

--2QB7O1hFTgaD5tHU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/bXuwACgkQ3SOs138+
s6FKBQ//TBLMtbsou6bbuudeuQEKvYa0tffjko5YwU5sr/g3gDENC3MRSPt7XqFg
4VUhcMXqJV2GOhmvf12SzEIx4L/pFwU41nvJdI5WQGj1IbvWZI3xvwj/HIJZFvBE
KE5l59EJ6rO8a06fxRBEIADDZ/htTXnC3dLTpT8aNL6Rhs7rGshRwzYnoLjgy8nH
Me9zmlbmfjUUB3wxWMEvzZImI3qB1xrKr3D6v2i/v7wAvese3jGP0mezjOScHpUe
udFeKz3ssmyoUoOkZml4yvGt88AMe+a33R1lXNmdawNoHFWhh5jqCRTCHOnLwc8M
SFmAWMUV84sLcSaZoiBB8uJLdnVWjx3tI3/4+qkPVER2nYCVpjPcxuEKf+uDCQUs
7fWIt43/vxT9ULWLaFs7xVlRcE4gSkAn8wXc+5dOT+VF8DO/XluLCqNZd/TYXe1r
F7ZXJS/neZ+2axQ9mTzBDfOMf1+sA5wRb68ckfhReoTosLrko9OAicWwbkFguVBs
fj7Ivtmn5oiXzrIK0tNDZnFMYM8UiJhe3TUOdGJNp5w5p6q+C7vwLo8282AOtJtZ
fuAdby9e0IDua3I6KUZrMIw341w0LhOs4nZYwNSBf26XSxfZVGUfHR53ZkgiBxSv
7pA62Lx5o/sMqZTxaEuPDUk4Nfs3wFIil5z6CMv+uc1QtOzo9Do=
=7nxN
-----END PGP SIGNATURE-----

--2QB7O1hFTgaD5tHU--
