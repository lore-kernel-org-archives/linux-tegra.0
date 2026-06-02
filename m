Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFEF3C3C13;
	Tue,  2 Jun 2026 15:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412608; cv=none; b=ZqySLdw1gbMG2tJDA/ZEKQy1hZKxvGR2KqJ6MzW1hMNx9w38VFHPNkoyln17A9Rg4qXej5jGY7NN1jclHGillIDoAzcR9ncx1PaCsy02MpRUZBKfacqG9zJlqSDzwG2Gqquse4aE6QA9iil5Y/peCdGqdeEiAKkqe75j07exDZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412608; c=relaxed/simple;
	bh=TFRr98T5FzYuy4//P1NMvfoliqTYeZcc1mMNejE4fiE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R/aamSckRNflWWRQBN/55FJmMX3+bmyGzAoAw3jAsLz0K1E74+kuqHlaErcEwN4ZF/SBobraPH0h4PPzHTI6bIwv95XZpDWEI7UeIaACCvs5nE+FOjc+dClQs9bzPwZDrpb6Ww3u+eK+UqcubRZSas75iqw9MaIi6BudyLHFiw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cuh2Rkiw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cuh2Rkiw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38971F00898;
	Tue,  2 Jun 2026 15:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780412607;
	bh=aMpAcga+foIz3QMdBsc9P1xmOu2fxowO+7SvwbNCNdc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=cuh2RkiwPeafQsORbLoilNpHYW+7QJHnbMA6ZpQoOwF3rU47mstNaXjnO/Un+z4dt
	 g94MYXzYXN8RgYuezYIA8/jXnxVg0AdTn8gv+7o1pXAmjmsD4DBkY+K68JAOpRgKEH
	 4kimzvAgAthol12eLd+TXlozwlEjl/wV/NYnAatqN40/5dzrxh71ldwefl9s5i52rO
	 kYgY1GyGQArTxqQCQ+wLw0SNxFVr2BDnKRkNDxF42Vt6k5bl0Pvn77t6Q8UCZnSRLi
	 x7f0/d5GfLx4331WYMDlKHHhK9H4gEsBjI2/Ek1oZ79FLbWJnCNqcHDFmcl5RSmWWt
	 wxeA1s2nqNHQQ==
Date: Tue, 2 Jun 2026 16:03:20 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Srirangan Madhavan <smadhavan@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, Conor
 Dooley <conor@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Dan Williams <djbw@kernel.org>, Thierry Reding
 <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 2/2] cache: add SMCCC-backed cache invalidate
 provider
Message-ID: <20260602160320.34f9e3a1@jic23-huawei>
In-Reply-To: <20260602082145.404939-3-smadhavan@nvidia.com>
References: <20260602082145.404939-1-smadhavan@nvidia.com>
	<20260602082145.404939-3-smadhavan@nvidia.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  2 Jun 2026 08:21:45 +0000
Srirangan Madhavan <smadhavan@nvidia.com> wrote:

> Add a cache maintenance provider for the Arm SMCCC cache clean+invalidate
> interface.
> 
> The provider discovers SMCCC support and attributes at init time,
> serializes firmware calls, handles transient BUSY and RATE_LIMITED
> responses with bounded retries, and registers with the generic cache
> coherency framework used by memregion callers.
> 
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
3 things inline.

With the loop style updated to either drop that optimization of
eliding of the last sleep or use a while (1) loop and the kconfig
modified to not imply there are _no_ registered providers.

Reviewed-by: Jonathan Cameron <jic23@kernel.org>

The comment in Makefile isn't really about this patch, just something
I noticed whilst wondering why it wasn't ordered.

> ---
>  drivers/cache/Kconfig           |  11 +++
>  drivers/cache/Makefile          |   1 +
>  drivers/cache/arm_smccc_cache.c | 160 ++++++++++++++++++++++++++++++++
>  3 files changed, 172 insertions(+)
>  create mode 100644 drivers/cache/arm_smccc_cache.c
> 
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index 1518449d47b5..5d7ef3d15979 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -42,6 +42,17 @@ menuconfig CACHEMAINT_FOR_HOTPLUG
>  
>  if CACHEMAINT_FOR_HOTPLUG
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
> +	  continue without a registered provider.

"without this registered provider". or "without registering a provider."

We need to be careful that we don't give the impressions this is the only
option for Arm64 systems that do SMCCC and need a cache maintenance
provider. The HiSilcon systems that use HISI_SOC_HHA meet all those
conditions - except that they don't use this service.

> +
>  config HISI_SOC_HHA
>  	tristate "HiSilicon Hydra Home Agent (HHA) device driver"
>  	depends on (ARM64 && ACPI) || COMPILE_TEST
> diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
> index b3362b15d6c1..6d91085aafe4 100644
> --- a/drivers/cache/Makefile
> +++ b/drivers/cache/Makefile
> @@ -4,4 +4,5 @@ obj-$(CONFIG_AX45MP_L2_CACHE)		+= ax45mp_cache.o
>  obj-$(CONFIG_SIFIVE_CCACHE)		+= sifive_ccache.o
>  obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+= starfive_starlink_cache.o
>  
Maybe we should add a comment here
# Depend on CACHEMAINT_FOR_HOTPLUG

or something like that to avoid them being 'sorted' into the group above
at somepoint in future.

> +obj-$(CONFIG_ARM_SMCCC_CACHE)		+= arm_smccc_cache.o
>  obj-$(CONFIG_HISI_SOC_HHA)		+= hisi_soc_hha.o
> diff --git a/drivers/cache/arm_smccc_cache.c b/drivers/cache/arm_smccc_cache.c
> new file mode 100644
> index 000000000000..ff6bca91a1a1
> --- /dev/null
> +++ b/drivers/cache/arm_smccc_cache.c
> @@ -0,0 +1,160 @@

> + static int smccc_cache_wbinv(struct cache_coherency_ops_inst *cci,
> +			     struct cc_inval_params *invp)
> +{
> +	struct smccc_cache *cache = container_of(cci, struct smccc_cache, cci);
> +	struct arm_smccc_res res = {};
> +	unsigned long delay_us = smccc_cache_delay_us(cache);
> +	int ret;
> +
> +	if (!invp->size)
> +		return -EINVAL;
> +
> +	/*
> +	 * Serialize the full retry sequence. With the default bounds, a caller
> +	 * may hold the mutex across up to four 20ms backoff sleeps.
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
> +		if (i + 1 == SMCCC_CACHE_MAX_RETRIES)
> +			break;

The for loop bound makes little sense if you are going to do
this.  Use a while loop.  Or don't worry about optimising out the final
sleep as we never expect to hit this.

> +
> +		fsleep(delay_us);
> +	}
> +
> +	return -EBUSY;
> +}

