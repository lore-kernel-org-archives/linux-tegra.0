Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91549C76196
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Mar 2023 17:51:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjCVRv4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Mar 2023 13:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbjCVRvz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Mar 2023 13:51:55 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB4764238
        for <linux-tegra@vger.kernel.org>; Wed, 22 Mar 2023 10:51:52 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id x3so76211779edb.10
        for <linux-tegra@vger.kernel.org>; Wed, 22 Mar 2023 10:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679507511;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6WaOFED816blZdtFTuLdOx5OA9/TefZvQoaFn0cJ/KA=;
        b=jOHVbMy/M29aXEQjfdczg4AdcZHm5jv7Ld4of6tCjFd0MHhBs/h3AfG3Qs2DtzBWOV
         yNo7k5Br2YAWPuVQDHoGWgMMo+RO4olJc4dC3HOnVt8ZzxObOR+pKYwb/i5dOTxlBRKl
         DvBVVBDr5H0DSLfBJABIkC9URe3/NGoWnT8zMPJGVJ/ZTOmGds1dEslEj4SDjzKm2Kfv
         1t662CUWvvhnemKexrvYIXHN17rH/we4HmF749WVcoema9WgT5RYQQATEXy1YR52J9l8
         9soyepfPuMS8HfCm6zUF+AIU5vJxCvRXyBQKyEvatFgQ3N6Byd7A2HI25jf/h6J+Dezl
         uPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679507511;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6WaOFED816blZdtFTuLdOx5OA9/TefZvQoaFn0cJ/KA=;
        b=EGQK1twZLLG5iHq0tKCuzVMFWMo2MalZ/LdegN2P6kEFbyZVE8coTtheIvytKmosaC
         2Z+zi6jbgJ/t3pLMb7lry1j+/cuM8lj+51a67yGcGFQxtHYna7TUHos1zZtLoP4PgQhN
         +XlJq6eiyKPYiuNOM3MeUHjt4aX5NHDV2hMh98ZJ0tzyNKCqd6kXEdiGDgjB9dpBTPc/
         SveS4nM4yfaTdpHtZI215LiZoGLnOBWwWNLAVG9XoGgeHxUy+d1BfSHfJq08LPxSO1kT
         CuNPVhrInYLsTTxVldLCIkIN9ngYDzN74N4V0gF9VKaUHHdqFzYlV328R0Uexm92Znyi
         lqhQ==
X-Gm-Message-State: AO0yUKXDdYCOGzAjyRPixo4M7eeLbAUlroI0F9Cl/s1LEXGcXkKlOnBK
        p0/CesZ53DFMZkmv810p/JivNw==
X-Google-Smtp-Source: AK7set/N7Q+7f4YI9bhuXQvptgkRYPsxozTlHniZA5aQlpvAWkWgraP0KrP2K9r3QFpP9oXvTSDSmA==
X-Received: by 2002:a17:906:28d5:b0:92c:6fbf:4d with SMTP id p21-20020a17090628d500b0092c6fbf004dmr6617678ejd.40.1679507510764;
        Wed, 22 Mar 2023 10:51:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id gy15-20020a170906f24f00b00932bfab0fcesm6555595ejb.55.2023.03.22.10.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:51:50 -0700 (PDT)
Message-ID: <5e0bb728-1cdd-6c16-b096-eb0934effe94@linaro.org>
Date:   Wed, 22 Mar 2023 18:51:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Patch v3 07/11] cpufreq: tegra194: add OPP support and set
 bandwidth
Content-Language: en-US
To:     Sumit Gupta <sumitg@nvidia.com>, kernel test robot <lkp@intel.com>,
        treding@nvidia.com, dmitry.osipenko@collabora.com,
        viresh.kumar@linaro.org, rafael@kernel.org, jonathanh@nvidia.com,
        robh+dt@kernel.org, lpieralisi@kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        mmaddireddy@nvidia.com, kw@linux.com, bhelgaas@google.com,
        vidyas@nvidia.com, sanjayc@nvidia.com, ksitaraman@nvidia.com,
        ishah@nvidia.com, bbasu@nvidia.com
References: <20230320182441.11904-8-sumitg@nvidia.com>
 <202303211551.eBLRqnv0-lkp@intel.com>
 <dcf8b1a9-d0e3-510f-8dc3-5ef9eebb0696@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <dcf8b1a9-d0e3-510f-8dc3-5ef9eebb0696@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/03/2023 12:49, Sumit Gupta wrote:
> 
> 
> On 21/03/23 13:06, kernel test robot wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Sumit,
>>
>> Thank you for the patch! Perhaps something to improve:
>>
>> [auto build test WARNING on robh/for-next]
>> [also build test WARNING on krzk-mem-ctrl/for-next pci/next pci/for-linus]
>> [cannot apply to tegra/for-next rafael-pm/linux-next linus/master v6.3-rc3 next-20230321]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Sumit-Gupta/firmware-tegra-add-function-to-get-BPMP-data/20230321-024112
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
>> patch link:    https://lore.kernel.org/r/20230320182441.11904-8-sumitg%40nvidia.com
>> patch subject: [Patch v3 07/11] cpufreq: tegra194: add OPP support and set bandwidth
>> config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230321/202303211551.eBLRqnv0-lkp@intel.com/config)
>> compiler: aarch64-linux-gcc (GCC) 12.1.0
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://github.com/intel-lab-lkp/linux/commit/fa31f117302fc7c15b5d9deeefb8c650554f503d
>>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>>          git fetch --no-tags linux-review Sumit-Gupta/firmware-tegra-add-function-to-get-BPMP-data/20230321-024112
>>          git checkout fa31f117302fc7c15b5d9deeefb8c650554f503d
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/cpufreq/
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Link: https://lore.kernel.org/oe-kbuild-all/202303211551.eBLRqnv0-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> drivers/cpufreq/tegra194-cpufreq.c:397:5: warning: no previous prototype for 'tegra_cpufreq_init_cpufreq_table' [-Wmissing-prototypes]
>>       397 | int tegra_cpufreq_init_cpufreq_table(struct cpufreq_policy *policy,
>>           |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
> 
> Thank you for the report.
> 
> Adding static to the function prototype fixes the warning.
> Can we please squash the below change (or) please let me know if i need 
> to re-send the patch.

You must send new version which does not have warnings. The best if you
also build test your code before sending (it's kind of obvious except
that it is not).

Best regards,
Krzysztof

