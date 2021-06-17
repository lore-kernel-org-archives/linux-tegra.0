Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CA8C49361
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 11:00:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3B83613E7
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 11:00:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhFQLCs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Jun 2021 07:02:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:50788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232251AbhFQLCp (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Jun 2021 07:02:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81B67613E2;
        Thu, 17 Jun 2021 11:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623927638;
        bh=IjNco9f9EPzlQJjmK3xgbzrERQA6WBkHjH4qn50cnmw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LeEdVoxCe4TbiMFVCQSfkGnBr8MyV/ot7D6eeatqAMBpPeQPyaag5j8lWQ/drrZWU
         utYw++QUo/2j5q5wtU/uu51PzR70hhJi7MDm/RPPT3j2NOoYl9beMQ8EKw0G8PeXvg
         c9O2+cpvEsRd+MYv6Xu/qIQWT4XlFYjUA8m9Ay7M=
Date:   Thu, 17 Jun 2021 13:00:35 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     arnd@arndb.de, ykaukab@suse.de, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: sram: Only map reserved areas in Tegra SYSRAM
Message-ID: <YMsrU81o9hCTNfy7@kroah.com>
References: <20210617094804.667716-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617094804.667716-1-mperttunen@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jun 17, 2021 at 12:48:04PM +0300, Mikko Perttunen wrote:
> On Tegra186 and later, a portion of the SYSRAM may be reserved for use
> by TZ. Non-TZ memory accesses to this portion, including speculative
> accesses, trigger SErrors that bring down the system. This does also
> happen in practice occasionally (due to speculative accesses).
> 
> To fix the issue, add a flag to the SRAM driver to only map the
> device tree-specified reserved areas depending on a flag set
> based on the compatibility string. This would not affect non-Tegra
> systems that rely on the entire thing being memory mapped.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/misc/sram.c | 108 +++++++++++++++++++++++++++++++-------------
>  drivers/misc/sram.h |   9 ++++
>  2 files changed, 86 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
> index 93638ae2753a..a27ffb3dbea8 100644
> --- a/drivers/misc/sram.c
> +++ b/drivers/misc/sram.c
> @@ -97,7 +97,24 @@ static int sram_add_partition(struct sram_dev *sram, struct sram_reserve *block,
>  	struct sram_partition *part = &sram->partition[sram->partitions];
>  
>  	mutex_init(&part->lock);
> -	part->base = sram->virt_base + block->start;
> +
> +	if (sram->config->map_only_reserved) {
> +		void *virt_base;
> +
> +		if (sram->no_memory_wc)
> +			virt_base = devm_ioremap_resource(sram->dev, &block->res);
> +		else
> +			virt_base = devm_ioremap_resource_wc(sram->dev, &block->res);
> +
> +		if (IS_ERR(virt_base)) {
> +			dev_err(sram->dev, "could not map SRAM at %pr\n", &block->res);
> +			return PTR_ERR(virt_base);
> +		}
> +
> +		part->base = virt_base;
> +	} else {
> +		part->base = sram->virt_base + block->start;
> +	}
>  
>  	if (block->pool) {
>  		ret = sram_add_pool(sram, block, start, part);
> @@ -198,6 +215,7 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
>  
>  		block->start = child_res.start - res->start;
>  		block->size = resource_size(&child_res);
> +		block->res = child_res;
>  		list_add_tail(&block->list, &reserve_list);
>  
>  		if (of_find_property(child, "export", NULL))
> @@ -295,15 +313,17 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
>  		 */
>  		cur_size = block->start - cur_start;
>  
> -		dev_dbg(sram->dev, "adding chunk 0x%lx-0x%lx\n",
> -			cur_start, cur_start + cur_size);
> +		if (sram->pool) {
> +			dev_dbg(sram->dev, "adding chunk 0x%lx-0x%lx\n",
> +				cur_start, cur_start + cur_size);
>  
> -		ret = gen_pool_add_virt(sram->pool,
> -				(unsigned long)sram->virt_base + cur_start,
> -				res->start + cur_start, cur_size, -1);
> -		if (ret < 0) {
> -			sram_free_partitions(sram);
> -			goto err_chunks;
> +			ret = gen_pool_add_virt(sram->pool,
> +					(unsigned long)sram->virt_base + cur_start,
> +					res->start + cur_start, cur_size, -1);
> +			if (ret < 0) {
> +				sram_free_partitions(sram);
> +				goto err_chunks;
> +			}
>  		}
>  
>  		/* next allocation after this reserved block */
> @@ -331,40 +351,66 @@ static int atmel_securam_wait(void)
>  					10000, 500000);
>  }
>  
> +static const struct sram_config default_config = {
> +};

No need for a "default" config, just do not provide one and then do not
call it if it is not set.  Much simpler and less code churn.


> +
> +static const struct sram_config atmel_securam_config = {
> +	.init = atmel_securam_wait

Add a trailing , please.

> +};
> +
> +/*
> + * SYSRAM contains areas that are not accessible by the
> + * kernel, such as the first 256K that is reserved for TZ.
> + * Accesses to those areas (including speculative accesses)
> + * trigger SErrors. As such we must map only the areas of
> + * SYSRAM specified in the device tree.
> + */
> +static const struct sram_config tegra_sysram_config = {
> +	.map_only_reserved = true,
> +};
> +
>  static const struct of_device_id sram_dt_ids[] = {
> -	{ .compatible = "mmio-sram" },
> -	{ .compatible = "atmel,sama5d2-securam", .data = atmel_securam_wait },
> +	{ .compatible = "mmio-sram", .data = &default_config },
> +	{ .compatible = "atmel,sama5d2-securam", .data = &atmel_securam_config },
> +	{ .compatible = "nvidia,tegra186-sysram", .data = &tegra_sysram_config },
> +	{ .compatible = "nvidia,tegra194-sysram", .data = &tegra_sysram_config },
>  	{}
>  };
>  
>  static int sram_probe(struct platform_device *pdev)
>  {
> +	const struct sram_config *config;
>  	struct sram_dev *sram;
>  	int ret;
>  	struct resource *res;
> -	int (*init_func)(void);
> +
> +	config = of_device_get_match_data(&pdev->dev);
>  
>  	sram = devm_kzalloc(&pdev->dev, sizeof(*sram), GFP_KERNEL);
>  	if (!sram)
>  		return -ENOMEM;
>  
>  	sram->dev = &pdev->dev;
> +	sram->no_memory_wc = of_property_read_bool(pdev->dev.of_node, "no-memory-wc");
> +	sram->config = config;
> +
> +	if (!config->map_only_reserved) {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		if (sram->no_memory_wc)
> +			sram->virt_base = devm_ioremap_resource(&pdev->dev, res);
> +		else
> +			sram->virt_base = devm_ioremap_resource_wc(&pdev->dev, res);
> +		if (IS_ERR(sram->virt_base)) {
> +			dev_err(&pdev->dev, "could not map SRAM registers\n");
> +			return PTR_ERR(sram->virt_base);
> +		}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (of_property_read_bool(pdev->dev.of_node, "no-memory-wc"))
> -		sram->virt_base = devm_ioremap_resource(&pdev->dev, res);
> -	else
> -		sram->virt_base = devm_ioremap_resource_wc(&pdev->dev, res);
> -	if (IS_ERR(sram->virt_base)) {
> -		dev_err(&pdev->dev, "could not map SRAM registers\n");
> -		return PTR_ERR(sram->virt_base);
> +		sram->pool = devm_gen_pool_create(sram->dev, ilog2(SRAM_GRANULARITY),
> +						  NUMA_NO_NODE, NULL);
> +		if (IS_ERR(sram->pool))
> +			return PTR_ERR(sram->pool);
>  	}
>  
> -	sram->pool = devm_gen_pool_create(sram->dev, ilog2(SRAM_GRANULARITY),
> -					  NUMA_NO_NODE, NULL);
> -	if (IS_ERR(sram->pool))
> -		return PTR_ERR(sram->pool);
> -
>  	sram->clk = devm_clk_get(sram->dev, NULL);
>  	if (IS_ERR(sram->clk))
>  		sram->clk = NULL;
> @@ -378,15 +424,15 @@ static int sram_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, sram);
>  
> -	init_func = of_device_get_match_data(&pdev->dev);
> -	if (init_func) {
> -		ret = init_func();
> +	if (config->init) {
> +		ret = config->init();
>  		if (ret)
>  			goto err_free_partitions;
>  	}
>  
> -	dev_dbg(sram->dev, "SRAM pool: %zu KiB @ 0x%p\n",
> -		gen_pool_size(sram->pool) / 1024, sram->virt_base);
> +	if (sram->pool)
> +		dev_dbg(sram->dev, "SRAM pool: %zu KiB @ 0x%p\n",
> +			gen_pool_size(sram->pool) / 1024, sram->virt_base);
>  
>  	return 0;
>  
> @@ -405,7 +451,7 @@ static int sram_remove(struct platform_device *pdev)
>  
>  	sram_free_partitions(sram);
>  
> -	if (gen_pool_avail(sram->pool) < gen_pool_size(sram->pool))
> +	if (sram->pool && gen_pool_avail(sram->pool) < gen_pool_size(sram->pool))
>  		dev_err(sram->dev, "removed while SRAM allocated\n");
>  
>  	if (sram->clk)
> diff --git a/drivers/misc/sram.h b/drivers/misc/sram.h
> index 9c1d21ff7347..d2058d8c8f1d 100644
> --- a/drivers/misc/sram.h
> +++ b/drivers/misc/sram.h
> @@ -5,6 +5,11 @@
>  #ifndef __SRAM_H
>  #define __SRAM_H
>  
> +struct sram_config {
> +	int (*init)(void);
> +	bool map_only_reserved;
> +};
> +
>  struct sram_partition {
>  	void __iomem *base;
>  
> @@ -15,8 +20,11 @@ struct sram_partition {
>  };
>  
>  struct sram_dev {
> +	const struct sram_config *config;
> +
>  	struct device *dev;
>  	void __iomem *virt_base;
> +	bool no_memory_wc;

What does "wc" here mean?

thanks,

greg k-h
