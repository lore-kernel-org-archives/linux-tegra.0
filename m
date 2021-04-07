Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0840C43461
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Apr 2021 15:45:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0CA161284
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Apr 2021 15:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234273AbhDGPpK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Apr 2021 11:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353688AbhDGPpJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Apr 2021 11:45:09 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E1CC061756
        for <linux-tegra@vger.kernel.org>; Wed,  7 Apr 2021 08:45:00 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id n38so3509459pfv.2
        for <linux-tegra@vger.kernel.org>; Wed, 07 Apr 2021 08:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+qfQCQqId0WTspRAj4kz6DuPB09HIJxxoSgf5ROVgtM=;
        b=zmWDPmjOJmFr7kDuBGoTtaYx65S49XI98JpsvFJrN+najC/kfuYlju+4YXn2rnHmUi
         hKq9yUAR5Hwnc9WnhI7+GZ3iJQCBlLZ8HXqvdrIg96e3uB0ancsgISylaUSWqVmXEpU4
         hh10dqyrwlEo9q/hJ0S7WdeynSlbcT2CA5aM0AlXyPP2nRHf79TDkn3djBC6sPIriyWO
         xrkkUgoxRlKNfEAXyKMfeSTntfwt27rm61Xb7lqMuTAgs3EZ3ON8UuXiLye6oHU22zxl
         Ne7ffG+3Xzb+BEyrXLheNR++l2nfE82BE3WWePEyL/TJz2GW8N0cfxJZK6jZAQxeXFnt
         nXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+qfQCQqId0WTspRAj4kz6DuPB09HIJxxoSgf5ROVgtM=;
        b=deRbnsQSnqJScDmhQiMRzvZceTiqUot928+cFb71QhsIckAjyMk899GtbHD61IHS18
         GgVU8KUZk3VXAENG0VvKzybNOhq7D5t/tkx6zvteaPzjeIafNJ124wz3T985jrGhf+F/
         nRws0g+3k3fGRttiWWgSnDTl9dJN4EVbOjzKS5TKjl4swgXIpdOr/y7qvVxYpy0dI/K9
         d1qfwUKaV6Io+EUX0xl2wmQPPeeYjhDti6wBZ//Q7RGIoNsqCyp/kh/zyo+/Ha1DH3On
         TdgUBU/sMNVoOlezTkPmAZTeCEqnjd7rYTqevkKXwqYNr6aQ3K2Ho33Q3uMXpmYHdJUz
         cJ4w==
X-Gm-Message-State: AOAM532kFdbqpy/E9ErSnnROV3CJYcqtgLpgn2M9vrQKz4lvsrqRlc1E
        NdpwxHmHivZKmktN79FpPSTTbg==
X-Google-Smtp-Source: ABdhPJzuYOTIM+pn84VM/EafCuxxJjRcVVjW6OOlNG5TbX/HcZet0ywbD5ohAK0Cux12gVhNKEUXuA==
X-Received: by 2002:a63:770e:: with SMTP id s14mr3749330pgc.377.1617810299745;
        Wed, 07 Apr 2021 08:44:59 -0700 (PDT)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id x1sm21865932pfj.209.2021.04.07.08.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 08:44:58 -0700 (PDT)
Subject: Re: [PATCH v4 0/3] Add AHCI support for Tegra186
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org
Cc:     pchandru@nvidia.com, devicetree@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1617758731-12380-1-git-send-email-skomatineni@nvidia.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <2cf9a0ee-034c-7d31-1fa4-66e6ad3ceb43@kernel.dk>
Date:   Wed, 7 Apr 2021 09:44:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617758731-12380-1-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 4/6/21 7:25 PM, Sowjanya Komatineni wrote:
> Re-sending dt-binding and ahci_tegra driver patches as v4 as device
> tree patches from v3 are merged but not the AHCI Tegra driver.
> 
> Missed to add Jens Axboe to mailing list in v3. Adding for v4.
> 
> This series adds support for AHCI-compliant SATA to Tegra186 SoC.
> 
> This series includes patches for
> - Converting text based dt-binding document to YAML.
> - Adding dt-bindings for Tegra186.
> - Adding Tegra186 support to Tegra AHCI driver.
> 
> Delta between patch versions:
> [v4]:	Same as v3 except removed device tree patches as they are
> 	merged.
> [v3]:	fixed yaml example to pass dt_binding_check
> [v2]:	v1 feedback related to yaml dt-binding.
> 	Removed conditional reset order in yaml and updated dts files
> 	to maintain same order for commonly available resets across
> 	Tegra124 thru Tegra186.

Assuming the libata tree is the best way for this to go in, so I applied
it for 5.13.

-- 
Jens Axboe

