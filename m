Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91DE22ACFA;
	Fri, 21 Mar 2025 16:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572957; cv=none; b=btpj9nPMzlfj/gi4Np0fUwxqEA+iSQ/4e19Ey7HMMuPYmeYA30X590lWrGGMGnfMqzfPpCS5KRn2TeJArWoURGdOJeuIQOY/gdQrqetwahjFWmQ18fekLdR7cSMpO7ogPBBRSzdo7xpQhwJtWd+QCmTr+BS8JZ6k/488kI9wxe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572957; c=relaxed/simple;
	bh=resnADRUm3B6YICfc7C0t17uPShmPUu14X1Oc5NkELU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6f4tmt/hSiUanMd5u31JscwJDldw65EohmJqbLPuxtu4KIDk32YViGhG5yenOB2TvfdsyxTXdUniF4U+XXnX5kIsSWJSZ9nUA5F6MSyNA2vD1QB3CNAqRn8vo6ApgTAzYDe2gjFkna9x9sCiJL1qAiFphypIYD8j1BAcUVkgs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBbVtFEb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBbVtFEb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05EB7C4CEE8;
	Fri, 21 Mar 2025 16:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742572956;
	bh=resnADRUm3B6YICfc7C0t17uPShmPUu14X1Oc5NkELU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VBbVtFEbNQeeUapwx6R6GebJvWo83vLLP3PhO7XPdqY0zK0e42RjDqj8Y6o6sJH8e
	 y/ipEUN5MgIXaP7Tk0aKQvNKBdiGf5TEnUJEvOaPPgEZtetivUqZsicIoFMnZkJZsW
	 KgYaALmHleb0S9BF/VRyMbqBpdih7F5b87W3l+flOFeKub9PzcNIfTGlXEjocHvXo/
	 3krqiUrbRUBndqI8meOa7mvAQJHTOuj4kTQtg47wOip2LnTbByhOflXCm2uZzGxS3+
	 ha7qDJYedDKnZ9mUZRNhxG8QwSNvsdvuNoy/zhcKrHYnstQwFK8gClh1PYbWC2TDUV
	 LkqiFLB6G1pcw==
Date: Fri, 21 Mar 2025 11:02:34 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: tegra: document EPP, ISP,
 MPE and TSEC for Tegra114 and Tegra124
Message-ID: <20250321160234.GA3372208-robh@kernel.org>
References: <20250314074557.16367-1-clamor95@gmail.com>
 <20250314074557.16367-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314074557.16367-2-clamor95@gmail.com>

On Fri, Mar 14, 2025 at 09:45:55AM +0200, Svyatoslav Ryhel wrote:
> The current EPP, ISP and MPE schemas are largely compatible with Tegra114
> and Tegra124, requiring only minor adjustments. Additionally, the TSEC
> schema for the Security engine, which is available from Tegra114 onwards,
> is included.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra114-tsec.yaml   | 66 +++++++++++++++++++
>  .../display/tegra/nvidia,tegra20-epp.yaml     | 14 ++--
>  .../display/tegra/nvidia,tegra20-isp.yaml     | 14 ++--
>  .../display/tegra/nvidia,tegra20-mpe.yaml     | 18 +++--
>  4 files changed, 99 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
> new file mode 100644
> index 000000000000..c66ac6a6538e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
> @@ -0,0 +1,66 @@
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
> +
> +      - items:
> +          - const: nvidia,tegra132-tsec
> +          - const: nvidia,tegra124-tsec

nvidia,tegra210-tsec appears to be about the same, already in use, and 
undocumented, so please add it to this binding.

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
> +
> +additionalProperties: false

required properties?

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
