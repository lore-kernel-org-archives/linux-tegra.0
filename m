Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2078A26F2BF
	for <linux-tegra@vger.kernel.org>; Wed,  3 Jun 2026 00:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780448357; cv=none; b=CT4qO6Oe5hYJ1djdLVHAA9R+nGyELsna/0vwUBt2fZY1Ol9yegd7uJPpm6gOmTcrncj5B7gD5YXEjQf06kybeQZDu8C+Ht+yRVavisE6MdMDXAJUjPn/4ZsiNZP6JOT5DxV0tt1Nm91ttlRIZh+NEXw0QykAh0vaZWPFox3b+eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780448357; c=relaxed/simple;
	bh=LHu0GHEmte9bNVYdHYkwG9CA4CfbBZuMIjXj0kPY41Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgMYRnuzRcOcDeL8TJb8N38aOpVBtGpQXJ5EgOQEZ55n8urwiVmvqrquNFqDKHx0hH7cyA/L3CeDmtAljuNUW/i2TQhTKH5FCE833B86HwEXBGx8juXJlLscbIN9PKd79XgFbww9NF77zBkBmRAA2lvdEoUTkmVGW6Z9vkYoOGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=HynYdAHk; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="HynYdAHk"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ccf18ef922so53718956d6.3
        for <linux-tegra@vger.kernel.org>; Tue, 02 Jun 2026 17:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780448355; x=1781053155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LHu0GHEmte9bNVYdHYkwG9CA4CfbBZuMIjXj0kPY41Q=;
        b=HynYdAHkPMc5G/6+0bYvcFtaOiFjLCRhbeRZnrriwSzTgC1q5xHYvNIPFotXvECGw5
         JSE3wEo8EirqIcnuddXSj1KjfjK63ZFFhinkhimnsTRxCY/tEbMNMZGc1tLlGEeD3V8Q
         VMAQ9Az3Go5tWk3brGh4mcRj4KWtEAP/+MZBVr1oz/kX54Sj3lWzk3/NQRwjM/mTciXu
         T09wsC2rfL+2n6cysrj025pJDF3Pb51UeEqmxj8xpNZX/S5dlo0dSslIlYBdodmPNq4d
         4r3wsem22ZFnU5kFSW0Av5v4CYbnB5/wTHqhims5vKJZHPRsLDX5gMDHE9xTGwmdLHzD
         GAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780448355; x=1781053155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHu0GHEmte9bNVYdHYkwG9CA4CfbBZuMIjXj0kPY41Q=;
        b=eghR84qlSMhM6g9Cc7zAAGpCOTtRmHkwpF2JuVosl3yA+SFdRpijF7UiTTODh9iUlF
         gBgDIU0+1UqVXLX4XS7tcSsZLWYAqxf9hsm5RVLpVw3KmKPoR8A1Ynq+UQMhQ9aXgcgT
         qPX186pjA2p4HsVDOmm3Arh+ufpL5tAWufpf2nuWlS6g/zmW5M/9C+CEe6E/GmGloHc+
         VTBu0fh39R0Z1rfTDzTPIjYWmcJ8EvMTwoGlaAV6GlFrk6E07U4Ptf26kT3kQ4xzC9CC
         Wqvt6gzzM+2+oOsGM/tjAsFA9xkOQfH3KM0tOc6vInOdeRZTSsgTK8sUc+rB/bvOrvqU
         wNnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NBH3KFAIU/+webPX4Uqjr0yR9dnAUQ0Bq7mymiWunWaa8bJ8ZYHMXDPw8yjs4VbcjNImzljkcKljhOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb4SvK0POaw59JOoiWQzH5Qdez2LiBLA4eAvPZCGHbCAoRWCTQ
	+fUCw6WV0pofStYDXmEEk4y+w6qQPig9kpw7bHhHvFBh4Y+yE7rdX57C+aomqsYFXjYvFKR0mK8
	tqF7E
X-Gm-Gg: Acq92OGYjfz9XQ+IoYC/8nfgXgXhebKuC9OQu9tZbM89txCcpGmTRu/DBVMMqDdug9w
	qf3X0/crFGEdBdGl3HSdU97nP05Wg0Djkaebstz/VcdMOL1bM77+hyvraP26k+gOq2w/THQeePu
	f4Ds8QkzdLBQ+faOXTlwSxK7b+40UfgPNEymgBzYWec8FIWg1yzkcU47T8zn+EcZqCy0Xrp3x+0
	MkN2RgfRrUVDRlwfcOl54D40FYO5bYZkTHhrfPpiAFdIYWVI0JhiwRjca5Tl2oyIQlXEvt1zF3X
	Zs+Ul3VLdju9wJz6j5xeJ8HhhbjkUP+mM+H9whxR5f9o/UZE3VUvYyNSh31/PkThrq2VF5TIC5N
	15yFdgMrlwFAAuKQtaH4xqjsNuqV9P0llCixF8Io8RYVMMkLTN5Dh3EMyO6/0PpRA0hd0MQN5Ft
	GlIQcUV7l52PEeBGv+nGEahhdk71Xep1zjIxJjJ2qUo8emvOHymj2Rn8qJTE5PpSxBxq1wtOp8J
	MnxxiI7LzNJDcWp
X-Received: by 2002:ad4:5d42:0:b0:8ce:cad9:479a with SMTP id 6a1803df08f44-8cecde9cef5mr16020226d6.15.1780448355181;
        Tue, 02 Jun 2026 17:59:15 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd0535b0sm6677916d6.28.2026.06.02.17.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 17:59:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wUZwv-00000004xMg-3Yl1;
	Tue, 02 Jun 2026 21:59:13 -0300
Date: Tue, 2 Jun 2026 21:59:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Ashish Mhetre <amhetre@nvidia.com>, robin.murphy@arm.com,
	joro@8bytes.org, nicolinc@nvidia.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 3/3] iommu/arm-smmu-v3: Issue CFGI/TLBI twice on
 Tegra264
Message-ID: <20260603005913.GN2487554@ziepe.ca>
References: <20260601104845.995005-1-amhetre@nvidia.com>
 <20260601104845.995005-4-amhetre@nvidia.com>
 <ah87dzHOOTNGBBmt@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah87dzHOOTNGBBmt@willie-the-truck>

On Tue, Jun 02, 2026 at 09:22:15PM +0100, Will Deacon wrote:
> be inspecting the command array in that case. Generally, it's a pity
> that we can't handle this all a bit further up in the stack when we know
> exactly what operationg we're trying to perform, but I suppose with all
> the different users of the invalidation commands that's hard to catch in
> one place?

There was an earlier version trying to do this and it was pretty ugly,
there are alot of places because this errata touches the CD/STE
invalidation flows too.

If it was just invalidation it could have been solved by manipulating
the invs list and be almost free on the fast path..

Jason
