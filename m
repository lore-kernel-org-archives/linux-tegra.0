Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920411;
	b=iMaev+5066X8EygU3jrdaHlDPc99u60jZDXDPqgZlSd599mdcuiBQkLKgY/coKagnhAb
	 h+1HCbQIEVQd6Dy7tGext2NFY0pOUhLzXNk6swiPTmtYshK5qci6bp9oqmkolulHvwPdZ
	 d/X8Fj1EMyv6pxYLrTKZcBLgf6b16JGdfqqJ7BMTUG+2kX3Ll/sORquuib2a8va89HbEu
	 iU0lkW9MnsSs4xZ8uBokEmH2XQMx2K9mm5Zo3d8D5riWcXtz82BvjD7mQJTMGllk9UwpE
	 bAakZKlu0ZSFJm+Oc2W1dhYhQc/1Tfchnu3yzQdf3PvqajVXPKCU9iSkbZYozwrutHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QHFqCnsPAP40ABSi/lHx2qUxkasVh8VfNqtA5qQ6pG8=;
	b=b7k9D6T0PgOFJHcwjZXGKjlI2u5jsi9s5OnAohvrIdEs2a94ckQSZ0zrAo1VFXdjl4C9
	 mW7R5fqgm7H2iAtgXfBHuZpwb04stiMK5dvORCDDVa0XBd8dgQ2x37LiEV8KDQZUkyoGS
	 2sH20F+pyoKNjNEg5BQvFRTO1tAj6G/PPXpTKvsnAM+7TX5dTouHxtn90PRY1VysjEFgD
	 ZCqtJNjUk64w6l4hGAB0BR6/Rvwl8E7xA+Xg9kTIw1F/RTspZc5H/bDrP17vlUGFcveEV
	 z+9w96VZJUgwwgdufKswiZpqBG4tlaWEWAnyOfjSfPMJ7LtGkRuS/oJES5Vz/lLEUfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="f/sG3061";
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF084606A8BD
	for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2026 13:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF084606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=f/sG3061
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91e7af9a67fso30532086d6.2
        for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2026 05:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794920409; x=1795525209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QHFqCnsPAP40ABSi/lHx2qUxkasVh8VfNqtA5qQ6pG8=;
        b=f/sG3061BiDtzYbu/u9CMnLL3fCvqZDyjJyMktvEFUz3a2EL7GbMEblMaUGHRCccZb
         amJ1tPmMY5qRz+xDbqHepfli9In09eKumZOL0YVJbC+kk+2Oz9/6s1IvGxQxvC9H1MRM
         4utrNUgF2Ir4qMwPkcDmFSqDiHVbdj6Hw9ZpQ5tcC6UXm/cJzsd9tuHY1yPYuo/jI5UB
         oInfS8kaWsmVfM2HsfGTm5UGLYaBmk9MDvcmBoLxAIOdDKZZR09vjlrn77Yf8d0bgeo6
         KbD8o1R/mXI8WEeK3aorXTXQhIOXV8P3nUOyV2fCi2oPxWeVYClMWVk2QspiPzG92hbS
         d4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920409; x=1795525209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHFqCnsPAP40ABSi/lHx2qUxkasVh8VfNqtA5qQ6pG8=;
        b=hUo/6rJjRlUbDp6bCw5PAai1pKAkt7OcsFjezz0Nat5UoZszQzWyf2x4zT1AzxpD1d
         BzMTXw40iyPTcJxMbWuQOy2f1ju8RRkM1Y7yn+J//qQaTxb1XR6+UwLaG95E6HiyRprC
         jTfokg89UX11Dc9W43CZAfWJMxFlZshRwS853emhCaZB7gVHNx2WF6bRldsFM0BIYJLq
         j1v2ouLFQnDZhuOc3gxx2KZLZKogY0jGOioLPK6nXu3gKQ02IqeJp4UxJex6nw0mSW2S
         JwP4BtzXn8PjF5+NsDRdxv2qQlfSZWpnpvPjvF6AwbeLFBunlyjmHjXLz4XkTzct+yVL
         shQg==
X-Forwarded-Encrypted: i=1; AL+hErHt/iP+i7SZ+JGrJozjGF7KIbrhQ0kOPoybsfz4D/Ku64tji2lvWeCXWlsgfEAsvQ7b48zjUv2Gg+ZLMQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z902UyJ24fyldzS296oDcugbsyFNv+ujT3eXPe7o2SMGu1IajhE
	hkfrP0alx4sAtvkCtctEwGf+/uTi2osKjbXfXuN+2hknGtaDZhGCviiIjPGZVpmgo2Y=
