Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A5B2E92DA;
	Thu, 25 Sep 2025 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758792237; cv=none; b=LNnklrsov30cJZnX/dhgX6zEM1A9mHwPOacrDImoAdZlTRzWkr/HUeLhkUWMT4amFR9d87TlSXjwK3g0jBj2Ls5BRnX0xdksOmgVPKOxTzX+6iFXwKnzBT7oPAziaxHNeeSVNWVNVvFmTOJP6SuFJLrmuOSzSoN0zCVqPsBSKq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758792237; c=relaxed/simple;
	bh=ojvKtjS8jdo9LfVAKxjkCMiyqCA04Up825qlfjnpW1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kLPb1/i8MI5bKLL1GRR/hPMA4hILIQQsIwt+UXV8MAHmwdAY3XwXDSzu8u9qT2uFg7qIVtOyLktbyREukB5i2R4W4JUTzrIJaUI0G3itAvpjYznzN20rao7jM6AfyLUH+aAmZOIju+dzcgK3yKOYeFGPqGkmag/ruVTYrepisWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC0D41692;
	Thu, 25 Sep 2025 02:23:46 -0700 (PDT)
Received: from [10.57.1.72] (unknown [10.57.1.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BD9A3F5A1;
	Thu, 25 Sep 2025 02:23:53 -0700 (PDT)
Message-ID: <149b84c8-cdd6-4302-b3be-9cf6e69c3319@arm.com>
Date: Thu, 25 Sep 2025 10:23:51 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] perf/arm_cspmu: Add callback to reset filter
 config
Content-Language: en-GB
To: Besar Wicaksono <bwicaksono@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, ilkka@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, mark.rutland@arm.com, treding@nvidia.com,
 jonathanh@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com,
 sdonthineni@nvidia.com
References: <20250923001840.1586078-1-bwicaksono@nvidia.com>
 <20250923001840.1586078-3-bwicaksono@nvidia.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250923001840.1586078-3-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/09/2025 01:18, Besar Wicaksono wrote:
> Implementer may need to reset a filter config when
> stopping a counter, thus adding a callback for this.
> 
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
