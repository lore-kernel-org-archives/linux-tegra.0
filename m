Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9F6C41535
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Mar 2022 01:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbiCIBOP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Mar 2022 20:14:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbiCIBNY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Mar 2022 20:13:24 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D335A159295
        for <linux-tegra@vger.kernel.org>; Tue,  8 Mar 2022 16:56:56 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id u7so914851ljk.13
        for <linux-tegra@vger.kernel.org>; Tue, 08 Mar 2022 16:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YP/0hGSGtfR5UxMi95dIsCh5Rw8euDrjjK1mJjlT4r8=;
        b=ZcpQKNEm//vuDKmhXtZWUVc4JRi7y6yHg4x03IJTaBb2AWv8/UQYeyYp8ocPteppTU
         foncyFyA0dVhXbGmF+wIsHlmtTI27IGA4EETKxCAh8jWPocHp+QZDzFb7VEcvUbzNxgc
         vqhK8q/eOB1Ay9C1HNPWFaqwo4DwAVyB3tj3SD3DFkXNL6O9evjXl5LGqG4+J4DWgx9z
         B9o9yOSvWh7dJ+0kbQpStUcr2oWG+s+XlO3iXNWgme+1eddqN4sO78SYe2O1zpqeTAul
         oXKCDzGeAel2RVM/P8HdoXlGWulfVPC8zqZLX+F/uaH54bV9e97wO0mYTE7WiCpXnHgd
         hM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YP/0hGSGtfR5UxMi95dIsCh5Rw8euDrjjK1mJjlT4r8=;
        b=avJ0EqEc0RiDoNQbiIf4KLPY5FekFBdRAF335l+Ss6Vtx89UGN82Kwc/6mqHFk1Hmp
         VnoqvISzrRi3BdeEMKOw4icECj1/wZ/KFlz8VpEcP6tM0RWypCS5BhMR3oruCkdGSihe
         3b6CQBDiv0h77HvNA4W+AgfQCGnZIO46jpdJoCCLjBswlN4HOO0iaL0tdXfVmwX3+KyB
         cdUhbLaEngH7fwrGsUWTKV4C01OyyFfgEfZ76rU7giJoz0K0y5dhuO9FXN0LXlhs55mk
         6HXNqRKNxwFlS5k58H8eQlNGnJogE3fW7KaOgAc3JQ8DA5hwr+rtziK8rsvdsItjs8p3
         bIsg==
X-Gm-Message-State: AOAM531VR82xQvG9+MYPW3Y0iKsZIGvUyed/6N55cGu2pp/V73IM6INU
        0U7v+8fAcNXlbk2EDAEBidI=
X-Google-Smtp-Source: ABdhPJxCIyMVLaY1KwAWV+liCiF/95v5gm0lmcZBgTPiGh1smTshUSlNN1kY+IXIob5SgG2W0rAYfQ==
X-Received: by 2002:a2e:bc26:0:b0:247:dfe8:ee9c with SMTP id b38-20020a2ebc26000000b00247dfe8ee9cmr9753844ljf.94.1646787415084;
        Tue, 08 Mar 2022 16:56:55 -0800 (PST)
Received: from dimatab (109-252-136-171.dynamic.spd-mgts.ru. [109.252.136.171])
        by smtp.gmail.com with ESMTPSA id m14-20020a19520e000000b004483213f607sm79726lfb.103.2022.03.08.16.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 16:56:54 -0800 (PST)
Date:   Wed, 9 Mar 2022 03:56:26 +0300
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] ARM: tegra: Move Nyan FHD panels to AUX bus
Message-ID: <20220309035626.49a6641d@dimatab>
In-Reply-To: <20220307180344.2168395-1-thierry.reding@gmail.com>
References: <20220307180344.2168395-1-thierry.reding@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

=D0=92 Mon,  7 Mar 2022 19:03:44 +0100
Thierry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> From: Thierry Reding <treding@nvidia.com>
>=20
> Similarly to what was earlier done for other Nyan variants, move the
> eDP panel on the FHD models to the AUX bus as well.
>=20
> Suggested-by: Dmitry Osipenko <digetx@gmail.com>
> Fixes: ef6fb9875ce0 ("ARM: tegra: Add device-tree for 1080p version
> of Nyan Big") Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra124-nyan-big-fhd.dts | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/tegra124-nyan-big-fhd.dts
> b/arch/arm/boot/dts/tegra124-nyan-big-fhd.dts index
> d35fb79d2f51..4db43324dafa 100644 ---
> a/arch/arm/boot/dts/tegra124-nyan-big-fhd.dts +++
> b/arch/arm/boot/dts/tegra124-nyan-big-fhd.dts @@ -5,7 +5,13 @@
> =20
>  / {
>  	/* Version of Nyan Big with 1080p panel */
> -	panel {
> -		compatible =3D "auo,b133htn01";
> +	host1x@50000000 {
> +		dpaux@545c0000 {
> +			aux-bus {
> +				panel: panel {
> +					compatible =3D "auo,b133htn01";
> +				};
> +			};
> +		};
>  	};
>  };

Thank you :)

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
