From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 12/24] PM / devfreq: tegra30: Inline all one-line
 functions
Date: Fri, 19 Jul 2019 19:52:09 +0300
Message-ID: <12ea5667-bd93-1103-b20f-95b012047d1d@gmail.com>
References: <20190707223303.6755-1-digetx@gmail.com>
 <CGME20190707223633epcas4p3873704f3199126be0e8d5cb7454c7a51@epcas4p3.samsung.com>
 <20190707223303.6755-13-digetx@gmail.com>
 <b5634fbe-8bc1-0f04-e13b-6345dfbb5615@samsung.com>
 <b7da3fa2-00d1-5bd6-408c-202c85be917d@gmail.com>
 <45621f73-2f86-cde7-a92e-2a34810b9c05@samsung.com>
 <20190719042251.37cc9cda@dimatab>
 <92f82420-5c50-468f-a403-7b4c36958076@samsung.com>
 <97f2a317-989a-bcad-dd45-ccf00ba18cca@samsung.com>
 <20190719051426.4e4145d8@dimatab>
 <8e3de3b8-d3c6-fba3-0883-a2cd8d0c4c98@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8e3de3b8-d3c6-fba3-0883-a2cd8d0c4c98@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

19.07.2019 9:01, Chanwoo Choi пишет:
> On 19. 7. 19. 오전 11:14, Dmitry Osipenko wrote:
>> В Fri, 19 Jul 2019 10:27:16 +0900
>> Chanwoo Choi <cw00.choi@samsung.com> пишет:
>>
>>> On 19. 7. 19. 오전 10:24, Chanwoo Choi wrote:
>>>> On 19. 7. 19. 오전 10:22, Dmitry Osipenko wrote:  
>>>>> В Thu, 18 Jul 2019 18:09:05 +0900
>>>>> Chanwoo Choi <cw00.choi@samsung.com> пишет:
>>>>>  
>>>>>> On 19. 7. 16. 오후 10:35, Dmitry Osipenko wrote:  
>>>>>>> 16.07.2019 15:26, Chanwoo Choi пишет:    
>>>>>>>> Hi Dmitry,
>>>>>>>>
>>>>>>>> I'm not sure that it is necessary.
>>>>>>>> As I knew, usally, the 'inline' is used on header file
>>>>>>>> to define the empty functions.
>>>>>>>>
>>>>>>>> Do we have to change it with 'inline' keyword?    
>>>>>>>
>>>>>>> The 'inline' attribute tells compiler that instead of jumping
>>>>>>> into the function, it should take the function's code and
>>>>>>> replace the function's invocation with that code. This is done
>>>>>>> in order to help compiler optimize code properly, please see
>>>>>>> [1]. There is absolutely no need to create a function call into
>>>>>>> a function that consists of a single instruction.
>>>>>>>
>>>>>>> [1] https://gcc.gnu.org/onlinedocs/gcc-9.1.0/gcc/Inline.html
>>>>>>>     
>>>>>>
>>>>>> If you want to add 'inline' keyword, I recommend that 
>>>>>> you better to remove the modified function in this patch
>>>>>> and then just call the 'write_relaxed or read_relaxed' function
>>>>>> directly. It is same result when using inline keyword.  
>>>>>
>>>>> That could be done, but it makes code less readable.
>>>>>
>>>>> See the difference:
>>>>>
>>>>> device_writel(dev, ACTMON_INTR_STATUS_CLEAR,
>>>>> ACTMON_DEV_INTR_STATUS);
>>>>>
>>>>> writel_relaxed(ACTMON_INTR_STATUS_CLEAR,
>>>>> 	       dev->regs + ACTMON_DEV_INTR_STATUS);  
>>>>
>>>> No problem if you add the detailed comment and you want to use
>>>> the 'inline' keyword.  
>>>
>>> Basically, I think that 'inline' keyword is not necessary.
>>
>> Sure, but I'm finding that it's always nicer to explicitly inline a very
>> simple functions because compiler may not do it properly itself in some
>> cases.
>>
>>> But if you want to use 'inline' keyword, I recommend
>>> that call the 'write_relaxed or read_relaxed' function directly
>>> with detailed description. 
>>
>> Could you please reword this sentence? Not sure that I'm understanding
>> it correctly.
>>
> 
> If you want to used 'inline' keyword,
> Instead, I recommend that remove 'actmon_readl/writel' wrapper functions
> and then you calls 'write_relaxed or read_relaxed' function directly
> with detailed description.
> 

This is a step into a wrong direction. Look, there is no need for extra
comments and the code is clean with the variant I'm proposing, while you
are asking to make code less readable and then paper that over with
comments.

I'll probably just drop this, #11 and #17 for now. Since these patches
and not essential for the functionality of the driver and they are
raising more questions than should be. Maybe we could get back to them
at some point later.
