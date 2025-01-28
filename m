Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CED26ACD
	for <linux-tegra@vger.kernel.org>; Tue, 28 Jan 2025 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738070438; cv=none; b=ihYkH9DU0iKR9afnuE78Wm4BQ9hIVtmzLPvMdKmlOCK8Elby2msaHXQLNrAX8z359+rWk4NMmSmhmfVvZuef8Tx2tOuZWv5y/3vvCuP3gC1C6l1A1AJxFOzNjifc8RgA6L8N+Cr5mAXdIcJKJyHbYUK8TcwAf/wxVTa23hhbsWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738070438; c=relaxed/simple;
	bh=U4suS5LTaOVNoqADNqMm3cSIM2A9q2pA52JYTTgCklY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQsi01ySg7rPUl4kKLRbRUdYGJ7wu4wEr9Fnicfv5eFYa/1BSrZWbpACLsKnf7RqbEuBc44JnDFGdVadxhb5mO23mROGcmGySV922t9ItmV5h1qLonjng0QhA1ynWwPiTy0amL/Fw+xD0grKDtWxkDqYomiiP6KXZXfhM606XXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Y/iX5bAQ; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Y/iX5bAQ"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6ed0de64aso517980985a.0
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jan 2025 05:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738070435; x=1738675235; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GOWXoYYRnWMsoeKK+VVuf/lMuv2V7GO+mfTTLFXfUSE=;
        b=Y/iX5bAQEEByiwQNOJDftwrQx7wHO5Y9UA51pkGWXkj2Mk83CmggJLSEd8babLOV8V
         nVlKo7Wns1lCfcty0PWvoFrTXhTdsasEBN3dPYCngRp2hxwOwTKvnQ5TiSV3u109RY3W
         bOWQsvooFLysWzmORdltM2sACdf2ED1vJs4gJueCSgiW8OxSLiVU2XqEbYZi6BbbMJXj
         pUz0qZYrwOBJ8fCSWH0vj++MlDlDfljZ9LCMPHIoCZsmsfTzCBvUSYaELvTA2gitzqpX
         GrXl9drRu0M6N5D+z7h4AK2ssMcwZ1baH3PleulmHmLYnpTHJzV5RftTvqdp0g2oJj6+
         ZtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738070435; x=1738675235;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GOWXoYYRnWMsoeKK+VVuf/lMuv2V7GO+mfTTLFXfUSE=;
        b=MxsbUGG0Z6UHds2vwUNkuhESAjvFdnUVjWxGPO4x3ht3lTsd/z+IsxZRxXdvQr6jYn
         mV2lRuPriQ6JpKCeuNLGjnPmKP40M9QYQCiBwi4JrZaUJJzYVU3wOIQosUco7XdPC/88
         EPXSNniYOwA3IIwsV43JDgqPSTc8R8EVvFxAueO4ogq0RdXT7ohqoUIUN67fM5/72GTD
         ZmFyEdxX5/SLR2n93WumXFKT0/wEUWAe+Jrf4Ov7gXpx2mz/r3SJ7B10DCEpSE70fT0b
         1qhMrCWgGsdF3H3Y2rpzYhZzZCE0D2q4q7hCIRFfjOjbBYhn9TeMHkAyiC59RbGEOAB9
         52iw==
X-Forwarded-Encrypted: i=1; AJvYcCWHC7pReAIcg/BmZULj5I/EOyBVb3l3Nd8luDH/NlidVgk+rNyBgXxxNkybqhdOFnBuNHJKsmJuhbaQpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOexU8bBvIEPBZA8V7/ck1YXsW75MjZJ4RtP4VVwMntsvD5gLU
	XOKgzkUDKEqb4s/dBm9Ju3MMBNwhSpKIolX9HUxBUUUHlzV2PgYNxZHrgNE/+Yg=
X-Gm-Gg: ASbGncv2kW48mHJi1+F0BTFglc2JCEo+y6nkESWHwaCYL3KZLbp1VzWCgqsGs6XND3c
	4Q1WSZ9KTdQvclWs+EBvMXWp/j92XN2sB5L9YSn4M1WI6PzA8n03GsKsU0RL/ZK8vl4J+LAsOCK
	A7eVRlPXSEEam7scQFNaLBRmtQ8LxdjVBSfUDq8zOwgLX/mdskGijseAGHcmdRnjTQ9acbOtu94
	EEbxTgXUG0nO2LjVaHErvBntF2ImpI7Mn4w6j+Xi4sbfi7I/DLqU1x43TJx/0zfEH6YeihpGd5F
	HBmipBF6+uhR+0tX9ylbBa8gEeKoT2w2q/niOAIobTz+QUIlfApP6d6eGCoaYUmLOQ7SosQRQrA
	=
X-Google-Smtp-Source: AGHT+IFfqsRD0FOVkdIg887UXRm977J4ky26yoqHXaGeXqELEj2EneWq+CuXUYKkdzvufPHaZSVAIg==
X-Received: by 2002:a05:620a:3910:b0:7b7:142d:53a8 with SMTP id af79cd13be357-7bff3fb4946mr402618885a.19.1738070435489;
        Tue, 28 Jan 2025 05:20:35 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be9aeedc68sm512887085a.74.2025.01.28.05.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 05:20:34 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tclW6-00000007TbE-14aw;
	Tue, 28 Jan 2025 09:20:34 -0400
Date: Tue, 28 Jan 2025 09:20:34 -0400
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
Message-ID: <20250128132034.GA1524382@ziepe.ca>
References: <20241201103659.420677-1-ymaman@nvidia.com>
 <20241201103659.420677-2-ymaman@nvidia.com>
 <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>

On Tue, Jan 28, 2025 at 09:51:52AM +0100, Thomas Hellström wrote:

> How would the pgmap device know whether P2P is actually possible
> without knowing the client device, (like calling pci_p2pdma_distance)
> and also if looking into access control, whether it is allowed?

The DMA API will do this, this happens after this patch is put on top
of Leon's DMA API patches. The mapping operation will fail and it will
likely be fatal to whatever is going on.
 
get_dma_pfn_for_device() returns a new PFN, but that is not a DMA
mapped address, it is just a PFN that has another struct page under
it.

There is an implicit assumption here that P2P will work and we don't
need a 3rd case to handle non-working P2P..

> but leaves any dma- mapping or pfn mangling to be done after the
> call to hmm_range_fault(), since hmm_range_fault() really only needs
> to know whether it has to migrate to system or not.

See above, this is already the case..

> One benefit of using this alternative
> approach is that struct hmm_range can be subclassed by the caller and
> for example cache device pairs for which p2p is allowed.

If you want to directly address P2P non-uniformity I'd rather do it
directly in the core code than using a per-driver callback. Every
driver needs exactly the same logic for such a case.

Jason