X-Gm-Gg: AYBFou0TAgje0yF8wYkZYHDvIZ4eKpHFTmnP0CQ5hZgyoKLezQR9W7RGmlkHM/AH1y3
	2BJTnt25NBRum6II4aNfTLf959Ng1Z6M6NfuvYNdEMBLJ/fa9Vz1SPSFPWUIK4b1u2hwByknb7Y
	BJPHyq9BpSON6s/37rvySnLfCuWb4VY9HpwKWYKSpGVKFrIrN6caOb2kezb856JdR8DBh8bptyz
	v1XJNoq0W3ldGfx0MbphxUua/Q6KMF/BzMWRxCpcKs5Boc72vx2NiOGQmOnB3MFbMN0HLHcnWzh
	EqeXy3l66LujO+vMluaz+f1SPRFroyFK5K5WNw5dRR+YuEvf78DajzENCFHzpz2hOABBq2qsQMN
	UcdCL7jpPNJ7cp05KeyrHwg7Q8pVyxbedv991cICV+p6/Rg/3wBhWZJYkLS8+8fKmo0XvmVj6Zl
	goAwFM1JUA+Y+HcPTp7Zh7DWM9w1g/MwWuIQYJ2qkQo9WO79CmFdEgwxgt2y2bd4ndtWFe1/S/R
	nab8GXiTDHSKJ/eoDPpSegzbcQl8XWR67yxSXH8cbvkyFMThi5bm7r4yBvRn42KW7YzLsMJEsQJ
	MGujTAYDAWAti099QJ4T7i4Ozsk=
X-Received: by 2002:a05:620a:a208:b0:949:5c62:e775 with SMTP id af79cd13be357-9495c62ea7emr1501690585a.15.1794920408653;
        Tue, 17 Nov 2026 05:00:08 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c803abbsm1067907885a.7.2026.11.17.05.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:00:07 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTIn7-0000000CJGS-3fNi;
	Tue, 17 Nov 2026 09:00:05 -0400
Date: Tue, 17 Nov 2026 09:00:05 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@linux.dev>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
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
Message-ID: <20261117130005.GC2606445@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
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
In-Reply-To: <avwQl18smAW4R6ec@fedora>

On Tue, Nov 17, 2026 at 04:30:15PM +0800, Peng Fan wrote:
> On Mon, Nov 16, 2026 at 03:30:21PM -0400, Jason Gunthorpe wrote:
> >On Thu, Nov 12, 2026 at 03:53:03PM +0800, Peng Fan (OSS) wrote:
> >> I used iommu-map for eDMA, but iommu experts rejected it:
> >> "Using iommu-map to describe synthetic dma_chan_dev devices that the
> >> kernel creates is the same kind of DT abuse from over here:"
> >> More info: https://lore.kernel.org/all/20260917144804.GI3196566@ziepe.ca/
> >> 
> >> So I followed here [2] as Krzysztof wrote for QCOM VPU:
> >> "Thanks Jason for context and detailed arguments. Robin did not chime in
> >> yet, but from what I understood the DT-child-node approach will be the
> >> way we should go here.
> >> 
> >> I accept above point of view and I am fine with this, thus Vishnu and
> >> Vikash - please go ahead with DT-child-node solution we had some time ago."
> >> [2] https://lore.kernel.org/linux-iommu/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> >> 
> >> This series adds per-channel DT child node support to fsl-edma and, as a
> >> prerequisite, introduces a proper bus for DMA channel devices.
> >
> >To be fair this is discouraged too, now that I've seen 3-4 people
> >trying to do exactly the same thing I'm not as positive about the
> >DT-child-node hack.
> 
> I may not describe it clear in cover-letter.
> 
> I understand the concern. Let me explain why I believe it is justified here
> rather than a hack.
> 
> On i.MX eDMA each channel has its own interrupt, its own register region,
> and on i.MX8QM even its own power domain. Each channel may also have its
> own Stream ID, or share one when SIDs are scarce. These are genuine
> per-channel hardware resources, not software fiction.
> 
> In dmaengine each channel is already modeled as a channel device (see
> dmaengine_chan_dev()), and this series puts those devices on a real bus
> (dmaengine_chan_bus_type) as a prerequisite. The DT child node simply
> describes that existing device, so its reg/interrupts/power-domains/iommus
> are attached per channel instead of as index-matched flat lists on the
> controller.

If they are real devices then why can't they come out as platform
devices?

I think you are overstating how independent they are. Many single
devices have per "channel" resources like MMIO and IRQs. That's
totally normal. It doesn't make the sub resources independent devices.

AFAICT what you have here is some HW designer used SID where they
should have used SSID and you are trying to hack DT to make that
usable because Linux does not support a SID as SSID model today.

Again, since this is the 3rd - 4th case like this, it seems like a
popular hardware choice and we should try to do better to make Linux
support if we can.

Jason
