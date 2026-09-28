Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DE04F393F;
	Mon, 28 Sep 2026 21:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631691; cv=none; b=dpOdoI5C/OZuifqqsx/vCr+8hBFtFie93bNTIS7EsJGjZuSBN7l3Do5f9AR+34SZaXl/zqv/oqGQt/rYtWqFU4FcAc1ijtBL6T2+iqiBqOON3yC9O+JAhPezyheBP50pQxne/CYJzpLACwWpmLxlM5bPIf2+byEC/+hyCXloBkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631691; c=relaxed/simple;
	bh=viP1DO9NWrDK4TvrvurhTSjgnbtzlWHRahfeQbzb/ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlEJoLm+v03kygt7e//WoYKjmrPOt+MFqXgzaSSzsFENXj6zgfv53HnPIi5j230FRq5mmVmJj0r7jamGnyrPAGypxtD3ThQlQEdmKiY5C3z/6QXkX6J0pi2K+qnsRYguKX2I9pQjB2/UKAiIcIIhD/wudFnT7wai5J3ZIKqSFxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYZR+ueX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYZR+ueX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169881F000FF;
	Mon, 28 Sep 2026 21:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790631690;
	bh=sWHUFNzAzpt4+xiPUsMGINIZ4IBYatV4RrzdZAJVpWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VYZR+ueXOMt+ABadtXBx/D/yfvkHNxd3tVTIQUqzBS3HBAeuhZsiZK8pcFqsnyHeS
	 +EVoAqIz6H5ZM0WoFr3aROetWHfGinfk2xMhtSVmeCC/7/i/r+Iemgr0hbKF92sYmC
	 +seIsyW8iNJF9h47nAzjZV8tFg5bFLZi4psOgkljpGYxJo6dxz7uPvU3vBuvtbEu/e
	 4ZxZi2txLkqZMtJwuBgEWcTvAKHIcAOUct2M5Z+MmXdu2lhY/uYOvz/CxN3NQcWVpF
	 74ibsne9rkqpfgoqyshQSGS6MJukLWN8+hldBCqgEAmKBFD64WP14SC4BN5ByPYTkW
	 75Lxn+8xNMzkA==
Date: Mon, 28 Sep 2026 16:41:22 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: as3722: Convert to json-schema
Message-ID: <20260928214122.GA804761-robh@kernel.org>
References: <20260928-as3722-bindings-v1-0-35f423a9f2b2@nvidia.com>
 <20260928-as3722-bindings-v1-1-35f423a9f2b2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-as3722-bindings-v1-1-35f423a9f2b2@nvidia.com>

On Mon, Sep 28, 2026 at 06:24:40PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the AMS AS3722 PMIC bindings from the free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/mfd/ams,as3722.yaml        | 276 +++++++++++++++++++++
>  Documentation/devicetree/bindings/mfd/as3722.txt   | 214 ----------------
>  .../bindings/regulator/as3722-regulator.txt        |  91 -------
>  3 files changed, 276 insertions(+), 305 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ams,as3722.yaml b/Documentation/devicetree/bindings/mfd/ams,as3722.yaml
> new file mode 100644
> index 000000000000..6a6444500396
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ams,as3722.yaml
> @@ -0,0 +1,276 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ams,as3722.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AMS AS3722 Power Management IC
> +
> +maintainers:
> +  - Laxman Dewangan <ldewangan@nvidia.com>
> +  - Lee Jones <lee.jones@linaro.org>
> +
> +properties:
> +  compatible:
> +    const: ams,as3722
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  # standard properties
> +  interrupt-controller:
> +    description: The AS3722 has an internal interrupt controller which takes
> +      the interrupt request from internal sub-blocks like RTC, regulators,
> +      GPIOs as well as external input.
> +
> +  "#interrupt-cells":
> +    description: The first cell is the IRQ number. IRQ numbers for different
> +      interrupt source of AS3722 are defined at dt-bindings/mfd/as3722.h The
> +      second cell is the flags, encoded as the trigger masks from binding
> +      document interrupts.txt, using dt-bindings/irq.
> +    const: 2
> +
> +  # from gpio.yaml
> +  gpio-controller: true
> +  "#gpio-cells": true

Constraints?

> +
> +  # optional properties
> +  ams,enable-internal-int-pullup:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: Boolean property, to enable internal pullup on interrupt pin.
> +      Omitting this will disable internal pullup on INT pin.

No need to say "Boolean property" when the schema defines that.

