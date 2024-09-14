Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0190179DC;
	Sat, 14 Sep 2024 02:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726279578; cv=none; b=HTKGZHX1b38VhQSQnG2GDEEmShz/nd5NA8WtddiC7h95ZkaIVf1s2B2pl7L1O75BtNUS2pInBQVfwo8PX3nOgLDXURMYeha2fPUq6ZnuAGRVCfU/fK/S5rJAMMp/rYN78iTmwCRahANlFTPttZtB9WCzb1wl+5IVj//TccSfw5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726279578; c=relaxed/simple;
	bh=r1SPEaFbtgONlYp9N92wMuvszR631+QcjZT+HAM08G8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rA7P6qI2i/xQ2yCaacnD3csUwSNfIb9YZ4RGYiHkeZKux8RTgtFRpjfjENtH9mxWe3DoTyM4/FObOlOh+o+VPWOYJgbpnd0GfhMS6M3vcrNl5O7TvjHZnP7TMUlkhNRR9QOvToqAfa4mf3kkuMDa+bCqBjwLpJ2DOKuzmpNq4OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wx0lFibl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wx0lFibl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726279576; x=1757815576;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=r1SPEaFbtgONlYp9N92wMuvszR631+QcjZT+HAM08G8=;
  b=Wx0lFiblieA/9/9zel9rjGGqiBhBg5zYjJ/ObIHxufVPcAMw1Fk+5oEb
   zjOJOQL72vzWiy8zQsKghpnSbtgajYcGTpXhEBXRi9FkGj/Q7G3uHH/k6
   Mp6q9arZJUfEnohcT+UYK9SFpVyVg8lfV+784+4Kc3JSkMqmKfyfZf8l3
   1fSe3I8qlsUlHfu1PSil9tghCgNGIa+ZCDyWZFVxhf8+D3hJskkidrG+u
   8y2xVFJhTo7kBnkBtA1zftgd7EosIg7aXwbmWoHQ6B2E3lw32By4gB1MF
   HvIqeRGlSQns9/n+49kVgwbAc6m84o675WYdjX7T5Ea9Rc23HTk1zQ702
   A==;
X-CSE-ConnectionGUID: 7++i2EDnTCq797+HfENnXQ==
X-CSE-MsgGUID: 3+9wc8S+TgyxDSnps6brwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="47706728"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="47706728"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 19:06:15 -0700
X-CSE-ConnectionGUID: hrcCDiI6S7qL/42olX80Rg==
X-CSE-MsgGUID: gzoUIxuVSy6K+Ux6zmuDmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="67968803"
Received: from allen-box.sh.intel.com (HELO [10.239.159.127]) ([10.239.159.127])
  by fmviesa007.fm.intel.com with ESMTP; 13 Sep 2024 19:06:12 -0700
Message-ID: <42bbc500-578c-474b-98ec-1988906f31ef@linux.intel.com>
Date: Sat, 14 Sep 2024 10:02:05 +0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/tegra: Fix NULL vs IS_ERR() check in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <ba31cf3a-af3d-4ff1-87a8-f05aaf8c780b@stanley.mountain>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <ba31cf3a-af3d-4ff1-87a8-f05aaf8c780b@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/24 10:34 PM, Dan Carpenter wrote:
> The iommu_paging_domain_alloc() function doesn't  return NULL pointers,
> it returns error pointers.  Update the check to match.
> 
> Fixes: 45c690aea8ee ("drm/tegra: Use iommu_paging_domain_alloc()")
> Signed-off-by: Dan Carpenter<dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/tegra/drm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Thanks,
baolu
