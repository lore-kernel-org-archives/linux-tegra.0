Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD28C43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:22:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 118852087D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:22:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQk3wzP7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgIQKWb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgIQKWE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:22:04 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C347C06174A
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:22:04 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id w2so1432349wmi.1
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5sK4Ga/gjLq/h1v5YXhWI2BJ46zhY1ZtAqhufOWtyuo=;
        b=HQk3wzP7oJNFovKlJ2ECPLXt/2oMK19nq+rIoLRbHLPkR5BkUNZiL5vmJFKgOV3PMu
         oJueDLHRWnNlQTKe9aU5zkRTvFdFYxvrNP2djrPw7tvbKq5vrTyqJlS8+zc0QCX1tqke
         BpwlTMIQdCAM/auWMLfRturtsgGdX8SRjzzCMSnDeb9sJ40CDZOK8Rob3vFhS75wApHy
         j3mpG+ybehLfCAAJeiH61pX2SvTehrk8ELxYgQylKP/kIs2rO6iUtt0agQi3f67tsNCe
         3Q4xISAdwttfdL5n2K4Ol1oYNEyIRjBNKJyd6OHQP3+55mfgAXAYFfnH/RYl0P4u+9aF
         0aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5sK4Ga/gjLq/h1v5YXhWI2BJ46zhY1ZtAqhufOWtyuo=;
        b=IL8MeJqYC6ecRDASbccrkVJCXx08KNwh9yN6YxMF4lZA+cGoMcIpSjfA4NQk0jUPRl
         RhVjFgl/8Wb7gvM2+GeXxj0YWfMVD9Q2KvdsOEbOoFFKNfjicepAUtBOH7wpkMfsZMFi
         QsCTv6kfCEvll17axPIncOxd1LzOq6bb4Kjlx4Jgj5Ew/+2jaMsLy4yxT1h/ef98Ejvz
         wyvENxS8FOaKyl/zZJmJqLi5sQe2soQxfC810wms+I+drR1iDvzhb5REY5KnMrwaqCmH
         ZPWfiw5UwXybeV1zaZqfY/ODXILVi6QspTah8PFpmm2VFfynASv7h16302af4XlZmpeN
         w6lg==
X-Gm-Message-State: AOAM530hv7j7ASSZE8aVqgotBPqYKvx4MhrHnbbGHO8I3d6x/TEn9vx+
        FWxwrlGdSI0I5WzQRLGCLI3HdoAmeznMlg==
X-Google-Smtp-Source: ABdhPJyT+yXlW7CCgB7vQGLIyuXLU0OIcpJVolpX2xDCKxRVfzE0cowJKSB5uRKHLPEy9P/Heyvmhw==
X-Received: by 2002:a1c:7c1a:: with SMTP id x26mr9700948wmc.112.1600338122717;
        Thu, 17 Sep 2020 03:22:02 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id 63sm10421835wrh.71.2020.09.17.03.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:22:01 -0700 (PDT)
Date:   Thu, 17 Sep 2020 12:21:59 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Wright Feng <Wright.Feng@cypress.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 0/4] WiFi SDIO fixes and improvements for Acer A500
 and Nexus 7
Message-ID: <20200917102159.GD3515672@ulmo>
References: <20200823144725.28299-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline
In-Reply-To: <20200823144725.28299-1-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2020 at 05:47:21PM +0300, Dmitry Osipenko wrote:
> Hello!
>=20
> I was debugging WiFi performance problems that I started to notice on
> Acer A500 and found couple problems. One discovered problem lays in a
> wrong SDIO PINCTRL configuration of A500 device-tree, others are found
> in MMC core and brcmfmac driver.
>=20
> This series fixes the PINCTRL configuration and improves MMC clock setup
> of Acer A500 and Nexus 7 WiFi.
>=20
> Big thanks to Wright Feng of Cypress who indirectly helped me to notice t=
he
> PINCTRL bug by showing MMC IOS info of the BCM4329 setup that Wright uses,
> it lead me to re-check to the PINCTRL configuration!
>=20
> Dmitry Osipenko (4):
>   ARM: tegra: acer-a500: Correct PINCTRL configuration
>   ARM: tegra: acer-a500: Set WiFi MMC clock rate to 50MHz
>   ARM: tegra: acer-a500: Use PLLC for WiFi MMC clk parent
>   ARM: tegra: nexus7: Use PLLC for WiFi MMC clk parent
>=20
>  .../arm/boot/dts/tegra20-acer-a500-picasso.dts | 18 +++++++++++++++---
>  .../tegra30-asus-nexus7-grouper-common.dtsi    |  5 +++++
>  2 files changed, 20 insertions(+), 3 deletions(-)

All patches applied to for-5.10/arm/dt, thanks.

Thierry

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jOMcACgkQ3SOs138+
s6G3NhAAjs4663wmicChZ7UUV628WApOIxKeZ2bJpoKG9twXnWliCD3icB4jEf5B
pd9hva8w/NejWrD+hSxUNUTXR7ZcI2JjALmLOSemS5xkmWBYU4o/CN8e8fA8VNdL
ZulqcFsVqFPQd+jo407eGjd7YZWPA4L+yI14twOcqU6tEyCKZ+c7XeWthWl9tRMn
0B5EA56NMhEyP4NLycJ5+pXWhV9ZOdb/T4NWsrbmKwcJt8DtA/EllqtXiG5is0k0
+awd4UUioWKU/eVDWsP/KdfALESeVPNf/77Z11lttWjLBaP9L646cnk2QGApv6e3
5PNVp7m6s4WCc7cjsykkjOSNT2rnABt7XUQBCYNR4/VGWIgqNqghPmBASYhGHwPI
Jat2nJoKLQE0W7zMfXTMoVjCASfKa/gQBjKHDSZotLY7yy0lxxoxc6X3qkvg5SMy
BwkyidxBTnnxUN6CshCtRr1kRGIKkIP/yCg0xkuXUyEXv11k7qEaocKcNcgpC048
DuBXJepcG/3VhQBl2e26JQW/xWBPqixvDjApzR9R145BHl6P2DCaMFstgOGTHG8/
VHo7AQOyL9EGlfeQSJyLWbAUASdx+NtkYYCKExznJAhqMS0SY1aB977aNvlfzOWO
PFCR09ZIt4ylNOHDx4NMxmtXX/PzHLgbeocs3I4ot9/ijYcbYvQ=
=dS6E
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
