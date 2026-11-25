Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620331;
	b=TPai1Fe/TLtHLFtrB4hseqI0HPKTz/RLE9Gsl3hbSwfBMPyT75RdMqaRtvTCwQR/S02g
	 /56QbBZG27pQDa+pLhZ9EZqpk1t09TOWs1pmu5vPPZoMnmBnaKjKAaNR8FeDHgRzFV8fr
	 TlOmQbvn5mtQREw7TbyAyarpT/CaGe0uPiqUM+bUZ5MRV4/QlDdVt9gIn+VPeYM/9ltbh
	 MFdIM7fvjvsgSia/5U38LIAvmK6VoaPRQCuAkVcIxUH/sTSnfv0FPdIQsKleICxYpOReh
	 XDYgZ/lbM4+tT+/wS5lteu9D2GTHGaL4UXObWdEn97cNGybSZriBaOfFxiNBPv8fe/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
	b=nLJ6o/MzJp44Uw0IfGaZuG2SKjhjiP5xqBdVIN7e13RLiqwjUYKcucfFrEqR8vFAG2eg
	 djvg7YpQ/bxqjs49aaaYvAnzYB07M41Gk1riSj8FV1iMu1kgRdv+qSi/O5hsEf5RMjUPI
	 2t+lMb6UDqvWNCKweU9NSWRvCBuIW4QJ78E4KqW5cnThYJwkefDTgjD530IIr6TRj1DWT
	 mxG8MaB/ZG11PeY6dqUYjOl9UENgbLDA29WU/VpL6T30YLx/BVzSEUttKMWv57k+lqmOQ
	 fFo4a+r9e8vxuVMzUBsxadMxdUpE0zQWvYfsJlzB5AccnYESeGeBFDrNOM/D85SHcOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iFk419Bq;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7797A606A323
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 15:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7797A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iFk419Bq
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-99071945aa7so3264621241.3
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 07:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795620330; x=1796225130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
        b=iFk419BqbfBi/6ObNDUZ2vsXpKfzRGG8soL1vwWsfo3s0278JXjr9iY8LX249svZsi
         r6zCWgQOJswtMqBkGndgaQ0IvnnCAjGp65TR4XQNdfZ5sZPg0BgeutzGHAq8cM2f0LQv
         k79Pa3Mi31cvvRuTHw0jZ0595qcyP7Hk6uoobP2Z5yd2mn/yT4hXNKxz8+kfBrSxNLDf
         QHFAAQ74iOvDW0Lv4NLZloAJyTvOPgRcIasINF2MuVmMIVyHVBduWP93wMPTk4SQT8Wq
         iiMNt8SR9mbCr9h27gdplCbxaAkt1KGPe3OqaB/mp7PDl4S4WFrxi6Ipq3bM+f7oWh6E
         wrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620330; x=1796225130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
        b=VMQFgx8/BmGL44XBD5x8s+BW86da12+qTlzFj+ISSaUL0HBq/3k8Y8uvu1gGW7Njhx
         zNJ1nV62/qXwuI/cMYwz9TflzM5kLtSx/RYe0o/TiuQMw/NN3yT6Cp11N/sOEy8Bx8qB
         /6UAdLM3QgbZhQLuIziQjHWS3Z8GmNtImEhOfQAn6mG9vXswMxsaLnulZl6N61zjiY76
         adlOBaK8stal99re0SJ0z/+KL4OS/EEU9PPX+6NuP1UCH+gaxMPclmNlvtcwYQ4p5Ca6
         tKP4Kw2gBwfLnqAGSKf9QEhFgCQWY/yNo4RMrLNaJTuKBV8xwHVgMLSSgYu+YWYbcJb/
         TwQQ==
X-Forwarded-Encrypted: i=1; AL+hErE0DWqT7Q+HESlREcPQHfIR6v5bp9xeM+hrjkbV1KOrVmHM/K0OBqYduu+r5Ej0FmvfrC5LKwULSqKe6Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z93wgCOdP289t/LJmcyfbIZXh9kfmF3Ut2uO0X5Eoo8ASrS+xNb
	z6Q69H7Ul9uEVYX+KaoFC+1DN4rBWoc+ueGPwrL+kSYwqW4lwUzxpqCtISoNjCjEn9A=
