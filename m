Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7995A49C4C1;
	Fri, 25 Sep 2026 13:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342857; cv=none; b=t92fFOTeQFpd7xqqXBuEyFnxkjFFbiI6j+ThioMRuuPGiM6QNq9KJgRPEZ+wbfowPRcp4l4RFJRGhZZeiJYsuO/vGhCPZ4ur0O745Ncnw922JzG7ciESiQsjmNwx7yBJr81v9Cvi/TnWelpePYJ7edM5gCW/WmZob6sM86DwuG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342857; c=relaxed/simple;
	bh=xH4CgvJ6S1TBcJ26MTtAcAZImdtR8Xh7/8reiWfwipE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcmrNhgCzXB3S7mdXXHRHnyZjqzrNwa514OXMK254IQd5SwBGDxUPEDKEC8o5nom40LD0jHcLR7MODESww1GUvxB9U7ebEQCH/kb3TiTnjogntOwg9fx1mewzN1gYbOzzed7xdaGR+5o4OlCNR96VF9SW9z7SlcqXc4iYG1BRiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wdd4qQzI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wdd4qQzI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CDA1F000FF;
	Fri, 25 Sep 2026 13:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790342841;
	bh=iOL2dsI0QKWCvEAu87sQ8NsOgSXgKA4g7aR9kmxjAfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wdd4qQzILq9UhCHkIa8mmY3gY4ea90zw+vpnpeRIsvpMv6kYgZlYCZDveJigqRJ1c
	 wsRzZgTWWZ7GDlVdR0xS4hHT+BohT/zI9/d4eDkMjX92ceaOHS48grbRONzt5pXGhm
	 13niQrixGQifrhb/YIiSWxnoYQWWz4R5T6LrAyeuleMWKmXRG2bcWSXgMDMH+YjNIQ
	 1Pnd20ADIIOPOzYw7ZZJSon/QDzQUcr479HGf0kc67TlU2vjGUUbw/izBFIfEv990F
	 6axTaBO+OsGNzq576Z6DjQKUCu71Ay4FQD7hHzLtOzvZ7Sn7WQ5jcm0LVVQWUOM/WR
	 8jYLviH2EIYOw==
Date: Fri, 25 Sep 2026 15:27:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Nagarjuna Kristam <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH 1/9] dt-bindings: usb: Add Tegra238 XUSB host controller
 support
Message-ID: <20260925-alligator-of-authentic-economy-f631fd@quoll>
References: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
 <20260921-tegra-usb-v1-1-74a925a35d82@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921-tegra-usb-v1-1-74a925a35d82@nvidia.com>

On Mon, Sep 21, 2026 at 01:19:01PM +0100, Jon Hunter wrote:
> Add a compatible string for the Tegra238 XUSB host controller. The
> Tegra238 XUSB host controller is similar to that found on the Tegra234
> device but only supports 3 PHYs compared to the 4 PHYs on the Tegra234.
> Hence, the binding is also updated to limit the number of PHYs that can
> be specified for the Tegra238 device.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../bindings/usb/nvidia,tegra234-xusb.yaml           | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> index 3f56110be915..9d605db7e77f 100644
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> @@ -19,6 +19,7 @@ properties:
>    compatible:
>      enum:
>        - nvidia,tegra234-xusb
> +      - nvidia,tegra238-xusb
>        - nvidia,tegra264-xusb
>  
>    reg:
> @@ -154,6 +155,25 @@ properties:
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
> +        phys:

minItems: to be explicit. I would expect minItems: 6, but your phy-names
is flexible, so probably wording in your commit msg should be "*up to* 3
PHYs compared to the...."

Best regards,
Krzysztof

