Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01075C4361B
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 15:06:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA23C235F9
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 15:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728793AbgLQPGH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 10:06:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728680AbgLQPGG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 10:06:06 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4D7C0611C5;
        Thu, 17 Dec 2020 07:04:57 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id g185so6003417wmf.3;
        Thu, 17 Dec 2020 07:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bwrKelRIw2P46W12+V8LfoBE7/ASZSlAN9pQ3TxWDLo=;
        b=oUp0+y3zuKEpg0X6dwedwVaRgcvY+s5BET0TxUEpClDImHGCFOMZZP54NbHNBk7fOp
         emm7Mju7/9eAFJwxr5AkUnNFRWU8iVyICeZElbyNwD0X84JBLMIighc4e7wiW1W3i/ht
         8g0I//ZG36+6VMdrUpPjYroBUnaGSZGI9g/xEZrknjvUuBBETxXZHuzf7FMYLhc93C4y
         5oAReoMp0IHAUAHWJTHMWRBKbgTICFqhEKPpOx+mb+yW44ZQ1nKRGbtnZGJSa8xRzv06
         Pr/bwwu6ept+g0aNU0QLdGBPTBQHBJadQhJd4wZwWeuFnSSdb/yRc0ElVolNYtYURSFt
         93zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bwrKelRIw2P46W12+V8LfoBE7/ASZSlAN9pQ3TxWDLo=;
        b=c0TROpf89sRrPUWTuhN7qkNbp1eXzCyHPnVuocFE0qGfGJWNuKReNQiLQCVugMLCCV
         pRVS7SmOnKIYOnho81ykt9T1PtO5OFVNY0cEDzeaKsYRoOkGcSxgU6EIceKQUqW58KLY
         SLAacXjLrMr0XZiJgrkNhsiJZcZpsniG/bLgw51Jienvo3ShaQS5BQxlWJqtolovsASy
         I/jdJjS8XHfoalZWaYQsXp/JTZoZynqc2N5NJjIKqvL3kOCK8Mp5spXTcPq4p4dlSApN
         y1PkiXBnFKhNYYiHhv4DaHvdZUQSPSutyJhUmUHwTu11aV5U/EH8dhmjdGC/LIP61Mr6
         I0Xw==
X-Gm-Message-State: AOAM532XciwHG7Npbyo8AeeldyuBTxsxi1fZfQKM9fRzRBwDTaickHWx
        q9fc+65COcWS5HskyTrLAJ8=
X-Google-Smtp-Source: ABdhPJwT9E/2K5P9r3w096GSn0TBFSMl9RpbNpnEnAqqthFNtWMWsfFCAcz2fBMSCXM1q/uBmAyaMg==
X-Received: by 2002:a1c:c204:: with SMTP id s4mr8965841wmf.73.1608217496297;
        Thu, 17 Dec 2020 07:04:56 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c81sm8877583wmd.6.2020.12.17.07.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 07:04:55 -0800 (PST)
Date:   Thu, 17 Dec 2020 16:04:53 +0100
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
Subject: Re: [PATCH v2 2/8] usb: phy: tegra: Support waking up from a low
 power mode
Message-ID: <X9tzlWYKRS9FY9q3@ulmo>
References: <20201217094007.19336-1-digetx@gmail.com>
 <20201217094007.19336-3-digetx@gmail.com>
 <X9teRPo/MadN79NI@ulmo>
 <3c204a61-86ae-1bbe-1442-527831f15232@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cOXpBbUiKUTaRQTC"
