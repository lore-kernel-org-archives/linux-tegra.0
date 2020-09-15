Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C6CC43461
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 00:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16FC0206DB
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 00:29:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="az+La9rg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgIPA3S (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Sep 2020 20:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726750AbgIONti (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Sep 2020 09:49:38 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484D5C06121D
        for <linux-tegra@vger.kernel.org>; Tue, 15 Sep 2020 06:49:16 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id z22so5156057ejl.7
        for <linux-tegra@vger.kernel.org>; Tue, 15 Sep 2020 06:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4F6Rk8R8bjGQryOBZ18aw2fPa3Om+nn4nuswQavl5qk=;
        b=az+La9rgpXtTKDX3djMZnBhto30ewW4YTvqoik+p6EN71+CVi06lx5rCOS/r20QWH7
         LXpgUFJuKgL6qxkknRV9vEqlvyM7Yw+eSOUGFoVEMgI1w6Sqn1O/lHJV2/2zvLde36bJ
         pbAqTDfR1iBbWniXjo5OEeXYSEz37xtLTIxNUYGjEdBoICW8Qzc7v5C0NKLp5g3VNU2p
         dFiC9m/wFo9sl+rMVCAgnxz7tVtbsJNiYRACP203MjS4mbZZo4Bfv91FDa2jXrE0wsDn
         ZXsY/CPV57vrxALDcVXdSjVhQTc4YdLlYB/Tb1vTsZkgXH8f8iPgOYd+a5k4uJakbrJI
         fgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4F6Rk8R8bjGQryOBZ18aw2fPa3Om+nn4nuswQavl5qk=;
        b=AWDI+ERAG2Ekjx935MnpfYJ189BX8GsZC+pxD4+sz9VLI6SjP7Y1FIVjYftYrNZg2e
         wUZwGLfBmQ8DMXvY1BR761PUu06NA7nzOAltMG0AftigxrQ2fqDa5Ed+b4ooq6zRvCqv
         I26vykYkVa2K05C+lytYg4l5yoTKQzX8ZrwYoGM5YKVe8lh9aeLsETEvjNbQCmvrnyNh
         FyZ2512TNn1MO0h0yLU2a+n0r/Csy+sm+yGKgMd0B6G3pay8OKwnaJlSQxwg0CqVMwDB
         2PSS2XI9oAUFsOLa4bniM1Wlnutuic6Qr5t+Fz7k+n1wZeOdR96g77CCimZDbsf0CPdD
         ID0w==
X-Gm-Message-State: AOAM532VKIgvLTjMnfZEwMcUmkCTgDfxhoiL52+oHF4Wo0Yr1f7HaSWX
        jkm/ufmpX3fbsJrv1iRH5hk=
X-Google-Smtp-Source: ABdhPJzpOTIyIGe9BW9NG2oleSV1jWL6R/YqjeEx8gqRyY0nl5lL4II/UFKA6S0FGzzqMN0eYYS6uQ==
X-Received: by 2002:a17:906:819:: with SMTP id e25mr20698326ejd.211.1600177754964;
        Tue, 15 Sep 2020 06:49:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g11sm11635626edt.88.2020.09.15.06.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 06:49:13 -0700 (PDT)
Date:   Tue, 15 Sep 2020 15:49:11 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 9/9] arm64: tegra: Initial Tegra234 VDK support
Message-ID: <20200915134911.GD3496938@ulmo>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
 <20200716141856.544718-10-thierry.reding@gmail.com>
 <3c2f4e9c-28af-d5dc-1daa-40744da32898@nvidia.com>
 <20200915124427.GC3496938@ulmo>
 <69859635-da61-acb8-82d4-3dbc6fd7fc10@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3Pql8miugIZX0722"
