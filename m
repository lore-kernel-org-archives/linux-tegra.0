Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66A53B3C04;
	Thu, 19 Mar 2026 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913174; cv=none; b=fufcUdfuEfTyljTCq5hsp9u7MKXwzarYQ7NtJo3uTdKO1f7MF2z+mUvSmvn+Upl6uz36uo/uX9GN45ssXzRrDM0Pvobyxpbv+ufztfPpnmFH2AX8IctDKuKL6Rdy8fUdrUGhE0v+IlIRSQW4poJnzHVKpvJUIxbNuXAmNmxBWbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913174; c=relaxed/simple;
	bh=HL07kykBNmLYTVHviBMszhXBKFTs8IpBAy5AxUjx0KM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ai7fnexEtCFliucNKYeWvqlqlNFfrxLcpSLEnXDsqW/VmWdY4kQcSGS1BL+YpeWEgragaYvR9LtNGVQ6n46aMYRwlgmOq+NmfaxFsD3EQbZWohhTufJ1meifiS9iVCkVSF9Ic4syRo9RuGSJ+/vSjVc9DeM9OfH8BofrsVqTRIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOg3CiWx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOg3CiWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F9DC2BCB0;
	Thu, 19 Mar 2026 09:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773913174;
	bh=HL07kykBNmLYTVHviBMszhXBKFTs8IpBAy5AxUjx0KM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GOg3CiWxDFjsxLSkUH8Qfk+jPu+o4J/a0xdb4bZTwA/fG3E5UawPe/Cm5et9/lG+G
	 1gpHCJm9onmOCrdZWAcHIkncJXDpXJ3rwpCQy4tlFD9JvRDSAZkaeubKh4nuGlRGUi
	 87FbsrK8xJ6ijGZQeF/Va9jY5RIKdb9zW04cT2v5BFKmQXD59eN8UrwzoqrRcBo4R+
	 P2B6vZX67FMEugDyOM35CH/PEQeesSebslTmgS+GfWqkqqAm7MGwFhujPuYpnUf/9y
	 fsctllzw78w1rk2j39r5PziN70R8HmgViGlIosXPPc3wOOOjP70uMOmg+zvUE5oWMv
	 oGB4vN2Hnnn5w==
Date: Thu, 19 Mar 2026 10:39:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: conor@kernel.org, Frank.Li@nxp.com, acpica-devel@lists.linux.dev, 
	alexandre.belloni@bootlin.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	ebiggers@kernel.org, fredrik.markstrom@est.tech, jonathanh@nvidia.com, 
	krzk+dt@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux@roeck-us.net, miquel.raynal@bootlin.com, 
	p.zabel@pengutronix.de, rafael@kernel.org, robert.moore@intel.com, robh@kernel.org, 
	smangipudi@nvidia.com, thierry.reding@kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to
 support SETAASA
Message-ID: <20260319-spiritual-defiant-galago-9bed7e@quoll>
References: <20260318-tweed-herbicide-eb924ef056b8@spud>
 <20260319084641.57672-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260319084641.57672-1-akhilrajeev@nvidia.com>

On Thu, Mar 19, 2026 at 02:16:41PM +0530, Akhil R wrote:
> On Wed, 18 Mar 2026 17:31:50 +0000, Conor Dooley wrote:
> > On Wed, Mar 18, 2026 at 10:57:14PM +0530, Akhil R wrote:
> >> Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
> >> Discovery and Configuration Specification [1] to specify which discovery
> >> method an I3C device supports during bus initialization. The property is
> >> a bitmap, where a bit value of 1 indicates support for that method, and 0
> >> indicates lack of support.
> >> Bit 0: SETDASA CCC (Direct)
> >> Bit 1: SETAASA CCC (Broadcast)
> >> Bit 2: Other CCC (vendor / standards extension)
> >> All other bits are reserved.
> >> 
> >> It is specifically needed when an I3C device requires SETAASA for the
> >> address assignment. SETDASA will be supported by default if this property
> >> is absent - which means for now the property just serves as a flag to
> >> enable SETAASA, but keep the property as a bitmap to align with the
> >> specifications.
> >> 
> >> [1] https://www.mipi.org/specifications/disco
> >> 
> >> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> >> ---
> >>  .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
> >>  1 file changed, 26 insertions(+), 4 deletions(-)
> >> 
> >> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> >> index e25fa72fd785..1705d90d4d79 100644
> >> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> >> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> >> @@ -31,10 +31,12 @@ properties:
> >>        described in the device tree, which in turn means we have to describe
> >>        I3C devices.
> >>  
> >> -      Another use case for describing an I3C device in the device tree is when
> >> -      this I3C device has a static I2C address and we want to assign it a
> >> -      specific I3C dynamic address before the DAA takes place (so that other
> >> -      devices on the bus can't take this dynamic address).
> >> +      Other use-cases for describing an I3C device in the device tree are:
> >> +      - When the I3C device has a static I2C address and we want to assign
> >> +        it a specific I3C dynamic address before the DAA takes place (so
> >> +        that other devices on the bus can't take this dynamic address).
> >> +      - When the I3C device requires SETAASA for its discovery and uses a
> >> +        pre-defined static address.
> >>  
> >>    "#size-cells":
> >>      const: 0
> >> @@ -147,6 +149,26 @@ patternProperties:
> >>            through SETDASA. If static address is not present, this address is assigned
> >>            through SETNEWDA after assigning a temporary address via ENTDAA.
> >>  
> >> +      mipi-i3c-static-method:
> >> +        $ref: /schemas/types.yaml#/definitions/uint32
> >> +        minimum: 0x1
> >> +        maximum: 0xff
> >> +        default: 1
> >> +        description: |
> >> +          Bitmap describing which methods of Dynamic Address Assignment from a
> >> +          static address are supported by this I3C Target. A bit value of 1
> >> +          indicates support for that method, and 0 indicates lack of support.
> > 
> > I really am not keen on properties that are bitmaps, why can't we just
> > use the strings "setdasa", "setaasa" etc?
> 
> The intention was to mirror the property described in the specification. Using
> strings would not allow to use a combination of methods when a device supports

Why combination would not be allowed? Look:
mipi-i3c-static-methods = "setdasa", "setaasa";
Both are allowed.

> more than one method. It also cannot represent the vendor extensions (Bit 2)
> cleanly. Would this be better if we use macros instead of raw numbers?

Hoes does setting bit 2 differ from a string "vendor"?

> Please let me know your thoughts.
> 

Best regards,
Krzysztof

