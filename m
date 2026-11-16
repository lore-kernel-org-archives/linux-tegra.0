Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857424;
	b=oqj7kU8LXfnxtVwRcQE0gYggbk1bb/eD0kw/+efuq7ogGSdWVtMRIn0OayUm1qZF2GyC
	 LMjd5tcS+kQ7W8Dhm2/9mKCDS2/khmoBh3moX1lGV0+Hi1pwxs1b3j38jvBqkCwlkMxAg
	 /16IVii4CyLenldfhtcrRDK6/LWD5daAG5U0+Hxk/zrNnXyEQdUrOB7y/OZDqI2WV2MXU
	 3CEMnGtMNlljwKH1fi0PU0bhtsZMNuO1W2wVi0i+nsZm7t/qfB5/OsEL9oZ58liq8tMFb
	 wdqqVWPFWCYh17vEgJ5bU6QVvrFmc+L24yTOaf332D5J4U7qL8yIcHbqHbZcVaKFWzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
	b=3lBsELIM3FJnYxCygx6QBCzQa8DtJjkbVCSNXoVZRKpElYfWFekLUDcdwo2nGMEpEEzL
	 DHg+fUHPAq9rqfNvcN7pJjP3kb2jdXs3rTZmzftUS5fP6/7OLyEuoOtyDw317WNjVCoFY
	 2O9LVm9w5KFyO0NVimUiiY06UBdBpFIN/FBmAvqIQ0Ip3GKtwa85hrQkJnpcMxd9l6pgO
	 dPDPEBBs56nP1msH1uhfofmYqyDEs0FPn/Vc1fvoJPIoy2rKtXIVbBPbtJjEEb6oX/PKt
	 7uNRjp3SvGnLoJx5LRJ6ZFoK3DsY9btx67VLnCZ3wLr8GcahmTXSLntvIb74LZsyJZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=E96WAHkT;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32120606A31C
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 19:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32120606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=E96WAHkT
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9497a167a6aso18903485a.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 11:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794857423; x=1795462223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
        b=E96WAHkT+sP92lQq8lfU7rpYkYmClz1BkPu1iXTnY8MIB//GemYHc5QdBt1ld40Smy
         acUqrFGAqUxCszfVw+pzy4SnJCfUKiX/A4Q+0gJXedFRj+sYatxoMGnyXMoUK+xgqxjR
         s4wgXwYNtTus15EIP5/qVjorQQoKK/mBth3DTSneehjsfS+0679AFf3GT8wrrI+TLrTG
         S67lGTnC4/NuArZMxsujuqU9DVFtqdgciQWqSBdOrH62D7p7LY8rnKE/kpe2Uczm3HkT
         7VhnHMuAAjm5NWwm6eproW22AIWHmXSjkJumB6jc+PP/hWJaqbaadKSgQjgzEdlnANOm
         VH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857423; x=1795462223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
        b=yHRDbUsxSOqzIt+pBjwIRFdvmwr/TqM4GkKOxXKiCuVx8kBsDsxzEaGFsCQgV3BDAD
         rZvqXs5deKj4XpINltc0kge3QIGx0TYSzga57la2Vobf9ZRka4Fac23OG5OemsJFa+G1
         hR+3RRGab1Jfxmpj75oEX1+ig1W6KK31UbGuHIjdp+v135IwfUfLcBCkteDkMpa2/0xY
         hnC2sVWHMBAm/TI18WS58ExkXb57/vHLZxKLhSbV7/DIrUF5WQd1eF1wFLYhxNVRsHiZ
         0cDPHJp9Rydx6Fe0PV+YuLMs8jV6y/SxVs8hLLfHL0iThGooWR4TrXyxguvwxr9Prevc
         rgbw==
X-Forwarded-Encrypted: i=1; AL+hErESwTqs4cRfuGXydzNdcX2TgbdWZXzu1tEo6L4bYPDXsAY7WPZX6zE7Au8seo14NDHt1vyIIbn1S00Kww==@vger.kernel.org
X-Gm-Message-State: APuU4Z+WK7QT00jK/dbRdVlqDIvi/QeAG/bhWUwuum4MK5nnl8j81aF9
	y3NlgtmhMuo6jnbk1OMypO3eNwJhjaJmQX13YURLMbu26CtIlUgSYCozAHO6DOg0Rf0=
X-Gm-Gg: AYBFou2cRDT3rWrqfyj3TVyVPX7gETmMuoiaSnrwvJuY6IUDon0HbZLY+AmJGZmV55I
	QRoOBV/H7a9f6twnxN23WCgiBJ2IW+1jNQ3zH61pP6pDNbvvUxxsrJYSZgw+3RDOXECnGp4Y282
	R5KdaBG7wzMPT2/gPww4d3KTdFU8fbcmGrcRjFhbKenhAGbRwNFmRpXFcCb6PNVZLKLfx/n1yky
	Mi0qAygWEziq2ypc9rs0/AMD2IEzKOlyTQLnxpcHYYi0WksE11KnUdpWUBni3eS8o7OcHFT9ySU
	FvGmA+o4kqwLelG4YA3DNQt7CN3itAcErtPa9ZGySjep7HSlP4rmVPZeQUeBWUFEcY5aCP/MCzG
	YZd4Zhn/bEophgs7YBQrP9i6CYdiY97d31NEkleYuNAWAiMxJlBKlwfmoqfpaVv2vSnJaMRVlEj
	lHoEyhgO+KShnqSNfTMbNMZFMKviLbNIG4SfNvPt6XRluy7LBeFnk1qUyEa69MCgbep6sBN7iVa
	MfV9et6LG7DW0yb9toT1Vl0DoTd7uF+ZpqAugcIQMUZytvj6DzYXEliFYgldpKQfDjNht3udQPQ
	0MeD4Q==
X-Received: by 2002:a05:620a:4406:b0:949:7058:dbcb with SMTP id af79cd13be357-9498b875510mr84935385a.14.1794857422999;
        Mon, 16 Nov 2026 11:30:22 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94978ae5483sm390417085a.12.2026.11.16.11.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:30:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT2PF-0000000AJAU-3HLU;
	Mon, 16 Nov 2026 15:30:21 -0400
Date: Mon, 16 Nov 2026 15:30:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
Message-ID: <20261116193021.GB2452510@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
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
In-Reply-To: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>

On Thu, Nov 12, 2026 at 03:53:03PM +0800, Peng Fan (OSS) wrote:
> I used iommu-map for eDMA, but iommu experts rejected it:
> "Using iommu-map to describe synthetic dma_chan_dev devices that the
> kernel creates is the same kind of DT abuse from over here:"
> More info: https://lore.kernel.org/all/20260917144804.GI3196566@ziepe.ca/
> 
> So I followed here [2] as Krzysztof wrote for QCOM VPU:
> "Thanks Jason for context and detailed arguments. Robin did not chime in
> yet, but from what I understood the DT-child-node approach will be the
> way we should go here.
> 
> I accept above point of view and I am fine with this, thus Vishnu and
> Vikash - please go ahead with DT-child-node solution we had some time ago."
> [2] https://lore.kernel.org/linux-iommu/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> This series adds per-channel DT child node support to fsl-edma and, as a
> prerequisite, introduces a proper bus for DMA channel devices.

To be fair this is discouraged too, now that I've seen 3-4 people
trying to do exactly the same thing I'm not as positive about the
DT-child-node hack.

Can all of you come up with a proposal that doesn't involve hacking up
DT just to unbundle the SIDs?

Jason
