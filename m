Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D96F3515C8;
	Wed, 14 Oct 2026 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992328; cv=none; b=A2toFw2432mBQJm26Stx4f5XwcKILk+AOYdv2WYaw/578q/j+nWjj7QKSI2/twlkqLyR+mr6x6dVbBKLG9z+GvcO2/gH1gHHfNwE7miSf3+vnuKNUOgEBAsEoI7vfaZbH2f31siO2NdWVQDjzpA4GepX+dPlNT+Cbdbi9Oqh6CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992328; c=relaxed/simple;
	bh=Oiqufe2I/A241rB3raCMpXyOoJ8QvyAZHk4EbPCq3aM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=II9m9jpkXS2E52W1nAFOoxKEcXV4A5hVelnCsMwH0NSuF58Wn+AB9EBkHFzzEDIROAHAX6OIdNQgmtrK79I38Fcq0y6T7scEv0+fppHreHcje7Y/eXx8qlPac7ps3YPpleZWoL6Rw/PLUzEpTI1sFCeEkALmth4M2Odo17xlwrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YFOtl9Zf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YFOtl9Zf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BEC91570;
	Wed, 14 Oct 2026 08:38:42 -0700 (PDT)
Received: from [10.33.8.90] (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 556913F7B4;
	Wed, 14 Oct 2026 08:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791992325; bh=Oiqufe2I/A241rB3raCMpXyOoJ8QvyAZHk4EbPCq3aM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YFOtl9Zf+7JSSJkrbK/vmteEdKGYxzDK5DfYraK93ZnOcF3HUPoIigdjVnTneEg4e
	 mbj2DCykTRzevF6/Shr5vNnqcrnRJ3cMP6ekus/DYC8T1Y04ei5VY44Io1+uigOu3X
	 d5kWopS0zjWEYx9SFJl8PkH9Bj6e0E9ohar36y6g=
Message-ID: <23e9b66f-083a-4a77-8214-25f30c08057a@arm.com>
Date: Wed, 14 Oct 2026 16:38:41 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] cache: add SMCCC-backed cache invalidate provider
To: Srirangan Madhavan <smadhavan@nvidia.com>, mark.rutland@arm.com,
 lpieralisi@kernel.org, sudeep.holla@kernel.org, conor@kernel.org,
 jic23@kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, aneesh.kumar@kernel.org,
 Souvik.Chakravarty@arm.com, treding@nvidia.com, jonathanh@nvidia.com,
 bence.csokas@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20261013070205.3566865-1-smadhavan@nvidia.com>
 <20261013070205.3566865-3-smadhavan@nvidia.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261013070205.3566865-3-smadhavan@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

thanks for adapting this to the SMCCC bus, that part looks good. Some 
minor things:

On 10/13/26 09:02, Srirangan Madhavan wrote:
> Add a cache maintenance provider for the cache clean+invalidate interface
> defined by Arm DEN0028 v1.7.
> 
> Register the interface attributes function as an SMCCC device and bind the
> provider through the SMCCC bus. The provider reads the firmware attributes
> during probe and serializes cache maintenance calls. It handles transient
> BUSY and RATE_LIMITED responses with bounded retries. It also registers
> with the generic cache coherency framework used by memregion callers.
> 
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
> ---
>   drivers/cache/Kconfig           |  11 +++
>   drivers/cache/Makefile          |   2 +
>   drivers/cache/arm_smccc_cache.c | 161 ++++++++++++++++++++++++++++++++
>   drivers/firmware/smccc/smccc.c  |   5 +
>   4 files changed, 179 insertions(+)
>   create mode 100644 drivers/cache/arm_smccc_cache.c
> 
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index 1518449d47b5..57fd1823dec5 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -42,6 +42,17 @@ menuconfig CACHEMAINT_FOR_HOTPLUG
>   
>   if CACHEMAINT_FOR_HOTPLUG
>   
> +config ARM_SMCCC_CACHE
> +	bool "Arm SMCCC cache maintenance provider"
> +	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
> +	help
> +	  Enable support for the Arm SMCCC cache clean+invalidate
> +	  interface as a provider for memory hotplug-like cache
> +	  maintenance operations.
> +	  The provider registers only when firmware advertises the
> +	  SMCCC calls and attributes, so systems without firmware support
> +	  continue without this registered provider.
> +
>   config HISI_SOC_HHA
>   	tristate "HiSilicon Hydra Home Agent (HHA) device driver"
>   	depends on (ARM64 && ACPI) || COMPILE_TEST
> diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
> index b3362b15d6c1..55736a032d6f 100644
> --- a/drivers/cache/Makefile
> +++ b/drivers/cache/Makefile
> @@ -4,4 +4,6 @@ obj-$(CONFIG_AX45MP_L2_CACHE)		+= ax45mp_cache.o
>   obj-$(CONFIG_SIFIVE_CCACHE)		+= sifive_ccache.o
>   obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+= starfive_starlink_cache.o
>   
> +# Providers below depend on CACHEMAINT_FOR_HOTPLUG.
> +obj-$(CONFIG_ARM_SMCCC_CACHE)		+= arm_smccc_cache.o
>   obj-$(CONFIG_HISI_SOC_HHA)		+= hisi_soc_hha.o
> diff --git a/drivers/cache/arm_smccc_cache.c b/drivers/cache/arm_smccc_cache.c
> new file mode 100644
> index 000000000000..aca71113eb1c
> --- /dev/null
> +++ b/drivers/cache/arm_smccc_cache.c
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 NVIDIA Corporation
> + *
> + * Arm SMCCC cache maintenance provider using the cache clean+invalidate
> + * interface defined by Arm DEN0028 v1.7.
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/arm-smccc-bus.h>
> +#include <linux/cache_coherency.h>
> +#include <linux/cleanup.h>
> +#include <linux/container_of.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/math.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/nmi.h>
> +#include <linux/time64.h>
> +#include <linux/types.h>
> +#include <linux/wordpart.h>
> +
> +#define SMCCC_CACHE_MAX_RETRIES		5
> +#define SMCCC_CACHE_DEFAULT_DELAY_US	1000UL
> +#define SMCCC_CACHE_MAX_DELAY_US	20000UL
> +
> +struct smccc_cache {
> +	/* Must be first member */
> +	struct cache_coherency_ops_inst cci;
> +	struct mutex lock; /* Serializes SMCCC cache maintenance calls. */
> +	u64 rate_limit;
> +	u32 latency_us;
> +};
> +
> +static int smccc_cache_status_to_errno(s32 status)
> +{
> +	switch (status) {
> +	case SMCCC_RET_SUCCESS:
> +		return 0;
> +	case SMCCC_RET_NOT_SUPPORTED:
> +		return -EOPNOTSUPP;
> +	case SMCCC_RET_INVALID_PARAMETER:
> +		return -EINVAL;
> +	case SMCCC_RET_RATE_LIMITED:
> +		return -EAGAIN;
> +	case SMCCC_RET_BUSY:
> +		return -EBUSY;
> +	default:
> +		return -EIO;
> +	}
> +}
> +
> +static unsigned long smccc_cache_delay_us(const struct smccc_cache *cache)
> +{
> +	unsigned long delay_us = 0;
> +
> +	if (cache->rate_limit)
> +		delay_us = DIV_ROUND_UP_ULL(USEC_PER_SEC, cache->rate_limit);
> +
> +	if (cache->latency_us)
> +		delay_us = max(delay_us, (unsigned long)cache->latency_us);

If I understand the spec correctly, then the provided latency value 
reports the time it takes to execute the call. So this might be used to 
decide if we can tolerate the blackout time, but I don't think we make 
this decision in the kernel, or have the interface to do so.
So I don't think we need to parse this value, or use it for calculating 
the back-off time, and you can just remove this part.

> +
> +	/*
> +	 * Firmware may advertise neither a rate limit nor a latency hint; use
> +	 * a small bounded backoff instead of retrying in a tight loop.
> +	 */
> +	if (!delay_us)
> +		delay_us = SMCCC_CACHE_DEFAULT_DELAY_US;
> +
> +	return min(delay_us, SMCCC_CACHE_MAX_DELAY_US);
> +}
> +
> +static int smccc_cache_wbinv(struct cache_coherency_ops_inst *cci,
> +			     struct cc_inval_params *invp)
> +{
> +	struct smccc_cache *cache = container_of(cci, struct smccc_cache, cci);
> +	unsigned long delay_us = smccc_cache_delay_us(cache);
> +	struct arm_smccc_res res = {};
> +	int ret;
> +
> +	if (!invp->size)
> +		return -EINVAL;
> +
> +	/*
> +	 * Serialize the full retry sequence. With the default bounds, a caller
> +	 * may hold the mutex across up to five 20ms backoff sleeps.
> +	 */
> +	guard(mutex)(&cache->lock);
> +
> +	for (unsigned int i = 0; i < SMCCC_CACHE_MAX_RETRIES; i++) {
> +		/* Long firmware operations can trigger watchdog checks. */
> +		touch_nmi_watchdog();
> +
> +		arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION,
> +				     invp->addr, invp->size, 0UL, &res);
> +
> +		ret = smccc_cache_status_to_errno((s32)res.a0);
> +		if (!ret)
> +			return 0;
> +
> +		if (ret != -EBUSY && ret != -EAGAIN)
> +			return ret;
> +
> +		fsleep(delay_us);
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct cache_coherency_ops smccc_cache_ops = {
> +	.wbinv = smccc_cache_wbinv,
> +};
> +
> +static int smccc_cache_probe(struct arm_smccc_device *sdev)
> +{
> +	struct arm_smccc_res res = {};
> +	struct smccc_cache *cache;
> +	int ret;
> +
> +	arm_smccc_1_1_invoke(sdev->func_id, &res);

I think you should provide the explicit function ID name here, and not 
rely on which function exactly is used to probe for the interface's 
existence.

> +	if ((s32)res.a0)
> +		return -ENODEV;
> +
> +	cache = cache_coherency_ops_instance_alloc(&smccc_cache_ops,
> +						   struct smccc_cache, cci);
> +	if (!cache)
> +		return -ENOMEM;
> +
> +	mutex_init(&cache->lock);
> +	cache->latency_us = lower_32_bits(res.a2);
> +	cache->rate_limit = res.a3;

According to the spec you would need lower_32_bits() for a3 as well - if 
we are going to use this value. But I don't think we need to, see above.

Cheers,
Andre

> +
> +	ret = cache_coherency_ops_instance_register(&cache->cci);
> +	if (ret) {
> +		mutex_destroy(&cache->lock);
> +		cache_coherency_ops_instance_put(&cache->cci);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct arm_smccc_device_id smccc_cache_id_table[] = {
> +	{ .func_id = ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(arm_smccc, smccc_cache_id_table);
> +
> +static struct arm_smccc_driver smccc_cache_driver = {
> +	.name = KBUILD_MODNAME,
> +	.probe = smccc_cache_probe,
> +	.id_table = smccc_cache_id_table,
> +};
> +module_arm_smccc_driver(smccc_cache_driver);
> +
> +MODULE_IMPORT_NS("CACHE_COHERENCY");
> +MODULE_AUTHOR("Srirangan Madhavan");
> +MODULE_DESCRIPTION("Arm SMCCC cache maintenance provider");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> index 5dc768ac4143..5a5d50d17410 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c
> @@ -100,6 +100,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
>   		.requires_smc   = true,
>   		.device_name    = "arm-rsi",
>   	},
> +	{
> +		.func_id        = ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES,
> +		.requires_smc   = false,
> +		.device_name    = "arm-smccc-cache",
> +	},
>   };
>   
>   static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)

