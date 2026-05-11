Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B885C3D8127
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 10:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495660; cv=none; b=sWQYnXdiRzOW7QAjd8W21gJZrT8unbZKLstYCR03A4MAidozX7R1zX0SsJTqAnF4iRv+q+QxuGaPTGjsDppuc+PchCdZHZ7fvJEC9kZg5BnWq7cwOHUvaeFvETrhJLnJy3LRyiBEUGiUDyl6y8+4eZgmq0Ym0nqK/tewZaW939o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495660; c=relaxed/simple;
	bh=OBjJ4qWY2VNba0vgmOYHWkVFmsOhC9ZRZRJDpBNdUpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuRwqnXelUc7ZIlgFiDlCjVkwyB3pnruy+VMGvhOMRK80M6FUbYQt0xYHPobiLVDCIuQt03zJM7khl0y1tVhs1ryAtOyP4qSaOxh5NMO3QJBsg8kKr5IfX000xAosS6sm7lAy/H+H5qk7bq5o60izQJctp9zmNk8CfJF+Iys6Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=saFeSYBO; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="saFeSYBO"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso485ad.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 03:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778495657; x=1779100457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+1RmAL1G6V7aOO8kOtNRCIE/n9eFhH+hpo5Ze/Bw3SM=;
        b=saFeSYBOFyQz2lCyuQMOBFR6yb+q133Z+gTXb1nqF8zJsXZLkWZXgZD1EGT68tYZX+
         0u2B8b3VPquJ6gJDtBJOVv5t1mrcCC+sfrsm/C2K7vtLIrkrwgMTSOtijdyyJQ41PfK1
         KoU+gonUzd7K/iHNc1f5q/DrodguGf8Et9GK0Ak78tpASYghNKBd91gN3kCC44oedxNc
         xt6e6eEf+wJ5n+sGn5YVwj7x434UiPWHZa4sV5H0RppgdCsNJ7ufYvHhgU4UrL3o2Sof
         WBFSAR9PaXi+yKc1DAn7ONwKDhv8/mBxzPVm/1lBEKR0fb87lpMcHnog1LP0P/8bttve
         Dy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778495657; x=1779100457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1RmAL1G6V7aOO8kOtNRCIE/n9eFhH+hpo5Ze/Bw3SM=;
        b=esFZn3f/yogaBshFce0AV4eTlInm3m7/fdaQDloHreEllA/l/cnz3ACpiA33lyW8GW
         4TJvOX8S7Du6Z5JzgF+WUViwB8eLW4Sh6rjXSCOqu8aiCu78Fr0qWZ4jhiKnw3JNVvd7
         Q7Jsj9DD7xIku1PWBF1s6WaL5CpFt7VZAg69/W9G/eDE6A/Q2EofDheWpsCPqgW2vAUa
         pJ2PBK2/paE5lU2Z+c/9/FuVEr3WaQHUaAn0lf3Lf6ih712U6PHdDXMRqmGsSRY738hk
         SZAUzvezJ35xkDYtV03pfce3vv6WQ8D1j/j47GUw3IoHDT3EbOWdt5+vmEiNYEm1TySM
         ckAg==
X-Forwarded-Encrypted: i=1; AFNElJ+Ts7PhVTRAX/J4TwUx1BUIl6OIeHTmZ6LrLQTYDgX0GL21ReGNVwX0V6wAhoADoX/8g7M6sVHLOZ6AoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzkH00RZI3nGf2cDsJkg2uaTDCWvDpBbSglS71wPULCu25RTnu
	qllATq4jI+RDgl4IARrYVMXPBtsikFEYP3UIY02VfJdb9pEU8HNUapjYzVCfKspFKQ==
X-Gm-Gg: Acq92OG7qWKjd9CvMAeCa0+gbsh7f7enaNHRXfhLzd4FFTrbkVBle+RCkfu0nONIaiR
	yWkTP6roCZ09IKfQdbz6zBAlP4AzsKb3WLkRZPchkTGGLDREP96tMaeWMTh+d+tdeoDwj4745gF
	yj8nkGoCqC7OkXmRqB3OReiX3bSEGEgZ2UuzA/HKdqucKKthPqexn8MBKa2e2cihtnviPSgszLq
	9j/ATFl5EqQTGks3UPYikDFzO/DpAiDwosKmpYKJn0Odo3JgunwZL19lhYDHaNkGUJz33nJDTs3
	GAvtqJiWfRYd56439o5BqBqTJE8g8JJ/mkz4XMQuSgLJNYlc49TfpraqGvRDAxarKgBjR97S1AR
	fNXoZThXuwnDIkKmVH2Otn6uAebEYz9+zkUSIIHWJqc6UzeTaxrWLb6UVkrFFHaXs9EbgbBgrdi
	I4ODCKwPpY5FIs3ezP4EVAWSzOUAWjfwXu/k7g7GqFgj3dj5IZPqdMuxaY3W/Sb4p89haa
X-Received: by 2002:a17:903:1c3:b0:2a7:6c4e:5914 with SMTP id d9443c01a7336-2bc746fc88cmr4737145ad.6.1778495656102;
        Mon, 11 May 2026 03:34:16 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d63e03f6sm7798313a91.12.2026.05.11.03.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:34:15 -0700 (PDT)
Date: Mon, 11 May 2026 10:34:09 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 7/9] iommu/arm-smmu-v3: Directly encode CMDQ_OP_ATC_INV
Message-ID: <agGwoYJD3s2T00fX@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <7-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <af3NH0cihPUQ8PST@google.com>
 <20260509165401.GL9254@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509165401.GL9254@nvidia.com>

On Sat, May 09, 2026 at 01:54:01PM -0300, Jason Gunthorpe wrote:
> On Fri, May 08, 2026 at 11:46:39AM +0000, Pranjal Shrivastava wrote:
> > On Fri, May 01, 2026 at 11:29:16AM -0300, Jason Gunthorpe wrote:
> > > Add a new command make function and convert all the places using
> > > ATC_INV.
> > > 
> > > Split out full invalidation to directly make the cmd instead of
> > > overloading size=0 to mean full invalidation.
> > > 
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > > ---
> > 
> > Nit: I guess it's worth mentioning that we remove CMDQ_ATC_0_GLOBAL as
> > we don't set ent->atc.global = true anywhere in the driver anymore.
> 
> I added this:
> 
> In section "3.9.1 ATS Interface" of F.b the specification says:
> 
>   When the SMMU returns an ATS Translation Completion for a request that
>   had a PASID, the Global bit of the Translation Completion Data Entry
>   must be zero.
> 
> Even though it faithfully forwards the G bit through to the ATS
> invalidation command there is no way to create G mappings so there is
> never any need to send a G invalidation. Thus don't expose global in the
> new helpers and leave CMDQ_ATC_0_GLOBAL unused.

Ack. Sounds good. Should also add that the only other place we might need
G=1 is for a full ATC wipe. However, we don't since the PCIe Spec 10.3.8,
mentions issuing an invalidation without a PASID prefix (SSV=0) already
forces the device to invalidate all ATC entries for any PASID at all 
addresses, e.g. arm_smmu_atc_inv_master(master, IOMMU_NO_PASID).

Although the comment in arm_smmu_enable_ats should suffice too.

Thanks,
Praan
