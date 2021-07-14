Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA4CC07E9A
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 07:30:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49A5761289
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 07:30:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238330AbhGNHdq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Jul 2021 03:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238316AbhGNHdq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Jul 2021 03:33:46 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE987C06175F;
        Wed, 14 Jul 2021 00:30:54 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso2879702wmc.1;
        Wed, 14 Jul 2021 00:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L2g9g7yfHG299CyeHIJtyTBc41aBL/LNrArS8gq1J/E=;
        b=uqxAQZ8IIJABNCtcWoXwRrP7e+yyOh6+hDwkhoFHMMDgTEqNHeAhh7IC7qZx5NwXkF
         skRHEujBEWiicCt55zr85elhUuO3qP3GlpF2b8PsqTPkhuxwJV77p6Gzl4XjaaCN6JKx
         KXDa5O6CijKteIyo+vA88qQdE+Ye6N9HGMlMKNdjtv5PekO7nqhndGWsCiKBTWhLJYw5
         pcwwAvFEPM+AbmaJcMJYaQbySgOOfWRoPhbfTVEPTREy+0BvdF4A2fI6Nakkd0V8N60g
         TJhe7R5UXG8/gBSPV3XX5GJB6E3bDZY9sG4JudDe46xEH9ibdtrO4ePpEW0kGFbHmkMr
         czmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L2g9g7yfHG299CyeHIJtyTBc41aBL/LNrArS8gq1J/E=;
        b=FsQcd7jXw4Zc2gSjptBDA9WBHXfc17dOir0dHbBHO28q9GtOE3iPy3KVmJRff4H7AZ
         G8Y5KUYXQvJnTZcsNfFt59AT2lzUlrcG7ju977q7E7j/aJ+5CU1sBUczLU3OcdtO6NhM
         InCA7uPujIyX9joPXlOgkQcKgKi/1tUdouJ2Lz89IjrJq4hsEFg7845JcqtzXQQk0ukU
         CGTfXjEgLtXX6mkfCeV8sivsWzVawLTwvy6IInVOJQB1bhl6bY6+LpkBgKKbJQ6G4Odu
         40JEU7Plk4wojBJ9U0BWpHChdS5u8U2r/Wnvkz5ICRoYQEjTAT6B8UN1fdlO9ek1S6jM
         8j9Q==
X-Gm-Message-State: AOAM531kochFCwvGzfJPS2rpnCEajpCxfobgnI6srKVJlDDM7m10A1F7
        /s6KQ00YAxyGepgnmK8Lo6U=
X-Google-Smtp-Source: ABdhPJymat3cBKMwhL7DHPc4P2FnxZy5OLh8NNlslYWEuiF7G9mh+gHL21oafIR8AJFfHAWm5g4Hkg==
X-Received: by 2002:a05:600c:3b86:: with SMTP id n6mr9937769wms.28.1626247853529;
        Wed, 14 Jul 2021 00:30:53 -0700 (PDT)
Received: from localhost (p200300e41f023e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f02:3e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r19sm1515005wrg.74.2021.07.14.00.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 00:30:52 -0700 (PDT)
Date:   Wed, 14 Jul 2021 09:32:51 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vidya Sagar <vidyas@nvidia.com>
Cc:     robh+dt@kernel.org, jonathanh@nvidia.com,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, kthota@nvidia.com,
        mmaddireddy@nvidia.com, sagar.tv@gmail.com
Subject: Re: [PATCH V2] arm64: tegra: Enable SMMU support for PCIe on Tegra194
Message-ID: <YO6TI8G4av/YdWRx@orome.fritz.box>
References: <20210713044414.25536-1-vidyas@nvidia.com>
 <20210713113546.20286-1-vidyas@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BF9dEAmvU+kEpJVR"
Content-Disposition: inline
In-Reply-To: <20210713113546.20286-1-vidyas@nvidia.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--BF9dEAmvU+kEpJVR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2021 at 05:05:46PM +0530, Vidya Sagar wrote:
> As of commit c7289b1c8a4e ("arm64: tegra: Enable SMMU support on
> Tegra194"), SMMU support is enabled system-wide on Tegra194. However,
> there was a bit of overlap between the SMMU enablement and the PCIe
> support addition, so the PCIe device tree nodes are missing the iommus
> and interconnects properties. This in turn leads to SMMU faults for
> these devices, since by default the ARM SMMU will fault.
>=20
> Add the iommus and interconnects properties to all the PCIe device
> tree nodes to restore their functionality.
>=20
> Fixes: c7289b1c8a4e ("arm64: tegra: Enable SMMU support on Tegra194")
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V2:
> * Changed interconnect-names from "dma-mem", "dma-mem" -> "dma-mem", "wri=
te"
> * Added Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
>=20
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 60 +++++++++++++++++++++---
>  1 file changed, 54 insertions(+), 6 deletions(-)

Applied, thanks.

Thierry

--BF9dEAmvU+kEpJVR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDukyMACgkQ3SOs138+
s6EqgQ/+LAPj/wMeq+nUQ5nsqf6m4KuMCLaOuZtjSqOwSdYnajwe65rKgq6E1bi6
dAR6nWiHpxDxsEMvPfE34JuHI/72IXGNiCUJOoycKOGabljiKZIkKTvNybghRTmR
JdAqIcKeOZEt4kegBNp3DRSjOLvIJfM7TRgeV41gWwT+W8LvFMRPLrLPlm4L+mLD
dVVjQdknVf6JX87VikPp5hiMLuaahOgn+ADr7mi9kehYSejjz2Zcg6oL4SbF9Vm3
oPHuEaNmHUWvnkwMtNG+vzsw9rmgvn/NDIRMSZBvKdzRMKCO04BYVyuwgmqbK/1h
YKdOnNUfvALFWiDVt6yUBVoHuckufNrv4JtbDqI2tfeLzaDfPVmTB9N8lRQqZB6H
PmTX6a7cZF5LNJ+FqN4p1Mnm9/ONx4Yg0VJVA939hlVybGv+X5LhvFpwpqmTtMvd
JZyWIkHDsJkvG5Byj8WrDTZvv/cYaDnWZHbH1vqDFXcQDO2ILhPqgie6pxOUzvcV
WtdhL6hOqJWWMCv2nGrKlf7ctLonVVcfva/uR3mOUVdE4eSkMO8Jfah+KWCT5ATP
NbIEbCoOQWGNHgJryGbxyhqPo54k3ZGCcN4KmFS1F03qow3E1y7bGo5wWbaxWpW4
lW8pcakgxkn5csk6j0KiAK9BvCkFZ3PnqdfWOuiF0LVMrVJsTrU=
=St/l
-----END PGP SIGNATURE-----

--BF9dEAmvU+kEpJVR--
