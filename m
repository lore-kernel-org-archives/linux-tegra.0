Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975CC8634A
	for <linux-tegra@vger.kernel.org>; Tue,  4 Feb 2025 13:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738675579; cv=none; b=lx8QtFZKFjOFnU5cxHn3Pr8QwVLRwzPIyxcb8mf1c4zGbwHo8z2/cQgvWd3jAsXlp8gEVNrAvuD3GDemvBhqUKY8f1idpXrcSKDQuhjMRdlxzd3IoC7R2/WQZQMkG4Rh+EaSFJBdXkuSK8PdrLT5SIxvhcqAMj/lV5rSC3bAA0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738675579; c=relaxed/simple;
	bh=5LJTr/ZPjO5d8ubgU1RzCLXSrJ44hRaRLu0S3BgGeDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TClJvdOFLCDPa3IPFCccCnccPKmYJ2b560FzdZlssNxyuUdML3CW5AG7/3l5v5r8PLhKLRsb2Acl3I4DY62ybbSREqydLCQE0PXIXMR/dy1rHYIrjbSJQKvCEidny3y4B0DiTnRK2fd1AW+LRprzaih2qskztBfGpPUri7Urvo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=NaPPhZE3; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="NaPPhZE3"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e4295b72b5so4754406d6.2
        for <linux-tegra@vger.kernel.org>; Tue, 04 Feb 2025 05:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738675576; x=1739280376; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AVp4b+FFVRvgHW7eQGwrIGJ0Ud3zrEOqDnH6Jl7Uugg=;
        b=NaPPhZE3CR5s9YAau5oCW85w4ZnzGzRJJYvNSPHq+D+poKU3NkVLjNV9IuHNfFVSYv
         GARUU654zsS/5Ev/yuqvRtjdpV2hg0b1yUKgVhBwTF51BtBqhPGp9q1ys/uznybAl37D
         T/qYjN/MWMXWBEhwjOoao4LL0U2CjPzXofJpp9GaA/jFsgd8MSwcDF9BtQ8FRonvOOTe
         kVM0JckIIgwIn8EI8iRFD1HPd75Wk3YbpO1CVra/5E2MIMy07tKdSZcmf45aZUESlVFy
         7XBgDeC8PYunWBERCnJzR23UXlu016zH71icMfWAL9H5jWnAqG40TixtU1oHpikuFkSa
         t7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738675576; x=1739280376;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVp4b+FFVRvgHW7eQGwrIGJ0Ud3zrEOqDnH6Jl7Uugg=;
        b=jtoeJR3mtyCrn6n4EFHpHWJOXCdYI/eSOPsEZtYIkHbKgbPs9HkGYoVKz5tYqP69L6
         Ii1YP05CqiXTy5V7vMYiml3vmQASmTXmbKDDIsCAKrBoI3zH7yIxBrk3AB2Nsd40GsOf
         dV1D/18jMUarfdc9Eg4D62Rm3qS7uimYQIRSqf8WyP+uwDpEb3Wx4Pk164YVUeiqUIXF
         JReB5ThVZ0Qam1dgktDaxgRp8VtK7YaAMtMnCuU81ZVom5N8M+zIwmbXUid7G+B6xYAT
         z6WnW48LuZiF/YxpBTEG7FP6pXxFArNqXcnoDqwIsWwj7zT3Xb5LRIo3uuow+7t8IhMG
         7ejA==
X-Forwarded-Encrypted: i=1; AJvYcCXASE81gT64v/rwo5Bzx929qbSvqLGihVevESldz0f9Nq7Acd1UJRbuDTfPb3anQDIMPqU267t0rYjMgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFpM84qU3wLxXN3dfNAn9/WOcp8N/Ct2Wp4LLJFqTCzM6b6lbM
	CpnAXxPm3KhpaLsCJ8DSGHfwOIbE/Vtcs7TFN1C07SQ/JfuLzqk4X7s19MuwUwI=
