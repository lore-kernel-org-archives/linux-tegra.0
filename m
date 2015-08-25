From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [RFC PATCH 1/7] DMA: tegra-apb: Correct runtime-pm usage
Date: Wed, 26 Aug 2015 00:46:46 +0200
Message-ID: <55DCF056.40004@intel.com>
References: <1439905755-25150-1-git-send-email-jonathanh@nvidia.com> <55DB1AA9.7090906@nvidia.com> <20150824142143.GK13546@localhost> <13590312.K3yoQT5YDc@vostro.rjw.lan> <55DC375F.1070907@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55DC375F.1070907@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vinod Koul <vinod.koul@intel.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 8/25/2015 11:37 AM, Jon Hunter wrote:
> On 25/08/15 01:04, Rafael J. Wysocki wrote:
>> On Monday, August 24, 2015 07:51:43 PM Vinod Koul wrote:
>>> On Mon, Aug 24, 2015 at 02:22:49PM +0100, Jon Hunter wrote:
>>>> On 24/08/15 10:22, Vinod Koul wrote:
>>>>> On Mon, Aug 24, 2015 at 09:47:13AM +0100, Jon Hunter wrote:
>>>>>> On 23/08/15 15:17, Vinod Koul wrote:
>>>>>>> On Tue, Aug 18, 2015 at 02:49:09PM +0100, Jon Hunter wrote:
>>>>>>>
>>>>>>>> @@ -1543,7 +1531,7 @@ static int tegra_dma_pm_suspend(struct device *dev)
>>>>>>>>   	int ret;
>>>>>>>>   
>>>>>>>>   	/* Enable clock before accessing register */
>>>>>>>> -	ret = tegra_dma_runtime_resume(dev);
>>>>>>>> +	ret = pm_runtime_get_sync(dev);
>>>>>>> why is this required ?
>>>>>> Because the clock could be disabled when this function is called. This
>>>>>> function saves the DMA context so that if the context is lost during
>>>>>> suspend, it can be restored.
>>>>> Have you verified this? Coz my understanding is that when PM does suspend it
>>>>> will esnure you are runtime resume if runtime suspended and then will do
>>>>> suspend.
>>>>> So you do not need to do above
>>>> I see what you are saying. I did some testing with ftrace today to trace
>>>> rpm and suspend/resume calls. If the dma controller is runtime suspended
>>>> and I do not call pm_runtime_get_sync() above then I do not see any
>>>> runtime resume of the dma controller prior to suspend. Now I was hoping
>>>> that this would cause a complete kernel crash but it did not and so the
>>>> DMA clock did not appear to be needed here (at least on the one board I
>>>> tested). However, I would not go as far as to remove this and prefer to
>>>> keep as above.
>>> Okay am adding Rafael here for his recommendations.
>> Well, and what is the question I'm supposed to answer, exactly?
>>
>> I was in Seattle last week, so haven't been following this closely.
>>
>>> I have tested in past and if my driver was runtime suspended we were resumed
>>> prior to being suspended. So I am not sure why you did not see that
>>> behaviour, and if that is right we don't need to force resume here
>> We're adding code for skipping runtime-resume-before-system-suspend, because
>> it is not desirable in general.
>>
>> The rule of thumb is that if you know you need to change the device's settings
>> (eg. because of wakeup being enabled or not) for system suspend and that
>> requires the device to be resumed, resume it.  It can stay suspended
>> otherwise.
> Thanks Rafael.
>
> Vinod, thinking about this some more, I am wondering if it is just
> better to get rid of the suspend/resume callbacks and simply handling
> the state in the runtime suspend/resume callbacks. I think that would be
> safe too, because once the clock has been disabled, then who knows what
> the context state will be.

One caveat here: system suspend may be invoked at any time, so you need 
to ensure that the device is properly suspended when that happens.

I believe you at least need a ->suspend callback for that.

Cheers,
Rafael