X-Gm-Gg: AZFdTZdBPuxJIy/WjJ+GAPsEVTQZtaJ68N6MU+swMkIb0yJRGTa9UrniFtwdbo2H3Qw
	g2MjTGb2Dgy3i/4mlHVC9Dxfn4As4BHgzvt04dE2OXeoyEZul4kPDiqigcTbIPovE+8ty9+X62d
	P3WF8XjDNUPKT/Ldw94xSUmM4ABcapwBkQ8DT+p9IJ5tAgMpnSi+DcYwrXlD8IxUP53NSEQ/IcE
	c3jayDCJx6TAVWmmabtIquICfnPUpYtbN+r3s4IDvNCGOt55N+Z1TqMvlrzGo17CmHzdSUrmbkQ
	pkUGIVZ2BaVYwtjCKKnXw6jw8WIAj8LFNYPzLuEzp9mP60aKxLtVqE6FNW8UdX77TWk1I1yTQfv
	PGaPaE7C7hvrdezj3+huS87YQObSYLw0tt/eQIEY3LgP7VbaqNi6CBpODwMQAvFSFuhHwZuBrU/
	cdw4N4xOlwNbffFws+F62EaMgYtsN2MrfkPwBpEGaVZFmL9lgc8LncjbabfcU3MZUx7sZhUfGmP
	rptaWKo1T3nWtwbFpRT3q0TQPiJ4t8DNLa99Es4jWxuftac6KkehLc52SW2iSDOtYcqt7ivce5a
	KgQBowDTV2z/ezxZb9nDnidPLXE=
X-Received: by 2002:a05:6102:3e8d:b0:7c3:fcb:180c with SMTP id ada2fe7eead31-7d739572406mr10710273137.20.1795620330327;
        Wed, 25 Nov 2026 07:25:30 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213479655asm165007476d6.4.2026.11.25.07.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:25:29 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWEsD-00000001rUc-0W0U;
	Wed, 25 Nov 2026 11:25:29 -0400
Date: Wed, 25 Nov 2026 11:25:29 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@linux.dev>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@kernel.org>,
	Larisa IIeana Grigore <larisa.grigore@nxp.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 0/9] dmaengine: add DMA channel bus and fsl-edma
 per-channel IOMMU support
Message-ID: <20261125152529.GK246011@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
 <awGWcq_nKWShC81B@fedora>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awGWcq_nKWShC81B@fedora>

On Sat, Nov 21, 2026 at 09:02:42PM +0800, Peng Fan wrote:

> Do you think it is reasonable to have chan device(not platform device) do dma
> allocation? 

?

Any struct device that works with the DMA API should be able to do
memory allocation consistent with its DMA parameters. That's an
integral part of having a working DMA API.

If you are asking if a struct device that can't do DMA should be able
to do DMA allocation, then no, obviously it should not be able to do
that.

AFAIK the main issue in most of these cases is the need to get a DMA
capable struct device for a particular SID because of a confluence of
decisions the HW designer has made and the Linux limitation of struct
device baaed DMA.

> I ask because if we allow chan device to do dma allocation, we need
> to provide a dma channel bus for iommu_buses to fix tegre186(TBH, I
> am not familar with this platform, it even has iommu-map for the dma node).

If your question is 'should I be able to have a "board file" that
creates DMA capable struct devices from C code" then I think that is a
pretty "smells bad" solution. Especially if you have to then create
fake busses and add them to iommu discovery.

The DT should create the iommu devices as platform devices.

There was yet another thread about this, so we are at like 5 drivers
now with this kind of need? This was my suggestion on what an API
could look like to solve this general problem:

https://lore.kernel.org/r/20261119143151.GH3115493@ziepe.ca

I recognize it would not be so easy to make, but it would be easier
and safer to use.

Jason
