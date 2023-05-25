Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C733BC7EE2F
	for <linux-tegra@archiver.kernel.org>; Thu, 25 May 2023 16:20:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbjEYQUL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 May 2023 12:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240325AbjEYQT7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 May 2023 12:19:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42754195;
        Thu, 25 May 2023 09:19:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA88B6476D;
        Thu, 25 May 2023 16:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F130C433D2;
        Thu, 25 May 2023 16:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685031596;
        bh=PEtK4XQujJVRG9JuuhXTpXbXc0yGWo0XW1UzlJpTm1U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YcA9yR8zEjfdA5VDDZwvy77Vy/0MjDzX9ob95Yk3imwGam7iCSYqs0X9xCzObBqaf
         Y+mcZ+FeGGlaXhw7D21JwyaP4LPYABmiaGUFPkcu/LcmlnMF9zyLnS0VZXkC+95UGY
         hCdblKo1/U26KBEFEKdUt3paAZSj316ZlZRBGbLCnad5yTmXJAun1tepg+TIoIOMFv
         k4VSrT/d5jdRUvZ3ruG7L8BPS2DgRRg7f2kEkhRPZcltyr5K6J5syUtHrKvSqvZ/UN
         exnwWOjvsdwtDYKAxtHO4y8TgYVaygUvVLL6AF+BrPYQQFjzFAHkmR45xIAfYHwaMF
         ZtuK3EeJ7w/ew==
Date:   Thu, 25 May 2023 17:19:51 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: tegra-xudc: Remove extraneous PHYs
Message-ID: <20230525-pancake-amiable-903f8e96c58d@spud>
References: <20230525094237.2846682-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6032cX2oMZzLCuYF"
Content-Disposition: inline
In-Reply-To: <20230525094237.2846682-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--6032cX2oMZzLCuYF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 11:42:37AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The USB device controller on Tegra210 and later supports one USB 2/3
> port, so only a single pair of PHYs is needed. Drop any of the extra
> PHYs from the bindings.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml         | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml=
 b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> index e2270ce0c56b..c6e661e8915c 100644
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> @@ -91,6 +91,7 @@ properties:
> =20
>    phys:
>      minItems: 1
> +    maxItems: 2
>      description:
>        Must contain an entry for each entry in phy-names.
>        See ../phy/phy-bindings.txt for details.
> @@ -99,13 +100,7 @@ properties:
>      minItems: 1
>      items:
>        - const: usb2-0
> -      - const: usb2-1
> -      - const: usb2-2
> -      - const: usb2-3
>        - const: usb3-0
> -      - const: usb3-1
> -      - const: usb3-2
> -      - const: usb3-3
> =20
>    avddio-usb-supply:
>      description: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
> --=20
> 2.40.1
>=20

--6032cX2oMZzLCuYF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG+KpwAKCRB4tDGHoIJi
0jC4AQDylP8KaWqPnEBN44hFeAbp72VX8q8/FP2vVH7qdqpqiAEA8dY7ncKN7tjz
mw3hkVsQWeBPoNshBboVWqINmLqnWQs=
=kYkx
-----END PGP SIGNATURE-----

--6032cX2oMZzLCuYF--
