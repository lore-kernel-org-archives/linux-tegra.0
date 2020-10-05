Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D9EC4727E
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 10:37:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC26620795
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 10:37:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHgpEcUk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgJEKg6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 06:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgJEKg6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 06:36:58 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254A7C0613CE;
        Mon,  5 Oct 2020 03:36:58 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b12so10212470lfp.9;
        Mon, 05 Oct 2020 03:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kXGxjrOECHo9Yx49QGExKC9VMrc3WpIW0kWli+WP6Wc=;
        b=fHgpEcUk5a1h/ZYcayz+n0HgwtBBcLPVDH60MdlYmQ6q1uhKixndlzQykidqHB5mtc
         t7XUXd/3M0YfRU8TRKSXnGeHzqymcHGdb1kkyPyhdnpxwVjek93PKmlERJT4spxrSsML
         e+biqMhblP2vDC8cAxpMc8nsz/z6v3bi/eewYMM0Bc9Ny6ftNgynxoM/naeY49qKQVz1
         Ktlp94D90cRnpS1+z4iSVuSzTxrglQg71Jp4A2mFLyYW2yW7RPnvt9B1pXqGm/eRAGfD
         FhPkYwF9oFyvg4CFrmcpjP+1PK+iQI5FUhTSr7Jy25Czo1auDwZR79F2nQqqL8ZHr1wV
         jHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kXGxjrOECHo9Yx49QGExKC9VMrc3WpIW0kWli+WP6Wc=;
        b=bRxfZ3FYMyPF1P+c2K1O0WjjrPwBt2V0T6khUj3u5jHLLXBCKq6EfdIbdqGGUbfuas
         gFrn1d3gtYGcJFRKSLrfAD70hxIxhl2gpn7qlsAEDM/k7fRzsWzrCQtgnDBzCH+ZIns2
         kAJ5i5rBquzpEVv7wCHpZHVavrgliHvX3LT9pK2J+4k+4m0FrvaQXbjaB4HRw4vgBsGb
         sYSgg2fcg72wde12PGuE9q3zPnzrs3iUZekkhHxE3xZwj+63qosOFS6XMI/D2kR8fRWy
         vGb0mgtU1i1na7plz+RQHjUzLHIBRUBd/nCBHXOPqyQRFESz2yM26PNRgUtBILQwusGR
         mTzg==
X-Gm-Message-State: AOAM531J+MtmjqdPjAtJirg5txRLVgb8VTvUZPz6aauRecUBkmIcSVfZ
        UbQAB3rI/jSKj0xCVNmXdPUBmmwCxRk=
X-Google-Smtp-Source: ABdhPJyJ9IH5yjJ1w3bo8h3abEOag+7Bnq7V9LkS3PO1PNhlyJ50gniAAz1mop6Ok01XMQ2/IMImiw==
X-Received: by 2002:a19:7e0d:: with SMTP id z13mr5049605lfc.455.1601894216462;
        Mon, 05 Oct 2020 03:36:56 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id i18sm2561967lfo.243.2020.10.05.03.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 03:36:55 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <b1a195cf-0127-0531-f6d1-835367511f57@gmail.com>
 <0c66bab9-0132-d3fb-ea4e-de1278cf2b04@gmail.com>
 <20201005095351.GI425362@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ae48aaaf-fe10-6de4-06bb-2afbde799168@gmail.com>
Date:   Mon, 5 Oct 2020 13:36:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005095351.GI425362@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.10.2020 12:53, Thierry Reding пишет:
> On Fri, Oct 02, 2020 at 05:50:08PM +0300, Dmitry Osipenko wrote:
>> 02.10.2020 17:22, Dmitry Osipenko пишет:
>>>>  static int tegra_smmu_of_xlate(struct device *dev,
>>>>  			       struct of_phandle_args *args)
>>>>  {
>>>> +	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
>>>> +	struct tegra_mc *mc = platform_get_drvdata(iommu_pdev);
>>>>  	u32 id = args->args[0];
>>>>  
>>>> +	of_node_put(args->np);
>>>> +
>>>> +	if (!mc || !mc->smmu)
>>>> +		return -EPROBE_DEFER;
>>> platform_get_drvdata(NULL) will crash.
>>>
>>
>> Actually, platform_get_drvdata(NULL) can't happen. I overlooked this.
> 
> How so? It's technically possible for the iommus property to reference a
> device tree node for which no platform device will ever be created, in
> which case of_find_device_by_node() will return NULL. That's very
> unlikely and perhaps worth just crashing on to make sure it gets fixed
> immediately.

The tegra_smmu_ops are registered from the SMMU driver itself and MC
driver sets platform data before SMMU is initialized, hence device is
guaranteed to exist and mc can't be NULL.
