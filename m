Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB41C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Nov 2021 04:35:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbhKYEiy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 23:38:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbhKYEgy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 23:36:54 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABEF6C06173E
        for <linux-tegra@vger.kernel.org>; Wed, 24 Nov 2021 20:33:43 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id t11so9943123ljh.6
        for <linux-tegra@vger.kernel.org>; Wed, 24 Nov 2021 20:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z7tG3xiUaoyEM6STWiPJ8DB/6Vy4kLRVEgzhfBpzBdU=;
        b=lTlcHwiYVluDZ4nzIS5HAIQZR1TzXpZzokVTffGWuPddY1CpnRmovni0bfmI7NabKK
         00zqgvwm9E1yjUkVvsqEpDA9HFMx30aA1XcCEwSNZJ6SwSgRUi4LyPz8e9+D3oC9ncrr
         SEYlFAvOd8Jo47HxQERUdU4eftrbzWR9xmPZW76TsG5pKgEbq02EaOUeuF4qn7Mi23D2
         c+FX787vjz6xKN8vKhS5UdOCFtzK6Vu0iIHxrRDIVS5SzrecLrZLZliq7sjP2gxf+ewe
         T+IryvDoS4m79byInFylZDuXh3zgOFqSy05opWE2zebJE0TWAMRfhdMcoGJIl0lkL7DL
         Cbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z7tG3xiUaoyEM6STWiPJ8DB/6Vy4kLRVEgzhfBpzBdU=;
        b=E+YUZGOWgUzrGSISQR353yWs9lwdBAA2jAsGjZLoGmqkqL/iKCsfMppVBqhSs6aNLl
         XpKTUF9XCDeOin8EGUFIs/N1l3bcYfhimYMootWwzdVdSkd3tOmCHyKBga/Qlr+lphXS
         BqPuVAlr0muiWErp5I0uXVkNOEe8CpjA6lbnyajaw4FpdTmPqqp/CFHc4oCJUCMcciwX
         sL3qqN059jMgJ1fSOPbeyeWvqBRmTQ92RI+teXbLLfo4ximtWqbqD4ZdHjUYwppVv/Fu
         ki29Ov+CTeiEBD1a9BF0MrPULL4nlhRn1GEJRXWwR9UTpX7Hrw0mfHyybWowbVYhqNbl
         5OKA==
X-Gm-Message-State: AOAM531qbnWfM041cHFQsgQpOxDZKIU9/wprACjNe1hWOdPDekRnYUYt
        S9HL15axE3XJ+URcqglNv56F4goMJHk=
X-Google-Smtp-Source: ABdhPJyfLTmh26Wfz4a25FZDCUt2cGdKHkqxeHfNcxdgutu6lENifugykBR6Kjg2i1BIUQP3HovcUw==
X-Received: by 2002:a2e:a305:: with SMTP id l5mr22100734lje.73.1637814821708;
        Wed, 24 Nov 2021 20:33:41 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id e17sm163495lfr.46.2021.11.24.20.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 20:33:41 -0800 (PST)
Subject: Re: [PATCH V2] soc/tegra: pmc: Add reboot notifier
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org
References: <20211123111134.26409-1-jonathanh@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <eeb4200f-7608-56d5-76e3-508660669812@gmail.com>
Date:   Thu, 25 Nov 2021 07:33:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211123111134.26409-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.11.2021 14:11, Jon Hunter пишет:
> The Tegra PMC driver implements a restart handler that supports Tegra
> specific reboot commands such as placing the device into 'recovery' mode
> in order to reprogram the platform. This is accomplished by setting the
> appropriate bit in the PMC scratch0 register prior to rebooting the
> platform.
> 
> For Tegra platforms that support PSCI or EFI, the default Tegra restart
> handler is not called and the PSCI or EFI restart handler is called
> instead. Hence, for Tegra platforms that support PSCI or EFI, the Tegra
> specific reboot commands do not currently work. Fix this by moving the
> code that programs the PMC scratch0 register into a separate reboot
> notifier that will always be called on reboot.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> Changes since V1:
> - Don't change the behaviour for writing scratch0 register when the
>   notifier is called.
> 
>  drivers/soc/tegra/pmc.c | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 575d6d5b4294..bb2f39597823 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -1064,10 +1064,8 @@ int tegra_pmc_cpu_remove_clamping(unsigned int cpuid)
>  	return tegra_powergate_remove_clamping(id);
>  }
>  
> -static int tegra_pmc_restart_notify(struct notifier_block *this,
> -				    unsigned long action, void *data)
> +static void tegra_pmc_program_reboot_reason(const char *cmd)
>  {
> -	const char *cmd = data;
>  	u32 value;
>  
>  	value = tegra_pmc_scratch_readl(pmc, pmc->soc->regs->scratch0);
> @@ -1085,6 +1083,27 @@ static int tegra_pmc_restart_notify(struct notifier_block *this,
>  	}
>  
>  	tegra_pmc_scratch_writel(pmc, value, pmc->soc->regs->scratch0);
> +}
> +
> +static int tegra_pmc_reboot_notify(struct notifier_block *this,
> +				   unsigned long action, void *data)
> +{
> +	if (action == SYS_RESTART)
> +		tegra_pmc_program_reboot_reason(data);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block tegra_pmc_reboot_notifier = {
> +	.notifier_call = tegra_pmc_reboot_notify,
> +};
> +
> +static int tegra_pmc_restart_notify(struct notifier_block *this,
> +				    unsigned long action, void *data)
> +{
> +	u32 value;
> +
> +	tegra_pmc_program_reboot_reason(data);

So the PMC reason is programmed twice now? First time by the reboot
handler and second by the restart? Why?

BTW, could you please always CC LKML or request to include linux-tegra
ML onto lore? Tegra ML uses Gmane and it's unusable for development
since all email addresses are mangled, the Gmane support told me that
only Tegra ML admin can disable mangling, but I'm not sure who is it,
maybe Stephen Warren?
