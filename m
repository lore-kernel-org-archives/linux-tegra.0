Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743C1C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 14:56:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C32C61039
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 14:56:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235142AbhKLO7R (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 09:59:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235246AbhKLO7Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 09:59:16 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB1EC061766;
        Fri, 12 Nov 2021 06:56:25 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 133so7982908wme.0;
        Fri, 12 Nov 2021 06:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JCqVUzOzEGA4JkXqmf2+cqP3C2tmsy0AnOVF6rZCuc4=;
        b=m4kSxAI2d8o+9qJr6+UPuYzZjtwofpmxkWdXwVzXo3doQFfYkWLbKIzzXdAoNuRN0B
         3UBxeSWsDlVB4JHJvK7oXSSuqxlhBK+UMXMTaUuES9E+8TSR6uTL5LOHALc6s7KIQRpA
         f+5822Yz4gckl0F58hz+LmttUQHHQMM9HasiW5IAmNuDnzxN+oUsqTx9JSbRWnxNFvDA
         uk8D3fBS5Zaj+124/+mCW6g31JhGKbiFs4ct0gQgN4I8glN43nOQHoyAl1y/29Dcbkez
         /NRlNakTdv+R47uhXUd8nWDBt/DQNAV5P1b71WwzlyRxc1typXvR2/pyw0hs9DPSF866
         tr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JCqVUzOzEGA4JkXqmf2+cqP3C2tmsy0AnOVF6rZCuc4=;
        b=jRgLAH35d2y9YDGxubCH5SLEoTh+HbrXWJ5pvZY8wNZeD9GmFIan1VKdQS48UWMxK1
         xQDWACq4cNnM/gq3bmniAOHYZBeNzEA9dqnt0nbE5xDwDnKYXZgMJXkJbf2WV+2FKcK5
         d4ryUo6H8M8EyVlvPqtptOpkJfaqd91F5whPZTjqLERrbXms8Jycdjy8Bbd8cMU2sGni
         rJ/fm5RR1xQw9N/xQqtFBt1AnGiNyZln7IiGPAWuff2wIZCMPCdbNgco08hr+Iu0CSJd
         8HXsG0XihpdjuR6nlhaCsml/6ohac72ZtY4uAPb/FXVKtHVWHWXFj1R1SuoqwQPUaEXn
         USKA==
X-Gm-Message-State: AOAM530T3Uby6ZeVQnZWvG944AFbCZreTfGFhTbskas/qWHq2/TuM0c2
        4o4aktkVH9AXVIk/dVEUL1k=
X-Google-Smtp-Source: ABdhPJxksw1qU0cW8bIxV9dRicQ97DWaZ82PYF74HlxiYdecbV5alqNSZosmQkAhil1NpGWpUXPz3w==
X-Received: by 2002:a05:600c:4308:: with SMTP id p8mr11848789wme.132.1636728984574;
        Fri, 12 Nov 2021 06:56:24 -0800 (PST)
Received: from orome.fritz.box ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id a12sm5819733wrm.62.2021.11.12.06.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 06:56:23 -0800 (PST)
Date:   Fri, 12 Nov 2021 15:56:20 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] iommu/arm-smmu: Support Tegra234 SMMU
Message-ID: <YY6AlFhZFaUoIkBM@orome.fritz.box>
References: <20211112131231.3683098-1-thierry.reding@gmail.com>
 <e19479d9-f0b4-5347-1a43-2fcf5224a090@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YzV9+/LPAQG+ci/z"
Content-Disposition: inline
In-Reply-To: <e19479d9-f0b4-5347-1a43-2fcf5224a090@arm.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--YzV9+/LPAQG+ci/z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 12, 2021 at 01:43:54PM +0000, Robin Murphy wrote:
> On 12/11/2021 1:12 pm, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Hi,
> >=20
> > this series of patches adds and enables support for the ARM SMMU
> > instances found on the new Tegra234 SoC. This is mostly similar to what
> > can be found on Tegra194 except that there are a few more instances to
> > meet increased bandwidth needs.
> >=20
> > In addition to adding support for the new Tegra234 compatible string,
> > this also adds a missing description for the nvidia,memory-controller
> > property to the ARM SMMU device tree binding.
>=20
> Besides a nitpick about the inconsistent enum ordering in patch #2,

Heh, yeah, I'll go fix that up so it's consistent in both the top-level
compatible property description and the conditionals.

>=20
> Acked-by: Robin Murphy <robin.murphy@arm.com>
>=20
> for patches #1-3.

Thanks!
Thierry

--YzV9+/LPAQG+ci/z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGOgJQACgkQ3SOs138+
s6FPbw//abAd6QKSSqbcGCDl8InqWLdNRjR3JNpKWAM8Dvib8JJ2NSbRGaveExqJ
7xLI556MCIJzuX9DEFW+ay1SeVnW/KZwANl1Y/DSq29n8W+makepo523s04TsIBE
VpwsgHlvoVIslWvex0n31M+EjKy+udR6/lQpTbBmuMDIG6ETH/cZ6XBkqwGRPbau
EnCi55JSXQWujbOgKrCSAajqSt5AgqXgIzFzZBqbPnWnZf8ESOicTfQwdwpwOeCS
IQqYbPfh0vdZ7C6wnTC4CFXqv4//WXjTPALh5tz0qi3eKP6nCOVO9psh9eVMbHGs
949MghRv0hrTf2V815Au2fqlf+Gf0LMizWgbi6EP9mRQkKd9nXFhHKa0ime86Ryd
V5QzTfcHQBuW7+qv8uQNHRn8cBxsmoMxIkpaoGRoW0Okt920c2SkXXGzOZ37d/lK
joea6gwnJj/rEb6xy2Vbn0oEkaX2HpzHEDB0aB6N+/mKx7ZGXesNafW4nSW+xaPD
VYmjx74Hv6vL+cw0idLkR9ifU5MLVdcJiLwevuHy/bOdH8K11nopo4uM/MigWGEd
8UhcDrbq6cPGof9zSf7T/noyNHW7+G/uaGaE3SSDvBleQGS1iWho7rp7mxO37Kf1
9jbfBjI4PQMqkKKE6y/U5UqrMCxiatKJPlhpQrR7dZNuPJvKyqQ=
=imbm
-----END PGP SIGNATURE-----

--YzV9+/LPAQG+ci/z--
