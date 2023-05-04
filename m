Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE726C77B78
	for <linux-tegra@archiver.kernel.org>; Thu,  4 May 2023 12:21:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjEDMVs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 4 May 2023 08:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjEDMVr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 4 May 2023 08:21:47 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04932619E;
        Thu,  4 May 2023 05:21:42 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50bc4ba28cbso740979a12.0;
        Thu, 04 May 2023 05:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683202900; x=1685794900;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuCeimy89aoLBEfq8UtGbrGl1Fju7Zk0xTc4R4r0o+A=;
        b=UtzUOaphJw2jqqz8VrpBwPWX5KcOqnylJsaO0f+5pJxXNmSsRFLHq9HsV9/5LBXnVy
         xGZT3NF3s6vp9yMp5UybPOKMlvtC649lMRFS/7//UgDwCgD8NOXLDOHoX6WaFWTuuKuU
         VHpgJ1kwLHPu2/DHltDR/A3L27A1l5TPiH+vEGuA7P0RB/O/7A1/Cj84McSlODLvQy34
         sQy/yU9r0Qlz8pSB7MBVGpP5qTchnhMaIN8fgYeBS8ZZnGrvYx/7eCjpDnbVfXoJ8lwK
         P+wRT6+llpcsu4EgaDOfmElUBbUp8MjxNXVoSUlCxie4C0+Oe6+jYj8oZoUdZ52UJD3f
         lf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683202900; x=1685794900;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuCeimy89aoLBEfq8UtGbrGl1Fju7Zk0xTc4R4r0o+A=;
        b=f0Y7pgaWKikyZgM4uP+YYvDVUimaoNAZq/DcZXmSnabOfIxbNQnKZs8hD/OOo18u+/
         v3tAUcGzTpej02g8XFZ0IC5UU/4KLDwuF7qV9oSWyMLJEmx0DPixHCPf9g7lFY5HNKdf
         U+/I4kdu1WggYdc8fJKssjxZfn5vDn486S80yO9gQHKE36owmJXoqZJaTxAHyCmcCCFh
         F1b6I7AudKZSPuvZxxa2jsH7nxQ1WbQDS0JmMRkajfoOiNWSmCKHDpYSvP2shGKJwSZX
         PD/CITMPptcX7+I0tnuNoKGog8ChWHpMRQji7gZwH5hCB1mCohbztbOXeD0VCSXJ/JYh
         n4HA==
X-Gm-Message-State: AC+VfDwWj8HR1HqhynhTzFm535wpZxMY3iyD1VINVjQl8yo0k+Kyzu19
        a3NTpL9gHwSc2vovTss+B/8R17unq34=
X-Google-Smtp-Source: ACHHUZ4oeCTKb6cQ2EVUNGjNfidDKoWsv2xudO0GUgrApCHNDM/X2No5gR5QGhvNCKoy71kVS9WiJA==
X-Received: by 2002:a17:907:97c3:b0:961:8570:4591 with SMTP id js3-20020a17090797c300b0096185704591mr6874418ejc.40.1683202900273;
        Thu, 04 May 2023 05:21:40 -0700 (PDT)
Received: from orome (p200300e41f053a00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f05:3a00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id e15-20020a170906844f00b0094ebd376fadsm18874182ejy.144.2023.05.04.05.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 05:21:39 -0700 (PDT)
Date:   Thu, 4 May 2023 14:21:38 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Shubhi Garg <shgarg@nvidia.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 2/2] arm64: tegra: Add support for IGX Orin
Message-ID: <ZFOjUrUXMwxAgUXP@orome>
References: <20230502150249.773425-1-shgarg@nvidia.com>
 <20230502150249.773425-2-shgarg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3K3rTWAFDcGmHmTc"
