Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE74C21D018;
	Mon, 21 Apr 2025 22:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272932; cv=none; b=sDIU1WEBEBLkULaPauOLhMuycKLHRgYwWtEqBXh/Ds38+HFUSc4hJfghI0pSAKUa2cBNJwOPikX6O3EZJpR+4H2Bv6ovou4xFUYuTA1wpYesp6uDWpNpI1y+u47r1T3dkD/LR185qAgT3JuQIQzFGxdVq4LkOin/rmAiv6Bzipw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272932; c=relaxed/simple;
	bh=pnTTNOLSkxWgo8Qpo1kxsqzHcI0XFENBkLcqQ6rfLjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2p4J2RDAbAOHUuO6MqboJZcuskyLLbApjhMR/9py7vlHgLtYiRWNr7N3vRPoJc9710Bmk9m0icQBMuPAlyZQ99NhbcEw35itWfRKdvoaJYlqWOM66LmDjoD2WHsX41DNluVO/0+mvBSFmUH/7yHjjp48P9AFnDZWCQ+cHz9h2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ToZ+8yHC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ToZ+8yHC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D492C4CEE4;
	Mon, 21 Apr 2025 22:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745272931;
	bh=pnTTNOLSkxWgo8Qpo1kxsqzHcI0XFENBkLcqQ6rfLjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ToZ+8yHCXCux86okMYpevI8uPxvYaOKGoiuyDBuvYwL1Xq4SP1HQVZus9Zp2LQhE/
	 EJFlAdapCK7Q4KScyiexuZefQh0+M2nNbrn0eyJOzF206UZs7tq8E3sazeRHJyjGAr
	 vNOZb9rgoqWfORJyQIxWBj7ZylZpyl+xac5TRHpw4rrJm9QK7Ja6RClIIfNH29C+uc
	 JmT3AGNCyAsIhObUVWxaf7H7ad5gPlsN5g+s7O+H0Cd7SWkLdaY2mT0ojHaaIdwsju
	 nLyAz6nJyrvFhpHjENv20eKBrl/oEVaXrkx+uOzeSfqHyrhGi8yRvAWk7396pM5kW1
	 ju4Tnxv35Tm2g==
Date: Mon, 21 Apr 2025 17:02:09 -0500
From: Rob Herring <robh@kernel.org>
To: Shubhi Garg <shgarg@nvidia.com>
Cc: lee@kernel.org, alexandre.belloni@bootlin.com, thierry.reding@gmail.com,
	jonathanh@nvidia.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: mfd: add bindings for NVIDIA VRS PSEQ
Message-ID: <20250421220209.GA2975150-robh@kernel.org>
References: <20250416120619.483793-1-shgarg@nvidia.com>
 <20250416120619.483793-2-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120619.483793-2-shgarg@nvidia.com>

On Wed, Apr 16, 2025 at 12:06:15PM +0000, Shubhi Garg wrote:
> Add bindings for NVIDIA VRS (Voltage Regulator Specification) power
> sequencer device. NVIDIA VRS PSEQ controls ON/OFF and suspend/resume
> power sequencing of system power rails on Tegra234 SoC. This device
> also provides 32kHz RTC support with backup battery for system timing.
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
>  .../bindings/mfd/nvidia,vrs-pseq.yaml         | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml b/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
> new file mode 100644
> index 000000000000..d4c5984930e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.

First I've seen this...

According to this[1], you shouldn't have 'Copyright (c)'. But better 
check with your lawyers.

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
> +  NVIDIA Voltage Regulator Specification Power Sequencer device controls ON/OFF

Wrap at 80 char.

> +  and suspend/resume power sequencing of system power rails for NVIDIA
> +  SoCs. It provides 32kHz RTC clock support with backup battery for
> +  system timing.

Nothing in this description indicates it's also an interrupt controller.

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
> +            compatible = "nvidia,vrs-pseq";
> +            reg = <0x3c>;
> +            interrupt-parent = <&pmc>;
> +            interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +            status = "disabled";

Examples should be enabled or removed.

> +       };
> +    };
> -- 
> 2.25.1
> 
