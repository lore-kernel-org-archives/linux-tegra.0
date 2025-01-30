Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997FB17597
	for <linux-tegra@vger.kernel.org>; Thu, 30 Jan 2025 17:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738258941; cv=none; b=bs/uYYJ3AY9fhdNANw4HWYoZHs88VdDW8qNwzcSzrhdO2lsKijSZfAs05OO+PzDk7rCe/YmB/QZshrJOJ9J/wNY/5KfwuCv/GbodmVLtU+0NU7I2fEiLolt26v/jsIAwT08bw85RueDBp2qJ5GIV9v+ZWkNooZXJAqMN1mb1n/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738258941; c=relaxed/simple;
	bh=XtQCDwDTly37QPz8i9jNWoc4Mmbx4e+kSb49dC5tsSc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHg8nrbQSbkpPPxAk9tc17gEX/GOedqWyjkV0SbzeON+bbm8wRM+EWRW+cinrRKFi59QVKdwxpj51anvGMqTjBDg4mlcLM90ZDuzAEZjfMkldnpEXGDHBwicaxnWqPkBvQXEMMfB5Ew5lQ79di6JgpxrVAWonF16CrxfOkDXv5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=LfsE6GDQ; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="LfsE6GDQ"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467a37a2a53so12114801cf.2
        for <linux-tegra@vger.kernel.org>; Thu, 30 Jan 2025 09:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738258938; x=1738863738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CVNKXypQwOopSf1xgwOwZSkCQwewZeK8ItDq6p8m+EY=;
        b=LfsE6GDQbmYz3qyZKrOOziUjzv179Xd1geXzDq1D1pJ1I3nL4P/i9faJFv9Mafzuf/
         XRNY3NccZdtAfzb19CipjL0ZlTTuj41b8kkLmh59wxXq7OwNlsA7NfYC2BfcpG6umeYg
         30bih2wE91r8OTRvykqMRowpx4/Dzg4LgxeUuS9T/bMT/LUJcRBzJ3PgFfsL8ORdulNT
         M5awNuStAudAyLBH9Mgkjc7PXFTkNUS+xMtRI2wtWmXPucEQThOrrlqKvbnQ4QvEyUMH
         Qm8PlG/V7lW3XKxvJsTp9nco93OtVB8q7Uoa9c2xF1AQFDBp/hnCQe2wNcTaI+cWIv8P
         caxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738258938; x=1738863738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVNKXypQwOopSf1xgwOwZSkCQwewZeK8ItDq6p8m+EY=;
        b=MxLX8+pq6scyyaWkRf8F4H0xOgaJ+UoKwN5AzqL2FY5KmXw8TQK2amwe8MltKcJplC
         zhyQsafiRCyBslcdl1l/XtIvFig4OXJvCIXt1rbRuC7cvD4dbV1ziA9Sll98jKaNPLBm
         sC6Rnm9y6+vfS/ob6twAZmXNM03JYjJekjC3ax5HQlCfgoHHKP46sqgNK2kJMwIFekNm
         f0Sy6e8g2gHq7lVAOl7rhmBripMQqVVJ9LQRrnh7p6yOKsJUs/A3mjbICn3JXQflI32s
         DWKPvy1ujDBHc30blJyERaI+w3ZIflpT9czeVlpZqy9s1ugH/F3dVJUR2I/HQ92EBmkB
         nMLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV68o/ZHVyslZYQ4c5/z3uc9MFf8f0/YoyZNTgJ+37GETetQ1Rylg+TdDwQQY+RgEpBraqUfiwsJCZBFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGt1pwEIWhYWY1C2OVoRqJnGunYmQva1C8drvcEWeirij44x4M
	u6GWRZC3t3g7vY2Uap2mOMktK7AhcWEFR+mabxQCOioqIflh6bGNPtBG9FmOd9U=
