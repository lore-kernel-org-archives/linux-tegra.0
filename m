Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E276C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:51:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08B3D610A5
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:51:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233884AbhJGSxg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 14:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233866AbhJGSxf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 14:53:35 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 086AFC061570;
        Thu,  7 Oct 2021 11:51:41 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id t8so22194540wri.1;
        Thu, 07 Oct 2021 11:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aik39+wylsu4agnF9oCbwL/UHnQpdxsbSZh9y97MRWk=;
        b=ip8yN7hBtrCnajgq6bhlXelU0GSEkMPNwGWZKF1mKx++uVJMIFL78IGdXu3ADtAFNA
         j8Dmn6+QjublPgQkW/lAblVwq1cEGcgpkj9LF9gHVzUSb9Gyhm+oEfEwBMOk3maSg5rx
         Jp+MkIQ4Rxb9e0yKphGYWjxxb8+cNU5LQXxFayNmTOlKyHOWhFImH0CsAbRAAZoIk20L
         UGV6J2MsKgN+tYgJrJsCgHjubhJYaeUR13zUkzps+uyapfV/5i5SjaOxTwACDoQcS/FA
         AMOhoZ7tPhdZF+EAjcrCbSlfmUTCLXQCA7IntO073P29HxOvLKDjnaU5ZsTq9LHJQLNo
         VPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aik39+wylsu4agnF9oCbwL/UHnQpdxsbSZh9y97MRWk=;
        b=RN0t6DTRKpXSsYxDG2+XJXnWgLr1RXmxqVPY5239mYrnQcNYj+4a5M+MT0uaIldzT0
         iimDh+srMPJPDxThuLHvWesF2Hot146OzA3AEZF/YHEFJVkv0EFMBndI83O7dQW5Glth
         0JkFsZZ8lEr49makHTyev+mQwUVVDKZvVWaRNCeoVeQGdMOCxhIZ2KI/MEao67oiUAzz
         xx+4zvraRrJSVGtHEXetBlRTsvmAxkkqAKa7A8D4ZQZRI/cRvvdB0lPXy6qEto/SK0Bu
         zv63fg5rMbCLgnO6qWNCDX6373CBCnnsDVL3N4dWM2/qSAXG3GX/PyJ3kKlP8+LTLZXu
         PpWQ==
X-Gm-Message-State: AOAM532HjmeCNrmRFXegrIEasfGoLDQ/sB+UbhVuiZ3XQnugJLjxTB+e
        6uFkdZvJTO7ZXtZVIbwylagem0mZDeM=
X-Google-Smtp-Source: ABdhPJwZbgRiFX2i+LWGNXvebM7kjPIQrS5JeGxi/aYZI/RdHI0cSHuaUGjRPNyIkj4+/4wPYUaubQ==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr18649489wmr.89.1633632699672;
        Thu, 07 Oct 2021 11:51:39 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id c14sm147781wrd.50.2021.10.07.11.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 11:51:38 -0700 (PDT)
Date:   Thu, 7 Oct 2021 20:51:37 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: tegra: pmc: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <YV9BuYSOHUwxcEjS@orome.fritz.box>
References: <20210908071724.823-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s/kDtRDvbdOd/bXs"
Content-Disposition: inline
In-Reply-To: <20210908071724.823-1-caihuoqing@baidu.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--s/kDtRDvbdOd/bXs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 08, 2021 at 03:17:24PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/soc/tegra/pmc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.

Thierry

--s/kDtRDvbdOd/bXs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfQbkACgkQ3SOs138+
s6Ekqw/9G41RefFYldQIatVwmLAW4BVON+YyGpzsvnyPpc0csriuFvsZwgh+9DoD
KtuzTCrM60SefcZpB5TJac+r9kpLs6zbQoNLZc6mQjAk0uRGmltaMtiv/kz5PYss
W7hww4gr1CE5R4TR6UVMyxBIJn0poF4zCNgMx9Q3b1Q+/fY1t3yUBiyREWX1hBPr
cw0XfdYOFQEcgbIT7WsNnD2MYoUXIIAhr65Gmo3Sze5DggwlhaeupCptLw8sK5GB
bHpLr+OSvehypzibNK1te43ldH/FGrkfmWAOSC63vaDXhG3e+8PPMTsK6U6eSLm1
pnvM/hoDQfnGHHQi6SqzAiQ88SfrL+kPGo0y5VvQZuxVfd9fIBxSbLah5j3UZ/CP
4pWDzu8C8tMdATLBg01z/mDprqNqT8RJCUFsGumtnMUbIA3ZOohllvQ9BN2IZdR8
DOD5d/bri6fci4SEMMvhrYlJDfVs3VZDQVaaLBJKoPYUmf3eLKfceNQGd78NRtgB
XjeeYN/yv0tnHpwyaUSMPxjZ7U0B1oSp/IxrabK3MYSjJkShBG70AeyBDVGsG++C
bszd9EXlOpPObWOINdbqFzZJxVT2EAMSVPDfnF8K1TZAEL6xqbPHxb4zmMMpPFeO
v3k1CG74DF7mRGycVn06B3ErgIwE2rKF5S4qt6ijXwLMnIddEyk=
=7DnC
-----END PGP SIGNATURE-----

--s/kDtRDvbdOd/bXs--
