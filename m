From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V3 4/4] soc/tegra: pmc: Use the new reset APIs to manage
 reset controllers
Date: Tue, 25 Apr 2017 11:54:54 +0100
Message-ID: <afdb02e5-9299-fec9-9451-8271c220744b@nvidia.com>
References: <1492514488-27385-1-git-send-email-vivek.gautam@codeaurora.org>
 <1492514488-27385-5-git-send-email-vivek.gautam@codeaurora.org>
 <e87a846b-4bbf-03cf-f3a6-99d5e468425c@nvidia.com>
 <afcddcbe-7086-2739-6de2-84f5c1d34374@codeaurora.org>
 <b3f2cbe5-4a1a-2f7b-2e4a-6a06eeadc890@nvidia.com>
 <1493116400.2394.32.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1493116400.2394.32.camel@pengutronix.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>, swarren@wwwdotorg.org, balbi@kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, thierry.reding@gmail.com, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


On 25/04/17 11:33, Philipp Zabel wrote:
> On Tue, 2017-04-25 at 11:05 +0100, Jon Hunter wrote:
>> On 25/04/17 05:15, Vivek Gautam wrote:
>>> On 04/24/2017 06:15 PM, Jon Hunter wrote:
>>>> On 18/04/17 12:21, Vivek Gautam wrote:
>>>>> Make use of reset_control_array_*() set of APIs to manage
>>>>> an array of reset controllers available with the device.
>>>> Before we apply this patch, I need to check to see if the order of the
>>>> resets managed by the PMC driver matter. Today the order of the resets
>>>> is determined by the order they appear in the DT node and although the
>>>> new APIs work in the same way they do not guarantee this. So let me
>>>> check to see if we can any concerns about ordering here. Otherwise would
>>>> be nice to use these APIs.
>>>
>>> Right, that will be perfect.
>>
>> So I don't see any restrictions here and so I think this change is fine.
> 
> Thank you for checking.
> 
>> BTW, for the DT case, is there any reason why we don't just say the
>> order will be determine by the order the resets are list in the DT node?
> 
> I'd rather not make any promises, so I don't have to care about keeping
> them. This makes it easier to think about and allows for more freedom in
> changing the core code if needed.
> 
> What if in the future there is a use case for enabling a bunch of resets
> by flipping a number of bits in a single register at the same time? Or
> if people accidentally depend on the ordering when in reality there is a
> small delay necessary between assertions that just happens to be hidden
> by the framework overhead?
> 
> If there is a use case for an array of reset controls that must be
> (de)asserted in a fixed order and doesn't need any delay between the
> steps and is not suitable to be described by named resets for some
> reason, we can discuss this. Until then, I'm happy that tegra pmc can
> handle arrays without any particular ordering.

OK, makes sense.

Thanks
Jon

-- 
nvpublic
