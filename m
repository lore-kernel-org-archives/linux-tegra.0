Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42397C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Mar 2022 10:19:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239807AbiC3KVU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Mar 2022 06:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235280AbiC3KVT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Mar 2022 06:21:19 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D08FD1C16EA;
        Wed, 30 Mar 2022 03:19:31 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dmitry.osipenko)
        with ESMTPSA id A68D41F44516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1648635569;
        bh=StyztVffLbw1AQ6XJEFjXEnbu7ei/fKPsvU3Dkfn4Bs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=RrlST6RaEO6QMgKmX1jwEuDALibTtEYsPZq0s2XWGVXsfxwc3ac5pzNnRlW4vGWtO
         CmBh6HyoScUsvqsk0/6lNRBLF2bvqHDMKvphI9+gLbIoyn+HQEbDXqK0HQ1omCjGOy
         GGujG4IVICN5t2dNxBd2dfqsYkVe4Jn9ME1S9Sy991rKt2e4ss4o4rroTmAbipl/CL
         duzN+7mWx5o65wP1yGhUioncnQeN/6erj2M+YQEmGOykJn0bC2Q3h1HKHwTuySva/R
         SpT2Lj4qBQH2mktk6YBY8LAtEh24rx9aAsCPOaEIAqkEFI7HMHaLWF0bvFoI04Cow0
         yU2jaHAgonQjA==
Message-ID: <2ba661b5-a59b-89f4-7ad7-5eee4da4ce96@collabora.com>
Date:   Wed, 30 Mar 2022 13:19:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Patch v5 2/4] memory: tegra: Add MC error logging on tegra186
 onward
Content-Language: en-US
To:     Ashish Mhetre <amhetre@nvidia.com>,
        krzysztof.kozlowski@canonical.com, robh+dt@kernel.org,
        thierry.reding@gmail.com, digetx@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc:     vdumpa@nvidia.com, Snikam@nvidia.com
References: <20220316092525.4554-1-amhetre@nvidia.com>
 <20220316092525.4554-3-amhetre@nvidia.com>
 <04bb5ef2-15c3-d561-3572-76dc803275ef@collabora.com>
 <c5341578-e0a6-4ad7-5b6c-95b31b16faad@nvidia.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <c5341578-e0a6-4ad7-5b6c-95b31b16faad@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 3/30/22 12:03, Ashish Mhetre wrote:
> 
> 
> On 3/30/2022 5:36 AM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 3/16/22 12:25, Ashish Mhetre wrote:
>>> Add new function 'get_int_channel' in tegra_mc_soc struture which is
>>> implemented by tegra SOCs which support multiple MC channels. This
>>> function returns the channel which should be used to get the information
>>> of interrupts.
>>> Remove static from tegra30_mc_handle_irq and use it as interrupt handler
>>> for MC interrupts on tegra186, tegra194 and tegra234 to log the errors.
>>> Add error specific MC status and address register bits and use them on
>>> tegra186, tegra194 and tegra234.
>>> Add error logging for generalized carveout interrupt on tegra186,
>>> tegra194
>>> and tegra234.
>>> Add error logging for route sanity interrupt on tegra194 an tegra234.
>>> Add register for higher bits of error address which is available on
>>> tegra194 and tegra234.
>>> Add a boolean variable 'has_addr_hi_reg' in tegra_mc_soc struture which
>>> will be true if soc has register for higher bits of memory controller
>>> error address. Set it true for tegra194 and tegra234.
>>>
>>> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> Reported what? You should add this tag only if patch addresses reported
>> problem. This patch doesn't address anything, hence the tag is
>> inappropriate, you should remove it.
> 
> Okay, smatch warning was reported on v4 of this patch which is fixed in
> v5. Then I understand that we don't need to add Reported-by if we fix
> bug in subsequent versions, right?

Right, if the report was made to the in-progress patch, then you
shouldn't add the tag.

If report was made to the patch that was already merged, then you should
create a new patch that fixes the reported problem and add the
reported-by to this patch.
