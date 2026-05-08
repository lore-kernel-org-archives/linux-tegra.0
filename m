Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A11364949
	for <linux-tegra@vger.kernel.org>; Fri,  8 May 2026 11:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240809; cv=none; b=jP2xB9/qgaLIWEaJcl6iVYPrPF2A8K5PEUWKtFuy5SKSvg/w09fUbH2+V0ddVxTNPATwXGJjKki9KSXXb4oXXN68kxOZ5L76RZ5496C0Asi1veWwSEvruMVr4AXeeH3u0t//nXPHSq1+FdyTHwKKV1hwRNIAI0DRFkIp8F34sYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240809; c=relaxed/simple;
	bh=DYoySGWvwhGOll9MsWpRxB+eEde5kCmNkA4iyDMusGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofFxsmvTSesovPGIuYF70autVchJ3RDGnjxMKsLGgtNmOhoxMf6JeFcV9yqo4aUAkUEllw6FEZ5u1240vSR6yA/5A7ZeBAWHbtlO15a1oHmw/I+xPXmKV6wPTRcNVfsrPiiySQXRX6gnfmz+Mlk0GvP02dkv0lM5OYQRrXyfBkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jxjBFxdt; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jxjBFxdt"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ba180a022dso74475ad.1
        for <linux-tegra@vger.kernel.org>; Fri, 08 May 2026 04:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778240807; x=1778845607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yk+VF2UUzCSCg/RvIE6fW76wSTl5BC3qMVjRSFknw3M=;
        b=jxjBFxdtk70gRDtNbkGH4ju68a2GBIzOxroiyPum+oroM79f1807+EBdKVfajnL33l
         vuDop9lEp7Ie1OX7UdZYxAudXkXUxLVcxAD0d+BNemhKrlZO7rwHukDzL3F3BVwHOIpo
         Ae+9vaFrmfy1bS5Hzajek3HpSfFRV4js4hTqYIMbR1K0k2/bf6BaA+xClAq1mvQhC9tY
         cT1nWezCM7yrDpI/OIhwg4mgvw9P2J4AZyzDk+lC+dXomkrV2TmF9XYDnhQJqjDKiPiy
         8ZqjnpvfzeDAzTE2ST2HA1kFeEnVfwbnIMpm/uyEu8mmDmdtGVSKYzwlOx8KhpDu09kO
         Ecww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240807; x=1778845607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yk+VF2UUzCSCg/RvIE6fW76wSTl5BC3qMVjRSFknw3M=;
        b=AUAfScHtEUPSHhLukgy5qDQtDZyJv/QlRzVOnrhwYJvRASCKdWWk6eoFHvRhbJR5/m
         o4UOAddeWuPXuCFebYZRdZkjk+TuIMnNK4levD1L7G0y1NyBNkuh+UmlqhvdS8S3dI9g
         FJ5L6SeEFYxeQ9y/kMJg1HK/vXqW49N56wNxYPq2JWX4oDX3cvBKPEy7T4Jdt5IAWJRi
         vFH3WdVYH33xZpxmjieQTelILUU4eLpK4siOaBXa9axQFEsBux0+C5p9uD0h8PG8bGyW
         8QgtrgS7pwa1sQYTyXQZtun6+5/peeKNVfxN6yhLgNS4DQmw05n88phlleSv8toUy/kO
         suzA==
X-Forwarded-Encrypted: i=1; AFNElJ8Gdh45j4s8L6mgRdLzNxEGai2f91ovaWqGLB6SQ2jVDgJNzDq/cJzitCOE/t5KiA1rW09IRAyqyvIzFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIelLQcP9zJO5/ZGMvx/+eEfdMs+N+cUZszNI1+M+v2bkUWNCU
	M+aOkfCeHLXduFUkC4X2OY0PKjm+YM9+QJbFif3QBWKhBj+5AgSiLsM406BIJLETAw==
X-Gm-Gg: Acq92OHA4NHEqXa7JUd4HyElE6/KMzJgKDVG1ZwFdhv+wN/FoXW8VD4wqKfiTSc7bSf
	e1saVvmDfoge4+ZXGUgK7ly3PS2ffvgUBuFbcw7PfP/j8wo+Hn27C9PiWlliSx7DwEMWPvT/fyz
	Bm587dGwBhIk/XmKdlFrSRu/C+QLeVP37VRD22tjnDtxPnpVkhQUZ9Pw6N9Rah4/oEl8SqpJzvf
	N6FzyOnCueRPabWyOgW4CtoTEJp2Pyarw4zFgGAhpImgMeGzVHD9cdnx2ouMVftabslyuHwa8LM
	4XNgQDqoR4MwPPQ+zCkkxB7Gy9xz/gkAWsnGD+dCJ83CTJpTk5KgC0UlDJMNODIWzpvojXmCOvo
	vUnl8SFlXByvohoJRBquPUktGhMjhz9gGcKqNmjC7SkYL0IgJ2qq1RSrg/izVKtQgcVOJFu6FES
	BU8ok0csGHZ/mOPvOEIUXdEODJB6iSDphBV5CeZB5lnUjpMMlCKJvmg+K6pbIIL55/rzBF
X-Received: by 2002:a17:903:1210:b0:2a7:87c2:fcde with SMTP id d9443c01a7336-2baee8320bbmr2253775ad.15.1778240806820;
        Fri, 08 May 2026 04:46:46 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36c10sm15031850b3a.25.2026.05.08.04.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:46:46 -0700 (PDT)
Date: Fri, 8 May 2026 11:46:39 +0000
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
Message-ID: <af3NH0cihPUQ8PST@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <7-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>

On Fri, May 01, 2026 at 11:29:16AM -0300, Jason Gunthorpe wrote:
> Add a new command make function and convert all the places using
> ATC_INV.
> 
> Split out full invalidation to directly make the cmd instead of
> overloading size=0 to mean full invalidation.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

Nit: I guess it's worth mentioning that we remove CMDQ_ATC_0_GLOBAL as
we don't set ent->atc.global = true anywhere in the driver anymore.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