X-Gm-Gg: ASbGnctkkImanXFEAWpGl6DQ5NGJsNcitZ2nxyJG8bUvP8MEpklNXSqKYWsHYnDbYXY
	RGfhMm8MtO3+T8EZ8zCLILs6S/3kTl3asAerwIfqJuF5ALR6BCM3XiM/DOowPQzaiIBY7YOmlwm
	RfAfchIu1hpi2ft1Y0DiJG9y/U6nFYiHQs7XNOGIwZfdPEJ7VT9hYYwaMx90d1QptAVI/8H2Sck
	GEz7iaC3kgSI/zzZFwI4qhoY/PyJ/OcsAZ/+J6GlQgnETc5Icso0pLj+1ViEKStdbeJsl6ZIYSj
	8b9unkWnWVVYqxPWQrnkyKxRQFoOFAImC8F8kRfD/lbnQ9JwcLBaZgEbatSQbp6h
X-Google-Smtp-Source: AGHT+IFnQ+3H7xNChFVcqgc9dwjk4L8UEnbD/nNL/ykdDG0Q22FK3UpLRKkWb0FWjYtvwvzMuLT+BQ==
X-Received: by 2002:a05:622a:4296:b0:467:451b:eba3 with SMTP id d75a77b69052e-46fd0a7fe1dmr108793531cf.8.1738258938311;
        Thu, 30 Jan 2025 09:42:18 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0ceacesm8793061cf.31.2025.01.30.09.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 09:42:17 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tdYYT-00000009ew4-0Jjs;
	Thu, 30 Jan 2025 13:42:17 -0400
Date: Thu, 30 Jan 2025 13:42:17 -0400
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
Message-ID: <20250130174217.GA2296753@ziepe.ca>
References: <20250128132034.GA1524382@ziepe.ca>
 <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
 <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
 <20250130132317.GG2120662@ziepe.ca>
 <Z5ukSNjvmQcXsZTm@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5ukSNjvmQcXsZTm@phenom.ffwll.local>

On Thu, Jan 30, 2025 at 05:09:44PM +0100, Simona Vetter wrote:

> > You could also use an integer instead of a pointer to indicate the
> > cluster of interconnect, I think there are many options..
> 
> Hm yeah I guess an integer allocater of the atomic_inc kind plus "surely
> 32bit is enough" could work. But I don't think it's needed, if we can
> reliable just unregister the entire dev_pagemap and then just set up a new
> one. Plus that avoids thinking about which barriers we might need where
> exactly all over mm code that looks at the owner field.

IMHO that is the best answer if it works for the driver.
> > ? It is supposed to work, it blocks until all the pages are freed, but
> > AFAIK ther is no fundamental life time issue. The driver is
> > responsible to free all its usage.
> 
> Hm I looked at it again, and I guess with the fixes to make migration to
> system memory work reliable in Matt Brost's latest series it should indeed
> work reliable. The devm_ version still freaks me out because of how easily
> people misuse these for things that are memory allocations.

I also don't like the devm stuff, especially in costly places like
this. Oh well.

> > > An optional callback is a lot less scary to me here (or redoing
> > > hmm_range_fault or whacking the migration helpers a few times) looks a lot
> > > less scary than making pgmap->owner mutable in some fashion.
> > 
> > It extra for every single 4k page on every user :\
> > 
> > And what are you going to do better inside this callback?
> 
> Having more comfy illusions :-P

Exactly!

> Slightly more seriously, I can grab some locks and make life easier,

Yes, but then see my concern about performance again. Now you are
locking/unlocking every 4k? And then it still races since it can
change after hmm_range_fault returns. That's not small, and not really
better.

> whereas sprinkling locking or even barriers over pgmap->owner in core mm
> is not going to fly. Plus more flexibility, e.g. when the interconnect
> doesn't work for atomics or some other funny reason it only works for some
> of the traffic, where you need to more dynamically decide where memory is
> ok to sit.

Sure, an asymmetric mess could be problematic, and we might need more
later, but lets get to that first..

> Or checking p2pdma connectivity and all that stuff.

Should be done in the core code, don't want drivers open coding this
stuff.

> Also note that fundamentally you can't protect against the hotunplug or
> driver unload case for hardware access. So some access will go to nowhere
> when that happens, until we've torn down all the mappings and migrated
> memory out.

I think a literal (safe!) hot unplug must always use the page map
revoke, and that should be safely locked between hmm_range_fault and
the notifier.

If the underlying fabric is loosing operations during an unplanned hot
unplug I expect things will need resets to recover..

Jason