Content-Disposition: inline
In-Reply-To: <3c204a61-86ae-1bbe-1442-527831f15232@gmail.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--cOXpBbUiKUTaRQTC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 04:47:50PM +0300, Dmitry Osipenko wrote:
> 17.12.2020 16:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> +	/* PHY won't resume if reset is asserted */
> >> +	if (phy->wakeup_enabled)
> >> +		goto chrg_cfg0;
> >> =20
> >>  	val =3D readl_relaxed(base + USB_SUSP_CTRL);
> >>  	val |=3D UTMIP_RESET;
> >>  	writel_relaxed(val, base + USB_SUSP_CTRL);
> >> =20
> >> +chrg_cfg0:
> > I found this diffcult to read until I realized that it was basically
> > just the equivalent of this:
> >=20
> > 	if (!phy->wakeup_enabled) {
> > 		val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > 		val |=3D UTMIP_RESET;
> > 		writel_relaxed(val, base + USB_SUSP_CTRL);
> > 	}
> >=20
> >>  	val =3D readl_relaxed(base + UTMIP_BAT_CHRG_CFG0);
> >>  	val |=3D UTMIP_PD_CHRG;
> >>  	writel_relaxed(val, base + UTMIP_BAT_CHRG_CFG0);
> >> =20
> >> +	if (phy->wakeup_enabled)
> >> +		goto xcvr_cfg1;
> >> +
> >>  	val =3D readl_relaxed(base + UTMIP_XCVR_CFG0);
> >>  	val |=3D UTMIP_FORCE_PD_POWERDOWN | UTMIP_FORCE_PD2_POWERDOWN |
> >>  	       UTMIP_FORCE_PDZI_POWERDOWN;
> >>  	writel_relaxed(val, base + UTMIP_XCVR_CFG0);
> >> =20
> >> +xcvr_cfg1:
> > Similarly, I think this is more readable as:
> >=20
> > 	if (!phy->wakeup_enabled) {
> > 		val =3D readl_relaxed(base + UTMIP_XCVR_CFG0);
> > 		val |=3D UTMIP_FORCE_PD_POWERDOWN | UTMIP_FORCE_PD2_POWERDOWN |
> > 		       UTMIP_FORCE_PDZI_POWERDOWN;
> > 		writel_relaxed(val, base + UTMIP_XCVR_CFG0);
> > 	}
> >=20
> >>  	val =3D readl_relaxed(base + UTMIP_XCVR_CFG1);
> >>  	val |=3D UTMIP_FORCE_PDDISC_POWERDOWN | UTMIP_FORCE_PDCHRP_POWERDOWN=
 |
> >>  	       UTMIP_FORCE_PDDR_POWERDOWN;
> >>  	writel_relaxed(val, base + UTMIP_XCVR_CFG1);
> >> =20
> >> +	if (phy->wakeup_enabled) {
> > Which then also matches the style of this conditional here.
>=20
> I'll change it in v3, thanks.

Given that my other comment about the WARN_ONCE seems to have been
resolved, with the above gotos replaced by conditionals as I suggested:

Acked-by: Thierry Reding <treding@nvidia.com>

--cOXpBbUiKUTaRQTC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/bc5UACgkQ3SOs138+
s6EBzxAAq3HvcNtFiWElWKh9GGfrXYJAGBC3RHJPAOe0lYIfQlvBBbCnatiPqEEm
IfdoQcNF0EejAYZ6TvkUvICIpbJ9gNv2mes7MW+7qg4+rml76dAcVlPde0lap9oj
1J0qKl9bcwckRsCIHsa+A0NK2vf1BO/Slh4y5YqHJf6F2cU0YZBjX5DiqjYnaDyD
tx7CuZDcuwaUDHSfSZECL2fCmqdSkcUrXI3tLGTnS4OUualtZUh843Lf8fWoouAj
7ZHuA+SYx+ZgTbM7OZczx2h7mBYb4LGHAIkqyj57ZFu5GZozZBgZ+oqIp9QRw343
UoznZj/kpj64oNQI3WG8ecSG8vhObHRzgpqiX7+OzhAXMceRr41SuXglJOiqpi2d
/uk8i1sqG+SVET1BjsPukhQXetvt5QwaXQly2vMad/vNkUrzrAlefjSduKJ2i5Gz
1p4eDwpRpQ+VLZy/6zCOJjGmXUJAfCA+tUfCKcJwvaaVyLcjcKczCBomHdcwLrQG
Nii7y1ctcHxG5mhTxHDbgx9cQtWqVuSosDylVp7MZweJTYTVIHDJ/EG/Q9IUqcCh
aSj99DKpY8LMB+fvCgz+6oF2iBvjC2NoinOcV0s5AtXFbX9VDc1SO8EpLPaxhWX+
5S7dZkM2aJBlL8IWSNKCorDvcOSaU0yX/n3Ho/hEZz0OuBhht9M=
=E4e/
-----END PGP SIGNATURE-----

--cOXpBbUiKUTaRQTC--
