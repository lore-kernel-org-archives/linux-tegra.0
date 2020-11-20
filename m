Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C41C2D0E4
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 20:52:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A04A122253
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 20:52:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2vAtksO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgKTUwn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Nov 2020 15:52:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728060AbgKTUwn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Nov 2020 15:52:43 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C143EC0613CF
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2020 12:52:42 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id bo9so8963848ejb.13
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2020 12:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m8+O14erVM41BYY+/K7GlYCxAyvMHOyGKuCe4UVZSFI=;
        b=Z2vAtksOy4y2zNlVpeTy0fynG1kyc/z0XGXv91My0s6N7aHzqqnln0jtzOtjGHig/o
         3Erhn/bkA05CMnXj30YaTKLeSkYqbTcHCudZz0JE0S0Baq3lMWY740jriDXHGylIlPL8
         0vExnRmktdbGSzmJHU6a8DbSJTxEm0POjqxB/bEyciCDs1+/WJuVyWxYyVgd3JDlElc6
         jPLu2YLVyVAXFBFhnHTNrwdt8zw9Ckw6VaU6leY3YcnM6LA/UnTEYe2sKGPxKuvjHUjF
         mGprWTdaZwMsUfo+g/EFYoz0yDFmijAhXWUKisj6edcOhE0uS8sdbc4NwlD6TJKLDzVR
         0FXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m8+O14erVM41BYY+/K7GlYCxAyvMHOyGKuCe4UVZSFI=;
        b=rc/ZKaLuGzQWXa6A2hstWui0+oWJxWApdHu2UIBzZ+B3Wn06WCC0AuF43dclmoazkA
         w71ugqVZ2iLNtL0+9FJBc+BhHy821eXFLFLixTRhVDDkvwgBJHdhzs/sq4vlxBSr1rwj
         v7pTXWhgsEXRU1ubfsqYOh6LKGn6pHiw0xWlWNb+sxTrKY1hsIeJ9NnfouBMmA6qPOjA
         LGCozruFPhj9l3v6UxXnxKzqIo/ULrSE7dXFp6aI8l70ANOwggpd+AVsyUdwGyXOjBEa
         6f+FOzaf8mLPbZwsoo4ZmOM5iZuAGo0tex6bOTlhb3rjZkZS+KwXN088GgACm6SSVSdJ
         Q3rQ==
X-Gm-Message-State: AOAM5318I0nkTlTp69OrBYdbTPgSbgWr4tEBOiXU6I+Wr0RrOSjJCP+n
        z0kXCUQF+nlENSpQ6iZ4JAY2QWoWLMXg/F69h/Q=
X-Google-Smtp-Source: ABdhPJwX0XrJQ8MAVDtRjkj2xyt4EH2rgsFe+9eozhTwkR4z0MR7FohJBYca5syuwqIirFs0LlptYrJKRa20OYkIzA0=
X-Received: by 2002:a17:906:4698:: with SMTP id a24mr2138394ejr.90.1605905561489;
 Fri, 20 Nov 2020 12:52:41 -0800 (PST)
MIME-Version: 1.0
References: <20201120161356.3880457-1-thierry.reding@gmail.com>
In-Reply-To: <20201120161356.3880457-1-thierry.reding@gmail.com>
From:   Nicolas Chauvet <kwizart@gmail.com>
Date:   Fri, 20 Nov 2020 21:52:30 +0100
Message-ID: <CABr+WT=gDN86EOxryKNRvBUq-2WLqHf+PqiHpC5_QgWwLNuGLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: tegra: Hook up edp interrupt on Tegra124 SOCTHERM
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Le ven. 20 nov. 2020 =C3=A0 17:14, Thierry Reding
<thierry.reding@gmail.com> a =C3=A9crit :
>
> From: Thierry Reding <treding@nvidia.com>
>
> For some reason this was never hooked up. Do it now so that over-current
> interrupts can be logged.
>
> Reported-by: Nicolas Chauvet <kwizart@gmail.com>
> Suggested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra124.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124=
.dtsi
> index 64f488ba1e72..d2714419d823 100644
> --- a/arch/arm/boot/dts/tegra124.dtsi
> +++ b/arch/arm/boot/dts/tegra124.dtsi
> @@ -898,7 +898,9 @@ soctherm: thermal-sensor@700e2000 {
>                 reg =3D <0x0 0x700e2000 0x0 0x600>, /* SOC_THERM reg_base=
 */
>                       <0x0 0x60006000 0x0 0x400>; /* CAR reg_base */
>                 reg-names =3D "soctherm-reg", "car-reg";
> -               interrupts =3D <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupts =3D <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupt-names =3D "thermal", "edp";
>                 clocks =3D <&tegra_car TEGRA124_CLK_TSENSOR>,
>                         <&tegra_car TEGRA124_CLK_SOC_THERM>;
>                 clock-names =3D "tsensor", "soctherm";

Thanks for the fix. I confirm the interrupt is present on jetson-tk1.
cat /proc/interrupts |grep therm
101:          0          0          0          0       LIC  48 Level
  700e2000.thermal-sensor
102:          0          0          0          0       LIC  51 Level
  soctherm_edp
