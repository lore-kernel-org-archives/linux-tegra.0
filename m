Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFFEC433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 08:28:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 777C3601FD
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 08:28:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbhDZI32 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Apr 2021 04:29:28 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41892 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232068AbhDZI31 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Apr 2021 04:29:27 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lawbk-0002B1-Kf
        for linux-tegra@vger.kernel.org; Mon, 26 Apr 2021 08:28:44 +0000
Received: by mail-ed1-f70.google.com with SMTP id l7-20020aa7c3070000b029038502ffe9f2so16790220edq.16
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 01:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=COIkDfjubq7aAUAK5liY18XK8WSLoAGQXd5DYCklQ/A=;
        b=HChDbdiFJW2vbnWFZiFp7pdEFX+yQntWct6m0np63IG2RzE9jdtdsHMojfbI0evb0H
         eFWuppBkT2MSB4DxExMLezR1ZAEAAnN1XbAg8ycsC/Q9QkkSORTFyBliQ0Ka+J//7gZd
         vUM8WAxkkcVgdKjT7/HzOpPlc/oR7RQ7aLBVeHJYgYJnGbNdnTICQAFqCCwoq/VVtqmD
         YAKtSFfXXLnWKc6HzXAVX5qRjdDvJfGXA97GdeyfnVivGqDeub6j4fHYPnfHrvKw9ZsZ
         L3Jmpp5XpASn9p17sF+zi7X3WvuwTFxwuh4hhQ5jQDxDNEJjrlypMHCo+bpNqYkKUcXc
         6mqg==
X-Gm-Message-State: AOAM533lUuh8G7s2J9Pacr4CUH4W62dl86zkrneFGQ7zDl+eXAMDtH9U
        BDVzLxhEAZqSzCFH7MnVUJCiUpu0iLKR9cJYOp1TiT5XmbtbsPVbCsDLILYhTi6BPWdcmBIqDiW
        Wqfp2BPyPnkYfmUYv0ZE7ymrtfN0o7utN2HL4HuCw
X-Received: by 2002:a17:906:6d48:: with SMTP id a8mr17748264ejt.92.1619425724301;
        Mon, 26 Apr 2021 01:28:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhr25H0tBsBH7bLu7FVjvZjArCD5pPEKSdYyH73P4GGQO0s+LeQ8sv8v4PmZJ+zVnujNggsw==
X-Received: by 2002:a17:906:6d48:: with SMTP id a8mr17748251ejt.92.1619425724124;
        Mon, 26 Apr 2021 01:28:44 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id l6sm11153810ejc.92.2021.04.26.01.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 01:28:43 -0700 (PDT)
Subject: Re: [PATCH v2 01/10] memory: tegra: Implement SID override
 programming
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
References: <20210420172619.3782831-1-thierry.reding@gmail.com>
 <20210420172619.3782831-2-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <03e2a655-7dbf-a729-75f6-98db353e2b91@canonical.com>
