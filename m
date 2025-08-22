Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7803431FD;
	Fri, 22 Aug 2025 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755874778; cv=none; b=P97gdk+SOxfyIWxdIHe7foxS/CNHZdc4c+c5Ih/XCcOlgle8GU0lswmWIqqIYx5Drdf9wc2Vrgjac4EKU9462BFAKxqleZl4xt2NdPNDI3BVySnXvKqgnOJMS2L0qyp6QlfqG7DmHe62nRrfvaZImGEYygPC4JQMPKUBmSAYBZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755874778; c=relaxed/simple;
	bh=QiIs1pkIuMyELjCt2/wzjrK99v47E1KfFEUFDvAoA+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqXaRM/7XrHT88oS/mXN93ddKGkFncKCz6n61ZPLd++wcLBjQ3XcqOcHC3UHtCv4bWHkY8OLvCKf3/Bho0RQY62TTtIzeAIn4O58GfQS/fy4Y6RtgeMqZLky5IvBRVVXgkbQYiyxSGmW+NDzwTRM9WRjdgj8DAmFkBqIakxYeT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrvTPCvq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrvTPCvq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF5AC4CEED;
	Fri, 22 Aug 2025 14:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755874775;
	bh=QiIs1pkIuMyELjCt2/wzjrK99v47E1KfFEUFDvAoA+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KrvTPCvqxasOYk65yKmYn7lc/TcvBvmKohNLldcr/oPoO7OMyNaZuJTg2rm4kAW+h
	 sqAv/ThuDyXTmk+f1LigOr804JFCW9zYXwNncd3aTv+1uBvjbgJwWSt/4+2HJEN1dl
	 YWJB1i6RWhwLFY+djvibe8bjiBp9S1bRuJEvp+VpvPmxCQDSF1lW1HAadgUvxEPfjZ
	 op9VlFZUqi1M/f3k6oJcRf1S+Fc/eLK79phhKjNdrNmikUHyLrqTf5PQmiOZ74zmJW
	 XKQE71hMzis6/z8R1OvFITmzMP3VExwUX6MrWaldcuFtjSInANv9b2iDiOmDjM4Hd+
	 TwcjGf+8gvQkQ==
Date: Fri, 22 Aug 2025 09:59:34 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/9] dt-bindings: memory: Document Tegra114 Memory
 Controller
Message-ID: <20250822145934.GA3791610-robh@kernel.org>
References: <20250820151323.167772-1-clamor95@gmail.com>
 <20250820151323.167772-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820151323.167772-3-clamor95@gmail.com>

On Wed, Aug 20, 2025 at 06:13:16PM +0300, Svyatoslav Ryhel wrote:
> Add Tegra114 suffort into existing Tegra124 MC schema with the most notable
> difference in the amount of EMEM timings.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../nvidia,tegra124-mc.yaml                   | 106 +++++++++++++-----
>  1 file changed, 80 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
> index 7b18b4d11e0a..e2568040213d 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
> @@ -19,7 +19,9 @@ description: |
>  
>  properties:
>    compatible:
> -    const: nvidia,tegra124-mc
> +    enum:
> +      - nvidia,tegra114-mc
> +      - nvidia,tegra124-mc
>  
>    reg:
>      maxItems: 1
> @@ -62,31 +64,7 @@ patternProperties:
>              minimum: 1000000
>              maximum: 1066000000
>  
> -          nvidia,emem-configuration:
> -            $ref: /schemas/types.yaml#/definitions/uint32-array

The type should stay here. It is not conditional.

