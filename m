Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4435DC77B75
	for <linux-tegra@archiver.kernel.org>; Tue, 18 Apr 2023 10:38:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjDRKiT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 18 Apr 2023 06:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbjDRKiS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Apr 2023 06:38:18 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E64B2421B
        for <linux-tegra@vger.kernel.org>; Tue, 18 Apr 2023 03:38:16 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-63b5465fc13so1412884b3a.3
        for <linux-tegra@vger.kernel.org>; Tue, 18 Apr 2023 03:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681814296; x=1684406296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yBtopcpVhz9eBMQtYuRsTFTrwcJpD9PK5zOo4afuwW4=;
        b=OLj4qlWf5iQxuoOmQfVXJWvwBrwo4/kbTL61IveT1xBOR/BdXpam6si3KQsdGoXn5P
         u0JC1PWHKFXln6VU2CR1lP19XwNDnoDoN+Pvx6kGjzpjSYx69veEPB1fZNr0zOw68fMU
         VAC2cv2S2PpdxBQTCU0AxUyWYkJEnKQmkl8n1jgzfnNI+xSD5kSzSjYRh63xfuyXv79b
         on1Gg53zzux2+T8Nup9HSeCag+zwmKw8TXl1Uh2VowuMmlyR/tKOTJwR00L8IRWyZrdO
         6lGP6vMYBD5v291t0QGGlTO/urPUhe7IDw2UDe0HvKRqBrq8NrpTgSl3O5d/NKIRtMO2
         mIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681814296; x=1684406296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBtopcpVhz9eBMQtYuRsTFTrwcJpD9PK5zOo4afuwW4=;
        b=Nqg+50xic2A3IUG29o/VcknT8gUCZJA4w+iiTCyWSmTAiYif6vewL+4T8w9qSZEzLm
         bPQgsP4TJdX8IdRrJRybR9eQXfg5yYx1uHIPLMdhlZpsrwacymY+317uakLa5XdJeUZ2
         VY/teQbYHqkS28t6D/JrE7zHGX2xo2PfsJpYzsDtS5j2j276x0LJ7HxZrkpzca4CzORJ
         rjmlPztXfXxsD1h4IPVWXh31KSF23pTt4LXCY66ydkYpJtEYiuIv2dcSq5BTAt2K6/lb
         7lMGG3SZ+xi02XyVc5PuFRW+3TA6M0ARXnTxrF/AzlKRt9F7JiYBbH6su3598j0ohNy1
         a8/g==
X-Gm-Message-State: AAQBX9dxa8BO7kryO12MWX56gjSU3T/Z07jNuhY9SB98QBbJB/caUsFL
        zcQXPp5TpvZqLLPwOYk5kOOLHg==
X-Google-Smtp-Source: AKy350YmoUouJLJncpUhqAHIl1VHEwB0iKOrdoz7B4rih6xNXtKSQCSwhjsMF2ycCJxHdrapjFJIxw==
X-Received: by 2002:a05:6a00:2d88:b0:63b:8792:f288 with SMTP id fb8-20020a056a002d8800b0063b8792f288mr12523385pfb.31.1681814296388;
        Tue, 18 Apr 2023 03:38:16 -0700 (PDT)
Received: from localhost ([122.172.85.8])
        by smtp.gmail.com with ESMTPSA id n9-20020aa79049000000b0062ddcad2cbesm9285886pfo.145.2023.04.18.03.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 03:38:15 -0700 (PDT)
Date:   Tue, 18 Apr 2023 16:08:13 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sumit Gupta <sumitg@nvidia.com>
Cc:     treding@nvidia.com, krzysztof.kozlowski@linaro.org,
        dmitry.osipenko@collabora.com, rafael@kernel.org,
        jonathanh@nvidia.com, robh+dt@kernel.org, lpieralisi@kernel.org,
        helgaas@kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        mmaddireddy@nvidia.com, kw@linux.com, bhelgaas@google.com,
        vidyas@nvidia.com, sanjayc@nvidia.com, ksitaraman@nvidia.com,
        ishah@nvidia.com, bbasu@nvidia.com
Subject: Re: [Patch v6 6/9] cpufreq: tegra194: add OPP support and set
 bandwidth
Message-ID: <20230418103813.z77tdq5i2iqj6mgn@vireshk-i7>
References: <20230411110002.19824-1-sumitg@nvidia.com>
 <20230411110002.19824-7-sumitg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411110002.19824-7-sumitg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11-04-23, 16:29, Sumit Gupta wrote:
> Add support to use OPP table from DT in Tegra194 cpufreq driver.
> Tegra SoC's receive the frequency lookup table (LUT) from BPMP-FW.
> Cross check the OPP's present in DT against the LUT from BPMP-FW
> and enable only those DT OPP's which are present in LUT also.
> 
> The OPP table in DT has CPU Frequency to bandwidth mapping where
> the bandwidth value is per MC channel. DRAM bandwidth depends on the
> number of MC channels which can vary as per the boot configuration.
> This per channel bandwidth from OPP table will be later converted by
> MC driver to final bandwidth value by multiplying with number of
> channels before sending the request to BPMP-FW.
> 
> If OPP table is not present in DT, then use the LUT from BPMP-FW
> directy as the CPU frequency table and not do the DRAM frequency
> scaling which is same as the current behavior.
> 
> Now, as the CPU Frequency table is being controlling through OPP
> table in DT. Keeping fewer entries in the table will create less
> frequency steps and can help to scale fast to high frequencies
> when required.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>  drivers/cpufreq/tegra194-cpufreq.c | 156 ++++++++++++++++++++++++++---
>  1 file changed, 143 insertions(+), 13 deletions(-)

Applied. Thanks.

-- 
viresh
