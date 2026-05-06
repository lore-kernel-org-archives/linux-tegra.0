Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7121316192
	for <linux-tegra@vger.kernel.org>; Wed,  6 May 2026 23:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778110877; cv=none; b=Q1r/8S2kbycYSgZB8SMUSKD31f5NOS9Q/3G1RfrFMHfp8dxXVxQqEJL4MlMba6ebKFi4I/Xibprf5VkUqrbzqt5cUdSI/wgxQ5kw8zOY/8qXOpMmu983Ti3wDDiPAUETsKHTrt3gDKcqQsQeAu88anKHOWcwze2dNzUKb/TR6JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778110877; c=relaxed/simple;
	bh=o0Srmy8jgIvvOfgyisrTtf/fJrmdBVr4h8Ys4jXIB1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQ3jopIygEbjeUnORoNZeMvDvqYyhWrnt9JC372RQ+epi46JaXsOXKW43ar2f92syZJ84mpw8Saa33pOzXE0yNagbnvnciLIJ0b2qlp7MRKCXizjFif7ZTPnLNoWvG0SKbRGYNxlrjxsbWwxAC32+9jqpn3fjgvLhr50b3PhP6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kFRHFGN4; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kFRHFGN4"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ba180a022dso24375ad.1
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 16:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778110876; x=1778715676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o0Srmy8jgIvvOfgyisrTtf/fJrmdBVr4h8Ys4jXIB1k=;
        b=kFRHFGN4gq5+ZW0HSNZj6qNZCzSzVSCfAJdHeJq4TklekWKELJ4EM3AELscR13vNKo
         RCTFlGxOcirrkyKhypPXU+O8pXVU37iVLVTfXppLacPvfDISaDkXrTdqwTPP1BwOXVb+
         u97k373MixBGbBXLuyd6ZPHE3IiA4zHGQLWHVz4F794DT/uo4R2dGvjnx0BZTDLZLRp/
         rEbu0Eg6l5WPh2f4oszA/ZbFG3xX/cjX50/1aO6qnvcpKRT3zMQ0nI/f3vpo3ESzXf5Z
         ntJNgsZr83C2vKOaNjW9ibceV53B2ORGp3JwSaijzSJxJXQnpcik7yrbny7blg9LqLLn
         AijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778110876; x=1778715676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0Srmy8jgIvvOfgyisrTtf/fJrmdBVr4h8Ys4jXIB1k=;
        b=fkQzL+xw8x3dBhIlf1QKqhpkshvny+Y98Dzbn/YdRAjaKwqJRk10Lgmh4DmZ8SM+9F
         gsAUYRQvDCywWUFQdy7aepbDSfBNAxdH9n1R5UDk5sBXYeRRiPz6TVn9rqnh0xRrwd5z
         /BRhhE0fWJY3rixC7b9H0YxbqC87Xm571YRNHTlRXmH0YHEdYLjffeHKH1pkgRLiMXN9
         ATanpsOXfky6K/gG+FS07CuU/TTQsbF6kSlD9lci7VcVcOe5KG+5JH174wKl99uLsaSv
         Chgmzh2krQM0/ksEJwzw4997Fyfts+TObEXDNxfIuRKCgOnZr4KbhP/v/m+yUJRrclzE
         AoIA==
X-Forwarded-Encrypted: i=1; AFNElJ/pxzHCq7AtqPov5rMKznW/BYDUYrbhkmHjZLtOIoKHaCqEnFfAgSQAqC9TBA0C4WX0RUiKmktb5fLWOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDidjACpEwawS0Nj0RrXCmpZIFsMN5twxGeHxItVzxJ/dA2jbs
	xu0jsOnffcTXX2UmzTL9cvQGIO+J36Ghh26Q2kr+aGcyIdldGylbqtvvEehNakRCXkMXVChlCcr
	uw5+rTQ==
X-Gm-Gg: AeBDieuAcFdmNGGewFluSQKXtG4UqblT5SMDCZ6FrIDu0g4HImrAQa9DAIujQF/lgnd
	4jITv/g+TMwig8XIkKgGcCz7UhqMMo5pCG2LJzAAQ41Z8ocwqLyOf2+4yk/8tgWVImDvPpt27ES
	JOTfHasyrlekr/WJwYxEaZfqA7vB7HbpSfyrIyjVd9rB6kxKTAyB4Cf7vyPufhLiZGYy6CMhAfg
	jDNRD/KRtCG64mkYUayJZ4PdfOcaBkzLCbTdjbn8a0mshk63sOyXvAfyMGIJUy5dbqViOGL89HI
	Kmcwu1O9usUEDFqMDY4jv8f7EubJ2sQmM+VoZx2Lvz4U5Qmr5y2oFaw0QFQ7moxPZavq7K+MZG5
	mdSlUQXsWBxxsZ5GspZDEXRODOlVov5UbgF1JaQlUmzP/QTqqw3ZpoeKs3xZZVo2CpiEw8PHjB0
	zqPuUQjeTm1iIq+oD+qA3PqcH9mKWEwVDOSX0D7ewjgFeX7a+R35Cvnz3Hd3bd8AJcB5xXFC/Wz
	xDlUDwE
X-Received: by 2002:a17:902:d414:b0:2b4:60e6:44bc with SMTP id d9443c01a7336-2bab641edaemr956085ad.13.1778110875628;
        Wed, 06 May 2026 16:41:15 -0700 (PDT)
Received: from google.com (153.46.83.34.bc.googleusercontent.com. [34.83.46.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b08cc8c9sm1629410a91.6.2026.05.06.16.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 16:41:15 -0700 (PDT)
Date: Wed, 6 May 2026 23:41:11 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>, 
	David Matlack <dmatlack@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	patches@lists.linux.dev, Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 1/9] iommu/arm-smmu-v3: Add struct arm_smmu_cmd to
 represent the HW format command
Message-ID: <afvRefDGTuqNsfGM@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <1-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>

On Fri, May 01, 2026 at 11:29:10AM -0300, Jason Gunthorpe wrote:
>Like STE/CD, add a wrapper struct around the u64 array to represent the
>already FIELD_PREP'd command data. Unlike the STE/CD this is a u64
>because the command submission path will have the swap to le64.
>
>This makes the API clearer when a u64 is referring to a formatted
>command and makes the following changes easier to follow.
>
>Move the command constants out of the struct and into an enum alongside
>the rest of the constants defining the HW format so the entire HW format
>is self contained and independent of struct arm_smmu_cmdq_ent.
>
>Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>---
> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 48 ++++++++++++---------
> 1 file changed, 28 insertions(+), 20 deletions(-)
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
