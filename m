Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784B2C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 17:02:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C70660F44
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 17:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242368AbhJGREE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 13:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238287AbhJGRED (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 13:04:03 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D88A7C061570;
        Thu,  7 Oct 2021 10:02:09 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id r7so21102638wrc.10;
        Thu, 07 Oct 2021 10:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4i3GVmpkBuD3m3Dx++9hKY9H5Zr+5vF1Cseny6w5ZcE=;
        b=ayFMQsGJOdGUZ1MVTHTYDiZ1SQc6yze4ghyhItnIni3RQ6J67klDWuwGH42IOH+nJg
         5tlO0ZVqzUWHDqJLUpaD45xszQxcRtBv1p9VUHdyIYwkrWRze0j3a0Is+2i7Y8ITkbk6
         N1FUIm1G1eFOpdzLtQUGzMm4NLXYV9dHfXfC7rumNPJlXd3YBtztiCv71q+ddCxGuvZ/
         QuyI8Ax8QFpUBtNsswLR8L7lBmdO0QKvOznAWLOobCnhe547npz7cDvmR27CXF58qKO+
         dtxiaB3YEP64mX3PbAyJ1j8u+XA8RrfTtXqNoXCr4AP4XRmcutHgG1mYHeMucHysNipO
         9lRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4i3GVmpkBuD3m3Dx++9hKY9H5Zr+5vF1Cseny6w5ZcE=;
        b=05VvMN5pHJqQH3svVvY/fOZceVqiFdiqLJ29+HoCRDUY4eGb86W5PGGwfghZk5SIpI
         YzTcjPT3ROq/adW2T9juRUD6HstBTDfI5XwyB9PILB9OAVR4njfBg4uwEaIg8TjbbV5C
         efaHvR4eDB76/GoRw76bD2IE9twsTTknPlo73OQSMTXx68MmgMwEqkpcq8uritYyP0OL
         sB22F/9o06byJXFweLik4PsXdd392AkM6SkdChIR3aWGMEbr4tux66dx3BzN8/POPRL6
         ewAiC8DrofyNviIz/pgqXUk+CxY7pI/XXMC+eu/gMfGurkV+/w1Qr9hIzGqso8hPFncs
         ryZQ==
X-Gm-Message-State: AOAM531jDGaPuAbmxiooun/289OZnpKbqvymiIZKm0tWBVK3nRX35wax
        NdQP+fmiwAuBI7KQBV8k9T4=
X-Google-Smtp-Source: ABdhPJztK3Ymj0FVvTj85HCmP4sz33hCB1vgj2DcsLNkHyhcBy4oQgS6eSoRfo+Q7Joqansxy3VJ2Q==
X-Received: by 2002:a05:600c:3b21:: with SMTP id m33mr5805316wms.80.1633626128447;
        Thu, 07 Oct 2021 10:02:08 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id d8sm174568wrv.80.2021.10.07.10.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 10:02:07 -0700 (PDT)
Date:   Thu, 7 Oct 2021 19:02:06 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, will@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        digetx@gmail.com
Subject: Re: [PATCH v6 5/6] iommu/tegra-smmu: Attach as pointer to
 tegra_smmu_group
Message-ID: <YV8oDrIweDV3Mo++@orome.fritz.box>
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-6-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9bn30aZWl2it19YI"
Content-Disposition: inline
In-Reply-To: <20210914013858.31192-6-nicoleotsuka@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--9bn30aZWl2it19YI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 06:38:57PM -0700, Nicolin Chen wrote:
> This could ease driver to access corresponding as pointer
> when having tegra_smmu_group pointer only, which can help
> new mappings debugfs nodes.
>=20
> Also moving tegra_smmu_find_group_soc() upward, for using
> it in new tegra_smmu_attach_as(); and it's better to have
> all tegra_smmu_find_* functions together.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/iommu/tegra-smmu.c | 94 +++++++++++++++++++++++++++++++-------
>  1 file changed, 78 insertions(+), 16 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--9bn30aZWl2it19YI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfKA4ACgkQ3SOs138+
s6Fisg//YTpYUjCFbuDVLZtxhX/A7K4EQHHaz4cKA4GOVp54LNy4eEX6BNOsHo9/
fkWFS3/4n5WmT+NRbwicvBJz2OTTDDzZfZPumPO5RUh1W95O7TaD8NJba0eKT+qD
+W9EESBwVQhDoPMC56Pfiuri+4HUY/QvPWSH90fG3eFbAuCwEOYYlEsoll/B7d+x
OmgnnZD8UQeV/84HpAZNQ5S20KmvWhXL6uP7AzPWXfU084UFt8oh4ozmPqu/qoCg
BZtxmlFp1M77UTmlwSgqVbI0F7X2iY1pmxviJjhJ0iU44UWCE5AxlKVtNwYooyJV
yIwuHh5B3VJq5F6JhHXa55OPS0IYwS4+nM9HlSDHPIYwjZCwhPxTuQ+3UfvsWUrJ
rlUyqtXJxq3juJT3q//uQk+LSBbE3HTx0gOlng0Wo3eA7c1KLXvgq0OWIW+g445Z
hV9kQPYa7aVciNYF2YvGqnzFuCZLl65zZiO5yfVJHI2K4ynO8attd6IEuioc6ML8
J0XaI7j/16l8wyi5JvQ82M4WxhHsy7Yl6OrpsuC0Jv50tIg++YZ6oxYKXfAYumaL
RzE9xwZbSlMN56gljpkhqgxmUU7ibmvxdZM681V2uydFHCEjvI2iJQfwkCtgqyjt
yRy7dkap/ebKVI6+gEijJHQIWPNM+ZN/VjDXxpFMOceW3nQVXDU=
=mbcy
-----END PGP SIGNATURE-----

--9bn30aZWl2it19YI--
