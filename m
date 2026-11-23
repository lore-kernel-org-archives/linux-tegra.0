Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434244;
	b=rJy91I0XLuWOIKBGVCbFiWVCPyH+/07dlC8isSWWVZa/tKZzzsiIRFsLlQSXXgi9fY6l
	 b+zefpGflrd3oXSDoIWSDFR2+meE5dYR2SUPAoJ/g/Ua559CHDcDIqj7UZSieVEuP8wjD
	 DfYG9UXuj6azqsNzNw/3wTNguB7biWOMmYleFLyE2Gr5/hUPxlUvkOXLjBIgWblN7MKih
	 DeXtd17tdZEeLzeQMcWutrXE/QkHBI3xJ75Bl7FcViqzLI6Pu9yUlT5QQ72M0J2T+jjM9
	 611+rPOd3i+ruF2TTbf6mIseQ3kdsOAAkWA2469DM295Klf4K/VMPbNK+SCATHhqlbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434244;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/0ejSNlRu4xWE52mLb4QOPKwVZHO3yqe+KvuEcrsyw4=;
	b=q36IG1YvYttIBI0gRWze0SGTRtxHNu/Rv0WrJWSM+6m7eYAIOOZjYPkVe46c+etkfrOR
	 Ho66s1V52QwOL1KKpURaxRh3t5BvmOw68TEI/oTLzwaT4+Uq3LZwFH9efmw4Cv/WcyUNT
	 42Pz0rYzJI3Sry/VpNpUoa9329DVlSRkcKKd76JJWMati+iaypzOIdxcOoE3eV2Mk8jnG
	 Oq/Xfnl2cFgyTiAdsJtp90fET9PqvqFyd/nyEL+1+vhRERHE0M+ia/PeOK9EYUra09vg/
	 KFiygAKtxTW3yaiwCR6dPm5wRWfII6IXB+MqSCJqDxIfSWlzvaxDEeIN2PsHq8tTiwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bqaClvdG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED4D606A31F;
	Mon, 23 Nov 2026 11:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bqaClvdG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A19E1F000E1;
	Mon, 23 Nov 2026 11:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795434244;
	bh=/0ejSNlRu4xWE52mLb4QOPKwVZHO3yqe+KvuEcrsyw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bqaClvdG17qxe31niDjuLqC93mYbiPqKiy4NrXeDv+F9TcsPaXZCynlxfG/oxEyyy
	 88Vz9jxPF+iov1xZnuUqbx1dg0cI7Z82amexQdgd6SFEfGXBnN12sL7DsqEDn6DCI/
	 uUEQSi3ieHmT74Hh72+JMM0QNu3sGlUylc2FeYNo3VPnXQL+WcDtPjYjBxqgqLNlL9
	 TW4Fb4P2I6ktrVlmmkJWUULkqM03tvlgzdZ86FIo0JrVW+XyooGKnfTnHL+1hl5a4s
	 INNCtokjuxi7Tl2MI3lmlDKx1yz+VoeF0oH3tCS2uJ5NqpxEalPUjhTtXOQ8tQ57fT
	 2GWhbIbSHBKvg==
Date: Mon, 23 Nov 2026 12:44:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Nagarjuna Kristam <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH v2 02/12] dt-bindings: usb: Add Tegra238 XUSB host
 controller support
Message-ID: <20261123-sassy-fragrant-markhor-c6fbb3@quoll>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-2-42efc03a9700@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116-tegra-usb-v2-2-42efc03a9700@nvidia.com>

On Mon, Nov 16, 2026 at 03:23:59PM +0000, Jon Hunter wrote:
>    reg:
> @@ -140,6 +141,16 @@ properties:
>          - usb3-2
>          - usb3-3
>  
> +  resets:
> +    items:
> +      - description: XUSB host controller reset
> +      - description: XUSB SuperSpeed reset
> +
> +  reset-names:
> +    items:
> +      - const: xusb_host
> +      - const: xusb_ss

Drop xusb_ prefix, that's the name of this device.

> +
>    power-domains:
>      items:
>        - description: XUSBC power domain (for Host and USB 2.0)
> @@ -162,11 +173,44 @@ required:
>    - nvidia,xusb-padctl
>    - phys
>    - phy-names
> -  - power-domains
> -  - power-domain-names
>  
>  allOf:
>    - $ref: usb-xhci.yaml
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra238-xusb
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 8
> +        iommus:
> +          maxItems: 1
> +        power-domains: false
> +        power-domain-names: false
> +        phys:
> +          maxItems: 6
> +        phy-names:
> +          maxItems: 6
> +          items:
> +            enum:
> +              - usb2-0
> +              - usb2-1
> +              - usb2-2
> +              - usb3-0
> +              - usb3-1
> +              - usb3-2

This should be rather fixed for this device, so without enum, just:
items:
  - const: ...
  - const: ...
  ....


Best regards,
Krzysztof

