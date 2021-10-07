Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2B1C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:47:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5303C61130
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:47:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbhJGSt1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 14:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243763AbhJGSt0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 14:49:26 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD537C061570
        for <linux-tegra@vger.kernel.org>; Thu,  7 Oct 2021 11:47:32 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id o20so21966477wro.3
        for <linux-tegra@vger.kernel.org>; Thu, 07 Oct 2021 11:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=c0vJHtF1Fii2w6E34lsow/ZWu52pCCtIq87zX9ZJUCk=;
        b=ldFupA98+TuY+sehjn+Q9eKJLwiDqEyEz92jIc0rwAwAjqD4RxCm0dQCa1g/PmOqXr
         qgPHAKghQU6wkbqnYbR9b6ST7bmBpHn3H+bLWMG+xyB/2kCkXXQpVkT/32ZPc05pen5z
         agJgNeAxPCmIarN+Ki4G3OsQby6/IawlpjppDzLIikmDucYi6k8km97WYNZEqqDISt7L
         gubs4eCRQukXH8D2DolMMMPzq34x1s4P8OuZGrr1wip+Mtx3EL3IVljQLls0NTMd+tcB
         TKxnjBxVOE9aP3svXDE+JwqimCKtQ+paoFJKC+QlDTl/CVO4ANL91oNSpApvsiVpjZTa
         yJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c0vJHtF1Fii2w6E34lsow/ZWu52pCCtIq87zX9ZJUCk=;
        b=JDHLxBFfkyOrSPNCq+LWkw25ZYVP6yhi+DsFB5xAtkjtFd6NLT6v8PbBjH8dCtOytQ
         LE6UVnG0XV48jGAoX4hhczp5o2zo1dVbcKq7NpmHeKqC2SuZfpdKIeApB84ZSXZrluAH
         ccS8mJn5kb7eBGNUpizVgdq6ltHL4yivo7KDmZ+cvDcJaisnIRk57o17iv1hPvM8Fdjs
         FmRR5xTrLEx9j/WQagtggdSfcom6FCZYA1m28irVfIuyEd87jBXAaW+210XAAN2/E1ot
         X8Ip82gpFpxW/IDqmtGyAEpXW4LP6J28YwNj4Ynwe/vgb6otQ2EVWQoUgr+0t8McMCNX
         WQvg==
X-Gm-Message-State: AOAM530UrFG5+FGVqMZqxwmFEQTXPUc1uWTDf5TxSRKIBvPLTc8jILkk
        G9/ZDSgfcbFY2GdKrLgsuI8=
X-Google-Smtp-Source: ABdhPJxdeXzRuwRuLwH5R+gIX05lmtteRpUyMG3e/DwK0vilBfD82dytt0+B3wywtHTF7yYMG6vTvQ==
X-Received: by 2002:adf:e549:: with SMTP id z9mr7543147wrm.334.1633632451483;
        Thu, 07 Oct 2021 11:47:31 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id a25sm9078192wmj.34.2021.10.07.11.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 11:47:30 -0700 (PDT)
Date:   Thu, 7 Oct 2021 20:47:29 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] soc: tegra: Add Tegra186 ARI driver
Message-ID: <YV9AwWmTBiSjyncA@orome.fritz.box>
References: <20210617121307.792386-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Ca/59gIwhtH2+je4"
Content-Disposition: inline
In-Reply-To: <20210617121307.792386-1-mperttunen@nvidia.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Ca/59gIwhtH2+je4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 03:13:07PM +0300, Mikko Perttunen wrote:
> Add a driver to hook into panic notifiers and print machine check
> status for debugging. Status information is retrieved via SMC. This
> is supported by upstream ARM Trusted Firmware.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v2:
> * Changed to use panic notifier instead of serror hook
> ---
>  drivers/soc/tegra/Makefile       |  1 +
>  drivers/soc/tegra/ari-tegra186.c | 80 ++++++++++++++++++++++++++++++++
>  2 files changed, 81 insertions(+)
>  create mode 100644 drivers/soc/tegra/ari-tegra186.c

Applied, thanks.

Thierry

--Ca/59gIwhtH2+je4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfQMEACgkQ3SOs138+
s6EDdA//Vvb6e8w4xt5ldpjGX2DFC8cFTTm90xKoD5yY4BU/yiu+HOtqWd1lQzBH
iijAWlS0FkLRieWu+rBYHYKRQlAspuVCBeEMoNOILZrmJu6FvWcUwmsygwA5qWWX
GHIGK6rXwJDPTa1T2bG1llddJdmiIM4BNoewI/pVLB7HRjXsBPvipLTgO7UEwjXu
XsF6gyjogWTW6yditkp5FzUsL1/zSUKV6KzW+541NErGypofWBZWOozrwG/UI6d/
fjRkxBtioIhTHd5yD0/fUEZRuEEg8SLaWwTUpnqLDyzCfcSrOljBBj1TrHgYhOi9
dW4atcAP4J5yFKZ7vpNfl7eWzuzSZBU4CYHYBFN5GdFjTbUHvlyMe8xxpwV/ipMR
3sIg/8qE/3KFGQi7Ydr+2Vvks1xZU+SVxUPSXduXdC82HEeSiMhlFO5wnarYmT2u
7RnM14YKs2KJi6R399H0R6p8DGewBGRUiJQuN5vfaDp1F/KITyX9gjhD8DXzVtLo
gHsdRltct0igdcjdBE6vetwx3jJHXrS7c4IC9M75rADtiHnuuuhIazskEX2OihGx
Grjl/MQEPO5rtNLLW0Lcm/tbBpYil/wFbZQdjsrLLL8pHp7TDOxo1zR27/jnBs+X
+px/VnGBiOhLIj3dTZYSEVMjMJ1Y9thuX6f6Fjx5ryFSj3N89zk=
=YXaZ
-----END PGP SIGNATURE-----

--Ca/59gIwhtH2+je4--
