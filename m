Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C587C4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 14:26:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 083AA206FA
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 14:26:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mb2uQwoP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387777AbgJBO0Q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 10:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBO0Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 10:26:16 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DCFC0613D0;
        Fri,  2 Oct 2020 07:26:15 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id q8so2090484lfb.6;
        Fri, 02 Oct 2020 07:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NnO4CkB4CLW9Li8QejxKrb4H9LHQ8RR+HVvosy268zY=;
        b=mb2uQwoP34nGGHbHmdUqaOjeDzaN83FSARRIN0VBzz425u0SEvCy7ns0SwMEE9yBqO
         GCSkzW2DLg9ElRevEKch7PuUurfGyycbBQHtOMwGK1kaQVJRpYmfwWnpf8VqjPDSqEY6
         gm2f+6psB9i1AQaCrjbb+gQK9yqbfYcT5XVXdIBi+bfdTKyN+Emmq6L9EWUvlca7Hrlm
         zkmccNnH1nTSjs8EkbAAach4HXXPWWX7NxsDDQXrFu7sMtZ5/IwGFglnalU2w3+bM0Hp
         6FBS6zLtftOGIdGyrbT5jhw3bKH4v9l1vfeVUxZ3hxW7WAOKrxpo0bSelENtCLxbvW+v
         PGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NnO4CkB4CLW9Li8QejxKrb4H9LHQ8RR+HVvosy268zY=;
        b=eJFcICwwerWycDcA2wBDrVtdBZFFkk7DIhMcXjybskIr1SWIQGWsT15rxFrvI8hjhJ
         CQeZrDwf/u/BoJN1XAfqL6vUJYMxUJcWbLedZEMIBTX4Eyqml8hpI19gRPMZFPq1FsRO
         zitPmAUvK1pnkAf6ZYvKa2pxLfLdLPURC1aOSQtHAIbywgCAsD6bdw7NeTS80UCxuQp4
         uwQ97R6M21EhdwAY29+26UtRvqEFA2MPKY7V2kfZhmmTjpsMTz7kaFj6uVXYdPZu71A5
         PiBYLtgcgOm69gmL5JM80bi1RjCKHN6agMlvJIT64lsGky3Kxk0OmRs2LY3w3Hd43Eay
         NVuw==
X-Gm-Message-State: AOAM532ZDysgGVPX2rUuMgjVqsRQ3jYLOYxeVeIgi5ytdT1wuVNNDkcW
        ZIinVPleFzUYhQU7KIo7duLUuNCEBVs=
X-Google-Smtp-Source: ABdhPJwAi3WOx1lsk/3Yq9rkV8i/y5IPzBxNkfq7fht7QwRNUutlaKe9RZ/isRIDDhFw7wypYW6IHA==
X-Received: by 2002:a19:9cf:: with SMTP id 198mr1068551lfj.214.1601648774105;
        Fri, 02 Oct 2020 07:26:14 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id q24sm316363lfo.149.2020.10.02.07.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 07:26:13 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] iommu/tegra-smmu: Use fwspec in
 tegra_smmu_(de)attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-2-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <90e4709c-1684-a280-92dc-0a4de2e4457b@gmail.com>
Date:   Fri, 2 Oct 2020 17:26:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002060807.32138-2-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.10.2020 09:08, Nicolin Chen пишет:
>  static void tegra_smmu_detach_dev(struct iommu_domain *domain, struct device *dev)
>  {
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  	struct tegra_smmu_as *as = to_smmu_as(domain);
> -	struct device_node *np = dev->of_node;
>  	struct tegra_smmu *smmu = as->smmu;
> -	struct of_phandle_args args;
>  	unsigned int index = 0;
>  
> -	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
> -					   &args)) {
> -		unsigned int swgroup = args.args[0];
> -
> -		if (args.np != smmu->dev->of_node) {
> -			of_node_put(args.np);
> -			continue;
> -		}
> -
> -		of_node_put(args.np);
> +	if (!fwspec)
> +		return;

When !fwspec could be true?
