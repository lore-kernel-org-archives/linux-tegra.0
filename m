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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7089DC4361B
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:42:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10AD22396F
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:42:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgLQNmT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 08:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgLQNmT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 08:42:19 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050BAC061794;
        Thu, 17 Dec 2020 05:41:39 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id d13so8390717wrc.13;
        Thu, 17 Dec 2020 05:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SSiUovB1ZKvlSGMVvhS/vfOc7vEzdGXOp/oMPhMJjwE=;
        b=rkS6TF9br+Bg1nnQ+IGTw7QVjntpInFGPQYtyKJ7ieGM14VA5oVryVfGXxzc6S9HtY
         B1ZLQtjrk48iq2Yla6mVE41aBMcZrh+Gbq1Nkd8VZNrBH5XQ/bam63RYuFPuDlPiOrGY
         Errq/t+7s5pQMyptqzKW0qioD4oST49B2ysTgBJITGyWuRaL/oyz7FSxLj1x4ipLUQTj
         CaTD+TsOrBpfXL99KyVZihztYjfJpwXxCljRYL3HG31mvXAaNplxOt4ddmge1Hn6EoLg
         oEg7iePzUojr/JpgPbAkk6nZ2LSfHDpJ0cdQuVpBkFHhJCOx1bZ6W7WZWi2SKtirxpXg
         MoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SSiUovB1ZKvlSGMVvhS/vfOc7vEzdGXOp/oMPhMJjwE=;
        b=AQF+jqdo/+LjyTuFf+GxQAXTJF7NVfiDGfMo21px50OTtLaZQwI8RxyoviPwmkWJlO
         ZqlQN/AeMatoUBDmoDE7phg9W/QalPix0lEK0gOAP3ehbA5Yg3AjcO1qLxQAs7vBS/eN
         0fnZgEf9Kg9QV8HgWhH0o1sb+/E11kaQ/bABJfyOQGnBBgQ7Zc2n447pnFMgEiyUxMSW
         2PBMRturfCcb+NvQ/wLi/toW5KHgHvo9YcyCihW20ml9RoDhH8bWLQxrdIxb8awiUr8l
         erCGGBiuozm6+234JcKmSnWIW3QJBZ2j6XyfpnQFWEUP19CX3xWFoX9tGn8CIXLrJptU
         PLyQ==
X-Gm-Message-State: AOAM533XUmSlPKnlF93amFqhiLKKNjhMOuOQQTk3YaqCqRVKz3eOvIaj
        JZ7nrTYap4J7gXTfAcguBOg=
X-Google-Smtp-Source: ABdhPJzLB9dqsEJ377DeFiwq4G/4bBOdNhmaCyeB6CWo0v7dpy2Agw3PkWbDuZOqEP5j3VzTja6k7w==
X-Received: by 2002:adf:ef12:: with SMTP id e18mr12415210wro.192.1608212497764;
        Thu, 17 Dec 2020 05:41:37 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r13sm9030864wrt.10.2020.12.17.05.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 05:41:36 -0800 (PST)
Date:   Thu, 17 Dec 2020 14:41:35 +0100
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
Subject: Re: [PATCH v2 6/8] usb: chipidea: tegra: Support runtime PM
Message-ID: <X9tgD+KSU1bIvht5@ulmo>
References: <20201217094007.19336-1-digetx@gmail.com>
 <20201217094007.19336-7-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n/D9wwuYCvcRgZHH"
