Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E851A23D287
	for <linux-tegra@vger.kernel.org>; Fri, 25 Jul 2025 05:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753420276; cv=none; b=t4S9RZkhWaUB8G4mvYvLyWX0u2DwPdAQ27wifcVdgJZ3Qy3TL5VkmwvhAY2Ux4XYEg562xOLKn8jYuHHhiOwJZ3KCf2dMDpNutcK/5rUyf5PaTLRp5yG+muvVkCg9aynrqIrpAfOXEeM2NJibwbP7Zgq42G9x3vmcSWB8d7RRzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753420276; c=relaxed/simple;
	bh=l6dE3XVGUiPeU5nmiSZ0jJ0PyvZFUH2gVZbYvaYkIbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoyJsTrxvqH7Cm/6NEo4Uxtmu4FZC3b6mQLX6BbXxNi6S/iEdTzW9+brltykTOLGmhkPoIj7WXytsVFNKXlb3L9Cwc7paENBZH0I17AXLmol5dCH5MSZ04e5KeQZpdU6YJ7Av4P0FMyvGv+eSgCHNGP+CpnVexIKQQunlUq1gqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AXz67ofj; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AXz67ofj"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23dd9ae5aacso72355ad.1
        for <linux-tegra@vger.kernel.org>; Thu, 24 Jul 2025 22:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753420273; x=1754025073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NJRrie+evisFjv3ojJcmxiW8N4BF+TiSqioS6un+K1k=;
        b=AXz67ofji4koAOoffe/yR3VwC7lQ4AsY2gMIsQ0iJdIyniGhjgNJiC9VCWhScLsWtP
         7ljKodmaGva5+0VupP9FgBfNnAskdnt1L+Hbfz425MUFj+j5GU2SMZ0GwZ0XJm/blWJO
         oUknWLosuIIKbJ4AZdFBo6T0IW/p5EAHvCi4MySRaqabItzhRD8glBKW5Jw+KAz5rAc2
         MdljBYmEaWYoReDfm2mB8hIv5AWJF6qJs0TqjfXiSQnrwMq13VbAnPy4AyoVazHVmi58
         qLSAKtCfHhL7Y/yHqFOt415/qKh7tITlVUH2ooHv6Tr5VxlZatFiZX8WkVmg3c8v8V3H
         RbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753420273; x=1754025073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJRrie+evisFjv3ojJcmxiW8N4BF+TiSqioS6un+K1k=;
        b=dO8SIk/sbITof7BKOPdP2PVsD6dIuVX0V9riKnRDX/09I+FE2B9hu2YeDwVsFPDTuM
         /SqgTuDCUFLrF/hWXaf79fHEMCOytT3AhAhaxRc/lGSPdW87V+XffIZxrk1i6Ml2Xexi
         sMGbBiNK6HXMF2NpMrb/5I25fYbDcMV2y1ZRLu7gavwnyqVORX4Dk0IY0f+LYc6ftkuV
         5WjbwHXkT9/7J7+MqcXQpA4Eg+76GWiWj5VXYYGL4VcMa//KHMcftFQCed+qSsYJLCLj
         /Fn9Q5OBufCxLBL7k0RDbuizN/ofaFtMguVB2DNN9yWV4LOhTIhwH5y+33F4Ni7/leJ+
         7UZg==
X-Forwarded-Encrypted: i=1; AJvYcCWR6pKElpR6E7SmyZZs3sKgE4gibo7s9DmwCMDvLqvyugigtGygVllOJi0TUyEadMDHlnhYqCd34rlHHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrfbWI5zUKRcwLp9QJQNTLxvZ/ZQU4zyDrC1Kwp0bitrNgmHXR
	fvDLlEaHT9DwFRzjVzdaWx7wptzKPyXHhuu8pVqNwPQUyQpK2woes6LK0EAfuy1LNg==
