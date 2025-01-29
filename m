Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEBE199B8
	for <linux-tegra@vger.kernel.org>; Wed, 29 Jan 2025 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738158482; cv=none; b=PnZn/XO9Cc0xN/ELgc9rX/zdAU0zSF/JVc0UkcDLNG818FykSvA183TSVS+DvC0CNsXZgZ0Z/wP3Lzn+ZfuCtcIXDhPCYExTl62xCgrtuARnnwOLXN1mQ4G0FUwyW8yIG5/DjaMnPdw4m0S5fv3QtQtq4pmcuJnl3T9PhNMb+ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738158482; c=relaxed/simple;
	bh=4p5V8MeeXoHZimLX86DEqr7isEbN5AK9qq48FtatG0c=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7vhY8l5lUrHBr/I/k9UIyWXKRS+XxnXR9h8iCEfCaFA5wCEBzEgpbcFJe4cQUUQm346dTkOfHU0JMUdaQJolJlE9aUQepwkxk5JQ1lVCFtF49WZ7PzeIg2gzJ2Iiyv/jO7FG6hmdfa4TAmalrrRUoH1LJ4oez1apUN3bqs17nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=HGdV6S4n; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="HGdV6S4n"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-467a3c85e11so49876971cf.2
        for <linux-tegra@vger.kernel.org>; Wed, 29 Jan 2025 05:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738158479; x=1738763279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TGxs1D5kHZWfV3TMw8ydKze6LYDZn037JbgBy8rBgVo=;
        b=HGdV6S4nUFZxmhXDs7awIf2kGvYN68fgxC7JmV36Qhk4/9FruV2YgpuCyKsY5Ra0hd
         JfgEZUp8oseQ3RlKPNFY4CnvKCrDEaHhNrK6/eRgvElFo8mxoek++GIE2itG74BSmP6k
         VB3Tal1clOyaiHL4920xmNAizQxnS02sE7d58ouhi0fjvtEhTFaed3muC9RlBe+ZbGP2
         yFGRLkxYuqE8SMoxWKrmquIiVP33KKbFeQHoei/OO7PZ1H8mgOSHOX0vU7NJcFOG05UL
         63QKyad5ykGWf0n88K4AMzCGSY6foiHmZHTxfYQDTBgmAevtEu+DjuytkhyKdNT70tdi
         C1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738158479; x=1738763279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGxs1D5kHZWfV3TMw8ydKze6LYDZn037JbgBy8rBgVo=;
        b=UgPf7gPoCfb/XeN0lHQ4VKIQPXqKZKbgN7hYabMjAxEun/jpHaqFpj1XWxv90xZSuU
         UZjnzBxpi0SUqxWbpb93LNT7qwKCI7+K8lZuPSvgECXqVv5gie7KdgAbKCBjAdADxKGo
         pBES9RpysYmEeskWVbVC/boVgC5M+zJ0CqyAC46RSs1TF/PMkjEFxCH6BWRYb9xtm5eV
         7LGbfoyti7ngFPqgtq/E+0mJaR30nRQTyd2CzIxIQ562yDrb6rt4pfUoNeSMXD8Xmlvu
         MXFRbg/W8hbC8wizMZAl3pcQQk+2UXiVpZ4KthulPG0YAlR8zPZkVKaX+M7HHc1ksIji
         bHFw==
X-Forwarded-Encrypted: i=1; AJvYcCVBPzmKEP2KzNpdBDj6Nnx9Cta+VHiIs5aUOFL0Ez3CAxJbkE3bZyVcsk9LsChsSSHcX5RW8BBEQT3oCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzt+b2UNsCRo5k4EEy6r4qkqKCoy0jsSwSoSdX/ZqZUMwmn1ni
	g+OWLYraadsrnP+KSi6/57hNZzWc+4cyxQyUepbCUEp0mQ/Wd7vQNjXh6ZAu1w0=
X-Gm-Gg: ASbGnctsM2ozfz5q9mxLqXWlwE2IcrHUR0GR1MDOd2HQCTrcNlDsjVYSSo2BCKiHKvB
	4iMDWUgLsXdBu+jBM4cz624PHwF9KZAaMw4pFjXerIBgUIR4V1xBIg3B2/j/QzYhdafrU/GBeOK
	D+YmhhDyJvZ9vZx30mEUgMbBnj5OPXW2gTSXf8ji1JTnnGhpOXcP61Up0iXX4+biJNgtlbOmpny
	C5wtEh6gCAxRZ852poSbS2+RFEPWelWQO2x7DB0zU9wF7gsUfqAefYRckLYb4FSid0cv6xPvJgD
	FQ26RSk8hdHCfUF1fIA6e6zVe9FTNN1L722to1Ah4vp5qU1NgoxIPnU9fzPWgFg8
X-Google-Smtp-Source: AGHT+IHuYCAk+wYHqjFRDvmI1uuhKYfRXYz+H9jof+ajiAjSs3miFEirWAObJrrIBPKksD6vvP2lVg==
X-Received: by 2002:ac8:5a08:0:b0:46c:782f:5f85 with SMTP id d75a77b69052e-46fd0b98596mr53288201cf.52.1738158478735;
        Wed, 29 Jan 2025 05:47:58 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e66b67680sm62281881cf.60.2025.01.29.05.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 05:47:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1td8Q9-00000009BlF-1by8;
	Wed, 29 Jan 2025 09:47:57 -0400
Date: Wed, 29 Jan 2025 09:47:57 -0400
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
Message-ID: <20250129134757.GA2120662@ziepe.ca>
References: <20241201103659.420677-1-ymaman@nvidia.com>
 <20241201103659.420677-2-ymaman@nvidia.com>
 <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
 <20250128132034.GA1524382@ziepe.ca>
 <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5ovcnX2zVoqdomA@phenom.ffwll.local>

On Wed, Jan 29, 2025 at 02:38:58PM +0100, Simona Vetter wrote:

> > The pgmap->owner doesn't *have* to fixed, certainly during early boot before
> > you hand out any page references it can be changed. I wouldn't be
> > surprised if this is useful to some requirements to build up the
> > private interconnect topology?
> 
> The trouble I'm seeing is device probe and the fundemantal issue that you
> never know when you're done. And so if we entirely rely on pgmap->owner to
> figure out the driver private interconnect topology, that's going to be
> messy. That's why I'm also leaning towards both comparing owners and
> having an additional check whether the interconnect is actually there or
> not yet.

Hoenstely, I'd rather invest more effort into being able to update
owner for those special corner cases than to slow down the fast path
in hmm_range_fault..

The notion is that owner should represent a contiguous region of
connectivity. IMHO you can always create this, but I suppose there
could be corner cases where you need to split/merge owners.

But again, this isn't set in stone, if someone has a better way to
match the private interconnects without going to driver callbacks then
try that too.

I think driver callbacks inside hmm_range_fault should be the last resort..

> You can fake that by doing these checks after hmm_range_fault returned,
> and if you get a bunch of unsuitable pages, toss it back to
> hmm_range_fault asking for an unconditional migration to system memory for
> those. But that's kinda not great and I think goes at least against the
> spirit of how you want to handle pci p2p in step 2 below?

Right, hmm_range_fault should return pages that can be used and you
should not call it twice.

Jason
