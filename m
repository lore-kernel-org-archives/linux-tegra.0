Return-Path: <SRS0=iMCN=CY=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7076C433E2
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Sep 2020 12:44:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67B5320B1F
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Sep 2020 12:44:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRWVCqfY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgIOMoy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Sep 2020 08:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgIOMoe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Sep 2020 08:44:34 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92D4C061788
        for <linux-tegra@vger.kernel.org>; Tue, 15 Sep 2020 05:44:31 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id l17so2847283edq.12
        for <linux-tegra@vger.kernel.org>; Tue, 15 Sep 2020 05:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mEiVCit6FSg8i4y7xzG1PhjUQrtE3x8RMEykB0yBZow=;
        b=hRWVCqfYMK2MPPQwYa91FJ9bg7QEA26p0sM58xh2VHakwa8Idnn7wyf7RjGnhjEMYc
         CnmZW4y8K7FGOgXtCVk5KXi5oj5+BBRpMV/LcOGnPqgJM+3XOOSloZcmOTzHN6ENwc2e
         QQM4ePTCJbjOtOq/FZlGCIDd0mivE+7prKup810HiuK1Hz5+glkKKXIJ+s36F43UGHSv
         M0o8pdkp3ynsjUUJoS7B+qMew48wfset5rRFPTjOOgL+7W1gSNsBlZPzMVjySveSbk7m
         XPXzQ7+24caIrX/arBIBbDk4MxblgAXEm1IuTl6w5GjQFhHASYFuanehKQUVFD+3JL+A
         wiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mEiVCit6FSg8i4y7xzG1PhjUQrtE3x8RMEykB0yBZow=;
        b=nDZCKJlYgymzjkfUZGVsyPFk6t7boL/AHxEEZ1luWCS1wCJeOxh2XBOhqjesOJq3AI
         wUZQI6TQEj2NCnD0+TFgi+fAwQUuYyECsdA6w8tHwZ2suLgko1G4KweV3JZzqmT4ewpQ
         Itvi3duyAZ8zFqzg2UBzIkUfd3v40tVwuNSPoPIXAAAd6pePFLS2wza2fNrX5lJqWau5
         Wwxi4t9/SLwatfyxVv0M1wS6w/R97+x467+wE17BBhb6BHmv1qAxaj9DODlBF1/3L/9p
         szIJPcg8mQWgl7jsFLcLP1zT6YrDVQtzSzE1sc9qKEuFikRKbhcDXLR6gaKHDJ1voE30
         bglQ==
X-Gm-Message-State: AOAM533eFHNZUUmWDzDjgdo6Gza+4/GnTG58e/exacfSOCM191HN+AW/
        y3b6e2OGCmPgIC8T6yQwsZQ=
X-Google-Smtp-Source: ABdhPJzHxoOUXvXFVfVey8oiNZuP4hjeh49KqHcgeQ12dBfzaXNx9+ModH3NnakBVnP0eGFeDx/Ezg==
X-Received: by 2002:a05:6402:1212:: with SMTP id c18mr21856162edw.344.1600173870376;
        Tue, 15 Sep 2020 05:44:30 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id s15sm9983892eju.105.2020.09.15.05.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 05:44:28 -0700 (PDT)
Date:   Tue, 15 Sep 2020 14:44:27 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 9/9] arm64: tegra: Initial Tegra234 VDK support
Message-ID: <20200915124427.GC3496938@ulmo>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
 <20200716141856.544718-10-thierry.reding@gmail.com>
 <3c2f4e9c-28af-d5dc-1daa-40744da32898@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Content-Disposition: inline
