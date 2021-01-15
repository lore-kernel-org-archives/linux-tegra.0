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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4055C433E6
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 16:20:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B17A0238A0
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 16:20:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbhAOQUM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 11:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbhAOQUM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 11:20:12 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0992C0613D3
        for <linux-tegra@vger.kernel.org>; Fri, 15 Jan 2021 08:19:31 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id a9so6391020wrt.5
        for <linux-tegra@vger.kernel.org>; Fri, 15 Jan 2021 08:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RpPzCnEbM+BB2d0m/Im6aUAG378bIlXPBSFsfBiF574=;
        b=RPaR/6hRCHnQ+gNnGZUeyaSC7TR4yqISHD0xfkduKwlk82dBmjI4mUQgka9fO5b4wT
         25GiDs1lxVr/QYgX1RayfBYK03F24bAcKBxkm1EO6v2pG0OZU8T4aT4CWjZRSqHQT5n1
         Xfdz6MDRd45r6/1I9n7EQfHkNcAr7VcL+e3f9eWmK9J3ZjcyxQ36/iV3MwCKXqAHTC3M
         64tWZ4S5NCCy/c+pmj9Hew4C/h/oMdGT+jT1odw7QBYT1LUrZ2OAS5L7z0/hjai7Vrvq
         RLgE197yc8+HCb2Y+bsHrMkp+a24hCtZ+d8QH2Y3bvK4a5gEn/oavXouwnoRZFNklGTF
         QMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RpPzCnEbM+BB2d0m/Im6aUAG378bIlXPBSFsfBiF574=;
        b=fxAZvz0XkLE8QK1JVxaE8KLZxBWSwsj7EN/pdJ+t/f1naj5K3fA62VaCJQrS7f9CGF
         9C9krgHKO/QfX8z92itq2Si5zVz4A4/69U93E7mNegT0quAqVoX8HPMnLWJnD9Ty6iBW
         XNw9s2CGJ7o+hVPDEs+CPzU8oGUH6DMevE9D1Y7arlunSKhNPightDjOuE3o4VwzN+nw
         UtRP2odmzRZXKunM9hJdjFeiG9Ijl7iDHA8+BPeRurbIXLqyjNpl98MGwGjfiRcrXhlg
         CA+sa97V8SPfocxmt1qBafBj1JrVgH6PyJ6OMMEcM0ej9DM3DRS7Vnj/8Ml6RRxjlxZK
         2rGw==
X-Gm-Message-State: AOAM530pvhT3DLgc3kNTqt73v0+S/KlxuTtMSP0Usm5vmgrzjeM3OH4Q
        DTBvt/tnedgt5YIixcdhePw=
X-Google-Smtp-Source: ABdhPJxI/1qebtBMwV2A+7PnO2NFrZmWL3t2YplgpKTfiyhRtly+Trpe3P6Tv9qFmY8toLqkl/zyhg==
X-Received: by 2002:a5d:488b:: with SMTP id g11mr13912820wrq.5.1610727570409;
        Fri, 15 Jan 2021 08:19:30 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h5sm16133986wrp.56.2021.01.15.08.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 08:19:29 -0800 (PST)
Date:   Fri, 15 Jan 2021 17:19:28 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Anton Bambura <jenneron@protonmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 2/3] drm/tegra: gr2d: Correct swapped device-tree
 compatibles
Message-ID: <YAHAkAnLEboum9xa@ulmo>
References: <20210112181421.21293-1-digetx@gmail.com>
 <20210112181421.21293-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="viLLSfZxethDFzaM"
Content-Disposition: inline
In-Reply-To: <20210112181421.21293-3-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--viLLSfZxethDFzaM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 09:14:20PM +0300, Dmitry Osipenko wrote:
> The device-tree compatibles are swapped in the code, correct them.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/gr2d.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--viLLSfZxethDFzaM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABwJAACgkQ3SOs138+
s6GwPw/8DVDOcrQKCDjZUKlO07aWrNYD93d4elWbRwvEDxCxV2IuXlFEUjBLG8nE
xieMld7kojjJFAFSDMDzt7sjGtK+5toejnhRZmPToAO2sNT6eTXTz4vhTlYXy0XS
VRgwPfWJGdXh/3+Jr+KrhBM/VPDsb7d4+y/GbKPpcloTDtDzfoAC4SBqREutq081
4nZ30PjaBr4Wuu86Mpep8O8nRgTDQgiBHcX7kkZsuSR34K4gEnIdZSoA0fPOp1kS
xtfdwVvco9riVGEvwwiHuEkF/UQkvv8K5ySXmD3USuVw6AJD5yA2Hn6DFvrnTQEw
lz/5jBC46A4VsgzRRitnJw8Txx6vbZpS3KAXXkdHpKdIWn4LvzsmOrbDaA0zGw5A
peFOsHQGbUfCUjFuPyxg0Z9ZC4/3ZeZIs268jG96bihI9cg8rSYDYx+8oMxnvp8O
lJ1bi+HZLNr4YwXTQt2I8Qo7nm1qvSuBIAV7MwbXjsnPZToott2+nlvRJtcOT+0A
GDbB2AEbrkm6ITGEFYwChGD9NYD0REw1fD7RPLVgrvPbWiCxc44y2RMMA+rQK0Xk
ZHgefvzI3pUtaY7gYs3jb2bP+naKXXr3F69aNelV4OIKU4RqSGF8zBxoV4z13W82
JPQCGl0s1h+oQwfKCuphcYDYBesHgvLKiVqeMRZz1Igr110B01E=
=WKK7
-----END PGP SIGNATURE-----

--viLLSfZxethDFzaM--
