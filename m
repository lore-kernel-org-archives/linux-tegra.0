Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B1337D135
	for <linux-tegra@vger.kernel.org>; Fri,  8 May 2026 07:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778225392; cv=none; b=UGhsRPHYkjkLo2nlrprqkLcNsjzVw1qhN0aXydVZFF7gfqVrFevSeEScSFeZ6emrfWFmF6qB64DWfTeGLi0W/r0fXS9mxgtdt67yY20a9wo8JxWl8iPuvWqBjGVaVSgjkmmhMNqWGOohXaD+rOdTp652CxDRuSH1cYd7WWk4Tvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778225392; c=relaxed/simple;
	bh=QA9hR0bSYIQ5D64x8sjWe6pmUWzl9IwQcukTQJ+tl4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhhJO4tCMSCFRN+h0Ji4Hybw17o1s28hRFLpoZYvLWvFatc6gt1Y1p+HH1vWm0SZzdAN3I8069R+RwK7VsYuIPWGk8lgSduHWY+ie9AAozr2ddnFYFIn3aIOp1s+NMWRrNqrgQeIMUKrS46RHOrSLiTVbZEYh/rhLVYikpVPzkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SIL+Qctd; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SIL+Qctd"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so54135ad.0
        for <linux-tegra@vger.kernel.org>; Fri, 08 May 2026 00:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778225388; x=1778830188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gtzgOVlx3+XiZk8bPWEWW2C41hmZeWg0/ZKf/2wFHh8=;
        b=SIL+QctdCUe4ThHAKyC2VTVRxYqC+O/JUjABuZg0by0/tlfAPE4fr5woozEPS5x9A0
         VN3mIPlm6CUOV+++R5USnChLTnBHKE3VItqsZhe2hewwXQajnRhl4hBq4hxgNkUq5UzW
         P9XjjiZhW4lTzhIxhHwqwmhcalA6tuGIgCMVMvfWkMVM9s9vinTFzGiAwFA9c3hBktsz
         fKrxcJr2QMNwZhlsXsvKxdJ/YM1SR3/dbd4I/eY6Z1wBI6SiYQ3hgfXBxr8Q2uAewUB1
         ditHU67ZvdJsJz5Iu2ZlDG+9eeByTvs26J+fhDESmz1TsYo+8ZI2EBoSkVag/yTByI06
         0cAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778225388; x=1778830188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtzgOVlx3+XiZk8bPWEWW2C41hmZeWg0/ZKf/2wFHh8=;
        b=GSWV4pmhIEdzNEQwZQojhaCfeb+s5WcnPjy9v97Xn5HurAVX1mG87CPBJOinjZYyJr
         XDKoUfYu1sgtHODfiqqav40nV6XWtaugL9DjHdJoEql3tXP+uE3oiiXaUCamnnNTO/Sx
         I1VOTVb4vzWP5wkKxEpRY+l2hqNIm6LRIhz6M9xlTY9buLSc4aOx6mmETXUkehZeYrNS
         3zZeN2J2gMpOwO6sDdVO9DL24aiOzkQq5sN7s6qxoEgqLGnSwv7Ww5yyBU/rxJ5iz+HO
         OUEusGy5Kp3F6dRXPD7AamIisD8ZLag4fgGhx7/aepQE7oBTurpXmUPU9blGKNEHJhBw
         kgBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lEh0r9ZcMSJ2WWuGpXpokL2tBdmy9KWQzk7CzWoSdg4yYEXmP49qN51NQkpaG1g/ybuu98PDcQxy5nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVCKFTFrRm68mt8Pa+xWiAwnrzMJRa+NBK33y8bEJeGihSyIfL
	N8RP0R2/fZ6Qicj3PQ4uE9Pba0s/eYfKGj3A4YJ17La9IBqJChhAUbMzXb9rcxw3eA==
X-Gm-Gg: Acq92OFWYSzTx6c9DorATQpkIppaNAju6HMamZqrXMF/F7xl4CLnn2nCBxm9amO5THV
	uTQuinxE+sCfQD1kKtxxqASeArepIEbY+FMTFiA3yX1mkNfOrox7oHm7delSJO1nHOxVKlt/Jjz
	n6dbPDgepwXWeZpb2lMdR1lO2pV8GS+Je1lbkyXJRzhUCFeguu/z/0tBTvHLjCR4Z1AcTi5xWRj
	VqLuqUslKj4iivR5RjAfGmvvCQcdwZOSqyJTTP1LYVvktWoKcFOGwLDw52ioTz8Os9EToARdH06
	ediPalPYECcnpFBfwI3g8nqMK1Py5kc+kz+5IbgNpcVG4dH2f4vxLOF6s6hiWvypvI3U2Mfp1yL
	AvQ3kd8t9SfgLGQuaQ0d6K1XR9cA/5dojSrfnndp9uiA6y1MeFfvB9w/C+Lfn9903SldwTUqeI2
	emiy5Ak2aDPwiFiTC/M6rwjXnr93G0ISD1Uy1LIAC1F+4iwwwRgvWH535veb5h9bCtFSWx
X-Received: by 2002:a17:903:3c6d:b0:2b2:70ba:305c with SMTP id d9443c01a7336-2bae9a8bf41mr2914125ad.8.1778225386989;
        Fri, 08 May 2026 00:29:46 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e9fd64sm10355055ad.69.2026.05.08.00.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:29:46 -0700 (PDT)
Date: Fri, 8 May 2026 07:29:39 +0000
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
Subject: Re: [PATCH 1/9] iommu/arm-smmu-v3: Add struct arm_smmu_cmd to
 represent the HW format command
Message-ID: <af2Q47MaAECnRzvY@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <1-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>

On Fri, May 01, 2026 at 11:29:10AM -0300, Jason Gunthorpe wrote:
> Like STE/CD, add a wrapper struct around the u64 array to represent the
> already FIELD_PREP'd command data. Unlike the STE/CD this is a u64
> because the command submission path will have the swap to le64.
> 
> This makes the API clearer when a u64 is referring to a formatted
> command and makes the following changes easier to follow.
> 
> Move the command constants out of the struct and into an enum alongside
> the rest of the constants defining the HW format so the entire HW format
> is self contained and independent of struct arm_smmu_cmdq_ent.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
