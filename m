Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52C0C433ED
	for <linux-tegra@archiver.kernel.org>; Fri, 14 May 2021 07:23:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A087A610A7
	for <linux-tegra@archiver.kernel.org>; Fri, 14 May 2021 07:23:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233004AbhENHYN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 May 2021 03:24:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:55166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231331AbhENHYJ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 May 2021 03:24:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D30BD61446;
        Fri, 14 May 2021 07:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620976978;
        bh=4uovLNiP8wL68lGCib+smMClDIwTXY6Ukg4CRe7CnP8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ITGEB8B6AJcfppHTwVi+HPsQkxeB17rkdQoYrTT9ZjSVXqEyKjB2AvCgXmRnjc7O0
         LHbeyUuAvcR/CfaggQApqS0PRmum5ZcTANOS5f0MkIBZ3pJ4avCeijhkZXFJyOUTwU
         Vs0zIPTEQQr6Bloh5d41hxeLW7YdqRtEbPBZTvDEh6ynmcstqG+U7bynTkSgaF7Ltf
         PjCLJd704QPYyvATxteP/lEhiTIeVewXAgjoTnsPkyRkdooUnAWDnBVOWNveMzvcaM
         ytI24IzTTaBN6BLVx/q+Gaw+i458xryZQ3Y6+aCQKzCAsA6zEvScT8PDT4+O18smwu
         +rA2qbxm8is4g==
From:   Felipe Balbi <balbi@kernel.org>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] usb: gadget: tegra-xudc: Constify static structs
In-Reply-To: <20210513200908.448351-1-rikard.falkeborn@gmail.com>
References: <20210513200908.448351-1-rikard.falkeborn@gmail.com>
Date:   Fri, 14 May 2021 10:22:50 +0300
Message-ID: <87o8dd7p9x.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Rikard Falkeborn <rikard.falkeborn@gmail.com> writes:

> Constify a couple of ops-structs that are never modified, to let the
> compiler put them in read-only memory.
>
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCeJUoRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUhY1wf+ISKWTzlCSJcnNPfbpwl4UlNbvUhEz6a/
E+E4KH/UViPlYw5RX12wXNr0FlLtiZqTo39DnOTWXvMV/gcSqBxrJxc3Vwhovti4
MBktFvJesYOrnp8CQA4awBASoyF1ZzcOyFMlejNqh40TrUtZBiHDyL1g7hfMzDHC
F0k8hUDoGWLCgkabUXFIcEI+1qTuM9yA7PpuWHq+YOo8tLgQi6oRGJUPL6dLXvJA
U7H8QMB8piqnx31BYaphkLLxTta1lxSThzor+rKcgfIjYs8qKA6tJZq+L7g+qWaq
HBHavJO1E9xI+DJes5tpkhsMPNCzQVwhHe33dAB10/tJH1PlLrDEKQ==
=HS5v
-----END PGP SIGNATURE-----
--=-=-=--
