Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF5D26289
	for <linux-tegra@vger.kernel.org>; Wed, 29 Jan 2025 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738157946; cv=none; b=IFCpip9GAxgdgsWeKr28fC6/KKYJ1LQ7vYbEbFCwbaEnrw+EGv54R+B3+IjH0mLY9Q5hboAO4Yxi2tqIHs1DnUeSh9rfiWRvN/YQYDLiTUdk6zqVBlJbz1Y6RfJwS8HgDckuAnsFF37KiCIODAaQEfTwhH7GdqZaeCi/0GSiIVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738157946; c=relaxed/simple;
	bh=RxH/qA/BgpYkjBVmBtOP+Wt33+Id7p5IBZ1sJh+PVe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkVYKm47AvBuh7Wn4Uw0iy4RsnZfAAvB79pYaJxf8+6+QchZWwBKPMSjn4R7QhaNVhg85kSuoXzkNIU9yhF6rn3yxuKVocw+G53+HfaoWCh87W3L1jI6WRXee/EGqh0rdwAG0RIdcLXbweEdw2cfIuZ5bU8mAL7A9gmrN1kH0W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=LRbXARLx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="LRbXARLx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436202dd730so48733335e9.2
        for <linux-tegra@vger.kernel.org>; Wed, 29 Jan 2025 05:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738157942; x=1738762742; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ekPyuSS82CPNI1Lh/E6IsIbzoEEGT2LSw6fRdzUam+8=;
        b=LRbXARLxcVlSVLOIW9nPwxiGleXpTsHVUK1xrS0UwYak72R+r5JA7lmqK8UxnnQHw+
         hjfkoSJN3yj16qLBqvfCG4JqRqP92QoaOZ3ZY+1vjEGDAPpILcv+DlIlstdU29B49j00
         9/MvPxpeF0nk8EcLadAsFREGfVtX/6b+FsBDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738157942; x=1738762742;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekPyuSS82CPNI1Lh/E6IsIbzoEEGT2LSw6fRdzUam+8=;
        b=tChY03fneetlbg91YookYqj48tH4c39Uo9DxYqRGmTYplq99q3GTFPoz/h0sXAcOOA
         z9XtyFjwdkqnAIUIko5ZXsVIMpDzahmTUC5fAfMiT08MpB8Fef6CbVCicr5OhwTMSJRK
         S77Fo5tUZTUoH+4R4U8OMflPsZKkbaNsKb/mB6lHMqJsBHupTujS+Q12WkT8OKYHHLOI
         +m5152701XZaSX2WPbga5LUb2Y3MVg1J59PlDOGv9lBsHDrCsqq6lodYACt1wdxpbg4l
         HLfB7EIgXysGfc3/4djxqWXsnBRwBN8bvDJo7uX1Cv9PChbFrNmIckFBdVsVcGA4sNaK
         i2cA==
X-Forwarded-Encrypted: i=1; AJvYcCV1+VfDp/yscVJqGtGKcQMCQmBJx4hsiZCcrqMsIe/KZPpv6Drq+fOsOHALhlSiKF9+z1bIvqw9RLrfHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoby/Q1uXvLwnMcR5iRRNY6IGbWms8R/LGwJP6wAkKcdg1J7BQ
	Szc9SrdRzLu6YrvY6kRZKQIxL0MjbfVp5TlgxjjAvMEt372wn2l1ts22blttN4M=
X-Gm-Gg: ASbGncvNo96jJJE3doqZfzfqRoTxwvIAeL6nNPf154F/F0vAm8Y2RjPWDRjR+Nrd5Wr
	4G6UsppnEavcRR+9dTAqHOUpqmVPhm48ztMA0rDI/D/OMrI7mfz0+SCLs2z2W7D4Du9LUKtn2kZ
	eDRa9+C6rDH9Qyx+jIETErkjhCQM1xAWpaN4+MQsjA2mm8e40Kl2o1A9K0ErEeTC0Q8cdC3afq7
	l0tvIAoRmctB+9SDmrLi3IVpIgjakeMYkPI+OzXqy/T7ZkmPeUknvj27M+NsZ8zAGmbXhZc5D7C
	0D44IDTgsEjm/xYQZhkOnN2fhq0=
