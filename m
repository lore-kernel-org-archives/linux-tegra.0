Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755163537E8;
	Tue, 25 Aug 2026 23:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787699255; cv=none; b=rMExozI+fH3Jl/fceLn5e8yPrtMHS28smoOhf1GOiGq0F74la/sHhldUUNJAQVI5Ig0sYyjQiGAdUIUdobPOC0IUeFC+oKMEQrMStmshHkK3ys/qh2OV/tJxcNryvs13Ee3HVuGoVy5gOFvTK1CjjeubLmALs/pCwTTETVFrbf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787699255; c=relaxed/simple;
	bh=zV1JHAJGsXhch2ykOKdmBJSkIaKQFaWPmlpQTHmzjm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjh66pKtiP5RXji43W0ul6U3EFCyIk4g0rKYSLxFQiTpXUXsI8GJ2jVwj5WcZ+GXyKyeEXug6PI2M2vjizr5j9BXYOHYbtyKkYgQhgiQx4qkbeZ8wHMl1wU7ubGql7/1Hj7VSPrqVhSiJ6RyCmwqIxa+FwZ1yB38SZKNFLITg6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HlF1QB1p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HlF1QB1p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02101F000E9;
	Tue, 25 Aug 2026 23:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787699254;
	bh=nFlwTm4qQGAC1w1uwjDEFjWbQSP1zLkzZU5crymBwz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HlF1QB1p+5UZwwq0Vnm55/M3AfdkkSwIZfzUrtr/czDS0E5nKCMf72dBWT3qn9J13
	 pFOtZmdR12zfb/picHjVn8M37Zn4rITje0CrAjABIg4K6BjPX0LoY88XG6HsY+z+gT
	 PoKJpDpmAUCYeK0qjcsiyLFJKAcFls0t+zf7as6DsGZ2HPWbV5PHvS1q5dP1iXN0F0
	 PeDU9TE6qZM4TyTgQMwixc/Ha86PycIYPY+orVY/admdAKGTlUIM3wtVpH5fMYe95r
	 nbAbCDZXtyRj3hJX8rmXvVoLK6UmKm7Jsm1/PSaJnwW7ng3eCj1UPRpfZIesCP8ii4
	 OTE91hzvqcUUw==
Date: Tue, 25 Aug 2026 18:07:32 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: nvidia,tegra234-mgbe: Add missing
 properties
Message-ID: <20260825230732.GA1224125-robh@kernel.org>
References: <20260716212001.989872-1-thierry.reding@kernel.org>
 <20260717212719.GA2687584-robh@kernel.org>
 <aoL36TMH4HBZhLwh@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoL36TMH4HBZhLwh@orome>

On Mon, Aug 17, 2026 at 02:18:06PM +0200, Thierry Reding wrote:
> On Fri, Jul 17, 2026 at 04:27:19PM -0500, Rob Herring wrote:
> > On Thu, Jul 16, 2026 at 11:20:01PM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > Being a DWMAC derivative, the Tegra234 MGBE supports AXI configuration
> > > nodes named stmmac-axi-config and phandle references to them using the
> > > snps,axi-config property.
> > > 
> > > While at it, add the 10gbase-r PHY mode.
> > > 
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > > This gets rid of the remaining warnings on half of the Tegra234 boards.
> > > 
> > >  .../devicetree/bindings/net/nvidia,tegra234-mgbe.yaml    | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml b/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
> > > index 215f14d1897d..dc897e312c55 100644
> > > --- a/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
> > > +++ b/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
> > > @@ -81,8 +81,9 @@ properties:
> > >    phy-mode:
> > >      contains:
> > >        enum:
> > > -        - usxgmii
> > >          - 10gbase-kr
> > > +        - 10gbase-r
> > > +        - usxgmii
> > >  
> > >    mdio:
> > >      $ref: mdio.yaml#
> > > @@ -90,6 +91,12 @@ properties:
> > >      description:
> > >        Optional node for embedded MDIO controller.
> > >  
> > > +  snps,axi-config:
> > > +    $ref: snps,dwmac.yaml#/properties/snps,axi-config
> > > +
> > > +  stmmac-axi-config:
> > > +    $ref: snps,dwmac.yaml#/properties/stmmac-axi-config
> > 
> > You should be referencing the whole snps,dwmac.yaml.
> 
> I initially tried that, but it makes things a lot worse:
> 
>     Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.example.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): clock-names: ['mgbe', 'mac', 'mac-divider', 'ptp_ref', 'rx-input-m', 'rx-input', 'tx', 'eee-pcs', 'rx-pcs-input', 'rx-pcs-m', 'rx-pcs', 'tx-pcs'] is too long
>     from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>     Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.example.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): clocks: [[4294967295, 380], [4294967295, 377], [4294967295, 376], [4294967295, 381], [4294967295, 357], [4294967295, 248], [4294967295, 374], [4294967295, 379], [4294967295, 369], [4294967295, 361], [4294967295, 373], [4294967295, 375]] is too long
>     from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>     Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.example.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): compatible: ['nvidia,tegra234-mgbe'] does not contain items matching the given schema
>     from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>     Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.example.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): interrupt-names:0: 'oneOf' conditional failed, one must be fixed:
>     'macirq' was expected
>     'eth_wake_irq' was expected
>     'eth_lpi' was expected
>     'sfty' was expected
>     'common' does not match '^rx-queue-[0-7]$'
>     'common' does not match '^tx-queue-[0-7]$'
>     'common' does not match '^ptp-pps-[0-3]$'
>     from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>     Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.example.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): mdio: 'compatible' is a required property
>     from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>     Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.example.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): reg: [[109051904, 65536], [109117440, 65536], [109707264, 65536]] is too long
>     from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
>     Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.example.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): reset-names: 'oneOf' conditional failed, one must be fixed:
>     ['mac', 'pcs'] is too long
>     'mac' is not one of ['stmmaceth', 'ahb']
>     'stmmaceth' was expected
>     'ahb' was expected
>     from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
> 
> This is because while the underlying IP is derived from the Synopsis
> one, the Tegra MGBE is slightly modified and has different clock inputs,
> interrupts, etc.
> 
> Or, well, I guess I don't actually know (does anyoen?) if the licensed
> IP is properly represented by snps,dwmac.yaml, or if it's just a set of
> values that happen to apply to some set of derived IPs.
> 
> Anyway, the easiest would probably be to just duplicate the
> snps,axi-config property because it's only a phandle. stmmac-axi-config
> not having a vendor prefix doesn't throw an error, so we could probably
> keep it as-is.
> 
> I suppose another alternative would be to add special cases into
> snps,dwmac.yaml, but I don't know if that's a great idea, it's just
> going to make that very messy if everyone starts doing that.
> 
> Which do you prefer? Or is there another option that you think would be
> better here?

My preference is to make deviating from the common schema painful, so we 
don't get needless variations in names and such. That doesn't work too 
well with existing bindings (but proves my point).

You either have to extend the common binding to fix the above errors. 
For example, update clocks so that more clocks are allowed. 
Alternatively, you could split out all the vendor properties to another 
file that both you and snps,dwmac.yaml include.

Rob 

