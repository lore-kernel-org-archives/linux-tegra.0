Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4DA1BD9CE
	for <linux-tegra@vger.kernel.org>; Thu, 30 Jan 2025 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738234234; cv=none; b=JaPentp7ToIE3XkkHAsbFPrSHk/oyKhxQImPlwtDATfZvYchZvRGGXAuW7ZREr+KAm6RPbl+Ns+9YyIPRNZPtGOljFtymr5P8Uo7XnwP7jJFFugPWLiA5C2ntei77F5otf69yfMJSSX3tw+1sMAbxIwDxRWlNd7c/32tEfdf8KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738234234; c=relaxed/simple;
	bh=SKBfS0WQtXwhn3Zs8dAn0uRWcnVH3Fp+ioSiHvDMYtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRtrIG8I1GsopveZZ8Uj5V4BPfASzYo8L8nuUy/0J5MxSsxtS6tHqmPw0zDU25vH2zJ/mCE+s3s+OdC25WYOZ3Dv8G9C4L1y12U8fU8jTYKowOUl/nEEZoWDJeUD5UavcS5yix/0vAOagP2HC4Ijp1z+1RHaEWt2lGVBC1A4s+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=QMszmrbO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="QMszmrbO"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so6188495e9.3
        for <linux-tegra@vger.kernel.org>; Thu, 30 Jan 2025 02:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738234230; x=1738839030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlIOJ9U3QA9sHWVQXA2SUvaDy201Q+tlYK7jAEa09Tg=;
        b=QMszmrbOwPzZGs7n/cbGZJGUOaxavUa2aEt33ex32VuH2DuuaxWrAXKz7CrUCST1xw
         v6i59Phgs6MSJmw/t+V92CxSvX2UFeYiSrGVW4CS4+FsZhhZ7WC5xH9l1frJ4dRROgTx
         1kbTy+NBs9t8IBXqIVygjJaWNiRKg5ScLu9ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738234230; x=1738839030;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WlIOJ9U3QA9sHWVQXA2SUvaDy201Q+tlYK7jAEa09Tg=;
        b=jxJLi3ZFx7dX60qTCgGJ8RhzC3F4RbJPyK/VoW2D1jnFdlTxbKrQ0IzmonoTmJUJwQ
         EOe/TsCgHPtHtDa3OwEBbvfQuYXlFlfQpiLphNmqhkHoG8Krf2Nhzb6YMCHMD1LNPwNK
         enqg5KrRELKCXjissHnhKbWIuoqGGuY+EIWB/Ruq9sTSrucfCgbj2hdLXpd4SEG2vvcZ
         kFD835rr1Z1LbzXBxzSmV9Y5goOVCJNDo3S6IKe47pW3xkMAcdhL6AE0BGme0KCjoBw6
         yxrObqlAqvaEcfhIaSgv1YoeagIuN9RJmkEfDB41TMb+78yuznr+dtGWG7i+xDzBUT12
         obbA==
X-Forwarded-Encrypted: i=1; AJvYcCVgVflmKDxN8u0Plg92a76T20wB4C0K27bxFWq0eTQNnO9ECx6ErDRFnWzRZUpB8Hx3fbOdZxxe2/TpWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA0hZjTUl6z4ulb29DyRJrTg7B2Ghmh+OOXturzML443XHZaUU
	ofLmrdSX7YW81yz86WfBB/mwwaj/gGrcCL23kBfYol79QhUoYTFTop18r+PBxA8=
X-Gm-Gg: ASbGnctcj49lo0htNmRzpq6wes/9cAyEaWoWlIlhBRcDD5N23yKacf67TVlWTO+67Uk
	uGtjrJTJkhf2OsTsTBsB04DadEZCFmt3f5kx0BP+eRqmEMSepiJK40QLh20dV8+kXI6+IG2/64/
	GaIVQZLE9YGvtFPdiP/D5YaEPvWIdNpCmLzj7v1cwo4kf7LxCt1mReXvPUCcjrWDxWyVO9d5gW8
	qTQ0KjiFSY+g4CSLL2zTvCm/2XsEhSvP03pX/4z1Rz874B/xmmnsUtL9D8qInInqr53ufvZswRB
	S+09+oNmvPOUKRomUxdt7lhGOa8=
X-Google-Smtp-Source: AGHT+IHMw0cYgOTvVvK6HIRKMLy20cgFzE3d4vlaCtti/GNUtg6PxQxKz8d7r2TT9CWFYzLA0t+WOA==
X-Received: by 2002:a05:600c:4e0c:b0:434:a386:6cf with SMTP id 5b1f17b1804b1-438dc3a8faemr61859005e9.2.1738234230580;
        Thu, 30 Jan 2025 02:50:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc81d74sm54599715e9.37.2025.01.30.02.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 02:50:29 -0800 (PST)
Date: Thu, 30 Jan 2025 11:50:27 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
	lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
	simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
	akpm@linux-foundation.org, GalShalom@nvidia.com,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-mm@kvack.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
	lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
	simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
	akpm@linux-foundation.org, GalShalom@nvidia.com,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-mm@kvack.org, linux-tegra@vger.kernel.org
References: <20241201103659.420677-1-ymaman@nvidia.com>
 <20241201103659.420677-2-ymaman@nvidia.com>
 <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
 <20250128132034.GA1524382@ziepe.ca>
 <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
 <20250129134757.GA2120662@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129134757.GA2120662@ziepe.ca>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Wed, Jan 29, 2025 at 09:47:57AM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 29, 2025 at 02:38:58PM +0100, Simona Vetter wrote:
> 
> > > The pgmap->owner doesn't *have* to fixed, certainly during early boot before
> > > you hand out any page references it can be changed. I wouldn't be
> > > surprised if this is useful to some requirements to build up the
> > > private interconnect topology?
> > 
> > The trouble I'm seeing is device probe and the fundemantal issue that you
> > never know when you're done. And so if we entirely rely on pgmap->owner to
> > figure out the driver private interconnect topology, that's going to be
> > messy. That's why I'm also leaning towards both comparing owners and
> > having an additional check whether the interconnect is actually there or
> > not yet.
> 
> Hoenstely, I'd rather invest more effort into being able to update
> owner for those special corner cases than to slow down the fast path
> in hmm_range_fault..

I'm not sure how you want to make the owner mutable.

The only design that I think is solid is to evict all device private
memory, unregister the dev_pagemap and register a new one with the updated
owner. I think any other approach boils down to the same issue, except we
pretend it's easier and just ignore all the race conditions.

And I've looked at the lifetime fun of unregistering a dev_pagemap for
device hotunplug and pretty firmly concluded it's unfixable and that I
should run away to do something else :-P

An optional callback is a lot less scary to me here (or redoing
hmm_range_fault or whacking the migration helpers a few times) looks a lot
less scary than making pgmap->owner mutable in some fashion.

Cheers, Sima

> The notion is that owner should represent a contiguous region of
> connectivity. IMHO you can always create this, but I suppose there
> could be corner cases where you need to split/merge owners.
> 
> But again, this isn't set in stone, if someone has a better way to
> match the private interconnects without going to driver callbacks then
> try that too.
> 
> I think driver callbacks inside hmm_range_fault should be the last resort..
> 
> > You can fake that by doing these checks after hmm_range_fault returned,
> > and if you get a bunch of unsuitable pages, toss it back to
> > hmm_range_fault asking for an unconditional migration to system memory for
> > those. But that's kinda not great and I think goes at least against the
> > spirit of how you want to handle pci p2p in step 2 below?
> 
> Right, hmm_range_fault should return pages that can be used and you
> should not call it twice.
> 
> Jason

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