In-Reply-To: <3c2f4e9c-28af-d5dc-1daa-40744da32898@nvidia.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2020 at 08:46:48PM +0100, Jon Hunter wrote:
>=20
> On 16/07/2020 15:18, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The NVIDIA Tegra234 VDK is a simulation platform for the Orin SoC. It
> > supports a subset of the peripherals that will be available in the final
> > chip and serves as a bootstrapping platform.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
> >  .../boot/dts/nvidia/tegra234-sim-vdk.dts      |  40 ++++
> >  arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 191 ++++++++++++++++++
> >  drivers/soc/tegra/Kconfig                     |  10 +
> >  include/dt-bindings/clock/tegra234-clock.h    |  14 ++
> >  include/dt-bindings/reset/tegra234-reset.h    |  10 +
> >  6 files changed, 266 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
> >  create mode 100644 arch/arm64/boot/dts/nvidia/tegra234.dtsi
> >  create mode 100644 include/dt-bindings/clock/tegra234-clock.h
> >  create mode 100644 include/dt-bindings/reset/tegra234-reset.h
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/=
nvidia/Makefile
> > index 2273fc5db19c..9296d12d11e9 100644
> > --- a/arch/arm64/boot/dts/nvidia/Makefile
> > +++ b/arch/arm64/boot/dts/nvidia/Makefile
> > @@ -9,3 +9,4 @@ dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p2894-00=
50-a08.dtb
> >  dtb-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D tegra186-p2771-0000.dtb
> >  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p2972-0000.dtb
> >  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p3509-0000+p3668-0000.d=
tb
> > +dtb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D tegra234-sim-vdk.dtb
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts b/arch/arm=
64/boot/dts/nvidia/tegra234-sim-vdk.dts
> > new file mode 100644
> > index 000000000000..f6e6a24829af
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
> > @@ -0,0 +1,40 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/dts-v1/;
> > +
> > +#include "tegra234.dtsi"
> > +
> > +/ {
> > +	model =3D "NVIDIA Tegra234 VDK";
> > +	compatible =3D "nvidia,tegra234-vdk", "nvidia,tegra234";
> > +
> > +	aliases {
> > +		sdhci3 =3D "/cbb@0/sdhci@3460000";
> > +		serial0 =3D &uarta;
> > +	};
> > +
> > +	chosen {
> > +		bootargs =3D "console=3DttyS0,115200n8 earlycon=3Duart8250,mmio32,0x=
03100000";
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
> > +
> > +	cbb@0 {
> > +		serial@3100000 {
> > +			status =3D "okay";
> > +		};
> > +
> > +		sdhci@3460000 {
> > +			status =3D "okay";
> > +			bus-width =3D <8>;
> > +			non-removable;
> > +			only-1-8-v;
> > +		};
> > +
> > +		rtc@c2a0000 {
> > +			status =3D "okay";
> > +		};
> > +
> > +		pmc@c360000 {
> > +			nvidia,invert-interrupt;
> > +		};
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra234.dtsi
> > new file mode 100644
> > index 000000000000..3509687441a1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > @@ -0,0 +1,191 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <dt-bindings/clock/tegra234-clock.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/mailbox/tegra186-hsp.h>
> > +#include <dt-bindings/reset/tegra234-reset.h>
> > +
> > +/ {
> > +	compatible =3D "nvidia,tegra234";
> > +	interrupt-parent =3D <&gic>;
> > +	#address-cells =3D <2>;
> > +	#size-cells =3D <2>;
> > +
> > +	bus@0 {
> > +		compatible =3D "simple-bus";
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
> > +
> > +		ranges =3D <0x0 0x0 0x0 0x40000000>;
> > +
> > +		misc@100000 {
> > +			compatible =3D "nvidia,tegra234-misc";
> > +			reg =3D <0x00100000 0xf000>,
> > +			      <0x0010f000 0x1000>;
> > +			status =3D "okay";
> > +		};
>=20
>=20
> Is there meant to be a fallback option here, because I don't see
> anything to match the above compatible string?

I've got the below patch in my tree that's meant to add that code, but
it's in the wrong order in my local branch, so it didn't make it into
this subset. I'll reorder the patches to include the APBMISC support
patch in this series.

While this block is generally very similar, there are enough variations
for them not to count as compatible, in my opinion, so I don't think
adding a fallback is the right option.

Thierry

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9gtysACgkQ3SOs138+
s6Hyqg/+LeW2gS1vt964BE13iqFijk59/znlG/eMRFfyJVelPuZjWAYtKMqkMYUj
6O7Q5E2cZ7ZFz6sZiVNfclDfAq2qjjcO80BAH6fkM2kt6XR27sGXD2aRrBxlu2An
o0Q/3KpQRS1vPfxpPrmWtKNYVT1TYetd00wOstepypUwpksAhvAuZs5s3JMF/jEA
Ou8S8IDx5SbAnP5oQT+LrADsaFjxQrwXq1jT4hjZB55L2+alaKGru/cbNfCAqf4F
ARaWE+lPhkBpuaFaXkRFjVm9rRYIXMhO8IXejAvPenSyNg07OmvBuPC5ykzAfpjL
xRLlnUqGPKlkYqaSRv1zRf4RrBvKic0W9X/lV+ANIdFqIjBG8KHW7+SVJJ9+WA4C
xmO0Hd6zwcIMC5mIr6e8UZagLPSWojL6J079GKrQ83DlX0fUK6bXvUF08v0DkRcX
+GG7veRv7OxLoJxYTnwHkJaNssacl3PzSke+o5fxsySiMkYqGgT0SO9MPe64saiv
t8wivNzY9Kha/SSi4Xv+94xRkUmKY+kVz3JFmFdQmyyIAsH51zvoLmpTA9tZ+O3m
fa3AElqo5/2j8NThOKZlL+YoveH4AZhVEl9jkDKSZqrH/2aPB6CVH/cROv+lWfp/
HezYNUchsCpNuBFNimPjQdSfSs3nOOWPQLUuTkq+LWD7NnYgaXQ=
=7yT6
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--
