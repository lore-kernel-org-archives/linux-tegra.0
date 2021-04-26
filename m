Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87968C433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 14:10:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E1B36101B
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 14:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbhDZOKw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Apr 2021 10:10:52 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52770 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233494AbhDZOKv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Apr 2021 10:10:51 -0400
Received: from mail-ej1-f69.google.com ([209.85.218.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lb1w8-0006xU-KF
        for linux-tegra@vger.kernel.org; Mon, 26 Apr 2021 14:10:08 +0000
Received: by mail-ej1-f69.google.com with SMTP id e18-20020a17090681d2b0290384d9ff1359so1295699ejx.16
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 07:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2ADebOh7mdB0pOynqo1V1oIiVpLH7xgzkBg1gH8EygY=;
        b=l7TOte0JPBIFJF0qqRTBC0SIqgucGKMxh2CsEspAsv1+W6teKFiVN0N6AiIHZPPXWC
         zOP4czlPGYd/4CD6Fr8nMBwYC6jApgSIArT6G9E/vCE1xbL59pe6X+dUjnUy2DfhdE4l
         W4E7pTdrguDb5ZCEMfxHN+yLNO5BkikjiTmUpZvoOsEsskzOR+BjmH5iKBWiZteVXrS8
         QwuSRREGOohpqy1GvJnismYzYFI+xgR+7CWabvHJ3SoXP0boNhy5aP/HDl5IbtwWWb1C
         4JC3W5UQE/lh3zYvZn8+v76dsaDADLNQoePoSXaeQXPjJe3aRH3003I5Vy3ftXB8UW5S
         IuYg==
X-Gm-Message-State: AOAM532xaRkru6llWBjPN1cNRlfF+BE1Y9t7quHHcLR1bJ1smHTAAAP6
        xxjIJHHUhSVG7LQyf0FJ7FUi253U5vYtmzTVr9h0a4RXe9+FOXVS5GGntZpRJTK8TK/pEP+4x/P
        KGri9oLjExsC+fQPYAXDYVKhdizrZ0zE8XQlSiilH
X-Received: by 2002:a50:ee88:: with SMTP id f8mr10726107edr.176.1619446208305;
        Mon, 26 Apr 2021 07:10:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaB1Db7KABg9TD1/UL3dQ5XfAGx3KjxU9sYwe/UocPCGa2sJj2AJlgIhi7ZrvToVrSsb83Tg==
X-Received: by 2002:a50:ee88:: with SMTP id f8mr10726080edr.176.1619446208110;
        Mon, 26 Apr 2021 07:10:08 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id m14sm14363432edr.45.2021.04.26.07.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 07:10:07 -0700 (PDT)
Subject: Re: [PATCH v2 01/10] memory: tegra: Implement SID override
 programming
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
References: <20210420172619.3782831-1-thierry.reding@gmail.com>
 <20210420172619.3782831-2-thierry.reding@gmail.com>
 <03e2a655-7dbf-a729-75f6-98db353e2b91@canonical.com>
 <YIauV/BgPCZSZ8u2@orome.fritz.box>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <526942f8-861a-8b0f-66a2-42eda600fabe@canonical.com>
Date:   Mon, 26 Apr 2021 16:10:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YIauV/BgPCZSZ8u2@orome.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 26/04/2021 14:13, Thierry Reding wrote:
> On Mon, Apr 26, 2021 at 10:28:43AM +0200, Krzysztof Kozlowski wrote:

(...)

>>> +
>>> +	value = readl(mc->regs + client->regs.sid.override);
>>> +	old = value & MC_SID_STREAMID_OVERRIDE_MASK;
>>> +
>>> +	if (old != sid) {
>>> +		dev_dbg(mc->dev, "overriding SID %x for %s with %x\n", old,
>>> +			client->name, sid);
>>> +		writel(sid, mc->regs + client->regs.sid.override);
>>> +	}
>>> +}
>>> +
>>> +static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
>>> +{
>>> +#if IS_ENABLED(CONFIG_IOMMU_API)
>>
>> Is this part really build-time dependent? I don't see here any uses of
>> IOMMU specific fields, so maybe this should be runtime choice based on
>> enabled interconnect devices?
> 
> Unfortunately it is. struct iommu_fwspec is an empty structure for
> !CONFIG_IOMMU_API, so the code below that tries to access fwspec->ids
> fails for !CONFIG_IOMMU_API configurations if we don't protect this with
> the preprocessor guard.

OK, thanks.

> 
>>
>>> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>> +	struct of_phandle_args args;
>>> +	unsigned int i, index = 0;
>>> +
>>> +	while (!of_parse_phandle_with_args(dev->of_node, "interconnects", "#interconnect-cells",
>>> +					   index, &args)) {
>>> +		if (args.np == mc->dev->of_node && args.args_count != 0) {
>>> +			for (i = 0; i < mc->soc->num_clients; i++) {
>>> +				const struct tegra_mc_client *client = &mc->soc->clients[i];
>>> +
>>> +				if (client->id == args.args[0]) {
>>> +					u32 sid = fwspec->ids[0] & MC_SID_STREAMID_OVERRIDE_MASK;
>>> +
>>> +					tegra186_mc_client_sid_override(mc, client, sid);
>>> +				}
>>> +			}
>>> +		}
>>> +
>>> +		index++;
>>> +	}
>>> +#endif
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  const struct tegra_mc_ops tegra186_mc_ops = {
>>>  	.probe = tegra186_mc_probe,
>>>  	.remove = tegra186_mc_remove,
>>>  	.resume = tegra186_mc_resume,
>>> +	.probe_device = tegra186_mc_probe_device,
>>>  };
>>>  
>>>  #if defined(CONFIG_ARCH_TEGRA_186_SOC)
>>> diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
>>> index 1387747d574b..bbad6330008b 100644
>>> --- a/include/soc/tegra/mc.h
>>> +++ b/include/soc/tegra/mc.h
>>> @@ -176,6 +176,7 @@ struct tegra_mc_ops {
>>>  	int (*suspend)(struct tegra_mc *mc);
>>>  	int (*resume)(struct tegra_mc *mc);
>>>  	irqreturn_t (*handle_irq)(int irq, void *data);
>>> +	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
>>>  };
>>>  
>>>  struct tegra_mc_soc {
>>> @@ -240,4 +241,6 @@ devm_tegra_memory_controller_get(struct device *dev)
>>>  }
>>>  #endif
>>>  
>>> +int tegra_mc_probe_device(struct tegra_mc *mc, struct device *dev);
>>> +
>>
>> What about !CONFIG_TEGRA_MC? I think arm-smmmu will fail.
> 
> I think it doesn't fail because for !CONFIG_TEGRA_MC it basically throws
> away most of nvidia_smmu_impl_init() already because ERR_PTR(-ENODEV) is
> returned by devm_tegra_memory_controller_get() and so it unconditionally
> fails early on already.
> 
> I say I /think/ that happens because I can't reproduce a build failure
> even if I manually tweak the .config such that ARM_SMMU is enabled and
> TEGRA_MC is disabled. But I can't say I fully understand why it's
> working, because, yes, the symbol definitely doesn't exist. But again,
> if the compiler is clever enough to figure out that that function can't
> be called anyway and doesn't even want it, why bother making it more
> complicated than it has to be?

Since you tested that case, it's fine.


Best regards,
Krzysztof