Content-Disposition: inline
In-Reply-To: <20201217094007.19336-7-digetx@gmail.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--n/D9wwuYCvcRgZHH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 12:40:05PM +0300, Dmitry Osipenko wrote:
> Tegra PHY driver now supports waking up controller from a low power mode.
> Enable runtime PM in order to put controller into the LPM during idle.
>=20
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/=
ci_hdrc_tegra.c
> index 5fccdeeefc64..655671159511 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -38,21 +38,24 @@ struct tegra_usb_soc_info {
> =20
>  static const struct tegra_usb_soc_info tegra20_ehci_soc_info =3D {
>  	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA |
> -		 CI_HDRC_OVERRIDE_PHY_CONTROL,
> +		 CI_HDRC_OVERRIDE_PHY_CONTROL |
> +		 CI_HDRC_SUPPORTS_RUNTIME_PM,
>  	.dr_mode =3D USB_DR_MODE_HOST,
>  	.txfifothresh =3D 10,
>  };
> =20
>  static const struct tegra_usb_soc_info tegra30_ehci_soc_info =3D {
>  	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA |
> -		 CI_HDRC_OVERRIDE_PHY_CONTROL,
> +		 CI_HDRC_OVERRIDE_PHY_CONTROL |
> +		 CI_HDRC_SUPPORTS_RUNTIME_PM,
>  	.dr_mode =3D USB_DR_MODE_HOST,
>  	.txfifothresh =3D 16,
>  };
> =20
>  static const struct tegra_usb_soc_info tegra_udc_soc_info =3D {
>  	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA |
> -		 CI_HDRC_OVERRIDE_PHY_CONTROL,
> +		 CI_HDRC_OVERRIDE_PHY_CONTROL |
> +		 CI_HDRC_SUPPORTS_RUNTIME_PM,
>  	.dr_mode =3D USB_DR_MODE_UNKNOWN,
>  };
> =20
> @@ -323,6 +326,10 @@ static int tegra_usb_probe(struct platform_device *p=
dev)
>  	usb->data.hub_control =3D tegra_ehci_hub_control;
>  	usb->data.notify_event =3D tegra_usb_notify_event;
> =20
> +	/* Tegra PHY driver currently doesn't support LPM for ULPI */
> +	if (of_usb_get_phy_mode(pdev->dev.of_node) =3D=3D USBPHY_INTERFACE_MODE=
_ULPI)
> +		usb->data.flags &=3D ~CI_HDRC_SUPPORTS_RUNTIME_PM;
> +

Does this prevent the wakeup_enabled from being set for ULPI PHYs?

Thierry

--n/D9wwuYCvcRgZHH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/bYA8ACgkQ3SOs138+
s6Hl5w/7BVkXve6VtsuqTT5P4adAwE8LOMKsR0XHw70c5khXTnLY7llcjsgeAQYk
6YP0XpHupIaF8fGjEDDohLRnyK/xAWQ2BkHyanHlolWSqYKSxssvcF5etkwiir2t
Gmq7Klsq4m9B1DeSDnhJj9rqSVhdDR+dVItPphjduL0g7OO8PslQB8m5oJUwuUNd
J9j2hFhjEeTLdJjItQEGNHBXtVzxx/b+YHFISZG3uIwnuzf0kZ6X+XgSDyONrso5
Etf2pLmQzchDWHomOoJgSgjZtTbjI9heKdVwG+hZd+hEQIS+m0kx1cxGPZrzNjh5
s61yFlYQOL1h2saheDY3OeG3k/wgATw2STIwauY+5/ERQQZhuR4UACeD2uPg89xI
0Wike8b/SWMgmv4V14nOFGNPhTTcQ3mXA+GdBzPznHwfhBXfmsfLaXXQJvA/gEjW
u4+u3MuPBkf/7t8bGwM7QY3Ia0rUHelOYSLyydKO4GNKSZO+Ldu9IRfg/7aGM70n
W6/c1LZIhUKMnOr4qXXm5ZZPYnVsDK814osk0wtqoU51auNqkeM1mQ9JrkV8fl57
7aefWjlNMvDOkpftfViwz6vYJsPqyN7e62khVWLXajCMW0K6nQie2K7DOBt0nQZL
2tCBA89CiJJzf3c/Hs9snd7H5v7aQqA9WncpYw92JXaJ/IRfns8=
=U/AY
-----END PGP SIGNATURE-----

--n/D9wwuYCvcRgZHH--
