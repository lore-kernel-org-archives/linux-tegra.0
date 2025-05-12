Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8105E248F49;
	Mon, 12 May 2025 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747067082; cv=none; b=dqWPS5jEZukh03/nUzhf3aMdqzs1UyyQ+s++rZK+PKXzKhRMtWck+qHfVOHENiU9z+M5rZW/dj0OY3LddGtn9bo68yV3R0yzLVjZoDgtFYK1rEjpGaJ2D2hrHbMmHf/YZogKQmBgjvQt1u/JaGppfYpzBIHylJunCA6BEqCy3wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747067082; c=relaxed/simple;
	bh=r/UZNmFYWgtwLiPQR7YXnDQZ1KJqs2OKZNrQQbttzmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6bOvRgZ2WOf1RXFJ4zr+s989/vJ+ZPFIu2zqZB3/IHgFx1JXrtAQhUvzfg5x6GMpbt+fpPlu/prJJ0S/WmBsnQsWG6hKnZLGqIxba7QEeq0pvMOIV+hrX6nBGhv0uWc0FIjNBJWbTup1Rm9p9BMPy2ALCGwOuO5BdKSdnu1WmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPTRWWvz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPTRWWvz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0AF6C4CEE7;
	Mon, 12 May 2025 16:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747067082;
	bh=r/UZNmFYWgtwLiPQR7YXnDQZ1KJqs2OKZNrQQbttzmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fPTRWWvznMT4g7LeNUe1n5ADd7juAK2snyBKEcY79qo22TS8TdCeF9q1SqWAeZV8V
	 TMck4o4LVEe1HUyZuahUCqeMOHSQuCf6PAqowUwWCKMPnwRIngfgV2arZhV2p0V/uB
	 gEiKJimRZiPDQUZuOFFHJ5UZiUbe7cWRe2JmDUHgiKbOCNfY9180LDQO7Yk5hV6/tr
	 +4dOa5uXIqkuhOI4td7Cg6r5gn7Kh/MWi00m0ocynLvgPCrfF+tlJbkm8K7tga4rTe
	 X0SvEKJPGvuUzbZqcsjr3+3qEh0TGl0X5ClAme3GHUquGjPmIvuup0zPMuRfhrzWNI
	 K6VbMvryH5QnQ==
Date: Mon, 12 May 2025 11:24:39 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: display: tegra: document EPP, ISP,
 MPE and TSEC for Tegra114+
Message-ID: <20250512162439.GA3441216-robh@kernel.org>
References: <20250504092324.10802-1-clamor95@gmail.com>
 <20250504092324.10802-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504092324.10802-2-clamor95@gmail.com>

On Sun, May 04, 2025 at 12:23:22PM +0300, Svyatoslav Ryhel wrote:
> The current EPP, ISP and MPE schemas are largely compatible with Tegra114+,
> requiring only minor adjustments. Additionally, the TSEC schema for the
> Security engine, which is available from Tegra114 onwards, is included.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra114-tsec.yaml   | 79 +++++++++++++++++++
>  .../display/tegra/nvidia,tegra20-epp.yaml     | 14 +++-
>  .../display/tegra/nvidia,tegra20-isp.yaml     | 15 +++-
>  .../display/tegra/nvidia,tegra20-mpe.yaml     | 18 +++--
>  4 files changed, 113 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
> new file mode 100644
> index 000000000000..ed0a5a8a091b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra Security co-processor
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +description: Tegra Security co-processor, an embedded security processor used
> +  mainly to manage the HDCP encryption and keys on the HDMI link.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nvidia,tegra114-tsec
> +          - nvidia,tegra124-tsec
> +          - nvidia,tegra210-tsec
> +
> +      - items:
> +          - const: nvidia,tegra132-tsec
> +          - const: nvidia,tegra124-tsec
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: tsec

Drop -names properties if there is only 1.

> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: tsec
> +
> +  iommus:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  power-domains:
> +    items:
> +      - description: phandle to the core power domain

Instead, just 'maxItems: 1'.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - resets
> +  - reset-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra114-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    tsec@54500000 {
> +        compatible = "nvidia,tegra114-tsec";
> +        reg = <0x54500000 0x00040000>;
> +        interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&tegra_car TEGRA114_CLK_TSEC>;
> +        resets = <&tegra_car TEGRA114_CLK_TSEC>;
> +        reset-names = "tsec";
> +    };
