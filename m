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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C159C4361B
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 15:03:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11CF92396F
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 15:03:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728131AbgLQPDM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 10:03:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727394AbgLQPDM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 10:03:12 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0753C061794;
        Thu, 17 Dec 2020 07:02:31 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id i9so26926733wrc.4;
        Thu, 17 Dec 2020 07:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vL6UODLD0sWqJcZPYNQCNPrMnCLRar1aQteLA5mURjA=;
        b=fp8IktJ8To5v2kEgpGOM/nXnVnp3WgdnTiAXa1yv14ytq3mYv6jFVLrFOHXTi5i/D6
         uazegOhqfItoeigWtNcSh8EEI3VafuzqQ+1kuwDTGEz9WJI6r8rukJDrVpm4Ua0kYxFo
         N9c+Tk+ME0AvBMDM9wV/TfR5FUg+2sURxaEAbrN0o9DIJznLK2K55iPQSMKbGqiMwmyk
         jMU9tmtVJ5SQs8AqO/VYnlh00ZZ5dd5WmhGcOwyrvxc9414QUL7MVWGbq2ssdY2hd7le
         0pguALwDBk9xRQBXsvrk9kB53BDNz5zFCQGGFas/McPf5dEstRxYx/wi2AVANDhcY1Q3
         R/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vL6UODLD0sWqJcZPYNQCNPrMnCLRar1aQteLA5mURjA=;
        b=lbCYHxZDkJg8pY5ePd4cwi7aheaoUD251JZf9cYaweX+12I1+h7M8RNdkNXxg71jMG
         RfUTzT2SPfNUDXIeMkr8T9/724cdhZJDPBg8igwVjjPlNG4HFVsp/I4sXW0fiGIxXd1q
         Dle2aejbqor4iqLur2b/SINnAWmQlMHqAfXjJMl+2DDpyBMPMuoxVena5GSEncJpwZHS
         Gg/ajUZrX+ATql0XzcyPI7zpYmn1J6uFbYYb30bZrpaEZsvjBD2a0OedIPU+AVoOJ3Gi
         vZ84pDUQ/hHushxP4rpLlN94TamxB3y/Z7bctNw/eYr3z+PAwbHz4yZN+faBRMTiwMyg
         g0CA==
X-Gm-Message-State: AOAM533T2xtnFwh1PG8NSOF+NUidcIv80N/FhWMOxdSLn+Qn6X4pd5Df
        ZE68kDXG9VqNRmO3/QUmPPQ=
X-Google-Smtp-Source: ABdhPJxR8odVpv2JcMMWASVApMOOn/CEb0NsFnlSpprbTzqitHWue2Ai9Trd3po7aTTnBKpntB6PTw==
X-Received: by 2002:a5d:4349:: with SMTP id u9mr43137225wrr.319.1608217350410;
        Thu, 17 Dec 2020 07:02:30 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q17sm9063519wrr.53.2020.12.17.07.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 07:02:29 -0800 (PST)
Date:   Thu, 17 Dec 2020 16:02:27 +0100
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
Message-ID: <X9tzA4q8mv2j13yo@ulmo>
References: <20201217094007.19336-1-digetx@gmail.com>
 <20201217094007.19336-7-digetx@gmail.com>
 <X9tgD+KSU1bIvht5@ulmo>
 <28468e30-a832-9774-bed3-ac986aef8831@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OW10L9f0L2MzRxHp"
