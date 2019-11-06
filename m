From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v9 19/19] PM / devfreq: tegra20/30: Add Dmitry as a
 maintainer
Date: Wed, 6 Nov 2019 10:24:27 +0900
Message-ID: <da10a370-de1d-67c9-a916-cdc1a31c0a96@samsung.com>
References: <20191104215617.25544-1-digetx@gmail.com>
        <CGME20191104221855epcas4p3761ca7e09ffa66b686be8b5a840ea383@epcas4p3.samsung.com>
        <20191104215617.25544-20-digetx@gmail.com>
        <0e7db72b-37ff-a36e-11fe-727ed43c26a6@samsung.com>
        <9bd7bfc0-508f-e7fb-d985-d32f2d9a88d8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9bd7bfc0-508f-e7fb-d985-d32f2d9a88d8@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter Geis <pgwipeout@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

On 19. 11. 5. 오후 10:29, Dmitry Osipenko wrote:
> 05.11.2019 07:07, Chanwoo Choi пишет:
>> On 19. 11. 5. 오전 6:56, Dmitry Osipenko wrote:
>>> I was contributing to the NVIDIA Tegra20+ devfreq drivers recently and
>>> want to help keep them working and evolving in the future.
>>>
>>> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  MAINTAINERS | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 9f69d01da3a6..4b9679988514 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -10632,6 +10632,15 @@ F:	include/linux/memblock.h
>>>  F:	mm/memblock.c
>>>  F:	Documentation/core-api/boot-time-mm.rst
>>>  
>>> +MEMORY FREQUENCY SCALING DRIVERS FOR NVIDIA TEGRA
>>> +M:	Dmitry Osipenko <digetx@gmail.com>
>>> +L:	linux-pm@vger.kernel.org
>>> +L:	linux-tegra@vger.kernel.org
>>> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mzx/devfreq.git

From now, I'll help and review the devfreq patches as maintainer
and the devfreq git information is changed[1]. You should change 
the git info as following:
[1] https://lkml.org/lkml/2019/11/5/39

+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git

Also, I add my acked-by tag.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

>>> +S:	Maintained
>>> +F:	drivers/devfreq/tegra20-devfreq.c
>>> +F:	drivers/devfreq/tegra30-devfreq.c
>>> +
>>>  MEMORY MANAGEMENT
>>>  L:	linux-mm@kvack.org
>>>  W:	https://protect2.fireeye.com/url?k=9d0ba644-c09508de-9d0a2d0b-0cc47a336fae-300ed90f1ba3077c&u=http://www.linux-mm.org/
>>>
>>
>> Looks good to me. 
>>
>> But, the merge conflict might be occurred.
>> After getting the review from Myungjoo,
>> you better to send this patch separately
>> based on the latest MAINTAINERS file.
>>
>> Thanks for your all efforts.
> 
> Okay, I'll wait for the rest of patches to land and then re-send this
> patch separately. Thank you very much for the reviews.
> 
> 
-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
