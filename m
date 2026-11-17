Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939421;
	b=yVrViJeRSnjyoIugHBIXczX8hzSk+vjtsJDaQ0z0Y2y6cUiLUMVK5R9s5F8M2TiyQKZi
	 SP3fBv6z3ZUxIyVboR46eBEGTzzmZCLT10uXU0bHaozf9HyoncxRIdV+Z4KjCXdVTg8f2
	 iO2GdpEVtOO1BG9DAimYkyaAMBuUwKMwdAfImLlP6BMy25Nd1QlnINyj9MS+/JRnvTh0I
	 LwmXpvr5FVLalgbJwqlK7DRI5l/KukcP4lUO7FAW8KuJwz5nCfkbW0AJE+nkWAUFuQlGl
	 OU3VpVkOsQe7z6DYAauaSNCh3H26Wd1amkwWuHizviWdP4YSrZcteobHY4s00zTam8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pepFJC4WupF41wk+cSidNw5vmFTw1POO1gRenleZ+aQ=;
	b=5gaxrHrbTi8nGv+78wSVY1PSTIKyjuhob5yrX2chtcc1WcG1VC7YAJC47wEXbdcgS0A8
	 GHIEDA4kwPPu9T/0LLb4+1LVh9W8F0R7soZ8QdtGgIyzoaCnKNT7DRQBAqWLtQNydV0FI
	 26u0VXtbt23vzWcTUv12hNtR7Us8A4WkS1GjfLkXzS2zHNlpGCgjyrBx9niUrTalWRbYe
	 hmwRZcaGejog6zZlWbozCnMqSXFyKi7l9zdL1/sI2x4q5vFp7KDcpTdkmfROKsyqgGRqM
	 oqiTlOKzYSzX0djV2xZGwwC3pL6yshCCr4V7o/AV5mz2fuyKcUlVT59/VHKwNG1zNZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="oR2/h2jA";
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD03606A336
	for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2026 18:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDD03606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=oR2/h2jA
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5364d86f7f0so959951cf.1
        for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2026 10:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794939420; x=1795544220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pepFJC4WupF41wk+cSidNw5vmFTw1POO1gRenleZ+aQ=;
        b=oR2/h2jAzlatMI8qr/+m1DFzN+AOiaSQgHdPXWe5z72GMo9l1CPO7f/2XlVcMdb/B2
         HRmaYUUcJTaFWTfKUc8Xk+XLRDQ4qs8suoHcYjExtCJ+bUPN22DItmiL//KxCV9mJkxB
         6uPBt9ZUIYvq6BEgYq0HPaAgB9Eg+HXh3wQOyyqXrlKTb8J7Fv4BcnJP47XUrI/ppZ38
         fWF5w0hkc/gBrxi3nFI852j0wmuAewg0IU+JVmVMRM6eqUl2XzkYg1dx2IUJOZwh8izG
         n/Nw+wIYfbB2Yh4xAMzqmPTFplWOwDEfXGfAYloQ+zAopYlpZwUpFUXTPl2+I786AYPM
         FmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939420; x=1795544220;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pepFJC4WupF41wk+cSidNw5vmFTw1POO1gRenleZ+aQ=;
        b=G172ho95a4b0twf/NghxlLfA2+oW/sB50hhpnJGCpP4dTwn9++/bZxLX5qiYoGIxSq
         si5knW03eJRs9OnKbD29VuDa/X8jUn4h5qBQgMfT5MKBjPhiYGtFw19CEUbPeSOhTLLZ
         l2jm14Rxuho1ETijNDKRTk2VDS1aeUy18/IoEcNC/8FK5YWt5FuoU0iyHIQcOz/GPoyU
         22xYWli3JCVQIPtUY0zavA7oqSeW5o110pfTRUjf9JmXsAwyIE+hKi/7a30wjBto2yz5
         nuR2fcCLA7Nkuh+1uiT1OW00HmDpQcP5d+bMPwKvL0o4geRX5AWjwKQlMEr6pll+it5q
         HVHg==
X-Forwarded-Encrypted: i=1; AL+hErGsWKj0AQlyR3K6bN8yClZj+W8NNlDHN43to3iOGZcGkzEsN3PZEQ4YdLr8B82/SeU+delgGabD5ViDXw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/0VNH3VXqIUyM2Y5TJ3tf1OtVvOB4ca3GO2AvA5Ysy4ZKQ9Tib
	3BC5rjRgBY+8LUEDJaylE1dg9eqgjmB12ZHiYoPCJ3AKdTtcc1lwUIggLco34hUxtCbKJutZES3
	qTlJ6
