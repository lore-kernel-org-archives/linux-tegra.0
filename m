Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099A61E521C;
	Thu, 27 Feb 2025 05:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740633668; cv=none; b=ipuxSHEs+jZtE5g1hXxDZ2R5xcmxabggJwgAl1EYG6R1BDe6hATTwBe8JllGK4PqJxRXNjjjwPUXdqh5a5ES7Fjzs0ybV0mP6up4wAf9ae6+vwp+5jum1whHkwALaTlDy5rTMR1t98fGMAvNxi+gd2o7fnkEGKHWGMjyYUIG3XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740633668; c=relaxed/simple;
	bh=PQtjihnmxnJNt9cGH7dsXgv0bEF3d3LqLBB92T9bDY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWhxiLB+6/+X6Zp5nnF8ltTIThpohzXFfwjac0TCNsa4oeIBFMsBuSag4REcPOF8sHU8rOXOQ8GP6Pa6dscXCmwPJdml9pbr+fcPSg6Qd8f301BNGOhMV1pLfwcYEfRQEaekdReUQjizRVHEntMZjTxpkU9rryN+sybbGPkWUzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOi1NzNU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOi1NzNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740633667; x=1772169667;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PQtjihnmxnJNt9cGH7dsXgv0bEF3d3LqLBB92T9bDY8=;
  b=nOi1NzNUdbggdBHHiDeFss3Lm5WGznG6mP6tIvkGIjbbgxfggzjw7tJR
   gWjV5hldv8TfHgKnJUoAXiHttToREhu29K0DJaHnWZ+4L5J/iqg7hbm8U
   t/evBD0Uz4oB2VADeS38+W/X4nhrEdbwT1O1mfKp1/5ynxKtuWOd5eK98
   1HTkqywDwCCo0bidGIDnUIs54iJmVwbq32RN8GQygYkQbJ5FYw+2zGkNP
   M3E5i3lr1bWVqN2jMhk2WwX+o4vRxr+KeXy/Ic0tUOW8Gq08lf1ao2+xp
   d6lsrXgmE2rtEbqj9RXoCtSRfV1cKbd/q+k/607D/HfTJdlylQFMC+cvC
   w==;
X-CSE-ConnectionGUID: mbbMvASoQdyU3/KIAxp5Mg==
X-CSE-MsgGUID: cpz+Zl3aQGe5U4zeLIEMsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41638784"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41638784"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 21:21:06 -0800
X-CSE-ConnectionGUID: IDSQ03WOT0Sf2y1g0JuloQ==
X-CSE-MsgGUID: X4xnN020QO2lRkAamUgJOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117561589"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 21:20:59 -0800
Message-ID: <397fbef1-3aef-4421-bd68-107e289a95aa@linux.intel.com>
Date: Thu, 27 Feb 2025 13:17:42 +0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/23] iommu/pages: Move from struct page to struct
 ioptdesc and folio
To: Jason Gunthorpe <jgg@nvidia.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Hector Martin <marcan@marcan.st>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Robin Murphy
 <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 David Rientjes <rientjes@google.com>, Matthew Wilcox <willy@infradead.org>
References: <14-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <14-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/26/25 03:39, Jason Gunthorpe wrote:
> This brings the iommu page table allocator into the modern world of having
> its own private page descriptor and not re-using fields from struct page
> for its own purpose. It follows the basic pattern of struct ptdesc which
> did this transformation for the CPU page table allocator.
> 
> Currently iommu-pages is pretty basic so this isn't a huge benefit,
> however I see a coming need for features that CPU allocator has, like sub
> PAGE_SIZE allocations, and RCU freeing. This provides the base
> infrastructure to implement those cleanly.
> 
> Remove numa_node_id() calls from the inlines and instead use NUMA_NO_NODE
> which will get switched to numa_mem_id(), which seems to be the right ID
> to use for memory allocations.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
