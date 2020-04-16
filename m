From: Sumit Gupta <sumitg@nvidia.com>
Subject: Re: [TEGRA194_CPUFREQ Patch 2/3] cpufreq: Add Tegra194 cpufreq driver
Date: Thu, 16 Apr 2020 12:36:30 +0530
Message-ID: <8ea80551-b47c-3dd5-4efa-6befecc279e1@nvidia.com>
References: <20200406025549.qfwzlk3745y3r274@vireshk-i7>
 <3ab4136c-8cca-c2f9-d286-b82dac23e720@nvidia.com>
 <20200408055301.jhvu5bc2luu3b5qr@vireshk-i7>
 <08307e54-0e14-14a3-7d6a-d59e1e04a683@nvidia.com>
 <20200409074415.twpzu2n4frqlde7b@vireshk-i7>
 <00390070-38a1-19aa-ca59-42c4658bee7e@nvidia.com>
 <20200413062141.a6hmwipexhv3sctq@vireshk-i7>
 <64b609f1-efb1-425f-a91a-27a492bd3ec4@nvidia.com>
 <20200414054504.e3qn2cnxqur4sclw@vireshk-i7>
 <d6e0eed6-4267-fca9-59e1-02d16e17ff34@nvidia.com>
 <20200416033715.hscztwkxie2o5i3r@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200416033715.hscztwkxie2o5i3r@vireshk-i7>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@rjwysocki.net, catalin.marinas@arm.com, will@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bbasu@nvidia.com, mperttunen@nvidia.com, Sumit Gupta <sumitg@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 16/04/20 9:07 AM, Viresh Kumar wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 15-04-20, 16:55, Sumit Gupta wrote:
>>
>>
>> On 14/04/20 11:15 AM, Viresh Kumar wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On 13-04-20, 17:50, Sumit Gupta wrote:
>>>> This was done considering long delay value as explained previously.
>>>> Do you think that smp_call_function_single() would be better than work queue
>>>> here?
>>>
>>> Don't work with assumptions, you should test both and see which one
>>> works better. Workqueue should never be faster than
>>> smp_call_function_single() with my understanding.
>> Checked the time taken and its almost same in both cases.
>> Earlier we used smp_call_function_single(), but delay time period was small
>> in that SOC. In T194, the time period was more. So, this is an optimization
>> done because using work queue has advantage as interrupts will not be
>> disabled for that period.
> 
> Hmm, okay, keep the workqueue and mention the required details in a
> comment for everyone to understand why the implementation is done that
> way.
> 

sure, thank you!

> --
> viresh
> 
