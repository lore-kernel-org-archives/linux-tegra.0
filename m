Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9940516F841
	for <linux-tegra@vger.kernel.org>; Thu,  3 Jul 2025 18:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568534; cv=none; b=t7D4X6/rzVV1D8ckEOMuIz69aMOZvic6MJ6uVHH5xQXrtfBnrDODYZicdRL52jUEdiLglSMx38WjJi5iEPKJ65pPBoAXWnOSWOZ5NrYwLriBGrSfqCZs+CqumZ/xQagMU9rngcBGwUR76TUSOekf538re/q72LGEMoFztbs244I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568534; c=relaxed/simple;
	bh=5O1P4Qi5Ly7Yl1j45j9wqhnY5nin4eGqfmQLo0FqHpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBbEWUvqzxbF8F4JDs2u6n45qG3dznPIDGgkQVM2rAbYYHlkas5zt0TuxkF7s3k3GmTaLA+T68TRhTC2O7c9U4UAczeVpOrnfplg90hDpfh2ESn7qohPOTT+YG2qfyL8OjB/VZc3zUJvLdiNlODNm5w3+rq5gjWBGPaVX+4uDoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ayEMxE00; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ayEMxE00"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2357c61cda7so192915ad.1
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jul 2025 11:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751568532; x=1752173332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvzyiHvZKWRtHA7KGz4JH1KLn6i77WWlalz4Eq7c2XY=;
        b=ayEMxE00vHtlx5/OrDVm0I9wTbBmIyM4hSyj1WHu6OZB60Mg/U679XY53rId7PnXEb
         //CHUg1aAPsyrOU/9Z37xR/I832VNuQRWzXUAZVziJDKumh5JD9gIOLtitd4+lYUiGQ0
         FIlFPDIGSeQ/O/ia+rfVBdW685JVd/Z3nIyP1WdOwIcalCWCnJwJMQ46KBymOsQzHe8J
         XWN2X2G1j2+SFikLLFu7bbH9PxZ+XTXIqzoNAL18QlndgqE+/XoA8xa+WC5GkJE+zjQs
         ocvKQ1brGP1DasB2GISOA1JOMa/pDG0vKPFTug/JjTYfnNUxGjQAd3El01aOx6rH6eJ9
         zJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751568532; x=1752173332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvzyiHvZKWRtHA7KGz4JH1KLn6i77WWlalz4Eq7c2XY=;
        b=Ccg5RMdtgHO8/I7QNDkp4dscqgk0BD1P3I2lNOa0ZwKTvELu2HusICk6PbhxSosanl
         tnn59UJxnZLV+aYaQsh09KFegH/1jw6FkBR8B7455TX4Pv/y8cT5CDTVYFouzv1+piJA
         l9ADMJPrHnLUNinaMMdyPjfn44HmsSIkhd07MhILdFmKvIJIDx5TDi4M5xG3d6utY4Yl
         4IuBQGBaIJfi5TiWJObNMtIVvrKkcHpidJGAj/Fkw3NtDS7C3C5t3OXyth+1jAO3eqGG
         79k9L0mzyweEE8Zb6QZTnCjihsQe6G7kuyEogerSTFb3IIhh00hADYImXiCzVdQnRyYZ
         cLpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOScNGr+B1goNH7Wxbp+P2oSVXNvOsiGq+OE3cLXtg+DvbX4okpth9k7Vjj/19oxWLNxu+HHgDKCs4xw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9XOFWTLtOUzhkGva/K9S2GQk7/94QGIyOdrId1rMdEKh/k9gX
	7I96KbhPOvH0/mQUq+ZmWWBIaVB81EhWlSrq8I8tI0DvEKe4ij4gIBi366mTwh4FRQ==
X-Gm-Gg: ASbGnctdGQObu3Rj2mubU7sOFrxWJX40WrIlau+PScboVF3b9mkItFmyeZn/7k/8Twi
	5UbsC+NYgyT8d+q3zf76F4l3AN6BY8S2Qi+czm7fDjgEbQqUPWbrdTnzD4wB5Kd54bSgVH4v9HH
	qIgHRPYyx0usojfnKgKmWBeGAi+fdkiZSidoiIVo2yjvAMonbo0e7RtCK55lW7YfihF2MMbuWFI
	/KhhiyKaR4HLqYHm16iYhq0PdPDcKc+QJzErItNRqDF1brWndX14Fr89/QcbLU/H69jrJDMSryr
	nDAeCvnbN9pyq1ZTJYuhd+Ae6VVp3PhUHfFtKDdf3OJkKMG/goL/S/v+QOuVxb7NGDsO8wo6Wmm
	nJ6Dh9g5+UbmyloP7C9jX
X-Google-Smtp-Source: AGHT+IFuOFQYDWLy9dMFwm2BVYD/G6HSHUIkq7TbiXmhTvbZxzCpO4493oWkzZnsDCA2OiWThdj2eQ==
X-Received: by 2002:a17:902:d582:b0:215:65f3:27ef with SMTP id d9443c01a7336-23c79ada924mr4107505ad.12.1751568531582;
        Thu, 03 Jul 2025 11:48:51 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a381sm1926105ad.20.2025.07.03.11.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 11:48:51 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:48:42 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, will@kernel.org, bagasdotme@gmail.com,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 27/28] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aGbQipeSn0aZnwZU@google.com>
References: <aGRIctg4T6cQECx4@google.com>
 <aGRcPSwaJkTeUrMx@Asurada-Nvidia>
 <aGRmaOORg-YDfncY@google.com>
 <aGRozoIDIlgl9H9x@Asurada-Nvidia>
 <aGR55PUBnwb8qT8U@google.com>
 <aGSBTpY0nkdp2TTL@Asurada-Nvidia>
 <aGSNmf5Q82xEbDpX@google.com>
 <20250702180541.GD1139770@nvidia.com>
 <aGaXqwzfLwsgCH6n@google.com>
 <20250703175532.GF1209783@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703175532.GF1209783@nvidia.com>

On Thu, Jul 03, 2025 at 02:55:32PM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 03, 2025 at 02:46:03PM +0000, Pranjal Shrivastava wrote:
> 
> > Right.. I was however hoping we'd also trap commands like CMD_PRI_RESP
> > and CMD_RESUME...I'm not sure if they should be accelerated via CMDQV..
> > I guess I'll need to look and understand a little more if they are..
> 
> Right now these commands are not supported by vSMMUv3 in Linux.
> 
> They probably should be trapped, but completing a PRI (or resuming a
> stall which we will treat the same) will go through the PRI/page fault
> logic in iommufd not the cache invalidate.
> 

Ahh, thanks for this, that saved a lot of my time! And yes, I see some
functions in eventq.c calling the iopf_group_response which settles the
CMD_RESUME. So.. I assume these resume commands would be trapped and
*actually* executed through this or a similar path for vPRI. 

Meh, I had been putting off reading up the fault parts of iommufd, 
I guess I'll go through that too, now :) 

> > > The goal of the SMMU driver when it detects CMDQV support is to route
> > > all supported invalidations to CMDQV queues and then balance those
> > > queues across CPUs to reduce lock contention.
> > 
> > I see.. that makes sense.. so it's a relatively small gain (but a nice
> > one). Thanks for clarifying!
> 
> On bare metal the gain is small (due to locking and balancing), while
> on virtualization the gain is huge (due to no trapping).
> 

Ohh yes, I meant the bare metal gains here.. for virtualization, it's
definitely huge (as reported too).

> Regardless the SMMU driver uses cmdqv support if the HW says it is
> there.
>
> Jason
>

Thanks!
Praan
