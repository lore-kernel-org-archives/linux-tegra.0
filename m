Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF3638552C;
	Tue,  1 Sep 2026 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257431; cv=none; b=W0lx8i6bzsvBHMh+NKi7Gw5jUTmaqUUBGYsvJu17yeUjSYRBegC8X8s9SL/WAICXb01VRaF18FxrEQg92IuvSImN9VSN4u8i5CBw27nSj0jzRRpwaXm4V0Clbxa/SqqLIA9ZMfNc3CWkxK0MAhRecUwTKwwTOV32JWMvzmI3P8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257431; c=relaxed/simple;
	bh=k1l98lXr0rmQMTcPKfS14NQli5W7p2DK6djLFDrwjaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uU3ZZbuaaVY7Xq6sTfpXGsHUNbwyby1tObDNjX5lldObUtZBt96FTeEBVO8bmLTD8RBXwjyDXc6R8ECji4WpkhlIQoYe90qnzAWx885jQbJnnG2Df12HLS/FuuVXvy1sraS3r3k50HoilI2AWBKjLOEENUXtb1wuG0TzSLssGsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIp6Dj3L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIp6Dj3L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497391F000E9;
	Tue,  1 Sep 2026 10:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788257430;
	bh=mTW1P4jH11mmJj9GOyg5JewC/DNoiFnotN2d6AbTLmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VIp6Dj3LshbQA5iR89kQik10SY+PxCaGIDiqCQeYaQtb5vBxjT3MazWbND9D8I+4z
	 dQOGcU6R2SDu/qIBIJniTBtGRjL6F6/t5Fqt0d5xZ1/MpvA2dCaHJ0s5edLSabZcfB
	 Acm5XVfRnDDEOIMKnC9G8fDcaMXCNzV8uvtpXGNTkr0FUMtCueWTVpmMIz60QpYl93
	 kkl+BTlBoWDb7E7REQTtKEgSZ3/CDNW7y3NFrlOTTkyHJgDbgGZWmKUgSHNI1l9YC6
	 c5HsbHetRG095behaIP5aD7IvKF+N3F3mLQCorna5/70GJF9KH+Q4oaC4UQ6hxv2LY
	 Uwd0Fsbnkehhg==
Date: Tue, 1 Sep 2026 12:10:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wayne Chang <waynec@nvidia.com>
Cc: mathias.nyman@intel.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 2/8] dt-bindings: usb: Add Tegra264 XUSB host support
Message-ID: <20260901-solid-uber-coati-381d2d@quoll>
References: <20260831185835.3732707-1-waynec@nvidia.com>
 <20260831185835.3732707-3-waynec@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831185835.3732707-3-waynec@nvidia.com>

On Tue, Sep 01, 2026 at 02:58:29AM +0800, Wayne Chang wrote:
> Extend the Tegra234 XUSB host binding to cover Tegra264:
> 
> - Add nvidia,tegra264-xusb compatible string
> - Document optional USB wake interrupts for Tegra264
> - Document Tegra264 PMC wake event to port mapping
> - Allow up to five IOMMU specifiers for the additional XUSB host
>   stream IDs
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>

Why are USB patches mixed with DTS and phy ones? That's like three
separate subsystems, of which Greg explicitly said many, many times he
takes everything or nothing. Please read submitting patches in DT.



> ---
> V1 -> V2: Property definitions are back at the top level with the widest
> constraints, The allOf conditional only tightens Tegra234 to interrupts
> maxItems 9 and iommus maxItems 1.
> 
>  .../bindings/usb/nvidia,tegra234-xusb.yaml    | 35 ++++++++++++++++---
>  1 file changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> index ec0993497fbb..d63f0db4224c 100644
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> @@ -17,7 +17,9 @@ description: |
>  
>  properties:
>    compatible:
> -    const: nvidia,tegra234-xusb
> +    enum:
> +      - nvidia,tegra234-xusb
> +      - nvidia,tegra264-xusb
>  
>    reg:
>      items:
> @@ -43,6 +45,7 @@ properties:
>        - description: USB wake event 4
>        - description: USB wake event 5
>        - description: USB wake event 6
> +      - description: USB wake event 7
>      description: |
>        The first two interrupts are required for the USB host controller. The
>        remaining USB wake event interrupts are optional. Each USB wake event is
> @@ -50,10 +53,9 @@ properties:
>        platform. The USB host controller can function even if no wake-up events
>        are defined. The USB wake event interrupts are handled by the Tegra PMC;
>        hence, the interrupt controller for these is the PMC and the interrupt
> -      IDs correspond to the PMC wake event IDs. A complete list of wake event
> -      IDs is provided below, and this information is also present in the Tegra
> -      TRM document.
> +      IDs correspond to the PMC wake event IDs.
>  
> +      Tegra234 PMC wake events:
>          PMC wake-up 76 for USB3 port 0 wakeup
>          PMC wake-up 77 for USB3 port 1 wakeup
>          PMC wake-up 78 for USB3 port 2 and port 3 wakeup
> @@ -62,6 +64,16 @@ properties:
>          PMC wake-up 81 for USB2 port 2 wakeup
>          PMC wake-up 82 for USB2 port 3 wakeup
>  
> +      Tegra264 PMC wake events:
> +        PMC wake-up 79 for USB3 port 0 wakeup
> +        PMC wake-up 80 for USB3 port 1 wakeup
> +        PMC wake-up 81 for USB3 port 2 wakeup
> +        PMC wake-up 82 for USB3 port 3 wakeup
> +        PMC wake-up 83 for USB2 port 0 wakeup
> +        PMC wake-up 84 for USB2 port 1 wakeup
> +        PMC wake-up 85 for USB2 port 2 wakeup
> +        PMC wake-up 86 for USB2 port 3 wakeup
> +
>    clocks:
>      items:
>        - description: XUSB host clock
> @@ -97,7 +109,8 @@ properties:
>        - const: write
>  
>    iommus:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 5

You should list the items instead. Flexible array means now the order
have a meaning.

>  
>    nvidia,xusb-padctl:
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -137,6 +150,18 @@ properties:
>  allOf:
>    - $ref: usb-xhci.yaml
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra234-xusb
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 9
> +        iommus:
> +          maxItems: 1

And the new device has flexible interrpts and iommus?

Best regards,
Krzysztof