X-Google-Smtp-Source: AGHT+IFp40yYl/FrcEC18d1HA1Wbr1YBHRju+Twtn7vgv1BIenNhcb0w0RrYUn5K84MH3BCfQBYGmw==
X-Received: by 2002:a05:600c:5486:b0:433:c76d:d57e with SMTP id 5b1f17b1804b1-438dc3a40d3mr30211795e9.5.1738157942387;
        Wed, 29 Jan 2025 05:39:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc263f0sm23501465e9.9.2025.01.29.05.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 05:39:01 -0800 (PST)
Date: Wed, 29 Jan 2025 14:38:58 +0100
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
Message-ID: <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
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
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250128172123.GD1524382@ziepe.ca>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Tue, Jan 28, 2025 at 01:21:23PM -0400, Jason Gunthorpe wrote:
> On Tue, Jan 28, 2025 at 05:32:23PM +0100, Thomas Hellström wrote:
> > > This series supports three case:
> > > 
> > >  1) pgmap->owner == range->dev_private_owner
> > >     This is "driver private fast interconnect" in this case HMM
> > > should
> > >     immediately return the page. The calling driver understands the
> > >     private parts of the pgmap and computes the private interconnect
> > >     address.
> > > 
> > >     This requires organizing your driver so that all private
> > >     interconnect has the same pgmap->owner.
> > 
> > Yes, although that makes this map static, since pgmap->owner has to be
> > set at pgmap creation time. and we were during initial discussions
> > looking at something dynamic here. However I think we can probably do
> > with a per-driver owner for now and get back if that's not sufficient.
> 
> The pgmap->owner doesn't *have* to fixed, certainly during early boot before
> you hand out any page references it can be changed. I wouldn't be
> surprised if this is useful to some requirements to build up the
> private interconnect topology?

The trouble I'm seeing is device probe and the fundemantal issue that you
never know when you're done. And so if we entirely rely on pgmap->owner to
figure out the driver private interconnect topology, that's going to be
messy. That's why I'm also leaning towards both comparing owners and
having an additional check whether the interconnect is actually there or
not yet.

You can fake that by doing these checks after hmm_range_fault returned,
and if you get a bunch of unsuitable pages, toss it back to
hmm_range_fault asking for an unconditional migration to system memory for
those. But that's kinda not great and I think goes at least against the
spirit of how you want to handle pci p2p in step 2 below?

Cheers, Sima

> > >  2) The page is DEVICE_PRIVATE and get_dma_pfn_for_device() exists.
> > >     The exporting driver has the option to return a P2P struct page
> > >     that can be used for PCI P2P without any migration. In a PCI GPU
> > >     context this means the GPU has mapped its local memory to a PCI
> > >     address. The assumption is that P2P always works and so this
> > >     address can be DMA'd from.
> > 
> > So do I understand it correctly, that the driver then needs to set up
> > one device_private struct page and one pcie_p2p struct page for each
> > page of device memory participating in this way?
> 
> Yes, for now. I hope to remove the p2p page eventually.
> 
> > > If you are just talking about your private multi-path, then that is
> > > already handled..
> > 
> > No, the issue I'm having with this is really why would
> > hmm_range_fault() need the new pfn when it could easily be obtained
> > from the device-private pfn by the hmm_range_fault() caller? 
> 
> That isn't the API of HMM, the caller uses hmm to get PFNs it can use.
> 
> Deliberately returning PFNs the caller cannot use is nonsensical to
> it's purpose :)
> 
> > So anyway what we'll do is to try to use an interconnect-common owner
> > for now and revisit the problem if that's not sufficient so we can come
> > up with an acceptable solution.
> 
> That is the intention for sure. The idea was that the drivers under
> the private pages would somehow generate unique owners for shared
> private interconnect segments.
> 
> I wouldn't say this is the end all of the idea, if there are better
> ways to handle accepting private pages they can certainly be
> explored..
> 
> Jason

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
