Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37440C2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:59:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6714206DB
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:59:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPF8llp2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbgI3F7t (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgI3F7t (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:59:49 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC830C061755;
        Tue, 29 Sep 2020 22:59:48 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u21so527713ljl.6;
        Tue, 29 Sep 2020 22:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zkMB/eTwbcDzYeUwkqLNVNuszypf0t87/4bsgTKRRuU=;
        b=RPF8llp248AgypY2MDIt38FMjCeEktMKGAvFPgRAS74txcADz9b2RB898dHJD+jyUz
         gk3BsWnBugATRj56mpDo7PoS08IV9lhQq3i4uAfkjnq/EJqlQryaXwgizazIO90GbWwZ
         dWKKhae0LLo6fuammyCIHgh6Fs2UmZzPqnpf0dddlgf8bai642B37F9Zwzbtvu/POoPA
         7WOuBvfgTH21Y+zlRvbCA1WXfXp4IPdnvO1+sO0EgtSsuRdxODBCSDa2hQrjMkg8riIb
         Y3Xv1YvM22yDN17EcvSGaffQbiIZ7/HlP0Ste0nwMip2GOTQqnm3r5CMLZPdRq5VDQov
         Xaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zkMB/eTwbcDzYeUwkqLNVNuszypf0t87/4bsgTKRRuU=;
        b=qpBTqIN4uK+8/fp/zu6l26U5uOlx6U/QfnXIymJs6HaEM0mdc0swFX38+5w4aIR2Do
         Nd/LKuYax2ot7XmOXMenUdfgXnmiWom81aumOCtV9+oviYyhnSMYLHDkKr1c48Bq0ibR
         YwrBM2ZxztcMssbyurHKq3X0OOo0qGY50pUrIhRcvV1jaD7meobLPN3uFrSQdgcorrz6
         lq9jcpXmhl083Kvn/YhgrOc1WMQ+r6sNUumh5+Y16hGz55fuH++5dwnEM1DqI9OlFmBt
         yPdvETshU87aLF8+pS80K/n34I5vP5mpHpaLkMc0UmmCwxSWtR2K8Rh0maykyohUO3bM
         QpwQ==
X-Gm-Message-State: AOAM5313QLPSjDuM/EfdpZkR3xTrZKrKbtD+1ekU5hFLzcZnJk3GTyiE
        Ul2iB8rNyU06khet9Pe4F+KHDIw5ST0=
X-Google-Smtp-Source: ABdhPJxF1455iHEGS/+ljUe+sSI1+drgugHd5KUrICCLN/cqPa5Q80B/1k8DFj9gwt2F7Fj6kfnq3A==
X-Received: by 2002:a2e:8782:: with SMTP id n2mr397178lji.262.1601445586969;
        Tue, 29 Sep 2020 22:59:46 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id x5sm67196lfd.119.2020.09.29.22.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 22:59:46 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-3-nicoleotsuka@gmail.com>
 <e557a09b-bcc3-11cb-9529-096aafb42051@gmail.com>
 <20200930054119.GE31821@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <68c13611-bc3d-5ba6-70ec-29786d69ff9a@gmail.com>
Date:   Wed, 30 Sep 2020 08:59:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930054119.GE31821@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 08:41, Nicolin Chen пишет:
> On Wed, Sep 30, 2020 at 08:39:54AM +0300, Dmitry Osipenko wrote:
>> 30.09.2020 03:30, Nicolin Chen пишет:
>>>  static int tegra_smmu_attach_dev(struct iommu_domain *domain,
>>>  				 struct device *dev)
>>>  {
>>> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>>  	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
>>>  	struct tegra_smmu_as *as = to_smmu_as(domain);
>>> -	struct device_node *np = dev->of_node;
>>> -	struct of_phandle_args args;
>>>  	unsigned int index = 0;
>>>  	int err = 0;
>>>  
>>> -	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
>>> -					   &args)) {
>>> -		unsigned int swgroup = args.args[0];
>>> -
>>> -		if (args.np != smmu->dev->of_node) {
>>> -			of_node_put(args.np);
>>> -			continue;
>>> -		}
>>> -
>>> -		of_node_put(args.np);
>>> +	if (!fwspec || fwspec->ops != &tegra_smmu_ops)
>>> +		return -ENOENT;
>>
>> s/&tegra_smmu_ops/smmu->iommu.ops/
>>
>> Secondly, is it even possible that fwspec could be NULL here or that
>> fwspec->ops != smmu->ops?
> 
> I am following what's in the arm-smmu driver, as I think it'd be
> a common practice to do such a check in such a way.
> 

Please check whether it's really needed. It looks like it was needed
sometime ago, but that's not true anymore.
