Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3101ACEA3
	for <linux-tegra@vger.kernel.org>; Mon,  9 Dec 2024 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733754017; cv=none; b=UxhbGLpqxN2bpei2CTd40K54dZnF4GK2THl2m5MSZaEj2ymYqUgpH3xNnpjzhXEMqOYWUNE1OC45e09Vij9N6QRaTt0ASDCCMbLmZJ3tBGcS4AONTDUJ4XTmgA905kI7ncXQn2kpHk08VNXkiWypN3QzEV6o9IyIRehYIlcHzHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733754017; c=relaxed/simple;
	bh=1IfxwKOe0K+SXDwRfMDias6ZXlgFg4AGO8kVbL4Ta8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjIxIaz6wS+zm6jfnxhaPhYX1PVcH0hDRhhip7LojIM2MZHQeaEsKQtzkEZicQLz25UEq3JCxf7OfcdypxEGK8aQ3Ug7dLX5m/TJULAWB/zVp2wzjUNhq5iUg2BTB8fd7wbp1onTRZw4XP0BQZrYs40U3TOWu4UAMmJnA/3/uKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WjzmEVol; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WjzmEVol"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d8fd060e27so17065956d6.1
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2024 06:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1733754014; x=1734358814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nowhEyl5dI6aIIqwammoplLG7dGCizfgN3AwcDBvNB8=;
        b=WjzmEVol2HtqNOHDzn89GOi3ABrc8rbz+u0pvZXwDkalIxZVG2aHhGtjGZ2QkNl9W3
         sbcPg6ZbtF6lwdf9MtUkxlCY7zo2riVzwILSLyWFiQAj/zS48u8EAA70tcMIHvr+Yboi
         KIAKjJuHxV8r5RcCNk8gHU5W8odM481TXKcM7T3CfDUdPZiabn6B+FbVap1K55xq2Ag7
         ZOeC9iUJpzJwU7QIibAm5paWKntWlXlR6ZUQsFJzAnXKerYW20mrhmI8GSyGM1DWkOqi
         wuvwX6nBfBoHr1Ja0aQcz4VtBHK0y4mVIfpmiG3w9lQkJUO7Fwcr8OF1+kOyTrDi+Zpw
         9hbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754014; x=1734358814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nowhEyl5dI6aIIqwammoplLG7dGCizfgN3AwcDBvNB8=;
        b=jW29LwMbhZkC9UDfM75kvlSVaAmSkeonaW8VyAsctaPL0LBgntfeDNRJeo4xPB6MXD
         J7U/N4kU0xhJ8TmhwafHHEEs+NMw/ZHl6teDnCwP+RUxcquTVvaR9L6UMZWZqKNCTpv5
         ibDWBlmIOaQc8pBoWQQLJ91JbncbUj0TnNVZ5Hob1z4JB2zEgZB1QujqCKVRp4AByoKO
         Yff7c12Q0lqwY61vlsup0+5SYZlkdAOJ36kLL1Ebrl58mHl8vwJnyZWvpvrZrmhOyuGf
         3NRwv5dPzb3pkJlZ/OOnzigrPNlRLos+uz8BAHH22W0eMcCcs4lxIrLzWwCmt8/cI/el
         8jHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPoPt7VvMC/LL6Tc0GuYts2s6Uvmm/Dzj8rnMYMe3N1OWn+pithhNVUilt7O3hOEPqlvJY65CVaqpu/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjXCPiloBq/xrqUjk2D4wdDYqPuPrF4JynXIBa9qGN6JpRwO7C
	cRQHLZqK9GDCcvr3nODgJSwdpdNowRyzwOkloXcc3C23x4rKxUJNrfwZ2Pr4HTA=
X-Gm-Gg: ASbGnct0MZoOxT5FDnyX8+pmY+fYDJAox6NbZE5Np5q/NAmshq8UrMXVTQ6b8HtXNCj
	xW7QhJmkj29CXy6IsiDdnBgKOwdnUNKVXz6PONBDQDOEETnxATHUDTw96rEJZZxX586/puht+kE
	r3SEZ4RxE6c/TexJIQ9U/s+LgepOzye/0Z2O73/p2FnqG6QaTYoRJxhP+bUsaJUDtF3+Zf7WCFw
	EhBvMZw7eA8B8VS/a2IK0XLoi3UJYbuMrgEgL9iRVNI9TYJ7lIddSW8WEYq687/P9r6ju5r2A0H
	5Ix5I+d5hXOkMtLT+bl7OS8=
X-Google-Smtp-Source: AGHT+IHoY1ZOiHkAJnpdjYQRkeVDy7sffj3Siw+V0OMHlwsl39yE0CXPuxOPKOgDNwcCNM/wgKH60A==
X-Received: by 2002:a05:6214:1c07:b0:6d8:a76d:b66c with SMTP id 6a1803df08f44-6d8e7170365mr191037006d6.30.1733754014582;
        Mon, 09 Dec 2024 06:20:14 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da6b2291sm48868886d6.58.2024.12.09.06.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 06:20:14 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tKecP-00000009sI1-2JGA;
	Mon, 09 Dec 2024 10:20:13 -0400
Date: Mon, 9 Dec 2024 10:20:13 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2] iommu/tegra241-cmdqv: do not use smp_processor_id in
 preemptible context
Message-ID: <20241209142013.GC1888283@ziepe.ca>
References: <Z1L1mja3nXzsJ0Pk@uudg.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1L1mja3nXzsJ0Pk@uudg.org>

On Fri, Dec 06, 2024 at 10:01:14AM -0300, Luis Claudio R. Goncalves wrote:
> During boot some of the calls to tegra241_cmdqv_get_cmdq() will happen
> in preemptible context. As this function calls smp_processor_id(), if
> CONFIG_DEBUG_PREEMPT is enabled, these calls will trigger a series of
> "BUG: using smp_processor_id() in preemptible" backtraces.
> 
> As tegra241_cmdqv_get_cmdq() only calls smp_processor_id() to use the
> CPU number as a factor to balance out traffic on cmdq usage, it is safe
> to use raw_smp_processor_id() here.
> 
> v2: Sebastian helped identify that the problem was not exclusive to kernels
>     with PREEMPT_RT enabled. The delta between v1 and v2 is the description.
> 
> Signed-off-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Makes sense

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
