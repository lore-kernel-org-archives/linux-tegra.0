Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9FB37AA72
	for <linux-tegra@vger.kernel.org>; Fri,  8 May 2026 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247696; cv=none; b=paeMdDvadAUGqpjRH7ckI0qWpgiygIDe/9PdRvXAX1AJfva1sv60WT+A4bnC1zEsCnaWXD59gPBnuvDmohgAG+qf/L89AI5Bt35tCojTn5iGFl7ZHY+UfxK4Yhon2GItZHTOrRrxfmhXROoeiUdU9v/RQee0nQiW/uwar1jLTzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247696; c=relaxed/simple;
	bh=znsTVaBtPyzPupvWVrvhRnQZJGVi5v1mDow9DWL5Osc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5E4k99YfGHmtnvYCekWh4jyMdoSbE1y48RNH8Z4+WZ6+1gamI4Qb2ThkEmva9/uiaHyCk8RzAr2OG+CCr1MkG4Y23Dkyv7plPF+Y1zqoCzWlxId57ECrQbsc/RUHqq2TXosbN+TtRu2H8Wvooq4VEJ6ywftjzA8IFYuJ13KcZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UESGYEu/; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UESGYEu/"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba180a022dso85725ad.1
        for <linux-tegra@vger.kernel.org>; Fri, 08 May 2026 06:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778247695; x=1778852495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kn3HnEGpfsinsQczYQb+6skEifl1bNdoE4T6rMB6rKk=;
        b=UESGYEu/z3eKGl7meDQv0Qglp7QeeEXxTXX0Ho3CkyaKPIiItRQlbjc5xCzMwWSc2S
         Mk5bY9tUwgpZqyI9y1I1fgDA5Lm/oOu2C0+1FMEN94aOJsUTHIgsdO1IkOX6yEaPPQU0
         DTyW/INKWgug3vDiZUEMPDTE2XxxnRk34355AUwuvmkWtieKjr0sjaPpqGTOLYxMtCVC
         sKeYFXe3WT3ySB5DVgPxLc1PTfk1u3gMd5NO3x91qUn37Psct9x+9HtNI5Bfr1J9bZyc
         psXVI+U8setYxg2tW1mSwpHjoK6+NxklyDx/Z67CIgx1togmyuhV+vPAP1xrx4o0S1Qt
         H2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778247695; x=1778852495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kn3HnEGpfsinsQczYQb+6skEifl1bNdoE4T6rMB6rKk=;
        b=pdUyM1ODNspF4XphX+tFI2OUNjDyALeQ0pWa5nySHL4fs6XSbFy3HQmKTdEHAGOKo5
         n1H/u70sDp5oTVApPyfVv5lWycxSdpF+L/Fv07J/LAvooJUSQMdbwMIloQZiYz+GhVhJ
         r4+QnjThC/OhC0G0cYlq/TgWZt0Y5usgVQ3lXH9EcMuAH5aYUy5IaP81iu7NI83r4mgt
         iAssDbZLkM9UhNDDxYOJnBYCvLOEaAv0d6EKrEkq3669rVCVKsQR/4D0niCus2iAMP8m
         d+ORw5U57IygdCa8t/3dxbEfa8wKpyA8WUOvF5qQQ0ghMHQnJhDtEqPNhNTr3+HOpcv8
         35Tg==
X-Forwarded-Encrypted: i=1; AFNElJ87CpoCLoQi9EFeob50a9F2Tmtwt1oXcBmDvwtRPLb3hXjJkdWdaFPocN98R5/FP1DovoYsJlh0PIokcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0EreJQyDI4cQWD6MwmFSrYUrCYDR6q7hHMwRznkpLAliqHi7I
	4c3ROScre1xJN2rj0Hr2IERJEj8pWqlkdoGHTkAv9/wHxjhVkayq4Hx79C5y55+0Zg==
X-Gm-Gg: Acq92OHdV1XIVgB2+jhxx3ZI6n0x5arrXkbqYox+7V/7FK3imyYzJdMLm2CaymMeEYp
	z5AO+fLBzaS8c7LZvPp/Gt0vvMbSSR5381F0H4/I85agCYjERxtw3NYTjVVm6VBlQCyMs0aI4m4
	7C5PKtkyTCC6NIr6kk+ps/hAwVnDE602QxvJCchpseORnQJsnFQkC1urrwhXjay4zLYNkQ/WQ5z
	6duXROdPlyJNGnXpgmFh3R5/6DkdPgX4HjDJmY64VdrU4reUsrNObvmZAtwC4S9lxSUuSy20MK9
	9O8g+xswnrYi1W5kT9VFlUnLNL79sKdaKUpJkcPlPxPu/TMVRTusQMAsVQfUSux2dWukT/s3YdE
	ekoJoUO6oJagb3hZqlNGdcvCrWLlgDjLlUaGz/7jQKq767c2YWoVtCY0ItVIE08DdeKRhUiHpYb
	8lgsNzlJPm2lov9YOB0Kmg98AGR2inINcZZDZNZRxqxA39q527BheVB8BykW2MRCN7ynNh
X-Received: by 2002:a17:903:198b:b0:2b4:6529:7bae with SMTP id d9443c01a7336-2baee842030mr2436805ad.17.1778247694198;
        Fri, 08 May 2026 06:41:34 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3664da1f5d6sm2479705a91.3.2026.05.08.06.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:41:33 -0700 (PDT)
Date: Fri, 8 May 2026 13:41:27 +0000
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
Subject: Re: [PATCH 8/9] iommu/arm-smmu-v3: Directly encode CMDQ_OP_SYNC
Message-ID: <af3oB0efZjr7HZi9@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <8-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>

On Fri, May 01, 2026 at 11:29:17AM -0300, Jason Gunthorpe wrote:
> Change the flow so the caller controls the CS field and remove the
> weird u64p_replace_bits() thing to override it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
