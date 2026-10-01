Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8563E3E00A1;
	Thu,  1 Oct 2026 09:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847258; cv=none; b=QbI56u0zIAAEqrkE5tjqa2Rmswf5mQ2Axo0YcmwQha9eQIcSwv6TB+cHE5EfE7EmC1KUCz6c6Fqmw4HX3umsqxbgHEU3HBzGhiSNnwE93teK29ksVcuo7kIhAZAKSd9HkJQuRmgQM5nUbyYRIKA9yL9gWGm0Ti9+44bZtTx9n+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847258; c=relaxed/simple;
	bh=1zrhDKNmu636ji5kFIjsspTp01sRMrCi4IOadjuNaHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQ+LFMTB+OBVMlJOXoOaCQ/ZFhX0Sk1S8+0SD1QVVkF5CzMbQ9t3SaZwP/XPnDar2gC36I6RXKPfD+1bGuKo0QA6WJpXN95a2CyBIDbiqHakEihZtBAM6RK2cxPrk8yvX4Yi3VlFU9ZVjbnRqveauIYdttiVCNDpCrXSz5/Q5+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eKHxwRgs; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eKHxwRgs"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87E32497;
	Thu,  1 Oct 2026 02:34:12 -0700 (PDT)
Received: from [10.57.54.170] (unknown [10.57.54.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAA703F86F;
	Thu,  1 Oct 2026 02:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790847255; bh=1zrhDKNmu636ji5kFIjsspTp01sRMrCi4IOadjuNaHM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eKHxwRgsFLwuLhOef3kDJKGvaJxbwEY9GEebLqGc0Nmqyfzm1AfZ5WhNhm+smOwyh
	 +cE/EkmEfoc4IB1exw347qcu3IIOnHAUdOqOGt3sZZDxafbxRhvAztatI8nLFIjrEl
	 2EXbxy8FTS1+GoGL8dCflHfm2XEswdw3325mH/a4=
Message-ID: <0494fd68-2b73-4bbd-b013-7d1e79fdf01a@arm.com>
Date: Thu, 1 Oct 2026 11:34:12 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: smccc: add cache clean/invalidate IDs and
 return codes
To: Srirangan Madhavan <smadhavan@nvidia.com>, mark.rutland@arm.com,
 lpieralisi@kernel.org, sudeep.holla@kernel.org, conor@kernel.org,
 jic23@kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, treding@nvidia.com,
 jonathanh@nvidia.com, bence.csokas@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260910082142.1522865-1-smadhavan@nvidia.com>
 <20260910082142.1522865-2-smadhavan@nvidia.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260910082142.1522865-2-smadhavan@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/10/26 10:21, Srirangan Madhavan wrote:
> Define SMCCC Arch function IDs for CLEAN_INV_MEMREGION and its ATTRIBUTES
> call, and add RATE_LIMITED/BUSY return codes from DEN0028 for callers that
> need transient error handling.
> 
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
> Reviewed-by: Jonathan Cameron <jic23@kernel.org>
> ---
>   include/linux/arm-smccc.h       | 21 +++++++++++++++++++--
>   tools/include/linux/arm-smccc.h | 21 +++++++++++++++++++--
>   2 files changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index 4de81848fe2e..2e205320d88a 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.hARM_SMCCC_FAST_CALL
> @@ -116,6 +116,22 @@
>   			   ARM_SMCCC_SMC_32,				\
>   			   ARM_SMCCC_OWNER_CPU, 0x10)
>   
> +/*
> + * DEN0028 v1.7 defines these cache maintenance functions as SMC64
> + * because they carry 64-bit memory range arguments.
> + */
> +#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION				\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
> +			   ARM_SMCCC_SMC_64,				\
> +			   ARM_SMCCC_OWNER_ARCH,			\
> +			   0x5)
> +
> +#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES			\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
> +			   ARM_SMCCC_SMC_64,				\
> +			   ARM_SMCCC_OWNER_ARCH,			\
> +			   0x6)
> +
>   #define ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID				\
>   	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
>   			   ARM_SMCCC_SMC_32,				\
> @@ -305,13 +321,14 @@
>   			   0x53)
>   
>   /*
> - * Return codes defined in ARM DEN 0070A
> - * ARM DEN 0070A is now merged/consolidated into ARM DEN 0028 C
> + * Return codes defined by Arm SMCCC (DEN0028 v1.7).
>    */
>   #define SMCCC_RET_SUCCESS			0
>   #define SMCCC_RET_NOT_SUPPORTED			-1
>   #define SMCCC_RET_NOT_REQUIRED			-2
>   #define SMCCC_RET_INVALID_PARAMETER		-3
> +#define SMCCC_RET_RATE_LIMITED			-4
> +#define SMCCC_RET_BUSY				-5
>   
>   #ifndef __ASSEMBLY__
>   
> diff --git a/tools/include/linux/arm-smccc.h b/tools/include/linux/arm-smccc.h
> index 63ce9bebccd3..ae5637b3240f 100644
> --- a/tools/include/linux/arm-smccc.h
> +++ b/tools/include/linux/arm-smccc.h

Why is that? Is there any tool using that? I don't think we 
unconditionally sync the two files?

The numbers in the file above match the spec, so for that part:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre


> @@ -96,6 +96,22 @@
>   			   ARM_SMCCC_SMC_32,				\
>   			   0, 0x3fff)
>   
> +/*
> + * DEN0028 v1.7 defines these cache maintenance functions as SMC64
> + * because they carry 64-bit memory range arguments.
> + */
> +#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION				\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
> +			   ARM_SMCCC_SMC_64,				\
> +			   ARM_SMCCC_OWNER_ARCH,			\
> +			   0x5)
> +
> +#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES			\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
> +			   ARM_SMCCC_SMC_64,				\
> +			   ARM_SMCCC_OWNER_ARCH,			\
> +			   0x6)
> +
>   #define ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID				\
>   	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
>   			   ARM_SMCCC_SMC_32,				\
> @@ -182,12 +198,13 @@
>   			   0x53)
>   
>   /*
> - * Return codes defined in ARM DEN 0070A
> - * ARM DEN 0070A is now merged/consolidated into ARM DEN 0028 C
> + * Return codes defined by Arm SMCCC (DEN0028 v1.7).
>    */
>   #define SMCCC_RET_SUCCESS			0
>   #define SMCCC_RET_NOT_SUPPORTED			-1
>   #define SMCCC_RET_NOT_REQUIRED			-2
>   #define SMCCC_RET_INVALID_PARAMETER		-3
> +#define SMCCC_RET_RATE_LIMITED			-4
> +#define SMCCC_RET_BUSY				-5
>   
>   #endif /*__LINUX_ARM_SMCCC_H*/