Content-Disposition: inline
In-Reply-To: <69859635-da61-acb8-82d4-3dbc6fd7fc10@nvidia.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--3Pql8miugIZX0722
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 02:17:39PM +0100, Jon Hunter wrote:
>=20
>=20
> On 15/09/2020 13:44, Thierry Reding wrote:
> > On Mon, Sep 07, 2020 at 08:46:48PM +0100, Jon Hunter wrote:
> >>
> >> On 16/07/2020 15:18, Thierry Reding wrote:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> The NVIDIA Tegra234 VDK is a simulation platform for the Orin SoC. It
> >>> supports a subset of the peripherals that will be available in the fi=
nal
> >>> chip and serves as a bootstrapping platform.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
> >>>  .../boot/dts/nvidia/tegra234-sim-vdk.dts      |  40 ++++
> >>>  arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 191 ++++++++++++++++=
++
> >>>  drivers/soc/tegra/Kconfig                     |  10 +
> >>>  include/dt-bindings/clock/tegra234-clock.h    |  14 ++
> >>>  include/dt-bindings/reset/tegra234-reset.h    |  10 +
> >>>  6 files changed, 266 insertions(+)
> >>>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
> >>>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra234.dtsi
> >>>  create mode 100644 include/dt-bindings/clock/tegra234-clock.h
> >>>  create mode 100644 include/dt-bindings/reset/tegra234-reset.h
> >>>
> >>> diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dt=
s/nvidia/Makefile
> >>> index 2273fc5db19c..9296d12d11e9 100644
> >>> --- a/arch/arm64/boot/dts/nvidia/Makefile
> >>> +++ b/arch/arm64/boot/dts/nvidia/Makefile
> >>> @@ -9,3 +9,4 @@ dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p2894-=
0050-a08.dtb
> >>>  dtb-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D tegra186-p2771-0000.dtb
> >>>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p2972-0000.dtb
> >>>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p3509-0000+p3668-0000=
=2Edtb
> >>> +dtb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D tegra234-sim-vdk.dtb
> >>> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts b/arch/a=
rm64/boot/dts/nvidia/tegra234-sim-vdk.dts
> >>> new file mode 100644
> >>> index 000000000000..f6e6a24829af
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
> >>> @@ -0,0 +1,40 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >>> +/dts-v1/;
> >>> +
> >>> +#include "tegra234.dtsi"
> >>> +
> >>> +/ {
> >>> +	model =3D "NVIDIA Tegra234 VDK";
> >>> +	compatible =3D "nvidia,tegra234-vdk", "nvidia,tegra234";
> >>> +
> >>> +	aliases {
> >>> +		sdhci3 =3D "/cbb@0/sdhci@3460000";
> >>> +		serial0 =3D &uarta;
> >>> +	};
> >>> +
> >>> +	chosen {
> >>> +		bootargs =3D "console=3DttyS0,115200n8 earlycon=3Duart8250,mmio32,=
0x03100000";
> >>> +		stdout-path =3D "serial0:115200n8";
> >>> +	};
> >>> +
> >>> +	cbb@0 {
> >>> +		serial@3100000 {
> >>> +			status =3D "okay";
> >>> +		};
> >>> +
> >>> +		sdhci@3460000 {
> >>> +			status =3D "okay";
> >>> +			bus-width =3D <8>;
> >>> +			non-removable;
> >>> +			only-1-8-v;
> >>> +		};
> >>> +
> >>> +		rtc@c2a0000 {
> >>> +			status =3D "okay";
> >>> +		};
> >>> +
> >>> +		pmc@c360000 {
> >>> +			nvidia,invert-interrupt;
> >>> +		};
> >>> +	};
> >>> +};
> >>> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra234.dtsi
> >>> new file mode 100644
> >>> index 000000000000..3509687441a1
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> >>> @@ -0,0 +1,191 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >>> +
> >>> +#include <dt-bindings/clock/tegra234-clock.h>
> >>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >>> +#include <dt-bindings/mailbox/tegra186-hsp.h>
> >>> +#include <dt-bindings/reset/tegra234-reset.h>
> >>> +
> >>> +/ {
> >>> +	compatible =3D "nvidia,tegra234";
> >>> +	interrupt-parent =3D <&gic>;
> >>> +	#address-cells =3D <2>;
> >>> +	#size-cells =3D <2>;
> >>> +
> >>> +	bus@0 {
> >>> +		compatible =3D "simple-bus";
> >>> +		#address-cells =3D <1>;
> >>> +		#size-cells =3D <1>;
> >>> +
> >>> +		ranges =3D <0x0 0x0 0x0 0x40000000>;
> >>> +
> >>> +		misc@100000 {
> >>> +			compatible =3D "nvidia,tegra234-misc";
> >>> +			reg =3D <0x00100000 0xf000>,
> >>> +			      <0x0010f000 0x1000>;
> >>> +			status =3D "okay";
> >>> +		};
> >>
> >>
> >> Is there meant to be a fallback option here, because I don't see
> >> anything to match the above compatible string?
> >=20
> > I've got the below patch in my tree that's meant to add that code, but
> > it's in the wrong order in my local branch, so it didn't make it into
> > this subset. I'll reorder the patches to include the APBMISC support
> > patch in this series.
>=20
> OK, I think that the same also applies to efuse, pmc, rtc and bpmp-shmem
> from looking at this patch.

efuse is addressed in another of the patches that I have locally. I'll
add it to the series. For PMC I think we can just add a minimum version
of driver support for simulation, but there are a few registers that are
already known to be different from previous chips.

RTC needs the fallback for nvidia,tegra20-rtc. I'll add that in the next
version.

As for bpmp-shmem, that's something we can remove altogether since we
removed it recently from existing device trees. Turns out those regions
don't actually need any compatible strings.

Thierry

--3Pql8miugIZX0722
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9gxlUACgkQ3SOs138+
s6G8lRAAgFxp+3o5iqdDTtByfC3xBkyMVrs7rZahcjHxHwraeLgUgeQes8nc6SuY
uiOizYePtpcNNTV2C/oM/bdq0ra3/rhKeuoeYJHBMzxRXFBQWXhYBlRiBCRhminL
D5ZgA7PRGnkw8+FtfrgEKgqBd8YzooUpbudC04zheCdWImMXeq8IAsZopUIzj3LL
Ju8aF2ssY0snQPQKB7EpfOzl/7TiZw7z1+2aJXOMcsWpgO52+Ty28HnrhgCihq2p
QPG5H68z5XV1grgi1j6ET0EP24UlX/2o0I/cM6qfygDkxmd6GbDEBfu7H6NIj4YD
EsgqW7+oBJgo9pSLGYgsAVJiwQdnQAUEZmXwiWyzrponZtPcarEQlhEImvrgE7+f
YVgufvW22adl4fY8uf+PUIKJ+qdskneIJTsb4w4xgQil6MqLMwrIPv6bGwAV23bH
eFOOAO4T0g8an6WIOwizIgaWdR4pa5PLTEPSyyCM6yH9OZbguCetbDnoC5AruN2i
i59f27b0bzDKej12VXwpaZL9syGetNdfNjDfktjX6LXR1+vUibyTuSGAgCCdutwP
iBtc8zReheMpIOY9S/kDHp3APWgRuHXZYvLiKCKRtoomVjjx0wPcZmkIAoTIGmt+
CbHiOPRtyZcyC4TQ58YAkYLs8dnHnUJrXYCGW5b9HRRXvKGj2Gc=
=plbU
-----END PGP SIGNATURE-----

--3Pql8miugIZX0722--