Content-Disposition: inline
In-Reply-To: <20230502150249.773425-2-shgarg@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--3K3rTWAFDcGmHmTc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 02, 2023 at 03:02:49PM +0000, Shubhi Garg wrote:
[...]
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
> new file mode 100644
> index 000000000000..3ac8070918bb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include "tegra234-p3701-0008.dtsi"
> +#include "tegra234-p3740-0002.dtsi"
> +
> +/ {
> +	model = "NVIDIA IGX Orin Development Kit";
> +	compatible = "nvidia,p3740-0002+p3701-0008", "nvidia,p3701-0008", "nvidia,tegra234";
> +
> +	bus@0 {
> +		host1x@13e00000 {
> +			nvdec@15480000 {
> +				status = "okay";
> +			};
> +		};
> +
> +		pcie@140e0000 {
> +			status = "okay";
> +			vddio-pex-ctl-supply = <&vdd_1v8_ls>;
> +			phys = <&p2u_gbe_4>, <&p2u_gbe_5>;
> +			phy-names = "p2u-0", "p2u-1";
> +		};
> +
> +		pcie@14100000 {
> +			status = "okay";
> +			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
> +			phys = <&p2u_hsio_3>;
> +			phy-names = "p2u-0";
> +		};
> +
> +		pcie@14160000 {
> +			status = "okay";
> +			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
> +			phys = <&p2u_hsio_7>, <&p2u_hsio_6>, <&p2u_hsio_5>,
> +			       <&p2u_hsio_4>;
> +			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3";
> +		};
> +
> +		pcie@141a0000 {
> +			status = "okay";
> +			vddio-pex-ctl-supply = <&vdd_1v8_ls>;
> +			phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
> +				<&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
> +				<&p2u_nvhs_6>, <&p2u_nvhs_7>;
> +			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
> +				    "p2u-5", "p2u-6", "p2u-7";
> +		};
> +
> +		pcie@141e0000 {
> +			status = "okay";
> +			vddio-pex-ctl-supply = <&vdd_1v8_ls>;
> +			phys = <&p2u_gbe_0>, <&p2u_gbe_1>;
> +			phy-names = "p2u-0", "p2u-1";
> +		};
> +
> +		aconnect@2900000 {
> +			status = "okay";
> +		};
> +
> +		serial@3100000 {
> +			compatible = "nvidia,tegra194-hsuart";
> +			status = "okay";
> +		};
> +
> +		i2c@3160000 {
> +			status = "okay";
> +		};
> +
> +		i2c@3180000 {
> +			status = "okay";
> +		};
> +
> +		i2c@3190000 {
> +			status = "okay";
> +		};
> +
> +		i2c@31b0000 {
> +			status = "okay";
> +		};
> +
> +		i2c@31c0000 {
> +			status = "okay";
> +
> +		};
> +
> +		i2c@31e0000 {
> +			status = "okay";
> +		};
> +
> +		spi@3270000 {
> +			status = "okay";
> +		};
> +
> +		hda@3510000 {
> +			nvidia,model = "NVIDIA IGX HDA";
> +			status = "okay";
> +		};
> +
> +		fuse@3810000 {
> +			status = "okay";
> +		};
> +
> +		i2c@c240000 {
> +			status = "okay";
> +		};
> +
> +		i2c@c250000 {
> +			status = "okay";
> +		};
> +	};
> +
> +	aliases {
> +		serial0 = &tcu;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyTCU0,115200n8";
> +		stdout-path = "serial0:115200n8";
> +	};

This is admittedly a little unintuitive, but "aliases" and "chosen" are
special in that they are ordered at the top of the file (i.e.
immediately before the bus@0 node, and then alphabetically). That's
because they have special meaning, as opposed to the others below which
are just devices that don't have an address region and therefore no
unit-address.

Also, can you try testing this with the "bootargs" property dropped? I
have done some testing on older platforms and that doesn't seem to be
necessary since we have "stdout-path". It'd be good to confirm that it
holds true on IGX and if so we can drop "bootargs". I have work in
progress patches to do this on several other devices.

Thierry

--3K3rTWAFDcGmHmTc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmRTo1AACgkQ3SOs138+
s6GQCBAAvK0rSvXF7XCLXDzgXaLZiaW1MB7jboOi2XbevVgpu1shqubDi9tFK+3P
x8nIP/7sfy6YeKfGXYHtCRpjriyyDw3W9NKwCrTaxSsUxQHP7Gbuy3ugEizuJG87
8LBxvgjQmhvN9teaa66JUuBVXQBLLyK2E4HmUNTxSstKs+qSidW5J2/6XQrCoNRg
Dm8xIhP82mxxeaA/7RjdOrMRp1fAv+yuNVgeaAc33ZtXQRAZS0h6adKk8mweZNJt
gxbrDaVd00zBhsyv8hWf3LOThtKmeK7ONR2u+ksjIA7JXA7+s4WHGMr5R1fJL58m
672wNo3IqrwQi3l9+/FI4+5IKhtwx2HuvdvnigYs+FoQLxozhZ7wRyE+6Ns9Hu02
1QmHsiISLhsCEWgYJ9iURZ664Fs9nXBHvGrcXRB8yZYE5gEHIyFs73Z4kPaSdvJX
l1Tsj71d7GIl7WGiK8TTc0Sf+MDIsIM2IBxvLVA7oy1wfQv7F2aYeaT82TPmc7GP
LyLHt7EQBDyMkzBI9Pyx9UodtdBm/V4WvuHqAeHRy59r4LNg2H6ma9vf+NeGa4g/
HBd+mdwWQYVz9nLy9nG5DowygtgNUbHyDkrJEW/6mdAcj/i/9NpK58MRsH9xZfCZ
P8X82NMR3dkQ4dk/xqKDd1+OAFWNkY4tTdMA2/yPN18HXIbMqn8=
=VpFW
-----END PGP SIGNATURE-----

--3K3rTWAFDcGmHmTc--
