From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2] PM / devfreq: tegra: Add Dmitry as a maintainer
Date: Fri, 3 Jul 2020 09:44:22 +0900
Message-ID: <a08f16bc-df90-2199-91c8-f2acfe0f94ad@samsung.com>
References: <CGME20200402222006epcas1p4027cd509b32ba2d2bdf90e9e84cf4bec@epcas1p4.samsung.com>
        <20200402221723.6064-1-digetx@gmail.com>
        <921abb5e-8c12-db8b-b345-fbe49080dc1c@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <921abb5e-8c12-db8b-b345-fbe49080dc1c@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Dear all,

On 5/8/20 1:04 PM, Chanwoo Choi wrote:
> Hi Rafael,
> 
> Could you please apply it to linux-pm directly?
> 
> I think that it is better to be applied directly
> for preventing the possible merge conflict of MAINTAINERS file.
> 
> Best Regards,
> Chanwoo Choi
> 
> On 4/3/20 7:17 AM, Dmitry Osipenko wrote:
>> I was contributing to the NVIDIA Tegra20+ devfreq drivers recently and
>> want to help keep them working and evolving in the future.
>>
>> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>
>> Changelog:
>>
>> v2: - Addressed review comments made by Chanwoo Choi to v1 by correcting
>>       git's address, making this patch standalone and adding Rafael Wysocki
>>       to the list of email recipients.
>>
>>  MAINTAINERS | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 245a96316636..0a694e20ea19 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -10922,6 +10922,15 @@ F:	include/linux/memblock.h
>>  F:	mm/memblock.c
>>  F:	Documentation/core-api/boot-time-mm.rst
>>  
>> +MEMORY FREQUENCY SCALING DRIVERS FOR NVIDIA TEGRA
>> +M:	Dmitry Osipenko <digetx@gmail.com>
>> +L:	linux-pm@vger.kernel.org
>> +L:	linux-tegra@vger.kernel.org
>> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git
>> +S:	Maintained
>> +F:	drivers/devfreq/tegra20-devfreq.c
>> +F:	drivers/devfreq/tegra30-devfreq.c
>> +
>>  MEMORY MANAGEMENT
>>  M:	Andrew Morton <akpm@linux-foundation.org>
>>  L:	linux-mm@kvack.org
>>
> 
> 

I applied it to devfreq-next branch. Thanks.


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
