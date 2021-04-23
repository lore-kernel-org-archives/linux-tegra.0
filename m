Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200BEC433B4
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 15:01:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E294E61176
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 15:01:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243432AbhDWPCP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Apr 2021 11:02:15 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38722 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243522AbhDWPBr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Apr 2021 11:01:47 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id C3FCF1F43D22
Subject: Re: [PATCH v1 2/2] iommu/tegra-smmu: Revert workaround that was
 needed for Nyan Big Chromebook
To:     Dmitry Osipenko <digetx@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210328233256.20494-1-digetx@gmail.com>
 <20210328233256.20494-2-digetx@gmail.com>
 <20210401085549.GA31146@Asurada-Nvidia>
 <50a7e4c7-0e72-534a-a317-366e455213c1@gmail.com>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <d01ccde4-5fa9-2aa7-c28b-b3899cc54c54@collabora.com>
Date:   Fri, 23 Apr 2021 16:01:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <50a7e4c7-0e72-534a-a317-366e455213c1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 02/04/2021 15:40, Dmitry Osipenko wrote:
> 01.04.2021 11:55, Nicolin Chen пишет:
>> On Mon, Mar 29, 2021 at 02:32:56AM +0300, Dmitry Osipenko wrote:
>>> The previous commit fixes problem where display client was attaching too
>>> early to IOMMU during kernel boot in a multi-platform kernel configuration
>>> which enables CONFIG_ARM_DMA_USE_IOMMU=y. The workaround that helped to
>>> defer the IOMMU attachment for Nyan Big Chromebook isn't needed anymore,
>>> revert it.
>>
>> Sorry for the late reply. I have been busy with downstream tasks.
>>
>> I will give them a try by the end of the week. Yet, probably it'd
>> be better to include Guillaume also as he has the Nyan platform.
>>
> 
> Indeed, thanks. Although, I'm pretty sure that it's the same issue which
> I reproduced on Nexus 7.
> 
> Guillaume, could you please give a test to these patches on Nyan Big?
> There should be no EMEM errors in the kernel log with this patches.
> 
> https://patchwork.ozlabs.org/project/linux-tegra/list/?series=236215

So sorry for the very late reply.  I have tried the patches but
hit some issues on linux-next, it's not reaching a login prompt
with next-20210422.  So I then tried with next-20210419 which
does boot but shows the IOMMU error:

<6>[    2.995341] tegra-dc 54200000.dc: Adding to iommu group 1
<4>[    3.001070] Failed to attached device 54200000.dc to IOMMU_mapping  

  https://lava.collabora.co.uk/scheduler/job/3570052#L1120

The branch I'm using with the patches applied can be found here:

  https://gitlab.collabora.com/gtucker/linux/-/commits/next-20210419-nyan-big-drm-read/

Hope this helps, let me know if you need anything else to be
tested.

Best wishes,
Guillaume
