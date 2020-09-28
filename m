Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C116C4741F
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:03:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D674B21D7F
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:03:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AscYWSHW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgI1NDf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 09:03:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgI1NDf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 09:03:35 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E47BC061755;
        Mon, 28 Sep 2020 06:03:35 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k15so1219831wrn.10;
        Mon, 28 Sep 2020 06:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SoJF/ZUCN9xCW1YrWACPAVGxIqM7lMBxo7F/luj4ubs=;
        b=AscYWSHW2yH8Oy6e0/86HdDM5oBV7sOeVBOfDcTSsqAMk3Ssu0QBOkyRwPh7JVr+sh
         YnWO2bCSNw2GHwPE54AMgzpE1T1GxK0lEABIUGu9D1Rp/QGkzwfUmhJor0ytZQQzhURI
         wVnX0ys3d+yBbHp44uj15tHwpijoG4ONfblUJXNByPWHsXHTiXoW1fncFPSwDl1im333
         1jl96QkiComLhyueV7dv6ikGEvz94xeeITxTZB0D8PkyIpy6hVuntfJynuWy1fcOcWDX
         +pXAR4OuCV9nb+Bw+OLf6uvWGIb885mfTNYxPScZS9gqx4jKmvBxmzKeEgNsQlG5Eqa8
         Ce5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SoJF/ZUCN9xCW1YrWACPAVGxIqM7lMBxo7F/luj4ubs=;
        b=mOTtN5yKoduMFONkWBQmLaXzNSuv1VrqbJv9XPFdFF3esNwS4M3Yz6lJICBdPWcyk5
         pmRJJ3V1jrd4bF2eLmAXGIQFPn5nXkqz9dJlg8z5UcO1wt/L+gz/16RJr4eWsUucGZtT
         wPvgbRdB6gGRpyHreUKzto/ZCOV1XmQs3PE7//6G//dwWWTkYp1vmYnvgZ5ym3MJiM+R
         psIFLh/gQoCN6V7KewOYXoSjKk1hE9D9QmiSwC0Uod4tptwd7tbduhBU3m6R4AXIfwMp
         LGHlCbYf4WXts+V2OKCgD6AjFl5zMcrjl+hAtNcYOZ6YXJt6uPIIyYOWo87Z9j93sWD1
         FJCA==
X-Gm-Message-State: AOAM530lYv2AqvvsrCq2hlw21+O6x/IDgUh2rtx2guXUSB+A3g3rj6fu
        D4xtO8wqCiN+QW7fiK8HcpvG3546Nio=
X-Google-Smtp-Source: ABdhPJyaaUoapfcf7nTahqkEi6Jw603K7H+httkiTE5dhfHQl/6vG3xi32OCF55YgZOQWZBh7wTdVg==
X-Received: by 2002:a5d:4d48:: with SMTP id a8mr1612387wru.318.1601298213747;
        Mon, 28 Sep 2020 06:03:33 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id l5sm1270245wmf.10.2020.09.28.06.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:03:32 -0700 (PDT)
Date:   Mon, 28 Sep 2020 15:03:28 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v3 03/15] phy: tegra: xusb: Move usb3 port init for
 Tegra210
Message-ID: <20200928130328.GD3065790@ulmo>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-4-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="d9ADC0YsG2v16Js0"
Content-Disposition: inline
In-Reply-To: <20200909081041.3190157-4-jckuo@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--d9ADC0YsG2v16Js0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 04:10:29PM +0800, JC Kuo wrote:
> The programming sequence in tegra210_usb3_port_enable() is required
> for both cold boot and SC7 exit, and must be performed only after
> PEX/SATA UPHY is initialized. Therefore, this commit moves the
> programming sequence to tegra210_usb3_phy_power_on(). PCIE/SATA phy
> .power_on() stub will invoke tegra210_usb3_phy_power_on() if the lane
> is assigned for XUSB super-speed.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v3:
>    new, was a part of "phy: tegra: xusb: Rearrange UPHY init on Tegra210"
>=20
>  drivers/phy/tegra/xusb-tegra210.c | 298 +++++++++++++++++-------------
>  drivers/phy/tegra/xusb.c          |   2 +-
>  drivers/phy/tegra/xusb.h          |   2 +
>  3 files changed, 174 insertions(+), 128 deletions(-)

I'm a bit unhappy about the repeated calls to tegra_xusb_lane_check(),
but I don't have any great ideas on how to improve this, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--d9ADC0YsG2v16Js0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9x3yAACgkQ3SOs138+
s6HxPhAAr+CvsHnL3hHEm16WlYSCypfAD4WXtsyuUAHCn/EMYFcN8iXng0j/x9uP
CXlaIP2f12hiqSF+zBoTYLWvQo6gA4yluklJCaRgATDF1oLOL+t2RYxL0V/UD18+
ah6MRyE2yveo5nJ7tnaeDT09wd6yv/p40Ig6/F0sTMt9yc7jXnrzYouVYiwOUFNt
nD6TJGNp4U1y0Xt41yMGZxB3ju8SI8OyZcM9WCr5ipUp7h0H1oG3IAMVTUpu9UYF
j1P2V69ytBRyCFbnqQil8q3ywyQO1TMSsBGYO7XlShE8G03mpQJCZCdxE7A7Msvs
oaD9ANtfvZS/CbthtGtGSGM9Aofy+KiFBrM0u3Gb9iRncY2iy/3O4pyc2uyRyufN
IX8DYZDrz0+khkOPiZFh5tgxfEjuMwFvcnvMj/cIu0/1x30daT3pEkFoWPw73eKz
cKUCZYKtE8zaBV417qO2S3zIAPF4WO0UVRBsmocPnkQgB9VWJuFPeYWBO2ex1Pyc
BcceMHoKK9YP+UXo6I3mZnAUn07Br8hOaRHrR5c4JFy4Kos9Oe2drnrT2R4KOZi7
PJNkmUVCY3c5Dk99ZRqNpupZIEs8he9iryE3Mr+MHIqwRU4otZuqh1xBz2FYMjP/
o/qMENcXuBmqbIvQzVMQNGY/BMF4z5Ux3kdktFpnRNkYgtH7n/Y=
=CTGz
-----END PGP SIGNATURE-----

--d9ADC0YsG2v16Js0--
