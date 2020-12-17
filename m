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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228CBC4361B
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:46:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2CDB2396D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:46:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgLQNq0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 08:46:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgLQNqZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 08:46:25 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 527E4C0617A7;
        Thu, 17 Dec 2020 05:45:45 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id k10so5612589wmi.3;
        Thu, 17 Dec 2020 05:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rYsQcSifJBjYzEUAylJET7ZWFapvbTBxNtMFPXvIx4Q=;
        b=PPoMd+5wVNGHhLEW70pLNwmZJB3daMNJW72MDfaslVtNRqhTvzWUhZxu6oUfU0kHZ9
         BE/fVPHRn+c7dN6IHSt6THG3ADtYPJdXA/KnE4gRo1JjID7jqGGEfJI8DZ0fInpu0DdL
         EqoPIwZjW/zbwNgcBm9v3Mt6ieYg28/k3wshznBEF9mcRlJvYjXXL6LyGvgCwsdWyeX2
         ulvsOZVNpyDIUfuweccpbbnIisHu4lyFfSnsNHJtkDMnRPYFPzgQJc05nP2+TELIonvm
         /KQH76R1hOy/kVr3LHQxiaUG5ynAn2OICEVhhR8VnQ1oPIGF4VhBEBK1r58J0CTOyCxm
         bjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rYsQcSifJBjYzEUAylJET7ZWFapvbTBxNtMFPXvIx4Q=;
        b=ZSOdv55r+30Urm3xeOkpQJqeuGury5Yo+wYqdDnTPzl8WYFpbSnHiWNBRcch3dnlru
         3yG+VPG6HjKELh4iR1KBCqBIThqQKRxsarcI0G3yZ+XB/QZZYs2XKIs64b7d/RFpEsI5
         ZRvdAqLacJoPTawDlQ6If5OObyHI0Vh7z0hgv9qIclLAl21uGuplpv7DYE0L/gXLKC5K
         0nTNvNaj0/F4weL+SjxmzQKFlACVeVP4E+9ScNj4ijE0F3GWpA3kK2EZxKq/F25pGUip
         rbzdihOx4VZ6RPQKmGAoX5re9BX8bkv9VAga7O/x6LlyVz62HZxKv6cKMoS8N9MUEuoy
         T9eA==
X-Gm-Message-State: AOAM531eITBn+OgTEGm9hEpSfkWdVTiEnUXoOXZkBaMOpO4P7LHNPaLk
        /1bnnfZiIuJPGRmZFc0dTiA=
X-Google-Smtp-Source: ABdhPJyIltf6RWYr3L+OhyDJ9uNFV409+8fyF+xTY8gmG/AH2zKgXuP3Ov52HdsivhpF480PN1Dtkg==
X-Received: by 2002:a1c:7710:: with SMTP id t16mr8633011wmi.11.1608212744111;
        Thu, 17 Dec 2020 05:45:44 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id j7sm8125426wmb.40.2020.12.17.05.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 05:45:43 -0800 (PST)
Date:   Thu, 17 Dec 2020 14:45:41 +0100
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
Subject: Re: [PATCH v2 8/8] ARM: tegra_defconfig: Enable USB_CHIPIDEA and
 remove USB_EHCI_TEGRA
Message-ID: <X9thBR0QQY6MBi4R@ulmo>
References: <20201217094007.19336-1-digetx@gmail.com>
 <20201217094007.19336-9-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TcJYtQr9XJ0HXist"
Content-Disposition: inline
In-Reply-To: <20201217094007.19336-9-digetx@gmail.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--TcJYtQr9XJ0HXist
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 12:40:07PM +0300, Dmitry Osipenko wrote:
> The ehci-tegra driver was superseded by the generic ChipIdea USB driver,
> update the tegra's defconfig accordingly.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/configs/tegra_defconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Greg, Peter, it might make sense for this to go through the USB tree
along with the rest of the series to make sure it goes in at the right
time. This file doesn't see many changes, so I expect there to be no
conflicts with the ARM SoC tree.

Acked-by: Thierry Reding <treding@nvidia.com>

If you'd rather not pick this up, I'll just wait until the rest are
applied and take this through the Tegra tree.

Thierry

--TcJYtQr9XJ0HXist
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/bYQUACgkQ3SOs138+
s6H6uxAAh93w2y0dSzDquFO2kapHRFTPArcMPoqEx7HlitAUiLUkEoZi7IBkEREh
GEyVEZkpxILKjL9sEQn1U+W/YoIFcN7uGN29iU62oCSqNxfPlgnVbze+GaANiTWt
tvTidIYekLIl+hVYdB5VK0f3W/IPQFqTbsaRBntVNHKiZFavEs8Oy9jRoRi5VveM
Br6hU2WcNydgR7roBe61GqW59ZgoadYmkKOGbSKRIPDN0uyO/ompmzfJtSKH7fkI
zJCPs0AAmRiOzuwxZHpR17Z/kerF7BvNULe6ukNNOdezR2F5mBziAc+lfePsyraX
b5YCOR1bS8Xn/eOvuLMqmMoVVXS/2AZWtog6cZXFEBn61pxHthj4aspzDzle0JTs
vLGDjApZ1xhyomqe91xeA7QSOc8nujjfn5iSPzuBohKGjXljdSN0Km6UEQ8KO2dh
I9o1SB4gQ1GU6Qwk8mTJRY1zdhAdyKXmkjlJjvdhzTgDns6fN2oo76rTv82WwjVc
+MRUbueHuABi7+lJDBQJrVUoqXf1F2lIGKK0/C354ev7aP6fmTASE8A1TUFE89qD
X2PQJd+AIoORTEv1+5geaKHyvUyI7utSMlr2Au3hIw/Hp4WY3scpxUNYk42HrBHt
pcSlEu5RnReV+sJRSvOOQNeUyHanzU2SHvJcmo9P3jh/kFR28sk=
=//h7
-----END PGP SIGNATURE-----

--TcJYtQr9XJ0HXist--
