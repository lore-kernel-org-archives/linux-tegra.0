Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB57C4338F
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Aug 2021 09:55:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEC1260FC4
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Aug 2021 09:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236726AbhHKJzl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Aug 2021 05:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236521AbhHKJzk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Aug 2021 05:55:40 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81037C0613D3;
        Wed, 11 Aug 2021 02:55:17 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id z9so2107569wrh.10;
        Wed, 11 Aug 2021 02:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2b8psoCPOjX8IdKNBZmOz83qagMGK4KY9ft/nTsgdo4=;
        b=fJAcfQ1D8JXcTIjMeGD9tdgk6/LB816NpV9NCinQaRhvgzk/b6txUAC+NKj6axgm+N
         79ix41i7kpX/35D4saWkg3IX4eMqteopA9vNpYuolI1TsC2Bx5e5mQiLyStcSNb9cebB
         qGBNWgHEO0u4MAFkzw9PzXL72e4kt3ERY4K1JE3LxHf5wlVldXjqqg9lFKq29tbll5d4
         oiozjU3kjoutc869E91/cW9APC+sIqcvF8axjEBpGgcWWsVlZy5lVZtk6JWCIRcOijPB
         WPDf2ruLFE0ioV5amg0CWjkhN0kGNcMWt8J/CsHCFxm32iGWevwGbokf+5G/V+l5NWue
         MOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2b8psoCPOjX8IdKNBZmOz83qagMGK4KY9ft/nTsgdo4=;
        b=Vxm4/Z78umUIbvPBor6AQw5ZAb7jYTMf/PZAmTwzJlFczPA8A1jeIok+TnY6taMimr
         K/DUggqq4gLx6MHo9juaUr8a3dIBdg8BbS5XH9DjWtvA4mgMEzYatp+dEmZI9fAMZ/Ic
         xF9pZ/wjJ7DVoXZ8G8eHFrkFymjEwFJlGMOld0rjtr7rQ+i3HGeNFdKnti2MZM792yw+
         Cd/X/vMPtPOm3ZAIPJ7p3QoGFejDQ72opzFoU7yxt6Brom0rTdEDVNu8qDjuio6ehL/U
         wbzpELKMBfcmm2TV2Syoq/lPJchZeWUBWshCA1VcDI2aH4ucVUbLi+q1BoVzlYl0sDpH
         bUKw==
X-Gm-Message-State: AOAM532jumzN0qQHANasLQ9stz1PpIEjijcW2rzzOnUa925iytAhN0iA
        JYRkEfaUJqGI/4cfqXc3MfY=
X-Google-Smtp-Source: ABdhPJzGsuolK0NSYgBXnmXq41P8ksbRMhVA4yumsHabYdPmp//69adHoKLrFxwSKP8EIAItfMy3tg==
X-Received: by 2002:adf:e4d0:: with SMTP id v16mr7820450wrm.378.1628675716191;
        Wed, 11 Aug 2021 02:55:16 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id r10sm10364291wrq.32.2021.08.11.02.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 02:55:15 -0700 (PDT)
Date:   Wed, 11 Aug 2021 11:57:40 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/4] Tegra FUSE clock improvements for 5.15
Message-ID: <YROfFBziO7Q0HcsK@orome.fritz.box>
References: <20210802221336.32016-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="j7wCEzsgoH2L1y2m"
Content-Disposition: inline
In-Reply-To: <20210802221336.32016-1-digetx@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--j7wCEzsgoH2L1y2m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 03, 2021 at 01:13:32AM +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> This series improves handling of the FUSE clock by keeping it enabled only
> when necessary.
>=20
> Dmitry Osipenko (4):
>   soc/tegra: fuse: Clear fuse->clk on driver probe failure
>   soc/tegra: fuse: Add runtime PM support
>   soc/tegra: fuse: Enable fuse clock on suspend for Tegra124
>   clk: tegra: Remove CLK_IS_CRITICAL flag from fuse clock
>=20
>  drivers/clk/tegra/clk-tegra-periph.c  |  6 +--
>  drivers/soc/tegra/fuse/fuse-tegra.c   | 60 +++++++++++++++++++++++++++
>  drivers/soc/tegra/fuse/fuse-tegra20.c | 11 +++--
>  drivers/soc/tegra/fuse/fuse-tegra30.c | 16 ++++---
>  drivers/soc/tegra/fuse/fuse.h         |  2 +
>  5 files changed, 81 insertions(+), 14 deletions(-)

Applied, thanks.

Thierry

--j7wCEzsgoH2L1y2m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmETnxMACgkQ3SOs138+
s6HqjQ//dRIixHh39Hyv/oa0+uZZzBFnNlYpMIqr0YjlDlRftAxBsSMmf53LwyDb
Hq2iN11GAlVwIpUmKyYZPwW7rBdJk7itIp/QUKEjS5VlwOO0DWP7AG22k9x9Hjr6
TPkbQ/+8mfmoGbyjDchZ2XLqrHj/VY/Tw6OWqocBUOkfXMUMExBoLjuqoR9XUHB/
KvvZSn73Gjgf9TnGEB/eJh7xdem4dxSbGE95GtYCiOPdluCfrxfY+yZR3zxSIdP8
yhTvWK+1ZTOIdB5tZZDM6S4VS6nqSOUwV+2LMaGNOzqRAY5oBfR37PlY4s4fQby8
K53raJhg14npx4DHRCHaL6y4RLhY4E2YN67NNwk8y/KBO+Xa13UgjAzF3cbhfyr5
EPXRSZXsUFeWmysjB+E87e6MDONBoXs76MaUe6ltUrsrFwIUFF7kunM+jJG31hEK
Cim/VxDxNYdACEQckgPh000hOgtgu0/VC7B5pbUj/iKeDFCU2VPOP8uT35uKbyE8
WNb6aG+AvG8iZpZX+EWej+twlB1VaTVXABFlxwr3xGGIOcXbRyXMLf0KfW5QrK35
xpugfjPWcbofpMeh2zvLOQf4pSYJYNBWfkJ2HBWY+uKU/OWd69FZU9rJSA3DXd5+
Zorlgv4IXmJdMCkjVtXj6SA6q1VK8hIr14288U5sGiSRAApy7+U=
=AEwI
-----END PGP SIGNATURE-----

--j7wCEzsgoH2L1y2m--