Content-Disposition: inline
In-Reply-To: <28468e30-a832-9774-bed3-ac986aef8831@gmail.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--OW10L9f0L2MzRxHp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 04:45:03PM +0300, Dmitry Osipenko wrote:
> 17.12.2020 16:41, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Dec 17, 2020 at 12:40:05PM +0300, Dmitry Osipenko wrote:
> >> Tegra PHY driver now supports waking up controller from a low power mo=
de.
> >> Enable runtime PM in order to put controller into the LPM during idle.
> >>
> >> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> >> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> >> Tested-by: Peter Geis <pgwipeout@gmail.com>
> >> Tested-by: Ion Agorria <ion@agorria.com>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/usb/chipidea/ci_hdrc_tegra.c | 13 ++++++++++---
> >>  1 file changed, 10 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipid=
ea/ci_hdrc_tegra.c
> >> index 5fccdeeefc64..655671159511 100644
> >> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> >> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> >> @@ -38,21 +38,24 @@ struct tegra_usb_soc_info {
> >> =20
> >>  static const struct tegra_usb_soc_info tegra20_ehci_soc_info =3D {
> >>  	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA |
> >> -		 CI_HDRC_OVERRIDE_PHY_CONTROL,
> >> +		 CI_HDRC_OVERRIDE_PHY_CONTROL |
> >> +		 CI_HDRC_SUPPORTS_RUNTIME_PM,
> >>  	.dr_mode =3D USB_DR_MODE_HOST,
> >>  	.txfifothresh =3D 10,
> >>  };
> >> =20
> >>  static const struct tegra_usb_soc_info tegra30_ehci_soc_info =3D {
> >>  	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA |
> >> -		 CI_HDRC_OVERRIDE_PHY_CONTROL,
> >> +		 CI_HDRC_OVERRIDE_PHY_CONTROL |
> >> +		 CI_HDRC_SUPPORTS_RUNTIME_PM,
> >>  	.dr_mode =3D USB_DR_MODE_HOST,
> >>  	.txfifothresh =3D 16,
> >>  };
> >> =20
> >>  static const struct tegra_usb_soc_info tegra_udc_soc_info =3D {
> >>  	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA |
> >> -		 CI_HDRC_OVERRIDE_PHY_CONTROL,
> >> +		 CI_HDRC_OVERRIDE_PHY_CONTROL |
> >> +		 CI_HDRC_SUPPORTS_RUNTIME_PM,
> >>  	.dr_mode =3D USB_DR_MODE_UNKNOWN,
> >>  };
> >> =20
> >> @@ -323,6 +326,10 @@ static int tegra_usb_probe(struct platform_device=
 *pdev)
> >>  	usb->data.hub_control =3D tegra_ehci_hub_control;
> >>  	usb->data.notify_event =3D tegra_usb_notify_event;
> >> =20
> >> +	/* Tegra PHY driver currently doesn't support LPM for ULPI */
> >> +	if (of_usb_get_phy_mode(pdev->dev.of_node) =3D=3D USBPHY_INTERFACE_M=
ODE_ULPI)
> >> +		usb->data.flags &=3D ~CI_HDRC_SUPPORTS_RUNTIME_PM;
> >> +
> >=20
> > Does this prevent the wakeup_enabled from being set for ULPI PHYs?
>=20
> Yes

Okay, it should be fine then to keep that WARN_ONCE in that prior patch
since we should really only get there if there's something seriously
wrong.

Thierry

--OW10L9f0L2MzRxHp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/bcwMACgkQ3SOs138+
s6GiVRAApwu7yA+zMkklRAeRtXQxIO8UzUaDfB7k3WhRCO64o7ryP6SCQo92O65J
dRKf5ahUn+eGlKrWTvpzM+WLpXo1RU3Lta63xM3zDmuyO2NH9ut9+G5NRJv4aHtL
VoydZvONdKJZ4VnDL27ARNwqO8fh/rAm06eVQKzSl7pKMzHgjCTMOyMl6knUiCij
8gVsOEiBEs2G8+UW3M5J/k6Q2tAhcoemJ27ZcRzdpOEko6nZLBgmW4d937TimfYz
15IWWWk7Zix1F/qcuYj4lYPGfnkVijyP73nLgW7t9FbVQYIq0ni16hQWOMMo3ClP
35Yxr2S0Ova1BBTriG++BqfN4cBvIpghlseb0BjIxPbWkFznErIiySGGC4zixUVM
wErInEvZIAPS5M4Gj4Le3hHTCjdUwFktIIAoExwFp+ttUsI1G4VmW/dEcOH0ZqM7
nns4jWreNtZwtk450CtdtQMcAPan12JhvanuPm97h+dDZpDqFQVhZAA0Lk5/8Bo/
Trx8BTsyMRV4jOtKCVcNarsdN/5NefWZ0zwizgMDX5EmkmKm5Hbh4UZO5DzJfKGf
sHg2k7l4lsw+V7UeK/SL5RzjchaCEoIkFHBHyeoUwhKGl8VyTkxGoh4nsBvCSu2A
SGI5Gmok+hfna8WEXgl/qhv6NPACdW9EnC5YxuUyjuC45Mf0XTk=
=m/92
-----END PGP SIGNATURE-----

--OW10L9f0L2MzRxHp--