X-Gm-Gg: ASbGnctzeYW1Iz8Q4m7wrRIci1hCs9DyvRdWrtDtbgLfPFgCF3xUx5UagELqqa/HCPs
	YB1PExUbp0j1YyToByIVr/vHT0r3i8NX4mRn4CzmDLdBi0jHfoDaYSkKF8byRzBAuca+zjyq+k6
	fOBzwmVhY2hcyYYUK1vnreje0eQU9Xgfv0irDeTdXnSP/Xa3OKh7nwP0xhDAU6uKZ706eZwu3dS
	iRjbP5q3Wp1xrhRlQd+u3ZtsS3zzwMUq5kopv2DFcmOwXxJG8Jx/adv74yUcqZQm8YZWDPPIAMz
	HbMXFAGIjHnT9babn2vu6daonVe8KzJuTDrLAMzm2OpXrAoKhuNP5JAsy9wOHDUZ
X-Google-Smtp-Source: AGHT+IHlCOKBY+zoBFq/ioLTJPh7bDGQBSV2BY/QCHd0dQL9OkhFoX4vLeuIVKLlvifCm+9qEIE5+w==
X-Received: by 2002:a05:6214:5d87:b0:6d8:a5da:3aba with SMTP id 6a1803df08f44-6e243c3b07amr371097016d6.20.1738675576494;
        Tue, 04 Feb 2025 05:26:16 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254814d1esm61954386d6.38.2025.02.04.05.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:26:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tfIwR-0000000BRNQ-1pE0;
	Tue, 04 Feb 2025 09:26:15 -0400
Date: Tue, 4 Feb 2025 09:26:15 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com, lyude@redhat.com,
	dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
	leon@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
	GalShalom@nvidia.com, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-mm@kvack.org,
	linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <20250204132615.GI2296753@ziepe.ca>
References: <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
 <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
 <20250130132317.GG2120662@ziepe.ca>
 <Z5ukSNjvmQcXsZTm@phenom.ffwll.local>
 <20250130174217.GA2296753@ziepe.ca>
 <Z50BbuUQWIaDPRzK@phenom.ffwll.local>
 <20250203150805.GC2296753@ziepe.ca>
 <7b7a15fb1f59acc60393eb01cefddf4dc1f32c00.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b7a15fb1f59acc60393eb01cefddf4dc1f32c00.camel@linux.intel.com>

On Tue, Feb 04, 2025 at 10:32:32AM +0100, Thomas Hellström wrote:
> > I would not be happy to see this. Please improve pagemap directly if
> > you think you need more things.
> 
> These are mainly helpers to migrate and populate a range of cpu memory
> space (struct mm_struct) with GPU device_private memory, migrate to
> system on gpu memory shortage and implement the migrate_to_vram pagemap
> op, tied to gpu device memory allocations, so I don't think there is
> anything we should be exposing at the dev_pagemap level at this point?

Maybe that belongs in mm/hmm then?

> > Neither really match the expected design here. The owner should be
> > entirely based on reachability. Devices that cannot reach each other
> > directly should have different owners.
> 
> Actually what I'm putting together is a small helper to allocate and
> assign an "owner" based on devices that are previously registered to a
> "registry". The caller has to indicate using a callback function for
> each struct device pair whether there is a fast interconnect available,
> and this is expected to be done at pagemap creation time, so I think
> this aligns with the above. Initially a "registry" (which is a list of
> device-owner pairs) will be driver-local, but could easily have a wider
> scope.

Yeah, that seems like a workable idea

> This means we handle access control, unplug checks and similar at
> migration time, typically before hmm_range_fault(), and the role of
> hmm_range_fault() will be to over pfns whose backing memory is directly
> accessible to the device, else migrate to system.

Yes, that sound right

> 1) Existing users would never use the callback. They can still rely on
> the owner check, only if that fails we check for callback existence.
> 2) By simply caching the result from the last checked dev_pagemap, most
> callback calls could typically be eliminated.

But then you are not in the locked region so your cache is racy and
invalid.

> 3) As mentioned before, a callback call would typically always be
> followed by either migration to ram or a page-table update. Compared to
> these, the callback overhead would IMO be unnoticeable.

Why? Surely the normal case should be a callback saying the memory can
be accessed?

> 4) pcie_p2p is already planning a dev_pagemap callback?

Yes, but it is not a racy validation callback, and it already is
creating a complicated lifecycle problem inside the exporting the
driver.

Jason
