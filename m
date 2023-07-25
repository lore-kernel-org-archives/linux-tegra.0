Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2373EEB64DD
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Jul 2023 20:13:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjGYUNQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Jul 2023 16:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjGYUNO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jul 2023 16:13:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B38B61FCF;
        Tue, 25 Jul 2023 13:13:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2A2DB618CC;
        Tue, 25 Jul 2023 20:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A78CC433C7;
        Tue, 25 Jul 2023 20:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690315992;
        bh=/oB+WbRmcJ8xryE+2WxCR9Kz6yQKxMihN6JK4Kun4Qs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BjZe8mvL40hjXlWwA8cBP1WjvlLsIxnZrWCdd2RdwQefC+RnbmnhebJ2+RvQTbR1N
         HKTGsecWj/7oQXfU0oAVP99AkoOfOYuPgiTCMfUvVpkLFtn4ALbSwhbT6w2uexLxuJ
         qoZC+gPCbEDfOIhtlCy8bATwxZcWcYKDwXz0M/iHYWEgWrqUY9CHIwVzvrnA0h+nxr
         facSA5+3smH8Wb8Pt3IkV7vml/UZHcSauq7Oai7ZdvtSinntGhU/1B2GJ670JiCEEo
         54zIRa/UbgOOVT/cHZpPX5kOR5jYvm5y1isI2mFU0GqYBHLAM3HIRLD4F0r5LipZB7
         sNZI2gUj+YFjA==
Date:   Tue, 25 Jul 2023 21:13:08 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: clock: tegra124-dfll: Convert to
 json-schema
Message-ID: <20230725-ferocity-landfall-3cb67f60f039@spud>
References: <20230725162046.1426970-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pxEfUobMQuzGKX1s"
Content-Disposition: inline
In-Reply-To: <20230725162046.1426970-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--pxEfUobMQuzGKX1s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey,

On Tue, Jul 25, 2023 at 06:20:46PM +0200, Thierry Reding wrote:
> +  nvidia,pwm-to-pmic:
> +    description: Use PWM to control regulator rather then I2C.
> +    $ref: /schemas/types.yaml#/definitions/flag

> +  # required properties for PWM mode
> +  nvidia,pwm-period-nanoseconds:
> +    description: period of PWM square wave in nanoseconds.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1000
> +    maximum: 1000000000
> +
> +  nvidia,pwm-tristate-microvolts:
> +    description: Regulator voltage in micro volts when PWM control is
> +      disabled and the PWM output is tristated. Note that this voltage
> +      is configured in hardware, typically via a resistor divider.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 3300000
> +
> +  nvidia,pwm-min-microvolts:
> +    description: Regulator voltage in micro volts when PWM control is
> +      enabled and PWM output is low. Hence, this is the minimum output
> +      voltage that the regulator supports when PWM control is enabled.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 3300000
> +
> +  nvidia,pwm-voltage-step-microvolts:
> +    description: |
> +      Voltage increase in micro volts corresponding to a 1/33th increase
> +      in duty cycle. Eg the voltage for 2/33th duty cycle would be:
> +
> +        nvidia,pwm-min-microvolts + nvidia,pwm-voltage-step-microvolts * 2
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 1000000
> +
> +  pinctrl-names:
> +    items:
> +      # I/O pad configuration when PWM control is enabled
> +      - const: dvfs_pwm_enable
> +      # I/O pad configuration when PWM control is disabled
> +      - const: dvfs_pwm_disable

Should "nvidia,pwm-to-pmic" not have a dependencies thing like:
"nvidia,suspend-mode": ["nvidia,core-pwr-off-time", "nvidia,cpu-pwr-off-time"]
to ensure that the required properties are set?

Thanks,
Conor.

--pxEfUobMQuzGKX1s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMAs1AAKCRB4tDGHoIJi
0qbKAP9H3kAVy3HAtlhFPpBLwA29CcRle6CooaM/arRX/t0cYgD/bAIM71Tq7E/H
73GhoaZL0kN2VCjX84kVKzfmdSwFPwU=
=eksT
-----END PGP SIGNATURE-----

--pxEfUobMQuzGKX1s--
