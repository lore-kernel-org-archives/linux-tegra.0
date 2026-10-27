Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101811;
	b=gCcaJecHyufMGYb4ajLysXH/U+pfHudbX76vlartqYY0J+p6MyYMTkvk/5Afq+y2hR/v
	 hCMBs/VJ8NB9P7vSWHhrlxTECwUjpKTAJue2ySJW3etQJ67Nhodt+T1eYjBFI0D2+o4WN
	 +SFAfzXuYi5wkBUPWNrSaq6Q9PV/3auaoU7McfiLMjYsXUWblYI9goDSe4VxgE6d2arE9
	 kqxS6QS0p+lxCmB8maFTHlhvK2zfby+1bnOTn2zefjdjM5Ux11WnWxkHWDJC/9dOR+ZMM
	 YAYx1Jt66b3w/+ndNVVqpH3r3ed4oUDzewQB6RY2lTmimDV1PeStR1OukqEtk4OdNSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101811;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=4LS2QAZea28L14x36x4SE8vt4l1NVp0NgIHFN/fX/Z4=;
	b=ESlN1H0Hd3WYDNAV2VzatAsAL+2HjnjPmOcJfOKUpOrb6YvIz06TvYlzoMct08F05cNE
	 v3GCMmxXJQafg+Lx4Ipvly0RG+G3Tcy0Nzs+DB+U6jH6Aj9XHo1uwaxxgeSpwFOmVgR5B
	 jbLLEauPJi1Z5tMKUpIa9v+6gpdEQTp12v/xXFdhCdtvq36tJIhKor0eTQWFWyRc7Tj6r
	 PfH8Yws+WFieaWS9ZeFzs4D/CMHc7ZhV/FsPcw1KRQbePP8fB1adWT08/sLT5jQAXRk3U
	 XodXeFgjgy7jr1RXggZhOUsTq3QYHHXsPoq+fWKHAesGBvjD3PXU3B4PP+a4OQWKSPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OEIEL8hK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3C660A2606;
	Tue, 27 Oct 2026 11:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OEIEL8hK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFCF1F031E9;
	Tue, 27 Oct 2026 11:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101810;
	bh=4LS2QAZea28L14x36x4SE8vt4l1NVp0NgIHFN/fX/Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OEIEL8hK7rvYWMnv3aG7L6E4w+3sZiKjXJ4yAloB3MhefqoDcSwnlGvpB7zRqgNcu
	 NgfPhgV0R37+wc/NRm9VFs7uloK3ui3LOVlohhrtr5pIxojh2LUZTkqLfN/wxuQGvL
	 9DLx9oHgrHoxeTXqzBxvHAtkkX5gVIjBWH+M+eMK3wxm3nmHYOeJRZN3Y8r1qF7YxH
	 cQzV+WEvkqKMlQT+NINhkuDvUkzQugCWattd7Z/yPoWj2t9pdW8UOobSWpbLHYz1K8
	 WxBrEX1Uk6f8QkulZMwYw4GZGU/w38esQDjawqCtnI7wxJVEDLlxhcEZNSS+PnWiTl
	 ZdRP0ig2uvzAw==
Date: Tue, 27 Oct 2026 06:50:06 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jordan Viknar <jordanviknar@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: Move Tegra-specific Chipidea
 USB properties into a dedicated schema
Message-ID: <20261027115006.GC3598537-robh@kernel.org>
References: <20261004165204.205660-1-clamor95@gmail.com>
 <20261004165204.205660-2-clamor95@gmail.com>
 <20261026222928.GA15139-robh@kernel.org>
 <CAPVz0n2rkWikz1CZhkKiZnX5P+NdDH0RfJi69AyVTEV7qw_VXg@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n2rkWikz1CZhkKiZnX5P+NdDH0RfJi69AyVTEV7qw_VXg@mail.gmail.com>

On Tue, Oct 27, 2026 at 10:51:52AM +0200, Svyatoslav Ryhel wrote:
> вт, 27 жовт. 2026 р. о 00:29 Rob Herring <robh@kernel.org> пише:
> >
> > On Sun, Oct 04, 2026 at 07:52:03PM +0300, Svyatoslav Ryhel wrote:
> > > Move all Tegra-specific Chipidea devices and their properties into a
> > > dedicated schema file, by analogy with i.MX.
> >
> > I don't really see the point given it is only 2 deprecated properties.
> > Maybe those can be removed? Depends if they are deprecated and still
> > used or deprecated and removed from .dts files years ago.
> >
> 
> The ci-hdrc-usb2.yaml schema contains properties that are not
> applicable to Tegra, and conversely, Tegra-specific properties are not
> applicable to qcom, nxp, nuvoton, etc.
> 
> The 'nvidia,needs-double-reset' property is required for Tegra20 and
> Tegra30, and it is still actively in use, as you can see here [1]. Its
> marked deprecated state appears to be incorrect, as it should simply
> be restricted to Tegra20 and Tegra30.
> 
> The 'nvidia,phy' property is still used across all ARMv7 Tegra
> generations + Tegra210, as the Chipidea driver has not yet been
> converted to use the generic property. Therefore, while it is marked
> as deprecated, it remains in active use.
> 
> The example I added is from Tegra30, which in the real devicetree uses
> both properties, so I've included them here as well. With your
> permission, I can remove the Tegra-specific parts from
> ci-hdrc-usb2.yaml and tailor the proposed schema to better fit the
> current state.

Okay, please add these details to the commit msg.

Rob
