From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 2/4] gpu: host1x: Enable gather filter
Date: Sun, 20 Aug 2017 19:59:39 +0300
Message-ID: <f42a2854-d70c-ef40-7d45-ec14f581c337@gmail.com>
References: <20170818161553.27597-1-mperttunen@nvidia.com>
 <20170818161553.27597-3-mperttunen@nvidia.com>
 <78e11be6-1e4f-18e0-cdc0-13db4bf57bf6@gmail.com>
 <e9c8124c-fc3a-4f58-db88-3809be2969d9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e9c8124c-fc3a-4f58-db88-3809be2969d9@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 20.08.2017 19:44, Dmitry Osipenko wrote:
> On 20.08.2017 19:24, Dmitry Osipenko wrote:
>> On 18.08.2017 19:15, Mikko Perttunen wrote:
>>> The gather filter is a feature present on Tegra124 and newer where the
>>> hardware prevents GATHERed command buffers from executing commands
>>> normally reserved for the CDMA pushbuffer which is maintained by the
>>> kernel driver.
>>>
>>> This commit enables the gather filter on all supporting hardware.
>>>
>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>> ---
>>>  drivers/gpu/host1x/hw/channel_hw.c          | 22 ++++++++++++++++++++++
>>>  drivers/gpu/host1x/hw/hw_host1x04_channel.h | 12 ++++++++++++
>>>  drivers/gpu/host1x/hw/hw_host1x05_channel.h | 12 ++++++++++++
>>>  3 files changed, 46 insertions(+)
>>>
>>> diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
>>> index 0161da331702..5c0dc6bb51d1 100644
>>> --- a/drivers/gpu/host1x/hw/channel_hw.c
>>> +++ b/drivers/gpu/host1x/hw/channel_hw.c
>>> @@ -181,10 +181,32 @@ static int channel_submit(struct host1x_job *job)
>>>  	return err;
>>>  }
>>>  
>>> +static void enable_gather_filter(struct host1x *host,
>>> +				 struct host1x_channel *ch)
>>> +{
>>> +#if HOST1X_HW >= 6
>>> +	u32 val;
>>> +
>>> +	if (!host->hv_regs)
>>> +		return;
>>
>> Is it really possible that gather filter could be not present on HW without
>> hypervisor? Maybe there is other way to enable it in that case?
>>
>> Is possible at all that hypervisor could be missed?
> 
> BTW, this is also incoherent with the 'syncpoint protection' patch which doesn't
> check for hypervisor presence.
> 

However, I noticed that check and it's wrongly placed ;) See comment to the
'syncpoint protection' patch.

-- 
Dmitry