X-Gm-Gg: AYBFou06gnNierbDm78dGPCTX2jkCv1D8ZZpXjoNRWzCYVTV/s3ZZo+fSXlbGk7cXH+
	YRq3gMPTO8ye+JzsznvdpmcI6TgDCC2WsEFYVHjyxv7cesa717exqtaoEyPKzwTj+eDSLXwxllq
	V2cfGHkuIsUmyXwN2a4uJa9HFY9HbFeVJ56UDFM4o9m7WkdI5p7TpwwSaWRATl0DMvLL+58k6Qe
	19VOt+EN/5QecFB1rOEwe0JN30guLmN8Qgz6CuesHr87vB1KmVUcHPy1DNNNEsDNGGouwS4Pla9
	YqJKweYpzudcxI4Y8OasYW0peBJMnMa+wCT6pGazKfbZ23YNX/MCVxVqg3mHQteYa5Xw2FbQ3Ch
	VDN2MPRfB3Vbdb9S+uLoxlQigOhU9F6s9xqQhqiRfn1eMWdtQlDFzWE56iTGgXhgeKZZX2wkCR6
	qXwNNKW3eEhHYKS/j1g/pfeepMCD1DYRE7YeBlE1LaHJRQ/8cI/Jfqau7Y6t4RTwV6X8kr7vFnQ
	6VsJRWKbr28Fua3OZbpa30NYjT1LUtqMcxuq7yGGQjFTEv+I3qOmGbIemb72sB+iNjGo7QZnUix
	bxNbYA==
X-Received: by 2002:a05:622a:1b10:b0:55c:3b4b:45 with SMTP id d75a77b69052e-55d5a538613mr1980541cf.24.1794939419724;
        Tue, 17 Nov 2026 10:16:59 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d5907ee6dsm2590361cf.19.2026.11.17.10.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:16:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTNjm-0000000D0qg-02mP;
	Tue, 17 Nov 2026 14:16:58 -0400
Date: Tue, 17 Nov 2026 14:16:57 -0400
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
Message-ID: <20261117181657.GF2606445@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
 <avxs_TU6FHn7MMx8@fedora>
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
In-Reply-To: <avxs_TU6FHn7MMx8@fedora>

On Tue, Nov 17, 2026 at 11:04:29PM +0800, Peng Fan wrote:

> - Keep the DMA controller as one device and describe its channel Stream
>   IDs in the controller node (ordered list, no per-channel child nodes and
>   no requester-ID map).
> - Add a generic dmaengine/IOMMU mechanism that assigns one of those
>   Stream IDs to each dma_chan_dev, so the channel gets its own IOMMU
>   context/domain without inventing a DT device.

IMHO what you really need here is some way to get the DMA API for a
"PASID" combined with some way to convert SIDs in an iommus property
into a "PASID".

How exactly that looks, I'm, not sure, but you probably do need a
struct device to do DMA with as that is integral to how the DMA API
works.

If that is a real struct device or some proxy, I don't know. Long ago
there was some work on this topic and struct device per PASID seemed
to be the direction people were interested in.

> - Use the SMMUv3 shared-SID support (still under reviewing) for channels that
>   must share a SID.

If you get struct device handles for the SID then you don't need this
at all since you'd have exactly N handles with no overlap.

You don't need to force the struct devices you want to use in the DMA
channel's model to be exactly used as the DMA device..
 
> This keeps DT describing real hardware (the controller's SIDs) and moves
> the Linux-specific unbundling into the core instead of a per-driver
> binding. Each channel occupies 64KB MMIO region and works independently.
> With separate DT node, it will be easy for us to do channel device passthrough
> when using Xen hypervisor. Now moving away from this, the remaining question is
> how to expose a channel for Xen/per-channel passthrough without a per-channel
> DT node, seems I need to add some code in Xen hypervisor to support channel
> passthrough.

Normally you'd make a VFIO driver for this, especially if you have a
"PASID". You really care about Xen? It is so weird in this area?

> >Again, since this is the 3rd - 4th case like this, it seems like a
> >popular hardware choice and we should try to do better to make Linux
> >support if we can.
> 
> Yeah, I saw QCOM VPU case and thought child node usage was agreed from
> Krzysztof's reply. So I use same idea here.

It was but at that point it was the only one. Now there are two QCOM
ones, this and maybe another I forget.

Also, IIRC, it wasn't quite like this, the DT was supposed to create
real platform devices. This kernel creates struct devices and attaches
them to DT was the first idea that was pushed back on when it became
too complicated.

Jason