X-Gm-Gg: ASbGnct/YltHmag9zwOe7Z3L0JZZEULjQ5oeU9gG1gT6r38TDmTGNVLw1X1hjN40iMw
	WJcCdskVileDf+vlh9Jo3qKMVgMxXQGPRV1gizWEvfpDhB6YE9zy2nhSUIuHEGOgNC0cBjMCRhr
	OB+x/L1wprj/ZVbutKxFZdyUKJCmmRa5B4W2xyebbtwD5qZgVOxnWItUaTUvh3KhTtQZTsfIdAK
	VOLSraJCRq0wKNogLoaI8kXGDUhL1kcL9D99MQUAMwxwUC7dDIMyOKK+1A4axyqzLLO7cNNt10L
	kldZ8nXtGVmsSK0zZgKmjoHh0deXyy6ve0GCemvwFZ77ehQ+aRaMJIlu6H46p/Gry70x9lFn6qc
	TIKTUEqILWceX8gyoDXnGcUaf9KN4x/H2EINTR+jTP+uu96Toi9NKC5xe9OZD6dOFLrk=
X-Google-Smtp-Source: AGHT+IGG4QZQwavYhcLFszK2mSaWOfTBLnCc2XFKEIjBG7genN2zVTCSUApFR5trIV9DREmiDkhIQw==
X-Received: by 2002:a17:903:4b04:b0:23c:8f12:7c4b with SMTP id d9443c01a7336-23fada582fcmr1953485ad.10.1753420272915;
        Thu, 24 Jul 2025 22:11:12 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7630c947b6fsm575750b3a.33.2025.07.24.22.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 22:11:12 -0700 (PDT)
Date: Fri, 25 Jul 2025 05:11:07 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aIMR6xxR3Jdpy8kX@google.com>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
 <aIDlsUvF2Xbdelvx@google.com>
 <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
 <aIEwzM7mKUI8-h9U@google.com>
 <aIKd1owebUNQeN1-@google.com>
 <aIKqaGMMpsIuAVab@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIKqaGMMpsIuAVab@Asurada-Nvidia>

On Thu, Jul 24, 2025 at 02:49:28PM -0700, Nicolin Chen wrote:
> On Thu, Jul 24, 2025 at 08:55:50PM +0000, Pranjal Shrivastava wrote:
> > On Wed, Jul 23, 2025 at 06:58:20PM +0000, Pranjal Shrivastava wrote:
> > > On Wed, Jul 23, 2025 at 11:05:26AM -0700, Nicolin Chen wrote:
> > > > On Wed, Jul 23, 2025 at 01:37:53PM +0000, Pranjal Shrivastava wrote:
> > > > > On Mon, Jul 21, 2025 at 01:04:44PM -0700, Nicolin Chen wrote:
> > > > > > @@ -1273,6 +1279,10 @@ tegra241_cmdqv_init_vintf_user(struct arm_vsmmu *vsmmu,
> > > > > >  	phys_addr_t page0_base;
> > > > > >  	int ret;
> > > > > >  
> > > > > > +	/* Unsupported type was rejected in tegra241_cmdqv_get_vintf_size() */
> > 
> > Sorry, if this wasn't clear in the previous comment. I meant this
> > comment must be updated, the "unsupported type" wasn't rejected in
> > vintf_size, rather the type got corrupted which brought us here.
> 
> Any unsupported type would be indeed rejected by the init op
> callback. There is nothing wrong with that statement.

The comment mentioned tegra241_cmdqv_get_vintf_size() which isn't the
init op. The statement: 

"unsupported type would be indeed rejected by the init op" 

isn't the same as:

"Unsupported type was rejected in tegra241_cmdqv_get_vintf_size()"

> 
> It indicates that we shouldn't see an unsupported type here,
> unless some serious kernel bug like data corruption happens,
> which is implied by the WARN_ON itself.
> 
> > Had the
> > vintf_size rejected it, we wouldn't be calling the init op.
> 
> A data corruption could happen any time, not related to the
> init op. A concurrent buggy thread can overwrite the vIOMMU
> object when a write access to its adjacent memory overflows.
> 

I'm agreeing with all of it, it's just that the comment says something 
was rejected in by the size op, which raises confusion as to why we're
in the init op. The init op rejecting something due to data corruption
is a different thing..

I totally get the point about data corruption, i.e.:

size op -> returned something valid
<data corruption>
init op -> rejecting corrupted type

Wheras I was just trying to understand a case where as per the comment:
"Unsupported type was rejected in tegra241_cmdqv_get_vintf_size()", 
i.e. ->size op returned 0, yet we ended up calling the init op

I guess I should've been more clear. Sorry for all the confusion.

> Nicolin

Praan
