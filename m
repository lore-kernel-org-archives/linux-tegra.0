Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938989;
	b=NlvTUgA/jhbqVro9UBRBdgcHSfuRRE7quTbvHmL3KZvDtz1nJ9SxYeXsxRgFbf1vqhwp
	 IlIn1/DmWRCaOFx58+qyTt8WKMvb/ABJQkbF+o41eta26IGCorRMAgw4YzLJftTUOhLAM
	 qCyn/lJykNVO6e19Nmmr1ZL6kC4oBYqZOtd9r7PSOYtDRa2tsigAzMS1VNjNPDopV9R4p
	 OsEzClKBeXZZop23uC1v5j/GG+0eDgnvass4+Qr0WgAYM7j+tQfP6AeaAZGHsoGWkXXC+
	 xpExqMoOxdKOhk32yYCGKgXGGV/uw18xjQqSMSEmuAt4hgqHuhvXS3x+lJhZfi4BViA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
	b=fokKh5yYVIXCaOBJTo51ZoDWP7WLEiYXDhEUMoQfsSGhNKpgqsFs0NeCxRomo4csmxSc
	 X/TQ3hYNahC79o/OnZJnddFR4RkU66fhXD2bhr2KKhXg4CxpYoEewQ5DndpbvyIV2mDkA
	 Pwana+YEJPpPIPNuY3noAja304+fJ8x3McOIlTVcVouWkk7SwZ6vwEY7c3m0QdVqEnYIM
	 U/k/KCRmuFmxx6AHDZym/tAcmWEdmNUcNA3+4X1n+ggpdgv1R3XeoIllzQu5BynkM1DsP
	 7x3Nv/1DhVxlAEnMqLMqxHWxvh8pIwT8NiQ8aUGAmbrMCITcWCP9tjNHDVXkx6qH5fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YdgkGfVq;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856D5606A330
	for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2026 18:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 856D5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YdgkGfVq
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-949680e6d83so13156085a.3
        for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2026 10:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794938987; x=1795543787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
        b=YdgkGfVqKKui0aiLSvR6mWBKZ1+mzuRPsqTd1Sr0W+MZWL+4jDUMa6VxrqybHVoEOD
         /J9StWy33w6SStG5yfMJ1osxetxqx0DcvagahjDxFaoR5bvIK/sTcU9tLwx5smKDKl8z
         Thd3LDvAg2KozZedUmsFRZ7M/o2KonYaJ7dX9uNkiLmZm6olw5l3ytILQ2BH7q/LCTQZ
         hklXu99iDf3yimqo438LAdEHeUhdpzKPK1S2nLYqC+CIJNx5UEsxm3OYqhNRy22HA1Hw
         0o9ki1uwEKN/F5ZWTLAXZMa/9Jx7RmbhF5P3N2MbpK74vWTuOK4zl6bckElmrsmM0+vU
         2VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938987; x=1795543787;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
        b=v+Nrf4Sw4YlnduGDnScBefLqRi/zFsjtMtwZCiZjRVxe4S42VACGosUjd0Pse293lz
         2FctP2/8QyAo8GMRG+7TYjvJREcB8n8lud3C7oDOnFBR5XdxGp2NtqCu78rSlHtG4WwY
         uBByKJaXmnrLLE2Dqw/zE6YF6Gu7KN6pWTE0iuPjh5WEuGpYvPj9U6OAeuv1xxJgPEk5
         r3oQRVe/w+0Ei+3KiObRekr446Uz6YzSworO6Zc/dW5zNPcOKJPML8s4pZYF/gduUC5B
         BcgCji98yscS3+yBEO9DxB0cNgyGxH/WYalMSbOc+Cks1tbs9MF/mTkEBQQM+lD2hsiT
         +kLg==
X-Forwarded-Encrypted: i=1; AL+hErEq9PKNNmbWaP5h/mEvAEg2U3Pc6Jeh+phqCJ0FMf8Ca5CeIqrBhq9pyTU0odd2IalMifxKFUKUGsazfw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8HDpg9+yW3xefME21K2pstxdO09Lw/VIUUtgkbmADxgnW1zP3K
	r52GJwAAlB9i1di8URN+qOTHGhVKbT1xchycONfEn80Qrc5qtlaXrsq0oatYxlzstD4=