> -            description: |
> -              Values to be written to the EMEM register block. See section
> -              "15.6.1 MC Registers" in the TRM.
> -            items:
> -              - description: MC_EMEM_ARB_CFG
> -              - description: MC_EMEM_ARB_OUTSTANDING_REQ
> -              - description: MC_EMEM_ARB_TIMING_RCD
> -              - description: MC_EMEM_ARB_TIMING_RP
> -              - description: MC_EMEM_ARB_TIMING_RC
> -              - description: MC_EMEM_ARB_TIMING_RAS
> -              - description: MC_EMEM_ARB_TIMING_FAW
> -              - description: MC_EMEM_ARB_TIMING_RRD
> -              - description: MC_EMEM_ARB_TIMING_RAP2PRE
> -              - description: MC_EMEM_ARB_TIMING_WAP2PRE
> -              - description: MC_EMEM_ARB_TIMING_R2R
> -              - description: MC_EMEM_ARB_TIMING_W2W
> -              - description: MC_EMEM_ARB_TIMING_R2W
> -              - description: MC_EMEM_ARB_TIMING_W2R
> -              - description: MC_EMEM_ARB_DA_TURNS
> -              - description: MC_EMEM_ARB_DA_COVERS
> -              - description: MC_EMEM_ARB_MISC0
> -              - description: MC_EMEM_ARB_MISC1
> -              - description: MC_EMEM_ARB_RING1_THROTTLE
> +          nvidia,emem-configuration: true
>  
>          required:
>            - clock-frequency
> @@ -109,6 +87,82 @@ required:
>    - "#iommu-cells"
>    - "#interconnect-cells"
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra114-mc
> +    then:
> +      patternProperties:
> +        "^emc-timings-[0-9]+$":
> +          patternProperties:
> +            "^timing-[0-9]+$":
> +              properties:
> +                nvidia,emem-configuration:
> +                  $ref: /schemas/types.yaml#/definitions/uint32-array
> +                  description: |

Drop '|'.

> +                    Values to be written to the EMEM register block. See section
> +                    "20.11.1 MC Registers" in the TRM.
> +                  items:
> +                    - description: MC_EMEM_ARB_CFG
> +                    - description: MC_EMEM_ARB_OUTSTANDING_REQ
> +                    - description: MC_EMEM_ARB_TIMING_RCD
> +                    - description: MC_EMEM_ARB_TIMING_RP
> +                    - description: MC_EMEM_ARB_TIMING_RC
> +                    - description: MC_EMEM_ARB_TIMING_RAS
> +                    - description: MC_EMEM_ARB_TIMING_FAW
> +                    - description: MC_EMEM_ARB_TIMING_RRD
> +                    - description: MC_EMEM_ARB_TIMING_RAP2PRE
> +                    - description: MC_EMEM_ARB_TIMING_WAP2PRE
> +                    - description: MC_EMEM_ARB_TIMING_R2R
> +                    - description: MC_EMEM_ARB_TIMING_W2W
> +                    - description: MC_EMEM_ARB_TIMING_R2W
> +                    - description: MC_EMEM_ARB_TIMING_W2R
> +                    - description: MC_EMEM_ARB_DA_TURNS
> +                    - description: MC_EMEM_ARB_DA_COVERS
> +                    - description: MC_EMEM_ARB_MISC0
> +                    - description: MC_EMEM_ARB_RING1_THROTTLE
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra124-mc
> +    then:
> +      patternProperties:
> +        "^emc-timings-[0-9]+$":
> +          patternProperties:
> +            "^timing-[0-9]+$":
> +              properties:
> +                nvidia,emem-configuration:
> +                  $ref: /schemas/types.yaml#/definitions/uint32-array
> +                  description: |
> +                    Values to be written to the EMEM register block. See section
> +                    "15.6.1 MC Registers" in the TRM.
> +                  items:
> +                    - description: MC_EMEM_ARB_CFG
> +                    - description: MC_EMEM_ARB_OUTSTANDING_REQ
> +                    - description: MC_EMEM_ARB_TIMING_RCD
> +                    - description: MC_EMEM_ARB_TIMING_RP
> +                    - description: MC_EMEM_ARB_TIMING_RC
> +                    - description: MC_EMEM_ARB_TIMING_RAS
> +                    - description: MC_EMEM_ARB_TIMING_FAW
> +                    - description: MC_EMEM_ARB_TIMING_RRD
> +                    - description: MC_EMEM_ARB_TIMING_RAP2PRE
> +                    - description: MC_EMEM_ARB_TIMING_WAP2PRE
> +                    - description: MC_EMEM_ARB_TIMING_R2R
> +                    - description: MC_EMEM_ARB_TIMING_W2W
> +                    - description: MC_EMEM_ARB_TIMING_R2W
> +                    - description: MC_EMEM_ARB_TIMING_W2R
> +                    - description: MC_EMEM_ARB_DA_TURNS
> +                    - description: MC_EMEM_ARB_DA_COVERS
> +                    - description: MC_EMEM_ARB_MISC0
> +                    - description: MC_EMEM_ARB_MISC1
> +                    - description: MC_EMEM_ARB_RING1_THROTTLE

I imagine every SoC is going to be slightly different. I really don't 
care to know what are all the magic registers in the list, so I would 
just drop all this and just document the length. Just treat it as opaque 
data like calibration data we have in other bindings.

Rob
