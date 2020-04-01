From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/5] PM / devfreq: tegra: Add Dmitry as a maintainer
Date: Wed, 1 Apr 2020 21:52:51 +0300
Message-ID: <cfaf5c1c-51e7-2b5c-dcfa-65546674ca95@gmail.com>
References: <20200330231617.17079-1-digetx@gmail.com>
 <CGME20200330232036epcas1p2cba89238a41fa0941d0abcaf2b457072@epcas1p2.samsung.com>
 <20200330231617.17079-2-digetx@gmail.com>
 <db4883d4-18b7-238a-798b-ad45aad978fc@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <db4883d4-18b7-238a-798b-ad45aad978fc-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

01.04.2020 02:13, Chanwoo Choi пишет:
> On 3/31/20 8:16 AM, Dmitry Osipenko wrote:
>> I was contributing to the NVIDIA Tegra20+ devfreq drivers recently and
>> want to help keep them working and evolving in the future.
>>
>> Acked-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  MAINTAINERS | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 8b8abe756ae0..9e8b0779f6df 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -10931,6 +10931,15 @@ F:	include/linux/memblock.h
>>  F:	mm/memblock.c
>>  F:	Documentation/core-api/boot-time-mm.rst
>>  
>> +MEMORY FREQUENCY SCALING DRIVERS FOR NVIDIA TEGRA
>> +M:	Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> +L:	linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> +L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mzx/devfreq.git
> 
> Need to update it as following:
> git git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git

Indeed, good catch!

>> +S:	Maintained
>> +F:	drivers/devfreq/tegra20-devfreq.c
>> +F:	drivers/devfreq/tegra30-devfreq.c
>> +
>>  MEMORY MANAGEMENT
>>  M:	Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
>>  L:	linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org
>>
> 
> I already agreed it. To prevent the merge conflict of MAINTAINERS,
> better to be merged it to linux-pm.git maintainer. On next time,
> please add Rafael J. Wysocki to To list.

I'll update and re-send this patch separately from the rest of the
patches, thank you.
