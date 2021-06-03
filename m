Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71435C47096
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 06:22:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AF92613D8
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 06:22:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbhFCGX6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 02:23:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:44700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229635AbhFCGX6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 3 Jun 2021 02:23:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34DCA610CB;
        Thu,  3 Jun 2021 06:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622701334;
        bh=7Yo+XPCnHCNrluC6WJ7gXv6X2E0WIGde6sR5bmXupbE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=u/3dn2xK63jegxkyw/+exuROa/TA60SGr72TDfe6qgmxtvhLkzqAGBAyUEbGTgBvl
         qdEBCH6CdBA6ja43fQZtNIVzUpunHmK6hqUOZ1N9v0Wa3zl9wFtb/G9yorTugD+Yru
         PkKmcWSvHouSnOD3vv1LpBLRxRIJBuyP3T02TAPj1hjtu1axGGTXAMWwwJUuaLr9kJ
         Xv0+3/o/L/TP/gw8v8STt+FGHdaRSQ2yVKe5yfD8b160w20yyQV+IDiq2Eeo64kbyo
         bW88je0h35utwOS7fKbimu78MHHl4Wabid3pPHLs714TTXTE10ynquxe4WVqJp0E6L
         0PZOK4n8HZuoQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 1/2] usb: gadget: tegra-xudc: Don't print error on probe
 deferral
In-Reply-To: <20210519163553.212682-1-jonathanh@nvidia.com>
References: <20210519163553.212682-1-jonathanh@nvidia.com>
Date:   Thu, 03 Jun 2021 09:22:06 +0300
Message-ID: <87wnrbcvsh.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Jon Hunter <jonathanh@nvidia.com> writes:

> The Tegra XUDC driver prints the following error when deferring probe
> if the USB PHY is not found ...
>
>  ERR KERN tegra-xudc 3550000.usb: failed to get usbphy-0: -517
>
> Deferring probe can be normal and so update to driver to avoid printing
> this error if probe is being deferred.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmC4dQ4RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUhlgggAmOPCyo++9COGDOkUvGUYvPTk6eVfLOGF
PSagvfzdPzTN1qBJzy7j7ypR9r8iKm3GS/ZGRb/TfC0DLgRQAiYtQDjkrY7WUhSi
lwWWv6nODKy5/z/8L3VGeD3+UEqsMk31z2vLKBLE34LFDZOhZcnPbPegLhbdaEsW
/SWQC2Ss9dcaybluvvaQOglUzcscDKSFMkTSCgjEV8lZWxXwjjqoa45IEY31gW/y
M7MvmwO3+35p/dmv0bXG1OFhC5LEmdXcH5Y/eVi0tu5aC8x1R6HyWjfgJGUzH083
UwCOdupfxlogUMHVjZ/Ycy9lalrmUFRW1RjHOa+Ea/acnQl/R6N4Kw==
=ZuZt
-----END PGP SIGNATURE-----
--=-=-=--
