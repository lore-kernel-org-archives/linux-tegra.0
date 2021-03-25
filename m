Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE95C433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:28:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87C5861A2A
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbhCYO1f (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 10:27:35 -0400
Received: from foss.arm.com ([217.140.110.172]:50758 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231400AbhCYO1S (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 10:27:18 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74462143D;
        Thu, 25 Mar 2021 07:27:17 -0700 (PDT)
Received: from [10.57.50.37] (unknown [10.57.50.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A88963F792;
        Thu, 25 Mar 2021 07:27:15 -0700 (PDT)
Subject: Re: [PATCH 3/9] memory: tegra: Implement SID override programming
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
References: <20210325130332.778208-1-thierry.reding@gmail.com>
 <20210325130332.778208-4-thierry.reding@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <e994810f-7c3c-0f3a-b5af-b318b6eb31f8@arm.com>
Date:   Thu, 25 Mar 2021 14:27:10 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325130332.778208-4-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2021-03-25 13:03, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Instead of programming all SID overrides during early boot, perform the
> operation on-demand after the SMMU translations have been set up for a
> device. This reuses data from device tree to match memory clients for a
> device and programs the SID specified in device tree, which corresponds
> to the SID used for the SMMU context banks for the device.

Can you clarify what exactly the SID override does? I'm guessing it's 
more than just changing the ID presented to the SMMU from one value to 
another, since that alone wouldn't help under disable_bypass.

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/memory/tegra/tegra186.c | 70 +++++++++++++++++++++++++++++++++
>   include/soc/tegra/mc.h          | 10 +++++
>   2 files changed, 80 insertions(+)
> 
> diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
> index efa922d51d83..a89e8e40d875 100644
> --- a/drivers/memory/tegra/tegra186.c
> +++ b/drivers/memory/tegra/tegra186.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/io.h>
> +#include <linux/iommu.h>
>   #include <linux/module.h>
>   #include <linux/mod_devicetable.h>
>   #include <linux/of_device.h>
> @@ -19,6 +20,10 @@
>   #include <dt-bindings/memory/tegra194-mc.h>
>   #endif
>   
> +#define MC_SID_STREAMID_OVERRIDE_MASK GENMASK(7, 0)
> +#define MC_SID_STREAMID_SECURITY_WRITE_ACCESS_DISABLED BIT(16)
> +#define MC_SID_STREAMID_SECURITY_OVERRIDE BIT(8)
> +
>   struct tegra186_mc_client {
>   	const char *name;
>   	unsigned int id;
> @@ -1808,6 +1813,71 @@ static struct platform_driver tegra186_mc_driver = {
>   };
>   module_platform_driver(tegra186_mc_driver);
>   
> +static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
> +					    const struct tegra186_mc_client *client,
> +					    unsigned int sid)
> +{
> +	u32 value, old;
> +
> +	value = readl(mc->regs + client->regs.security);
> +	if ((value & MC_SID_STREAMID_SECURITY_OVERRIDE) == 0) {
> +		/*
> +		 * If the secure firmware has locked this down the override
> +		 * for this memory client, there's nothing we can do here.
> +		 */
> +		if (value & MC_SID_STREAMID_SECURITY_WRITE_ACCESS_DISABLED)
> +			return;

How likely is that in practice? If it's anything more than vanishingly 
rare then that would seem to be a strong pointer back towards 
persevering with the common solution that will work for everyone.

> +
> +		/*
> +		 * Otherwise, try to set the override itself. Typically the
> +		 * secure firmware will never have set this configuration.
> +		 * Instead, it will either have disabled write access to
> +		 * this field, or it will already have set an explicit
> +		 * override itself.
> +		 */
> +		WARN_ON((value & MC_SID_STREAMID_SECURITY_OVERRIDE) == 0);

Given the context that's just WARN_ON(1), but either way I'm struggling 
to understand who the report is for and what they're supposed to do 
about it :/

Robin.

> +
> +		value |= MC_SID_STREAMID_SECURITY_OVERRIDE;
> +		writel(value, mc->regs + client->regs.security);
> +	}
> +
> +	value = readl(mc->regs + client->regs.override);
> +	old = value & MC_SID_STREAMID_OVERRIDE_MASK;
> +
> +	if (old != sid) {
> +		dev_dbg(mc->dev, "overriding SID %x for %s with %x\n", old,
> +			client->name, sid);
> +		writel(sid, mc->regs + client->regs.override);
> +	}
> +}
> +
> +int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
> +{
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	struct of_phandle_args args;
> +	unsigned int i, index = 0;
> +
> +	while (!of_parse_phandle_with_args(dev->of_node, "interconnects", "#interconnect-cells",
> +					   index, &args)) {
> +		if (args.np == mc->dev->of_node && args.args_count != 0) {
> +			for (i = 0; i < mc->soc->num_clients; i++) {
> +				const struct tegra186_mc_client *client = &mc->soc->clients[i];
> +
> +				if (client->id == args.args[0]) {
> +					u32 sid = fwspec->ids[0] & MC_SID_STREAMID_OVERRIDE_MASK;
> +
> +					tegra186_mc_client_sid_override(mc, client, sid);
> +				}
> +			}
> +		}
> +
> +		index++;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(tegra186_mc_probe_device);
> +
>   MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
>   MODULE_DESCRIPTION("NVIDIA Tegra186 Memory Controller driver");
>   MODULE_LICENSE("GPL v2");
> diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
> index 7be8441c6e9e..73d5ecf0e76a 100644
> --- a/include/soc/tegra/mc.h
> +++ b/include/soc/tegra/mc.h
> @@ -168,4 +168,14 @@ devm_tegra_memory_controller_get(struct device *dev)
>   }
>   #endif
>   
> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
> +    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
> +int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev);
> +#else
> +static inline int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
> +{
> +	return 0;
> +}
> +#endif
> +
>   #endif /* __SOC_TEGRA_MC_H__ */
> 