> +
> +  ams,enable-internal-i2c-pullup:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: Boolean property, to enable internal pullup on I2C SCL/SDA
> +      pins. Omitting this will disable internal pullup on I2C SCL/SDA lines.
> +
> +  ams,enable-ac-ok-power-on:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: Boolean property, to enable exit out of power off mode with
> +      AC_OK pin (pin enabled in power off mode).
> +
> +  ams,system-power-controller:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: The AS3722 supports the system power off by turning off all
> +      its rails. The device node should contain this boolean property to
> +      enable this functionality.
> +
> +  pinmux:
> +    type: object

       additionalProperties: false

> +    description: |
> +      Device has 8 GPIO pins which can be configured as GPIO as well as the
> +      special IO functions.
> +
> +      Please refer to pinctrl-bindings.txt in this directory for details of
> +      the common pinctrl bindings used by client devices, including the
> +      meaning of the phrase "pin configuration node".
> +
> +    patternProperties:
> +      "^gpio[0-7_]+$":
> +        description: |

Don't need '|'

> +          Child nodes of the pinmux node represent some desired configuration
> +          for a list of pins. This configuration can include the mux function
> +          to select on those pin(s), and various pin configuration parameters,
> +          such as pull-up, open drain.
> +        type: object

blank line

I prefer that 'description' is consistently either first or last 
(in initial schema properties before 'properties'). You have a mixture.

> +        properties:
> +          pins:
> +            $ref: /schemas/types.yaml#/definitions/string-array
> +            description: List of pins for this configuration group.
> +            items:
> +              enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7 ]
> +
> +          function:
> +            $ref: /schemas/types.yaml#/definitions/string
> +            description: Function configuration for this configuration group.
> +            enum: [ gpio, interrupt-out, gpio-in-interrupt,
> +                    vsup-vbat-low-undebounce-out, vsup-vbat-low-debounce-out,
> +                    voltage-in-standby, oc-pg-sd0, oc-pg-sd6, powergood-out,
> +                    pwm-in, pwm-out, clk32k-out, watchdog-in, soft-reset-in ]
> +
> +          bias-disable:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +
> +          bias-pull-up:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +
> +          bias-pull-down:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +
> +          bias-high-impedance:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +
> +          drive-open-drain:
> +            $ref: /schemas/types.yaml#/definitions/flag

Other than cases which have 2 possible types, these all have types 
which don't need to be repeated here. You also need a $ref to 
pincfg-node.yaml and pinmux-node.yaml (for function).

> +
> +        additionalProperties: false

Preferred to put this before 'properties' for the indented cases.

> +
> +        required:
> +          - pins
> +
> +  regulators:
> +    type: object
> +    description: Device has multiple DCDC and LDOs. The node "regulators" is
> +      required if regulator functionality is needed.
> +
> +    properties:
> +      vsup-sd2-supply:
> +        description: input supply for SD2
> +
> +      vsup-sd3-supply:
> +        description: input supply for SD3
> +
> +      vsup-sd4-supply:
> +        description: input supply for SD4
> +
> +      vsup-sd5-supply:
> +        description: input supply for SD5
> +
> +      vin-ldo0-supply:
> +        description: input supply for LDO0
> +
> +      vin-ldo1-6-supply:
> +        description: input supply for LDO1 and LDO6
> +
> +      vin-ldo2-5-7-supply:
> +        description: input supply for LDO2, LDO5 and LDO7
> +
> +      vin-ldo3-4-supply:
> +        description: input supply for LDO3 and LDO4
> +
> +      vin-ldo9-10-supply:
> +        description: input supply for LDO9 and LDO10
> +
> +      vin-ldo11-supply:
> +        description: input supply for LDO11
> +
> +    patternProperties:
> +      "^(sd[0-6]|ldo[0-7]|ldo9|ldo10|ldo11)$":
> +        type: object

Missing regulator.yaml ref and unevaluateProperties?
 
> +        description: These sub-nodes must be named after one of the regulators
> +          found on the AS3277. Each sub-node should contain the constraints and
> +          initialization information for that regulator.
> +
> +        properties:
> +          ams,ext-control:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: External control of the rail. The value of this
> +              property will tell which external input is controlling this rail.
> +              Valid values are 0, 1, 2 ad 3. If this property does not exist,
> +              the default value is 0. The external control pin macros are
> +              defined in dt-bindings/mfd/as3722.h.
> +            oneOf:
> +              - description: there is no external control of this rail
> +                const: 0
> +              - description: rail is controlled by ENABLE1 input pin
> +                const: 1
> +              - description: rail is controlled by ENABLE2 input pin
> +                const: 2
> +              - description: rail is controlled by ENABLE3 input pin
> +                const: 3
> +            default: 0
> +
> +          ams,enable-tracking:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: Enable tracking with SD1, only supported by LDO3.

