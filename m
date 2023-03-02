Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8A8C7EE37
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Mar 2023 16:35:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbjCBQfY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Mar 2023 11:35:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbjCBQfS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Mar 2023 11:35:18 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E121589A;
        Thu,  2 Mar 2023 08:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=roYQIsSpHz5fL2zIngizuTvBFCJoqJp/J086FjeBQYc=; b=fdCWnu2itzSlf8Amrp12KHSkko
        z1BlPi8wPPf+TvuuSYyYzCix6x51jb+zhdBmO2UZfMJSLR2domMYDPJ0K+cwTJ1bfz2kf+Lx4TtC2
        J1k55PyjpVEgbWRgnE+9oxSWD6+NENEa0EgPoep1I/UsgD38fmtM06m5hpTWJD3xPXVsJwCgJ+IOP
        pdszMOXSjE4bRXfc0W5x2whSDsnXwhsf3yc6J6gQrTRA8GT6FFpiqfRQMHQ+slSPJ/eIhapFmyqoo
        lf3xtqMd+fy+E0fP9VYcR5UvG5WYoAb5bmAiG5n7V9adINsnqE9jCuqfo3SJlf1OjYWCnC5aF6BTu
        FsgF//Ww==;
Received: from [2601:1c2:980:9ec0::df2f]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pXltO-002qTG-CG; Thu, 02 Mar 2023 16:34:54 +0000
Message-ID: <9332c041-4cb4-b0f8-4cc7-8fd57e394610@infradead.org>
Date:   Thu, 2 Mar 2023 08:34:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] perf: arm_cspmu: Fix compiler warning
Content-Language: en-US
To:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Besar Wicaksono <bwicaksono@nvidia.com>,
        catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, treding@nvidia.com,
        jonathanh@nvidia.com, vsethi@nvidia.com
References: <20230301225657.30211-1-bwicaksono@nvidia.com>
 <7db8f057-e1d8-101d-19f4-1d4efb900f1f@arm.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <7db8f057-e1d8-101d-19f4-1d4efb900f1f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 3/2/23 04:01, Suzuki K Poulose wrote:
> On 01/03/2023 22:56, Besar Wicaksono wrote:
>> Fix following compiler warning message
>>    | smatch warnings:
>>    | drivers/perf/arm_cspmu/arm_cspmu.c:1075 arm_cspmu_find_cpu_container()
>>    |    warn: variable dereferenced before check 'cpu_dev' (see line 1073)
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <error27@gmail.com>
>> Link: https://lore.kernel.org/r/202302191227.kc0V8fM7-lkp@intel.com/
>> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

in Subject:, s/compiler/smatch/

>> ---
>>   drivers/perf/arm_cspmu/arm_cspmu.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
>> index e31302ab7e37..a3f1c410b417 100644
>> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
>> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
>> @@ -1078,12 +1078,14 @@ static int arm_cspmu_request_irq(struct arm_cspmu *cspmu)
>>   static inline int arm_cspmu_find_cpu_container(int cpu, u32 container_uid)
>>   {
>>       u32 acpi_uid;
>> -    struct device *cpu_dev = get_cpu_device(cpu);
>> -    struct acpi_device *acpi_dev = ACPI_COMPANION(cpu_dev);
>> +    struct device *cpu_dev;
>> +    struct acpi_device *acpi_dev;
>>   +    cpu_dev = get_cpu_device(cpu);
>>       if (!cpu_dev)
>>           return -ENODEV;
>>   +    acpi_dev = ACPI_COMPANION(cpu_dev);
>>       while (acpi_dev) {
>>           if (!strcmp(acpi_device_hid(acpi_dev),
>>                   ACPI_PROCESSOR_CONTAINER_HID) &&
>>
>> base-commit: 7f7a8831520f12a3cf894b0627641fad33971221
> 

-- 
~Randy