Date:   Mon, 26 Apr 2021 10:28:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420172619.3782831-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20/04/2021 19:26, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Instead of programming all SID overrides during early boot, perform the
> operation on-demand after the SMMU translations have been set up for a
> device. This reuses data from device tree to match memory clients for a
> device and programs the SID specified in device tree, which corresponds
> to the SID used for the SMMU context banks for the device.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/memory/tegra/mc.c       |  9 +++++
>  drivers/memory/tegra/tegra186.c | 72 +++++++++++++++++++++++++++++++++
>  include/soc/tegra/mc.h          |  3 ++
>  3 files changed, 84 insertions(+)
> 
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index c854639cf30c..bace5ecfe770 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -97,6 +97,15 @@ struct tegra_mc *devm_tegra_memory_controller_get(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(devm_tegra_memory_controller_get);
>  
> +int tegra_mc_probe_device(struct tegra_mc *mc, struct device *dev)
> +{
> +	if (mc->soc->ops && mc->soc->ops->probe_device)
> +		return mc->soc->ops->probe_device(mc, dev);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(tegra_mc_probe_device);
> +
>  static int tegra_mc_block_dma_common(struct tegra_mc *mc,
>  				     const struct tegra_mc_reset *rst)
>  {
> diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
> index 1f87915ccd62..e65eac5764d4 100644
> --- a/drivers/memory/tegra/tegra186.c
> +++ b/drivers/memory/tegra/tegra186.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/io.h>
> +#include <linux/iommu.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/of_device.h>
> @@ -15,6 +16,10 @@
>  #include <dt-bindings/memory/tegra186-mc.h>
>  #endif
>  
> +#define MC_SID_STREAMID_OVERRIDE_MASK GENMASK(7, 0)
> +#define MC_SID_STREAMID_SECURITY_WRITE_ACCESS_DISABLED BIT(16)
> +#define MC_SID_STREAMID_SECURITY_OVERRIDE BIT(8)
> +
>  static void tegra186_mc_program_sid(struct tegra_mc *mc)
>  {
>  	unsigned int i;
> @@ -66,10 +71,77 @@ static int tegra186_mc_resume(struct tegra_mc *mc)
>  	return 0;
>  }
>  
> +static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
> +					    const struct tegra_mc_client *client,
> +					    unsigned int sid)
> +{
> +	u32 value, old;
> +
> +	value = readl(mc->regs + client->regs.sid.security);
> +	if ((value & MC_SID_STREAMID_SECURITY_OVERRIDE) == 0) {
> +		/*
> +		 * If the secure firmware has locked this down the override
> +		 * for this memory client, there's nothing we can do here.
> +		 */
> +		if (value & MC_SID_STREAMID_SECURITY_WRITE_ACCESS_DISABLED)
> +			return;
> +
> +		/*
> +		 * Otherwise, try to set the override itself. Typically the
> +		 * secure firmware will never have set this configuration.
> +		 * Instead, it will either have disabled write access to
> +		 * this field, or it will already have set an explicit
> +		 * override itself.
> +		 */
> +		WARN_ON((value & MC_SID_STREAMID_SECURITY_OVERRIDE) == 0);
> +
> +		value |= MC_SID_STREAMID_SECURITY_OVERRIDE;
> +		writel(value, mc->regs + client->regs.sid.security);
> +	}
> +
> +	value = readl(mc->regs + client->regs.sid.override);
> +	old = value & MC_SID_STREAMID_OVERRIDE_MASK;
> +
> +	if (old != sid) {
> +		dev_dbg(mc->dev, "overriding SID %x for %s with %x\n", old,
> +			client->name, sid);
> +		writel(sid, mc->regs + client->regs.sid.override);
> +	}
> +}
> +
> +static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
> +{
> +#if IS_ENABLED(CONFIG_IOMMU_API)

Is this part really build-time dependent? I don't see here any uses of
IOMMU specific fields, so maybe this should be runtime choice based on
enabled interconnect devices?

> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	struct of_phandle_args args;
> +	unsigned int i, index = 0;
> +
> +	while (!of_parse_phandle_with_args(dev->of_node, "interconnects", "#interconnect-cells",
> +					   index, &args)) {
> +		if (args.np == mc->dev->of_node && args.args_count != 0) {
> +			for (i = 0; i < mc->soc->num_clients; i++) {
> +				const struct tegra_mc_client *client = &mc->soc->clients[i];
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
> +#endif
> +
> +	return 0;
> +}
> +
>  const struct tegra_mc_ops tegra186_mc_ops = {
>  	.probe = tegra186_mc_probe,
>  	.remove = tegra186_mc_remove,
>  	.resume = tegra186_mc_resume,
> +	.probe_device = tegra186_mc_probe_device,
>  };
>  
>  #if defined(CONFIG_ARCH_TEGRA_186_SOC)
> diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
> index 1387747d574b..bbad6330008b 100644
> --- a/include/soc/tegra/mc.h
> +++ b/include/soc/tegra/mc.h
> @@ -176,6 +176,7 @@ struct tegra_mc_ops {
>  	int (*suspend)(struct tegra_mc *mc);
>  	int (*resume)(struct tegra_mc *mc);
>  	irqreturn_t (*handle_irq)(int irq, void *data);
> +	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
>  };
>  
>  struct tegra_mc_soc {
> @@ -240,4 +241,6 @@ devm_tegra_memory_controller_get(struct device *dev)
>  }
>  #endif
>  
> +int tegra_mc_probe_device(struct tegra_mc *mc, struct device *dev);
> +

What about !CONFIG_TEGRA_MC? I think arm-smmmu will fail.

>  #endif /* __SOC_TEGRA_MC_H__ */
> 


Best regards,
Krzysztof
