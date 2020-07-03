From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] PM / devfreq: tegra: Add Dmitry as a maintainer
Date: Fri, 3 Jul 2020 11:21:03 +0300
Message-ID: <33a4df9d-7642-2f64-e073-ef6091f1ca33@gmail.com>
References: <CGME20200402222006epcas1p4027cd509b32ba2d2bdf90e9e84cf4bec@epcas1p4.samsung.com>
 <20200402221723.6064-1-digetx@gmail.com>
 <921abb5e-8c12-db8b-b345-fbe49080dc1c@samsung.com>
 <a08f16bc-df90-2199-91c8-f2acfe0f94ad@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a08f16bc-df90-2199-91c8-f2acfe0f94ad-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>
Cc: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

03.07.2020 03:44, Chanwoo Choi пишет:
> Dear all,
> 
> On 5/8/20 1:04 PM, Chanwoo Choi wrote:
>> Hi Rafael,
>>
>> Could you please apply it to linux-pm directly?
>>
>> I think that it is better to be applied directly
>> for preventing the possible merge conflict of MAINTAINERS file.
>>
>> Best Regards,
>> Chanwoo Choi
>>
>> On 4/3/20 7:17 AM, Dmitry Osipenko wrote:
>>> I was contributing to the NVIDIA Tegra20+ devfreq drivers recently and
>>> want to help keep them working and evolving in the future.
>>>
>>> Acked-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>
>>> Changelog:
>>>
>>> v2: - Addressed review comments made by Chanwoo Choi to v1 by correcting
>>>       git's address, making this patch standalone and adding Rafael Wysocki
>>>       to the list of email recipients.
>>>
>>>  MAINTAINERS | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 245a96316636..0a694e20ea19 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -10922,6 +10922,15 @@ F:	include/linux/memblock.h
>>>  F:	mm/memblock.c
>>>  F:	Documentation/core-api/boot-time-mm.rst
>>>  
>>> +MEMORY FREQUENCY SCALING DRIVERS FOR NVIDIA TEGRA
>>> +M:	Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> +L:	linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> +L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git
>>> +S:	Maintained
>>> +F:	drivers/devfreq/tegra20-devfreq.c
>>> +F:	drivers/devfreq/tegra30-devfreq.c
>>> +
>>>  MEMORY MANAGEMENT
>>>  M:	Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
>>>  L:	linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org
>>>
>>
>>
> 
> I applied it to devfreq-next branch. Thanks.

Hello, Chanwoo! Thank you very much! :)
