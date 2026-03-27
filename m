Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33513D669D
	for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2026 08:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600061; cv=none; b=s2uEh9kKzpczm2aV4GUKpmoUOS2kGjWkaVchU3G/KLo7wm9+F+UARaxbaMtHWKv3pHFSm6K/i8xWRIB2cmCz0+ncJnv0E/UTVirFrTLkwSCMoBYqMC1jtmC8H2JnIu6uwHueFvSYch//QmWuy1qN2TMTJec2uqFiYd7bRYG8cGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600061; c=relaxed/simple;
	bh=pnd5rHaXCCt+M4SrM7wM83jo3Va9J11tuQmok8a4dRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+EfEglkbPJ/w6mcQBejVTYmR9UGcnOkF2MYxLqYAVOXEQ1TDop2+2kGWSzLnrSyEa2eTAJh81OJ97279Cl4K8ibIr/vbnmj2Q2pgel11ueU2zzQ+mUH/qqUQYqJyNTDoIt8sp3jx/el1VvtoA7zGVpNfvk7bo4EVvd3U8+hBZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xWsA0LTk; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xWsA0LTk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BCC6BC406B4;
	Fri, 27 Mar 2026 08:28:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E1E660230;
	Fri, 27 Mar 2026 08:27:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E16510450F0D;
	Fri, 27 Mar 2026 09:27:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774600054; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=txJM2GJWPPWLss62O+A2FkU4gpdBs6qgEn0gNwSfyQw=;
	b=xWsA0LTkRU1SsJOMLr0Hc92VkQpX9sqGZGYnEk4gFZlSykvrEghAy12WspWUCTUnu9uuMl
	OwRAudxKkfLzuBaYjgzFAjfi/EACbl/iqfBZ1I+FRctTDBpCA0dNx05COtH621c9aIz2EB
	kViSgYBFQM/sOipM5ZjVrf/dlvS7AkSxZT8GqT2RpjVbvYcQRr8o0oD7GWtH988k3nk9Wz
	gxVeLSDNBSdmkAPUCjcMYx7JdzbvNWE/GTHbuL8Haf82UV1rlJl1FjBoRCvTpDEenVzeTD
	8sAzrPgD6o9J3k8hPOZGTaJFnGxwG8hQxEfGvEoR/J8FLQLwaiy29wdu0RIhhQ==
Date: Fri, 27 Mar 2026 09:27:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Frank.Li@nxp.com, acpica-devel@lists.linux.dev, conor+dt@kernel.org,
	conor@kernel.org, devicetree@vger.kernel.org, ebiggers@kernel.org,
	fredrik.markstrom@est.tech, jonathanh@nvidia.com,
	krzk+dt@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux@roeck-us.net, miquel.raynal@bootlin.com,
	p.zabel@pengutronix.de, rafael@kernel.org, robert.moore@intel.com,
	robh@kernel.org, smangipudi@nvidia.com, thierry.reding@kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to
 support SETAASA
Message-ID: <20260327082721f7e69e6a@mail.local>
References: <202603261544313f63018c@mail.local>
 <20260327081858.32354-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327081858.32354-1-akhilrajeev@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3

On 27/03/2026 13:48:58+0530, Akhil R wrote:
> On Thu, 26 Mar 2026 16:44:31 +0100, Alexandre Belloni wrote:
> > On 26/03/2026 10:05:03-0500, Rob Herring wrote:
> >> On Wed, Mar 18, 2026 at 05:31:50PM +0000, Conor Dooley wrote:
> >> > On Wed, Mar 18, 2026 at 10:57:14PM +0530, Akhil R wrote:
> >> > > Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
> >> > > Discovery and Configuration Specification [1] to specify which discovery
> >> > > method an I3C device supports during bus initialization. The property is
> >> > > a bitmap, where a bit value of 1 indicates support for that method, and 0
> >> > > indicates lack of support.
> >> > > Bit 0: SETDASA CCC (Direct)
> >> > > Bit 1: SETAASA CCC (Broadcast)
> >> > > Bit 2: Other CCC (vendor / standards extension)
> >> > > All other bits are reserved.
> >> > > 
> >> > > It is specifically needed when an I3C device requires SETAASA for the
> >> > > address assignment. SETDASA will be supported by default if this property
> >> > > is absent - which means for now the property just serves as a flag to
> >> > > enable SETAASA, but keep the property as a bitmap to align with the
> >> > > specifications.
> >> > > 
> >> > > [1] https://www.mipi.org/specifications/disco
> >> > > 
> >> > > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> >> > > ---
> >> > >  .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
> >> > >  1 file changed, 26 insertions(+), 4 deletions(-)
> >> > > 
> >> > > diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> >> > > index e25fa72fd785..1705d90d4d79 100644
> >> > > --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> >> > > +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> >> > > @@ -31,10 +31,12 @@ properties:
> >> > >        described in the device tree, which in turn means we have to describe
> >> > >        I3C devices.
> >> > >  
> >> > > -      Another use case for describing an I3C device in the device tree is when
> >> > > -      this I3C device has a static I2C address and we want to assign it a
> >> > > -      specific I3C dynamic address before the DAA takes place (so that other
> >> > > -      devices on the bus can't take this dynamic address).
> >> > > +      Other use-cases for describing an I3C device in the device tree are:
> >> > > +      - When the I3C device has a static I2C address and we want to assign
> >> > > +        it a specific I3C dynamic address before the DAA takes place (so
> >> > > +        that other devices on the bus can't take this dynamic address).
> >> > > +      - When the I3C device requires SETAASA for its discovery and uses a
> >> > > +        pre-defined static address.
> >> > >  
> >> > >    "#size-cells":
> >> > >      const: 0
> >> > > @@ -147,6 +149,26 @@ patternProperties:
> >> > >            through SETDASA. If static address is not present, this address is assigned
> >> > >            through SETNEWDA after assigning a temporary address via ENTDAA.
> >> > >  
> >> > > +      mipi-i3c-static-method:
> >> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> >> > > +        minimum: 0x1
> >> > > +        maximum: 0xff
> >> > > +        default: 1
> >> > > +        description: |
> >> > > +          Bitmap describing which methods of Dynamic Address Assignment from a
> >> > > +          static address are supported by this I3C Target. A bit value of 1
> >> > > +          indicates support for that method, and 0 indicates lack of support.
> >> > 
> >> > I really am not keen on properties that are bitmaps, why can't we just
> >> > use the strings "setdasa", "setaasa" etc?
> >> 
> >> If this comes from a specification, then I'd tend to just copy it rather 
> >> than invent our own thing. Obviously if is something structured 
> >> fundamentally different from how DT is designed, then we wouldn't. But 
> >> this is just a simple property.
> >> 
> > 
> > The issue being that the specification is not public so it is difficult
> > to take any decision.
> 
> There is a public version available in the same link, but you would still
> have to provide them a name and an email ID. The document will be sent to
> the mail ID.
> 

The public version only contains one property:
mipi-disco-interface-revision


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
