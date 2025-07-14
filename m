Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16097231C8D
	for <linux-tegra@vger.kernel.org>; Mon, 14 Jul 2025 21:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752528870; cv=none; b=lHTcssTKb+2Et5OTo7qypZ09brH07VHraOV+sBLgi3npQjsXV++78lscX+0UlWmYV7ScdGexvuS1m6dKPQsxuAEV4XDIiMgthQCayRT+DVG7WRaRaiVbDA+6pVxAKMV9XlzO8qc7FRcJ61wqI9gS7UMeKRNyCUQ0B8qe0cFfWdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752528870; c=relaxed/simple;
	bh=BDSxVNaH7DxXtXg4d8lyl7WfXKs0R9S9LaI79MzV4Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQS4RCQAFyCdb06Z57uvJjlzvWuA7UrtEvdWkNORKoHweNMETjXsoNwDLxIL0r0dSqlfbhcUIDGj4/8IEVvs5pp3Ex3D+N2pEivvnxyOwbcg7SBEr+4pVxcq4JLdt2NPhqNj97WHn/o9mkwM5zYUlR/cpxuyxB8CZpo6UO+O3/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=H64NFIs3; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="H64NFIs3"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7e2c920058fso116021885a.0
        for <linux-tegra@vger.kernel.org>; Mon, 14 Jul 2025 14:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1752528868; x=1753133668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xjsur9DLBO9lraNK3jQ4gyxveT6GDJ/WoDBpZ+ezdw4=;
        b=H64NFIs3xudhgaJn2FeR9ukD/krnO0az+jjDzGbWA72hxRYd0nN8hDOKW4Z7lUZYo7
         40GIXHLOO03/35TnfA7i8poYK2rpRxCWSYBoMmdE0YVB2pCaHWADT77KrwSvkT9vU79+
         dGqyE7RbOOGPPE/K5G5T1Rs/Go3hydhUIJazHMbDAB1UEjqMVKHZo8FOtqOLVHKeoYBE
         S5IW1ZmsD3Ay2ycaxcwhmQMkmeWKeCKFn7RpfmXgR53pDkuEne237g+kxlHDeNloDJK1
         B304JzitB7cbZG+h4AjLPcIvgk3kwGhpCoicnHEXzn8PtAMebPe7JHg9RgCnZancNB5d
         V/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752528868; x=1753133668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xjsur9DLBO9lraNK3jQ4gyxveT6GDJ/WoDBpZ+ezdw4=;
        b=FlXmIlCHMLcxFl8n+gIfd/fQcGiBI0h4l91zdEQpAESsb/a4pXZIRDxyjSmZc1XTRR
         uRyxi6Dd7vE6bo5Fks3nwFccGOMoJy94as89GsFUYdnpdCf/z7WLoLIovqH9QVfx/YdM
         QZzUrafJSIIXe8WYPa4geWFhY40bO82ezplNa54K+a5SHIPKG9NSMXD2WCK3mqY2KLRg
         RX67hEAwM0UMVNcpJeN83agJcK6nMehfgZ+/xob40xXkf6H4w+xDSI3tHETCIBswe+Yb
         4H/x0g0ChOdmetD7360BGebw2Q4aP9e5MHFSDx0qnCwAsy1+EKY0iA0CkoBbAdsCkF9y
         8eQA==
X-Forwarded-Encrypted: i=1; AJvYcCV98rN5YghJlFc04UFWrYHmxtv5OKjuFHRVb7eGhjaDz1u2Jg/rXPqtw2kkoU2Dzi0CXCP0SKk9BMVsoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAVtHjRag19EYiki/nUXxtbar8VEBZG/RUzADm3j+FnOKdgG/7
	FLamCmEh00rjVGS1OX+M7/i1a0S5PzHgglWrPBeSgM0PmacY0/6BDREo7R/9wqx7spQ=
X-Gm-Gg: ASbGncuXACeU1hgfEjAVEl9oNkWzCQI21NHR/5QmujaNzngf3+efTfdu2gqU/G1v2ib
	xqDLmXtMXHxlNRhUL1VzRtavQyAeZ/pmA7f5vH4gSD96YWQ22TIm9eSZYCV+4G4q/sL4tAXCqxe
	yc1VwCl6ky4Z+1I/ZuPADpmBJMpBuDmhVVpuwBUppDr1H07NdIojMDo57SQZCuUYXSMQRP3SHT5
	8nGVp1LyB4TomFS704mWcFwiRtr87pxcNedq72EB/hBRld9jvs2LPGGUaGSthoAzRjzYTmGjSop
	5ABrBgVii4g/jC81Q1YsS0M5kVl11MG0b+suUAeuCaTbY55ZHcG1ecSXh+NUGIJ4d/zWrzM7hYZ
	qFWRNgvkKPRNjKr9UZq4THXzWP3iNfdf5g7MJlsTQX5QLYZPPZ4hr0vc8tdxpSD2RfHzr/CBI5Q
	==
X-Google-Smtp-Source: AGHT+IFEx3lCJSamFS7GtCIM3DJJbVlIj8bmcaZbUD5CgXC67a7uWIwLe/hJ3o7zuNw/2yCru6JygQ==
X-Received: by 2002:a05:620a:20cf:b0:7e3:3682:6dee with SMTP id af79cd13be357-7e3378dd518mr183144785a.4.1752528867626;
        Mon, 14 Jul 2025 14:34:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e3357a2f85sm57242685a.14.2025.07.14.14.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 14:34:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ubQoc-00000008jqs-0p6Q;
	Mon, 14 Jul 2025 18:34:26 -0300
Date: Mon, 14 Jul 2025 18:34:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Nate Watterson <nwatterson@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/tegra241-cmdqv: import IOMMUFD module namespace
Message-ID: <20250714213426.GJ1870174@ziepe.ca>
References: <20250714205747.3475772-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714205747.3475772-1-arnd@kernel.org>

On Mon, Jul 14, 2025 at 10:57:38PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The tegra variant of smmu-v3 now uses the iommufd mmap interface but
> is missing the corresponding import:
> 
> ERROR: modpost: module arm_smmu_v3 uses symbol _iommufd_object_depend from namespace IOMMUFD, but does not import it.
> ERROR: modpost: module arm_smmu_v3 uses symbol iommufd_viommu_report_event from namespace IOMMUFD, but does not import it.
> ERROR: modpost: module arm_smmu_v3 uses symbol _iommufd_destroy_mmap from namespace IOMMUFD, but does not import it.
> ERROR: modpost: module arm_smmu_v3 uses symbol _iommufd_object_undepend from namespace IOMMUFD, but does not import it.
> ERROR: modpost: module arm_smmu_v3 uses symbol _iommufd_alloc_mmap from namespace IOMMUFD, but does not import it.
> 
> Fixes: b135de24cfc0 ("iommu/tegra241-cmdqv: Add user-space use support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied thanks

Jason
