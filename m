Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A7A18035
	for <linux-tegra@vger.kernel.org>; Fri, 15 Mar 2024 21:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710538088; cv=none; b=oFBdKQ0RdKzxAvVoNAepRK8TKQfhRB2QmBYkhgYGMSdYr8lraHno11Wcu6/6rR4cqUalzRQZvJz2vS+nEHNYAjDSExF/yUbAuwiMKpZU8GwqTzonIZXxfkhXHB4P1DjGjhKUDkGXXqwU2v0G2LBkksW/g7ef0v4kpoE1e3h78tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710538088; c=relaxed/simple;
	bh=Q+XOPMRCM5h9lRk7auaVgXY8II5pi0ZuPsC/JllFwmk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=l+ytvuiPZvIh7vY8kv39Mvo/yv8Zhr1M9RE1y3xq6rZO8Czgsm4HyKZ8KfrkmibtgbNyzUh+h26sJKI0VVZBIrd7IF4jTWny3zhcZFAat5yKpRVj4Z0INZxseos5GjRGfcHXD+Dt9GhekQXswBYEqXKICYsdD0BJP8huHLxqVtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pRd1ydMx; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pRd1ydMx"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dddd7d64cdso13855ad.1
        for <linux-tegra@vger.kernel.org>; Fri, 15 Mar 2024 14:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710538085; x=1711142885; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f8xWPRJ3tZZgN10pKFEIYzu9dCAJ11FurTmpvR2gSvg=;
        b=pRd1ydMxgsuj+Hrr8NQoK6QopU7eMl3NTwg8DwMiJyev3uGRHZ20MRFilGiloEhYNy
         BZurOMG+VRtsZDm8HLAth2Cbo3aNMGyzu3RO0Qm8XaB2gDv98gFyIOQn6dFLMovlXllF
         dO8RwntiOeEZ8o8HdXNpDYpMrk/6rfaNSdlvTF25ZulGTUsl0lgZUF17Z3biCTOY7tKx
         p/CVtX96eFOQfP8yTcI0sMHN5RTfleb2a5arLivrU9eiNclfX1uumLXqOHxpBmW3O/Ey
         SJ//MC3ToLsP/CZgzPDNImwJXVqm3z9+Qge+CzsdtE0C4w/A3HARJwH8hg8Ovf8QjVA9
         83Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710538085; x=1711142885;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8xWPRJ3tZZgN10pKFEIYzu9dCAJ11FurTmpvR2gSvg=;
        b=qnMrhKwO5CfPCU/tu3stHG9lf3gS2nrex/tT+tNLRAoFkTJxC+ycKoOPTGKAK/NCii
         EgHWz/pBxhfJXP664N0+0iEjsxt+QGA5vVwAg+6PjsZ3VC1/U7VYa0ji41AjXBeU7vwE
         DQZnrzrSjTtwshvQqf2U+HIh+6KKEL8vAkGKShLUzNP/oOZEpA312ppUKH71YTWLStXt
         4NqRdi1jUajwDk9FXIroTh7wOLHA8EOiniTQc/VswCobL/cGEjG01nTIWEiUcPbluSkS
         wRT+/I433KRU8NUKevIzQe4OB4sqxirq5Wgkc/U+Y/WkIsLF2RZRQiMIYm5zkyxQZM6x
         RMJw==
X-Forwarded-Encrypted: i=1; AJvYcCXJKCcE9x6VjnrGdcvqNCgYGdf+QBk9zj74gcVmkNxsTyreMlDgsSGSIfvOmcnV816db7lV6lFqxpivF+/gxOXYNiR35Dj/HbMu5cU=
X-Gm-Message-State: AOJu0YxIlh227qZUuW7EsrwzpUPVMi4d52N9+Y1pCsAhDNFS6sIaHX7y
	kejhntSFAl1wF6y0w73g/xjq1mil96L2M/fQyA2CTAtP3yK1fD1NGke9/WHzWg==
X-Google-Smtp-Source: AGHT+IFx0V9evEEHTCAL0rngEMSTSxrVQJwAPcZMZ/kTvEYdGlomkmF5ttVwWUPGQnGpzwrxLolHsQ==
X-Received: by 2002:a17:902:ea0b:b0:1dd:96e5:feae with SMTP id s11-20020a170902ea0b00b001dd96e5feaemr291145plg.16.1710538084580;
        Fri, 15 Mar 2024 14:28:04 -0700 (PDT)
Received: from [2620:0:1008:15:59e5:b9a4:a826:c419] ([2620:0:1008:15:59e5:b9a4:a826:c419])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001dddb6c0971sm4396163ple.17.2024.03.15.14.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 14:28:03 -0700 (PDT)
Date: Fri, 15 Mar 2024 14:28:02 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
    asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
    cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
    dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
    iommu@lists.linux.dev, jernej.skrabec@gmail.com, jonathanh@nvidia.com, 
    joro@8bytes.org, krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
    linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
    linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
    mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
    rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
    suravee.suthikulpanit@amd.com, sven@svenpeter.dev, 
    thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com, 
    vdumpa@nvidia.com, wens@csie.org, will@kernel.org, yu-cheng.yu@intel.com, 
    bagasdotme@gmail.com, mkoutny@suse.com
Subject: Re: [PATCH v5 02/11] iommu/dma: use iommu_put_pages_list() to releae
 freelist
In-Reply-To: <20240222173942.1481394-3-pasha.tatashin@soleen.com>
Message-ID: <34b593bb-796b-7657-8971-17d24dea4e99@google.com>
References: <20240222173942.1481394-1-pasha.tatashin@soleen.com> <20240222173942.1481394-3-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Feb 2024, Pasha Tatashin wrote:

> Free the IOMMU page tables via iommu_put_pages_list(). The page tables
> were allocated via iommu_alloc_* functions in architecture specific
> places, but are released in dma-iommu if the freelist is gathered during
> map/unmap operations into iommu_iotlb_gather data structure.
> 
> Currently, only iommu/intel that does that.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: David Rientjes <rientjes@google.com>
