Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58712877E2;
	Fri,  8 Aug 2025 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754671512; cv=none; b=YHGz5eyw/VTkw2LDNRDyMxuiLVFec2p/vEeFv48slcjD4R0slwbrL7aqX9xfaIoQ9qzcQ1raBhTYAddBXPT1ArZFK5rIEAbh0LRock19VRvi+q8iMPWJbWWjoiHkAJmIgJNDyI2J47fDtBF0JfDociwLqDsNdhb9BNNrPBKQRBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754671512; c=relaxed/simple;
	bh=I+vY0WeG46FeBW4Q0FSDLAP9663F3VLOjnmkn2wPUeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueofTkYmJyAVM+bd7Ab740Lp9Oaw/1Nt9ojze0XqylP8wduKFHVjZJGe6rOw8lzJYt3Gpchyq7W0EM3h9wSM3gww8xfZXF1xa+obkf5XzPfn6+B8d3KIMqjE/w2UmWDjZsY5kP1jkxLl/XGPtq/mi6umGSmLJEbYXMhWs5SrdUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u9FCslnr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u9FCslnr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F1CC4CEED;
	Fri,  8 Aug 2025 16:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754671512;
	bh=I+vY0WeG46FeBW4Q0FSDLAP9663F3VLOjnmkn2wPUeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u9FCslnrJMy5Bf6rgUmtlQF5NKCnnMVMF9APEjIA+O9URbWlBd+QeAQVdU7gZmKwj
	 Qgyns8y/3iQhQZNPFO1hW+KoNf0q3FBW8r0xBEaeBZEf+Qb1iiJV1wjAv5btr6tZlf
	 tl0cx20DrKAA92sP3ZrC9GgAayOcrDs7my12E8R6AR5UYRKrBbN55bzJ15EHVttA58
	 28V1SrHIKlH0K5YvuwHvbUEAf2iGPh6mbhvw4kqlC25z1JO4SK4eYeNp+pcj8+uZ6s
	 mMzDabXAgMgBYnUYg2DOTe6hZjZNoszqq9/915R2z0+9Npjn/DjVjvuvygLUGwgW12
	 YQ5t7sJQWovBg==
Date: Fri, 8 Aug 2025 11:45:11 -0500
From: Rob Herring <robh@kernel.org>
To: Haotien Hsu <haotienh@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Brad Griffis <bgriffis@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>,
	Vedant Deshpande <vedantd@nvidia.com>,
	Akhil R <akhilrajeev@nvidia.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, Henry Lin <henryl@nvidia.com>,
	Jui Chang Kuo <jckuo@nvidia.com>, Wayne Chang <waynec@nvidia.com>,
	WK Tsai <wtsai@nvidia.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: Add wake-up support for
 Tegra234 XUSB host controller
Message-ID: <20250808164511.GA340427-robh@kernel.org>
References: <20250808065733.347264-1-haotienh@nvidia.com>
 <20250808065733.347264-2-haotienh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808065733.347264-2-haotienh@nvidia.com>

On Fri, Aug 08, 2025 at 02:57:30PM +0800, Haotien Hsu wrote:
> Populate USB wake events for Tegra234 XUSB host controller.
> These wake-up events are optional to maintain backward compatibility and
> because the USB controller does not require them for normal operation.
> 
> Signed-off-by: Haotien Hsu <haotienh@nvidia.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> V1->V2
> - Add the Acked-by tag to the commit message.
> ---
>  .../bindings/usb/nvidia,tegra234-xusb.yaml    | 28 +++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> index db761dcbf72a..6365c6647cd7 100644
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> @@ -32,9 +32,32 @@ properties:
>        - const: bar2
>  
>    interrupts:
> +    minItems: 2
>      items:
>        - description: xHCI host interrupt
>        - description: mailbox interrupt
> +      - description: USB wake event 0
> +      - description: USB wake event 1
> +      - description: USB wake event 2
> +      - description: USB wake event 3
> +      - description: USB wake event 4
> +      - description: USB wake event 5
> +      - description: USB wake event 6
> +    description: |
> +      The first two interrupts are required for the USB host controller. The remaining USB wake

Wrap lines at <80 chars.

> +      event interrupts are optional. Each USB wake event is independent; it is not necessary to use
> +      all of these events on a platform. The USB host controller can function even if no wake-up
> +      events are defined. The USB wake event interrupts are handled by the Tegra PMC; hence, the
> +      interrupt controller for these is the PMC and the interrupt IDs correspond to the PMC wake
> +      event IDs. A complete list of wake event IDs is provided below, and this information is also
> +      present in the Tegra TRM document.

blank line

> +      PMC wake-up 76 for USB3 port 0 wakeup
> +      PMC wake-up 77 for USB3 port 1 wakeup
> +      PMC wake-up 78 for USB3 port 2 and port 3 wakeup
> +      PMC wake-up 79 for USB2 port 0 wakeup
> +      PMC wake-up 80 for USB2 port 1 wakeup
> +      PMC wake-up 81 for USB2 port 2 wakeup
> +      PMC wake-up 82 for USB2 port 3 wakeup

indent lists.

>  
>    clocks:
>      items:
> @@ -127,8 +150,9 @@ examples:
>                <0x03650000 0x10000>;
>          reg-names = "hcd", "fpci", "bar2";
>  
> -        interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> -                     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupts-extended = <&gic GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +                              <&gic GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
> +                              <&pmc 76 IRQ_TYPE_LEVEL_HIGH>;
>  
>          clocks = <&bpmp TEGRA234_CLK_XUSB_CORE_HOST>,
>                   <&bpmp TEGRA234_CLK_XUSB_FALCON>,
> -- 
> 2.34.1
> 