X-Gm-Gg: AYBFou2V6x67KLlZeztQ5ZRzTSE6eS6HUG7HdMjQUglTjczxBnvkdm+JMY196S23xw4
	HVqC++8+4VsW4hO35isovlLfM8KkA8aZ7cUTftfaoj7lZ9Si4fCX8LWcVmUOoBZEX3yKzgE2s9f
	DWxWgzd60CpwIzX586kJDLeDa/pT9YsqCc3L3EooNoCqG724RXi1k55p6EgdP+kIdhEWI6aY5jn
	dNbz8WU7S2V+0Cu/2WroWoJnpqMs0WtQCslLi/hh55ft3DVqVcnGHcz1RngeytYW1urk4DfsfRV
	diqIh5+17e+rQNDlcVIGJ6ODXJnY9SpKeplQftBi1AG6l0/r/aJqzygZiSLmmcbY9fCRTPLMLqA
	4j1+8s9EQ9TiXzaCT058M8t/+uQTIXnwQnVYQ/2HjbRDbPDnGGRzeaNTmgpLJkjfcKrp6lztBZg
	Ezkik3T4Ge4xXBL1PyNztgaC4cG+6VFCzt0eMUrQaowNRbgBtEHTFiYOeRSpLmi3xBfBQ57d1Nd
	hU/2d23AAZuOgn1jXdwVCjnJUCSYhAm9/0amrYcmorTJJ+hp7IWijkrpQJtqf424YcOhubn9nOP
	8ZYW7dM=
X-Received: by 2002:a05:620a:46a0:b0:949:6ec7:68e2 with SMTP id af79cd13be357-94999650610mr89698785a.79.1794938987121;
        Tue, 17 Nov 2026 10:09:47 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b5c1dsm1155175385a.33.2026.11.17.10.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:09:46 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTNcn-0000000D06D-1Abm;
	Tue, 17 Nov 2026 14:09:45 -0400
Date: Tue, 17 Nov 2026 14:09:45 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Peng Fan <peng.fan@linux.dev>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
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
Message-ID: <20261117180945.GE2606445@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
 <avyGI6QmuZ3DUqc9@SMW015318>
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
In-Reply-To: <avyGI6QmuZ3DUqc9@SMW015318>

On Tue, Nov 17, 2026 at 10:51:47AM -0600, Frank Li wrote:
> > > In dmaengine each channel is already modeled as a channel device (see
> > > dmaengine_chan_dev()), and this series puts those devices on a real bus
> > > (dmaengine_chan_bus_type) as a prerequisite. The DT child node simply
> > > describes that existing device, so its reg/interrupts/power-domains/iommus
> > > are attached per channel instead of as index-matched flat lists on the
> > > controller.
> >
> > If they are real devices then why can't they come out as platform
> > devices?
> 
> It cause complex when consumer to bindle channel dynmatically.
> 
> for example:
> 
> consumer_A
> {
> 	dmas = <&dma_provider ID>;
> }
> 
> if each channel is platform devices,
> 
> consumer_A
> {
>         dmas = <&dma_provider_chan0 ID>;
> }
> 
> Consumer_A will have to bindle to chan0. Actually, dma engine support bind
> to any free channel. It will be problem when there are not enough channels
> for all peripheral.

That seems like something you should be able to fix in a better way,
like by having the DT know which DMA devices are usable by a consumer
so it can be pooled.

> > I think you are overstating how independent they are. Many single
> > devices have per "channel" resources like MMIO and IRQs. That's
> > totally normal. It doesn't make the sub resources independent devices.
> >
> > AFAICT what you have here is some HW designer used SID where they
> > should have used SSID and you are trying to hack DT to make that
> > usable because Linux does not support a SID as SSID model today.
> >
> > Again, since this is the 3rd - 4th case like this, it seems like a
> > popular hardware choice and we should try to do better to make Linux
> > support if we can.
> 
> What's your prefer?

If a PCI device implemented something like this it would use PASID.

I have one device with many DMA streams is what PASID is for.

Recasting your multi-SID as PASID somehow seems like an interesting direction.

Jason
