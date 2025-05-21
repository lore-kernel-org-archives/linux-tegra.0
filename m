Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5425F129E6E;
	Wed, 21 May 2025 09:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818587; cv=none; b=CUqKIKGG8B2SprLRKi3zoIUAf94I4VdPzla4tFjn3omu8mg9+2EDsl/3rz8JMC8zm20CskJNNKvKyNJbPxjm4cXTezXQmkFM3sYkpGI4NOvCjvZIcCaPlHRBdMbkKh6wtmKGEeRKgDDb1uCt7ZHw9Gk/GTI//cUiWbB7bxA6p60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818587; c=relaxed/simple;
	bh=zF8qQy0iHUZ/jPexZJZzJkDJwfohmG1IM7OmwXiH8ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhQ7pXSZAfRY3Laz7Cx7jq7eLlZcWKntNPyfo+8Exyk5Eeqaxw7jvXjAaM8nwPTVhckiRjzDI3FdbWm5D0dAawaxJtqstJ3EGo3Ukzmcz+oEKKqjaounawNZzJUHcZQNXNzzBmBVqd76KB9XONWL9asDgkPdxLHVNU0wa9j9Iyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fO9/2rEb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fO9/2rEb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52566C4CEE4;
	Wed, 21 May 2025 09:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818586;
	bh=zF8qQy0iHUZ/jPexZJZzJkDJwfohmG1IM7OmwXiH8ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fO9/2rEbxBhm4URiY4oFbDobseX/aBZQSW6r5rFEEsgsgtqLJ30WxPBb6J125QDc+
	 67ZeUguxrhAhmRgnKjSNeTIEphyLctVDd93FgPazhGU76jY4eDR05gor6K6FortYMr
	 K25kB7k/9SsnrOM8pXRYzh9iuW8mr3Sb674F7tDaufo1P2vOMjdPTZsJVJ3JHpBSPI
	 bQqTAT0+gIO+3DSt6lMkwPs93+NYSOc5y0hpZHuV6Wsl/MwmJJZLUyqAEc2GuUeByv
	 f8ofze2RHd2OtYKAQUseRtFEgWgGlWCOg36DR805vyUkI2I0wtiSqvLpZUzGm0HPWT
	 ri/HMKBvYvkkw==
Date: Wed, 21 May 2025 11:09:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shubhi Garg <shgarg@nvidia.com>
Cc: jonathanh@nvidia.com, lee@kernel.org, robh@kernel.org, 
	alexandre.belloni@bootlin.com, thierry.reding@gmail.com, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/6] dt-bindings: mfd: add bindings for NVIDIA VRS PSEQ
Message-ID: <20250521-quixotic-jackdaw-of-certainty-ac02dd@kuoka>
References: <20250520090832.3564104-1-shgarg@nvidia.com>
 <20250520090832.3564104-2-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520090832.3564104-2-shgarg@nvidia.com>

On Tue, May 20, 2025 at 09:08:27AM GMT, Shubhi Garg wrote:
> Add bindings for NVIDIA VRS (Voltage Regulator Specification) power
> sequencer device. NVIDIA VRS PSEQ controls ON/OFF and suspend/resume
> power sequencing of system power rails on Tegra234 SoC. This device
> also provides 32kHz RTC support with backup battery for system timing.
>

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
> 
> v2:
> - fixed copyrights
> - updated description with RTC information
> - added status node in dtb node example
> 
>  .../bindings/mfd/nvidia,vrs-pseq.yaml         | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml b/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
> new file mode 100644
> index 000000000000..676a29d4e1fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/nvidia,vrs-pseq.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Voltage Regulator Specification Power Sequencer
> +
> +maintainers:
> +  - Shubhi Garg <shgarg@nvidia.com>
> +
> +description:
> +  NVIDIA Voltage Regulator Specification Power Sequencer device controls
> +  ON/OFF and suspend/resume power sequencing of system power rails for NVIDIA
> +  SoCs. It provides 32kHz RTC clock support with backup battery for system
> +  timing. The device also acts as an interrupt controller for managing
> +  interrupts from the VRS power sequencer.
> +
> +properties:
> +  compatible:
> +    const: nvidia,vrs-pseq
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':

Use consistent quotes, either ' or "

> +    const: 2
> +    description:
> +      The first cell is the IRQ number, the second cell is the trigger type.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        vrs@3c {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
e.g. pmic@ or something appropriate.

> +            compatible = "nvidia,vrs-pseq";
> +            reg = <0x3c>;
> +            interrupt-parent = <&pmc>;
> +            interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +       };

Mixed up indentation.

Best regards,
Krzysztof

