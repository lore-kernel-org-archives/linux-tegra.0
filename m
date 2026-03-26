Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097B73624CA;
	Thu, 26 Mar 2026 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537507; cv=none; b=YXLZlrHIQr+D76lWaRArDpyBHYSw+7o2cPLJtwQJgJJzDlWAxAHOD1bP9z5M1ZPkCKeMlAJyn4Rn01vz41w9t5Xh2mp6Q+P8Xkb119H3i+p3cUrR188pc3QlnRrWCZ5iTPwjxex6k3V5tNh0FTT39Q1FY2aTEUjYjAzrN/8bhrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537507; c=relaxed/simple;
	bh=pM2qPJP0N0ADDCsOppxXwTkoZA/x2DQWuP5hXPmDSj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9fia93GgoAsruzOByEQAfYCXRnKmhrOBIsuwWWICmDuXOYLbGlypAzQmEuuUoGgZQ34ii0tnOvulkqiyr6gGaW1VALylMw/d18Jk4izntaCajzeHI5Mr5iVbQg/xO3GGq0Fv7ctce+jKMW7ezZuUXV/LVWGF5lGqkRMsMH1gYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abog6Eds; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abog6Eds"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69651C116C6;
	Thu, 26 Mar 2026 15:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774537506;
	bh=pM2qPJP0N0ADDCsOppxXwTkoZA/x2DQWuP5hXPmDSj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abog6EdsAq6OJFP0NMkHKKgpox06HvO++xGDNqtPH5yVn5RhV0F9JeCLrGrSTOJ3u
	 OTmLCfzJxb3413mKiR4n0VFIfv93CclcwtzZd+gU0mzRLBTYOPs37wXStTDSqieKb/
	 awY0n2lRKCZlAdRJFqN4g+ZMLpwEnpT8fXpwyqkJnL5xS0jjIWH+Kesugl2qJIqWxE
	 WQAl0S5mw7a48J09F+dDl/cedMmCcW7HZ1O+KUmQuxE2EE7tnps9H1N5FNS9Mb/C5f
	 rtlzzhQEfmh6OLvPkmKnuBYlQJImiSyfPEqrH6uP2CqVfmip+lYA/i+CpmDkmvrETW
	 UL8QqDqV0upGA==
Date: Thu, 26 Mar 2026 10:05:03 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Akhil R <akhilrajeev@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Fredrik Markstrom <fredrik.markstrom@est.tech>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Suresh Mangipudi <smangipudi@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to
 support SETAASA
Message-ID: <20260326150503.GA2360967-robh@kernel.org>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
 <20260318172820.13771-2-akhilrajeev@nvidia.com>
 <20260318-tweed-herbicide-eb924ef056b8@spud>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-tweed-herbicide-eb924ef056b8@spud>

On Wed, Mar 18, 2026 at 05:31:50PM +0000, Conor Dooley wrote:
> On Wed, Mar 18, 2026 at 10:57:14PM +0530, Akhil R wrote:
> > Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
> > Discovery and Configuration Specification [1] to specify which discovery
> > method an I3C device supports during bus initialization. The property is
> > a bitmap, where a bit value of 1 indicates support for that method, and 0
> > indicates lack of support.
> > Bit 0: SETDASA CCC (Direct)
> > Bit 1: SETAASA CCC (Broadcast)
> > Bit 2: Other CCC (vendor / standards extension)
> > All other bits are reserved.
> > 
> > It is specifically needed when an I3C device requires SETAASA for the
> > address assignment. SETDASA will be supported by default if this property
> > is absent - which means for now the property just serves as a flag to
> > enable SETAASA, but keep the property as a bitmap to align with the
> > specifications.
> > 
> > [1] https://www.mipi.org/specifications/disco
> > 
> > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > ---
> >  .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
> >  1 file changed, 26 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> > index e25fa72fd785..1705d90d4d79 100644
> > --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> > +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> > @@ -31,10 +31,12 @@ properties:
> >        described in the device tree, which in turn means we have to describe
> >        I3C devices.
> >  
> > -      Another use case for describing an I3C device in the device tree is when
> > -      this I3C device has a static I2C address and we want to assign it a
> > -      specific I3C dynamic address before the DAA takes place (so that other
> > -      devices on the bus can't take this dynamic address).
> > +      Other use-cases for describing an I3C device in the device tree are:
> > +      - When the I3C device has a static I2C address and we want to assign
> > +        it a specific I3C dynamic address before the DAA takes place (so
> > +        that other devices on the bus can't take this dynamic address).
> > +      - When the I3C device requires SETAASA for its discovery and uses a
> > +        pre-defined static address.
> >  
> >    "#size-cells":
> >      const: 0
> > @@ -147,6 +149,26 @@ patternProperties:
> >            through SETDASA. If static address is not present, this address is assigned
> >            through SETNEWDA after assigning a temporary address via ENTDAA.
> >  
> > +      mipi-i3c-static-method:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0x1
> > +        maximum: 0xff
> > +        default: 1
> > +        description: |
> > +          Bitmap describing which methods of Dynamic Address Assignment from a
> > +          static address are supported by this I3C Target. A bit value of 1
> > +          indicates support for that method, and 0 indicates lack of support.
> 
> I really am not keen on properties that are bitmaps, why can't we just
> use the strings "setdasa", "setaasa" etc?

If this comes from a specification, then I'd tend to just copy it rather 
than invent our own thing. Obviously if is something structured 
fundamentally different from how DT is designed, then we wouldn't. But 
this is just a simple property.

Rob

