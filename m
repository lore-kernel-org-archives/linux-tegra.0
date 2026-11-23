Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434451;
	b=m7m4/FGK35pX71puWfkpq+7ucrnCwLnAKbdQu/aCfvnlSqDtpqa9wmxt7L0WXXuYYcnu
	 TKKkt1N6+xQJfFOTxSpnbrPG18mMNZVrPqIRF9Wx8Q1pQxnzBhdKz7NH3l/Pnk5oWVU2K
	 KwTcbRWBT0Kcl3/yTXJVX/1P4ZwwXI6XqJmEVMinxZZNNaOIesBfD3zRsqM0/qhAqIdIp
	 weQA0X1Q4dtVrkqJVG88JtF/iickyGUR+R4onGdry4gqaR5K4AUzgf8RRcSxLRtgnCVrE
	 CrsKWMTnC3Hw+r+MAzzinpSbxwkinwHhE1CHJDE/esImiQ8DRejl+MQQHaaa6frZ2nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434451;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PHZKX0qOJM28Tj2hbs7mNGtiUK/YIMY2xT+aqEo5P2s=;
	b=bVs/BLIdsZG1a9hNTnHA/ByLyUPCv7H3k8EPmzO9RGOD9Zf2UyxDgEPZ1j1+lz2h9793
	 l5MhoRFjPgExA+Y/ErXbMtsyjlMvtoeowOmYT+nQuBpXfxZDZX+HL+2r8P5pm6/ewqotF
	 f/RogMUxnEUOxPpRinQq1z3FigwTK9tSZjBVjunvUIYgkehoK+uxM9Jak49Vtj60h3z/Z
	 e8VjxgiNp4shhDXD4302eTD5D35nlGzg5ZZqMfUfZqqQZz29VmMlAiKLmZOyTC2DVF6XZ
	 JJvggoYTw6OXqRjkbP4yzKUGPpiDWiZKPOZCumFIuhQGF8t3AoU3mJsJddV2jqy8ByQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K9fOUlYs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DB9606A31A;
	Mon, 23 Nov 2026 11:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K9fOUlYs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359981F000C6;
	Mon, 23 Nov 2026 11:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795434451;
	bh=PHZKX0qOJM28Tj2hbs7mNGtiUK/YIMY2xT+aqEo5P2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K9fOUlYsb+WrusosJHD4/uwBPqsBY10DS7tlWJEQNUAm689/4wUAd4SbmVg3U+Vgc
	 fOgXpLsYsgsfRfB3Nhhohf1YTN+OZXWiAIfNisD7QjPB6Hecf76Qwep5nWfd7pKDBR
	 TmFyLOTbwkYv2oviTuYXYnmURUtB3eUa4GX0VtjumRBmuAsRCqS/nlbdZWV4KIgRDo
	 tMMF5jnXPx8A5Gdan0Effq5wbuYhxU5teFoogYopaJ6AA4VFbPkFYYjgi5748uEeob
	 XcMSibP6cjEIQaa8mTQtdTop3UySiyeDLnG5D4bCVB4paNqjjkqQw8RvFWVtnwDfCr
	 4iidKS5SY8EyA==
Date: Mon, 23 Nov 2026 12:47:27 +0100
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
Message-ID: <20261123-versatile-alpaca-of-greatness-dd6694@quoll>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-2-42efc03a9700@nvidia.com>
 <20261123-sassy-fragrant-markhor-c6fbb3@quoll>
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
In-Reply-To: <20261123-sassy-fragrant-markhor-c6fbb3@quoll>

On Mon, Nov 23, 2026 at 12:44:00PM +0100, Krzysztof Kozlowski wrote:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 8
> > +        iommus:
> > +          maxItems: 1
> > +        power-domains: false
> > +        power-domain-names: false
> > +        phys:
> > +          maxItems: 6
> > +        phy-names:
> > +          maxItems: 6
> > +          items:
> > +            enum:
> > +              - usb2-0
> > +              - usb2-1
> > +              - usb2-2
> > +              - usb3-0
> > +              - usb3-1
> > +              - usb3-2
> 
> This should be rather fixed for this device, so without enum, just:
> items:
>   - const: ...
>   - const: ...
>   ....
> 

Although I see now we talked about this - this supports *up to 6* phys,
so the list is not fixed per given IP block instance?

Best regards,
Krzysztof

