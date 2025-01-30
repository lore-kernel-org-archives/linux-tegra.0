Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11581819
	for <linux-tegra@vger.kernel.org>; Thu, 30 Jan 2025 13:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738243401; cv=none; b=TPjQ4kDgU7zXOi5/IxaoneYIDdHe3qi/9J36h+3J20uNUyOuaPYeo+1D1idvZq8dBMz5qTfLoBxIRGN+1hMqIrXCctUv1ExUEd4+9igycZAGjSCUIASvIiQEqIJGFSvEm9K+OVa8SpEh3oi6r6UAkbXWX3k2jVQ6QfoLcZFU3zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738243401; c=relaxed/simple;
	bh=p4tpidr02nY0Oi4LOQySSJVaWNlyV3JVNjJbzcvsD10=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubk0lO2KmRsXf4nd1yyTmcq9qtuccMphpg68flnVN+nSPcYrptxEhXLnDr5ZDo7xuUp65kKt9ixckCkN3GXwmcRZpptYXm9bOLl4Llk+ggpohbguOhxnINBKL28yKlsDUdtZfvyzeuAiovRMyWeorg1sQJvYHOjpF89Xr0Btevc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ABUEH9VS; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ABUEH9VS"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6dd420f82e2so10192306d6.1
        for <linux-tegra@vger.kernel.org>; Thu, 30 Jan 2025 05:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738243399; x=1738848199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4xPSZzw/OoNchPOgrFnhgjUTxZA4+QRO6/LNv63tO8=;
        b=ABUEH9VSNvxBTycE6cPxd5CFHhFWr3OnVrtW09pH0NCrw85ehnrDhJ7t9KYRHrxBir
         5lB6RFeFMFwB6B7cUhxDgie6m1y9xYsXm0VJiW3AsgWmDyPVC8BCUl047JumBaET1BwS
         NCRQLz3+BKocsfy34wavOdksK0Z/iWNtX8bw+EIW4NGrlFYb04swA4HZY0cJUbNNBJOw
         oF8tWjyN2Hd8AjydptFOm2I1PMCAfe9MDuIMDYBPWGCfRTqkzW1jw+gPeRxG52+TCJgA
         UAm4hkAe33gbY4mgEnorr3zH9DJQfxsiruTCtqNjS3ugbcMDGrJIxDikQ7/Qp4aSi2e1
         Zxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738243399; x=1738848199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4xPSZzw/OoNchPOgrFnhgjUTxZA4+QRO6/LNv63tO8=;
        b=qcuWK6us62cCfGCsDKlWDcrvDGcJABc69kz0QG3pElTyQ9Ffws8v8PIX456vhlwgK9
         VwU8BzaAXx7JuwG6yZOH8J0o47xVRGYKHAas4bcLPZBXE0Gmo6KmBv+TiyOT/wIXd7wj
         mi3mxw8i2pwBlVtUyu6KUC3/0ur910dSLS1bsNrO23PoZJmCcTMjiSAynKl3degnP6BG
         Ii/K7hBRiS3euB4jn8c1nMgoCuxLwsZrFChf47CHLrabMMoQn35h2qML31oymBaexi4B
         1tF0e7jFONptUZUzvYtS0bVC6BeT2jwj5BarpcRUG22T1vpCKqzKMTcjus3q1d0czhQS
         JHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpRmk3MKfm2oLBIxch3SKt2R0VNLWM4yBBhlkWPLqVox5rDlcI8OTxB9egg/tHAfSISrPKzGjpHerrpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTcJPSJWAzCOofLDZy9+4E3zLS1vxnDx1LHEhFkFGgSacHNPc0
	sFImA3cn1x/3eTLFs503aKjc29jkV43dBG4ZW86tbY610sF6GfByC/P3lfWWjYY=
X-Gm-Gg: ASbGnctiT6JDhytd1+vq1O1p/drjrCHMBfTm+FnWUwXnDtnVaSkrNi1eSBBrc+X2Dfo
	mlB1e1bgVm2AFLLXPxkiT/MrBCMuFNhs729aMPUabx8pgU0jtmn0XguOVE6i2yMHbGWb4VG8NuU
	4vkOSy8K8MvTcgFGNaTbw7efeCkVt8V52tXxVyuIgLz8nNPitb5zzR8TcqZLYr5/EPHJZHYB7up
	bVcL2/VOOIITAjg7iGnS+HgNFYLH7Pi0B2B3TLFso/kGyDLZymZry2ANeqh/sK9hF+EBzZQ4dae
	yCPs/1hY9fTMqtcoEqQBur3k7EXc9lj3+p/4Rq5YLxLFX5LepH6M/l69LDjGL2Bu
X-Google-Smtp-Source: AGHT+IGu3gG6c418DyCLyq64UOVytvPPjptyLj9HsxmCFyjptBXKcCidLbQRWokyMo3VhHjgkQmzrQ==
X-Received: by 2002:ad4:5d63:0:b0:6d8:aa45:a8a2 with SMTP id 6a1803df08f44-6e243bbbb2bmr94974656d6.11.1738243398854;
        Thu, 30 Jan 2025 05:23:18 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2549222cesm6056236d6.83.2025.01.30.05.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:23:18 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tdUVp-00000009YDe-2eaQ;
	Thu, 30 Jan 2025 09:23:17 -0400
Date: Thu, 30 Jan 2025 09:23:17 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
	lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
	simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
	akpm@linux-foundation.org, GalShalom@nvidia.com,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-mm@kvack.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <20250130132317.GG2120662@ziepe.ca>
References: <20241201103659.420677-2-ymaman@nvidia.com>
 <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
 <20250128132034.GA1524382@ziepe.ca>
 <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
 <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5tZc0OQukfZEr3H@phenom.ffwll.local>

On Thu, Jan 30, 2025 at 11:50:27AM +0100, Simona Vetter wrote:
> On Wed, Jan 29, 2025 at 09:47:57AM -0400, Jason Gunthorpe wrote:
> > On Wed, Jan 29, 2025 at 02:38:58PM +0100, Simona Vetter wrote:
> > 
> > > > The pgmap->owner doesn't *have* to fixed, certainly during early boot before
> > > > you hand out any page references it can be changed. I wouldn't be
> > > > surprised if this is useful to some requirements to build up the
> > > > private interconnect topology?
> > > 
> > > The trouble I'm seeing is device probe and the fundemantal issue that you
> > > never know when you're done. And so if we entirely rely on pgmap->owner to
> > > figure out the driver private interconnect topology, that's going to be
> > > messy. That's why I'm also leaning towards both comparing owners and
> > > having an additional check whether the interconnect is actually there or
> > > not yet.
> > 
> > Hoenstely, I'd rather invest more effort into being able to update
> > owner for those special corner cases than to slow down the fast path
> > in hmm_range_fault..
> 
> I'm not sure how you want to make the owner mutable.

You'd probably have to use a system where you never free them until
all the page maps are destroyed.

You could also use an integer instead of a pointer to indicate the
cluster of interconnect, I think there are many options..

> And I've looked at the lifetime fun of unregistering a dev_pagemap for
> device hotunplug and pretty firmly concluded it's unfixable and that I
> should run away to do something else :-P

? It is supposed to work, it blocks until all the pages are freed, but
AFAIK ther is no fundamental life time issue. The driver is
responsible to free all its usage.

> An optional callback is a lot less scary to me here (or redoing
> hmm_range_fault or whacking the migration helpers a few times) looks a lot
> less scary than making pgmap->owner mutable in some fashion.

It extra for every single 4k page on every user :\

And what are you going to do better inside this callback?

Jason
