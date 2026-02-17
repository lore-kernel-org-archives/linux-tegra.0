Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C14275AF0;
	Tue, 17 Feb 2026 08:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771317119; cv=none; b=dyaegPCLEwJZbqlNPHAcUb321Z06+MI2dGeUw8wxkTlc21QuQz6UIM9aeFYrDL3pAARo+LCIkZn+946QBnOv7g/gRr5ntIvnuMzhkm5NBW4WW7C574A2fSoJMRvoiPLwNGyPnx5OcNj3wzmhyhxcW85bTwDtjSxkE4FWAtkckN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771317119; c=relaxed/simple;
	bh=0Z5mg5JN+dMdFk1n4xlWVeR2j3Qg6QpiMWDZOQSCnhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qm0syvR8SqWIZmO5gULVXazJZsUaeC7ymRo4GRetM6bWzybPh4sr9p2VHjWI6uVRsg+8G86BzP6AMxgxQte8dizqIaLq1cjYN48j1UXKFZUdkTLcHmiLvctqqHt4rddbt2MweZnUn9C+6EIHRPIswRCDqmz55n5BSpXLokfTU+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMPkmETH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMPkmETH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A39C4CEF7;
	Tue, 17 Feb 2026 08:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771317119;
	bh=0Z5mg5JN+dMdFk1n4xlWVeR2j3Qg6QpiMWDZOQSCnhI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rMPkmETHKckuSpDs2uw5x7ZVWEFK4ADFgBP6iVRFVmB6MzQmCbrPW0EP6S4MUoqI2
	 CdRil2r71sCx0yNzqFWhZE4TTjuhbKWDQzW8XuSXmksERSZ5NwAc7ebh5lzyoSdCjl
	 cFRWzWen4xlD+jepibbxwWzMoF8Tn3m4EGFj9DOpWySxb5CFUugIqpnba30174Cnbf
	 tp6DT4Db5JT4Msdw5klnMTpC+booPE9BYl5c4F8o8iNN96pFR76YmH9PM7vf2Oyvny
	 6y7Pkcm8+Fc2VqSEINqAEovbfl8ySEBDoiJ0fD0+upkjgyGBnYFgidvcSEphwF3ruk
	 HIJqylfMkUYFA==
Message-ID: <af414583-56e2-4754-8200-62215f514c8d@kernel.org>
Date: Tue, 17 Feb 2026 09:31:55 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] memory: tegra: Add MC error logging support for
 Tegra264
To: Ketan Patil <ketanp@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260130173055.151255-1-ketanp@nvidia.com>
 <20260130173055.151255-5-ketanp@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260130173055.151255-5-ketanp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/01/2026 18:30, Ketan Patil wrote:
> In Tegra264, different components from memory subsystems like Memory
> Controller Fabric (MCF), HUB, HUB Common (HUBC), Side Band Shim (SBS)
> and channels have different interrupt lines for receiving memory
> controller error interrupts.
> 
> Add support for logging memory controller errors on Tegra264.
> - Add MC error handling flow for MCF, HUB, HUBC, SBS and channels.
> - Each of these components have different interrupt lines for MC error.
> - Register interrupt handlers for interrupts from these different MC
> components.
> - There is no global interrupt status register in Tegra264 unlike older
> Tegra chips.
> - There are common interrupt status registers in case of MCF, HUB, HUBC
> from which figure out the slice number or hub number responsible for
> generating interrupt and then read interrupt status register to find out
> type of violation.
> - Introduce new SoC specific fields in tegra_mc_soc like interrupt mask
> values for MCF, HUB, HUBC etc., which are SoC specific.
> 
> Signed-off-by: Ketan Patil <ketanp@nvidia.com>
> ---
>  drivers/memory/tegra/mc.c       |  35 +--
>  drivers/memory/tegra/mc.h       |  83 ++++++-
>  drivers/memory/tegra/tegra114.c |  13 +-
>  drivers/memory/tegra/tegra124.c |  32 ++-
>  drivers/memory/tegra/tegra186.c |  24 +-
>  drivers/memory/tegra/tegra194.c |  17 +-
>  drivers/memory/tegra/tegra20.c  |  23 +-
>  drivers/memory/tegra/tegra210.c |  16 +-
>  drivers/memory/tegra/tegra234.c |  17 +-
>  drivers/memory/tegra/tegra264.c | 428 +++++++++++++++++++++++++++++++-
>  drivers/memory/tegra/tegra30.c  |  13 +-
>  include/soc/tegra/mc.h          |  10 +-
>  12 files changed, 648 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index 49c470f7b1f7..a102a8ea7926 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -597,16 +597,16 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
>  		}
>  
>  		/* mask all interrupts to avoid flooding */
> -		status = mc_ch_readl(mc, channel, MC_INTSTATUS) & mc->soc->intmask;
> +		status = mc_ch_readl(mc, channel, MC_INTSTATUS) & mc->soc->intmasks[0].mask;
>  	} else {
> -		status = mc_readl(mc, MC_INTSTATUS) & mc->soc->intmask;
> +		status = mc_readl(mc, MC_INTSTATUS) & mc->soc->intmasks[0].mask;
>  	}
>  
>  	if (!status)
>  		return IRQ_NONE;
>  
>  	for_each_set_bit(bit, &status, 32) {
> -		const char *error = tegra_mc_status_names[bit] ?: "unknown";
> +		const char *error = tegra20_mc_status_names[bit] ?: "unknown";
>  		const char *client = "unknown", *desc;
>  		const char *direction, *secure;
>  		u32 status_reg, addr_reg;
> @@ -669,9 +669,11 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
>  					addr = mc_ch_readl(mc, channel, addr_hi_reg);
>  				else
>  					addr = mc_readl(mc, addr_hi_reg);
> -			} else {
> +			} else if (mc->soc->mc_addr_hi_mask) {
>  				addr = ((value >> MC_ERR_STATUS_ADR_HI_SHIFT) &
> -					MC_ERR_STATUS_ADR_HI_MASK);
> +					mc->soc->mc_addr_hi_mask);
> +			} else {
> +				WARN_ON(1);

You should handle it correctly instead. WARN reboots some systems and
this does not look like really impossible path, which would justify it.

>  			}
>  			addr <<= 32;
>  		}
> @@ -696,11 +698,11 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
>  			}
>  		}
>  

...

> +
> +#define ERR_GENERALIZED_APERTURE_ID_SHIFT		0
> +#define ERR_GENERALIZED_APERTURE_ID_MASK		0x1F
> +#define ERR_GENERALIZED_CARVEOUT_APERTURE_ID_SHIFT	5
> +#define ERR_GENERALIZED_CARVEOUT_APERTURE_ID_MASK	0x1F
> +
>  static inline u32 tegra_mc_scale_percents(u64 val, unsigned int percents)
>  {
>  	val = val * percents;
> @@ -187,15 +255,18 @@ extern const struct tegra_mc_ops tegra30_mc_ops;
>  
>  #if defined(CONFIG_ARCH_TEGRA_186_SOC) || \
>      defined(CONFIG_ARCH_TEGRA_194_SOC) || \
> -    defined(CONFIG_ARCH_TEGRA_234_SOC) || \
> -    defined(CONFIG_ARCH_TEGRA_264_SOC)
> +    defined(CONFIG_ARCH_TEGRA_234_SOC)
>  extern const struct tegra_mc_ops tegra186_mc_ops;
>  #endif
>  
>  irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
>  extern const irq_handler_t tegra30_mc_irq_handlers[];
> -extern const char * const tegra_mc_status_names[32];
> -extern const char * const tegra_mc_error_names[8];
> +extern const char * const tegra20_mc_status_names[32];
> +extern const char * const tegra20_mc_error_names[8];
> +int tegra186_mc_probe(struct tegra_mc *mc);
> +int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev);

This is such a confusing design... Function declared in mc.h header,
defined in a MODULE but used in a driver which can only be built in,
because it depends on some ARCH_foo stuf. If I deciphered it correctly
this fails and needs EXPORT_SYMBOL_GPL, but maybe I deciphered it wrong,
because code is confusing. Your drivers Makefile should not have
ARCH_TEGRA_FOO, but dedicated entries so the state of each driver is
obvious by reading Kconfig of this directory - it is built-in or tristate.


> +int tegra186_mc_resume(struct tegra_mc *mc);
> +void tegra186_mc_remove(struct tegra_mc *mc);
>  

_mc {


Best regards,
Krzysztof
