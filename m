Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2572AC4338F
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 09:48:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A774610FD
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 09:48:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234177AbhHYJtF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Aug 2021 05:49:05 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:51132
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237091AbhHYJtF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Aug 2021 05:49:05 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EBA5140767
        for <linux-tegra@vger.kernel.org>; Wed, 25 Aug 2021 09:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629884898;
        bh=tjsHPbCfcVOmhdB0vPy9yJyr+9FoVUNnDxTLE3I81xE=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=lvwmduuma/pedg+y6yz32rmcLwrz2/CbiXXqUq2hkUtSrDHb8rN4oxS5WQlPiKPdi
         LMFpPPEkRPORSHf6qma+OvVDNU1fSzoE6fAp+eCIDC5geDsbLtqgS2LP4RxjHprr4C
         NlMjOsBjvAyuoN0jOdIfeql92P4RxHGSVTkGmQAhrDadmJWB8/vSJbP/J3tI42gtfo
         jG3liZrI44AkOkzYJDTyPMlmg72ek1ujujsMcW9PBLZvfEVUULQoeRiSRB80bsHHcv
         Zfnuu5+fxB5jLaXyVXM9uY4rLQCP5StSIsS+dSZnTboKfVFwNBaEzByE9MRUgwKF7p
         kltSw1SIP1hUA==
Received: by mail-wm1-f70.google.com with SMTP id j33-20020a05600c48a100b002e879427915so1600378wmp.5
        for <linux-tegra@vger.kernel.org>; Wed, 25 Aug 2021 02:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tjsHPbCfcVOmhdB0vPy9yJyr+9FoVUNnDxTLE3I81xE=;
        b=S2y1Du+NjlDkkA4BTQoh32dGL6FGpmpexOfy+2X9vf58SBCH38uZK+Z0MCw/GpzS6s
         AhtmuU1W2L6NcPSY3685XJ4vEvigyYqsuQ45WXDyws3BVmDQnJ7ailNZumNfyYrDOC3i
         MAXp5yqbwmWAtwXdHOypmjMUCi/AbHG935D2s0Bw0vX95gkL0XgiZga75LhoaXs1/+wt
         8tHl61JGVsIP6Lz4AHgqgM/gv9YxqjqkN53s+43ip6RQ6xAkSm5lDUbk8jBWDD/wov6U
         31FgpNCgISWjPktv7c4aG2Ki8ppsk0V9LRe1+nm69MAd71fpGDSmHxQpDm/My2QLpFfK
         soRw==
X-Gm-Message-State: AOAM531tH9A/Wz05iXrYRizYgsorXwyMOfTHt6Q+JiRd+G9c87QdsOte
        O6O+pFkxB7S7WN987IfNYUilujWPK/WNbesceyBRWLROaMqBf/p8k616LjhPraqYkvyfUMMOl7X
        Bj+PbUpp0zyZFwIMWo/qurdJzW8hkRCewDfjYbhsc
X-Received: by 2002:adf:9783:: with SMTP id s3mr23140738wrb.349.1629884898704;
        Wed, 25 Aug 2021 02:48:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1PenjOjXIGJAnUWhJyZcjt8TAxEDMXHPR1JYG4WMSGlNdWtBL2TzkTIgCVaqjD/jXij3Otg==
X-Received: by 2002:adf:9783:: with SMTP id s3mr23140718wrb.349.1629884898544;
        Wed, 25 Aug 2021 02:48:18 -0700 (PDT)
Received: from [192.168.0.103] ([79.98.113.172])
        by smtp.gmail.com with ESMTPSA id r129sm4935073wmr.7.2021.08.25.02.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 02:48:18 -0700 (PDT)
Subject: Re: [PATCH linux-next] memory:tegra30-emc: replace
 DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
To:     CGEL <cgel.zte@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        jing yangyang <jing.yangyang@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
References: <20210821035223.28282-1-jing.yangyang@zte.com.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <066c231d-f923-6671-12d8-8aab79482a6e@canonical.com>
Date:   Wed, 25 Aug 2021 11:48:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210821035223.28282-1-jing.yangyang@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/08/2021 05:52, CGEL wrote:
> From: jing yangyang <jing.yangyang@zte.com.cn>
> 
> Fix the following coccicheck warning:
> ./drivers/memory/tegra/tegra30-emc.c:1322:0-23:WARNING:
> tegra_emc_debug_max_rate_fops should be defined
> with DEFINE_DEBUGFS_ATTRIBUTE
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>

Thanks for the patch. Same comment as with other one - where is the report?

Best regards,
Krzysztof

> Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
> ---
>  drivers/memory/tegra/tegra30-emc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
> index 7e21a85..80f98d7 100644
> --- a/drivers/memory/tegra/tegra30-emc.c
> +++ b/drivers/memory/tegra/tegra30-emc.c
> @@ -1289,7 +1289,7 @@ static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
>  	return 0;
>  }
>  
> -DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
> +DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
>  			tegra_emc_debug_min_rate_get,
>  			tegra_emc_debug_min_rate_set, "%llu\n");
>  
> @@ -1319,7 +1319,7 @@ static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
>  	return 0;
>  }
>  
> -DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
> +DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
>  			tegra_emc_debug_max_rate_get,
>  			tegra_emc_debug_max_rate_set, "%llu\n");
>  
> 

