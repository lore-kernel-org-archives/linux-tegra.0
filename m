Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D05C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Feb 2022 13:25:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231898AbiBPNZy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Feb 2022 08:25:54 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234076AbiBPNZl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Feb 2022 08:25:41 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42FA12775;
        Wed, 16 Feb 2022 05:25:25 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id a42so3237983ljq.13;
        Wed, 16 Feb 2022 05:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lOkRfnAK67kKjK4/79VZhvtQ4sw0j39PjhZ9eFLB3so=;
        b=R1NtB7ax8LBmgh31v/0Bsp5y/iYNzYwAmukAeYwmpNINF+SAd/2h0+E6Yz1eoFemmc
         kXoOo0xmTdBD9EpYtddwXaBKsIEwuvZXigDanvghwQkEtO4meL/rKDpPPnVK42NiDYDI
         8QMoxVBgd3rBUTOBpPkx17oNYb1T49QyG9oZzGaRkvEVu6eJN7jV58SJeWWHL34ROpjz
         BtcXGKEFnqyLtJzvHfPdKw+2BGbjq4bUq/doapWFv1Jrq5SxA5StXLn6zD9bD45fHVnr
         232jO9gbsGFocxUZ7EvcyaUw+edG/OZEyv7DUm6dIgswLcQCrKPvB1yD//s1gKxvP/ck
         cKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lOkRfnAK67kKjK4/79VZhvtQ4sw0j39PjhZ9eFLB3so=;
        b=Bt7dsXCVXM1hQHEgWDO1dLPfIjKWtAOBJMhbdcEYB+5ufdG0T7b0S55Z/6MxuNmnxN
         gjjcR5GKK33XPiQ8J6Rg95bIFddH3hxfRU3jTL1Hf6+0ThoWcMOapJaBCcWm776RzcJg
         JOkovdV61uRyn5dRx8dz7TeCNUbBi0ygfDJzmMCr8Ej6U/VHq6Z9nVlaCV3V8HdMJzfW
         F6git0pS00GHQbBbRw9hXcQLONakTEmtufP31jyviSvApeol68lECAGos9DRuBAC8WZA
         Fw+lQwXKnEqVSydY2grUr0HunIIcPGsyUHJd2p4YvfMZm/zHQ6Xo5/WMqLABCzgYPhMw
         z3Jw==
X-Gm-Message-State: AOAM532PAX3LxnoIhuPikolVueebcOewGb6Edp40U1nfchkdg2DY7fNX
        czEeqMvPs26C1In5jAK3TQ0=
X-Google-Smtp-Source: ABdhPJzG+KWM7JX7Pbf0JWplz9UI+LWoWlcmpKTGSzwKMkz4wWdoLkxZY6G7vMEYaafdItFdy2/dXQ==
X-Received: by 2002:a05:651c:179d:b0:244:c216:5598 with SMTP id bn29-20020a05651c179d00b00244c2165598mr2156415ljb.484.1645017924083;
        Wed, 16 Feb 2022 05:25:24 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id y39sm2987078lfa.27.2022.02.16.05.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 05:25:22 -0800 (PST)
Date:   Wed, 16 Feb 2022 14:25:20 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: arm-smmu: Document
 nvidia,memory-controller property
Message-ID: <Ygz7QD4EJX3vZJtD@orome>
References: <20211209163600.609613-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QdP3IMTJOvZvvtKr"
Content-Disposition: inline
In-Reply-To: <20211209163600.609613-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.2 (7160e05a) (2022-02-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--QdP3IMTJOvZvvtKr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 05:35:57PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> On NVIDIA SoC's the ARM SMMU needs to interact with the memory
> controller in order to map memory clients to the corresponding stream
> IDs. Document how the nvidia,memory-controller property can be used to
> achieve this.
>=20
> Note that this is a backwards-incompatible change that is, however,
> necessary to ensure correctness. Without the new property, most of the
> devices would still work but it is not guaranteed that all will.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - clarify why the new nvidia,memory-controller property is required
>=20
>  .../devicetree/bindings/iommu/arm,smmu.yaml     | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Hi Joerg,

can you pick up patches 1-3 of this series? DT bindings have been
reviewed by Rob and Will acked the ARM SMMU change. I can take the
device tree changes (patch 4) through the Tegra tree.

Thanks,
Thierry

--QdP3IMTJOvZvvtKr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIM+z0ACgkQ3SOs138+
s6F+NhAAn5xDNKRoblN/jQS2iO8okgeQy7nLasXqGnUTnZOVo3uJjJTjlJTT3kLH
WsOl1n6HoOfXuBigBlp6YAgCSaAnL22ALHz7rdseOKiZcVC5+sMzgv5y/yYS57r4
ay2xlSV0COLxnBwKkNapqijSL9iOxQP+UFxh75r2aAc+qA6qN8E35p8TfBj5NLUX
P4Y4rqdFic4ZULsngj9hlAmlI9uTHs4ltF+/TigKA6cOwTB2cw3jQd9jstib63gY
z07CvPs7GiaOlKl9gXXX6/0iOYtlE3C0GgO42YCgzMXM97F56nh+OOrZY4LOlIPS
g8KAE27wGk4jjkjUgKYjiBNqsIKkvLSqqFg1ZqRaFDkiv6Z6oA7vQ4L78kOrrS1B
g9O2lDNietS/scJXdteN8bqCRhEpqQYtiUEEMlEvRQV91QGb1iRoH78JlagzoKkR
WnzFBe84yw/CJQ9DO3QIfg/Zaqn2aJOzOlsfxwlieKWCyBSmMC9yDMl4Hpb7imC1
f9MbklJ4ORiVyltemtOuFMCvSjgXDmVsOArrAJk+w/6WV+JsvYfLWU5Bm0+TVdtl
I6eSy98XGI8ZQE8dzlGqiF1QZ2rytUE3zCwBz8zG/SiFKFfdWUaxUkB2jr46Izcb
6QSU5X4jaeKL2B69FROt6IoWoX+rPmvhRVrZqMmtfu9Aqc6JI3o=
=7wVH
-----END PGP SIGNATURE-----

--QdP3IMTJOvZvvtKr--
