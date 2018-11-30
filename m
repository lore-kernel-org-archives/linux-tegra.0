From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH v3 3/3] thermal: tegra: parse sensor id before sensor
 register
Date: Fri, 30 Nov 2018 11:10:08 +0800
Message-ID: <9beaf6ea-14bb-1944-2372-eb615f04f9e3@nvidia.com>
References: <1543383877-20555-1-git-send-email-wni@nvidia.com>
 <1543383877-20555-4-git-send-email-wni@nvidia.com>
 <20181128102520.GC20723@ulmo>
 <9c373693-1d3c-cd02-4972-dde338651c0e@nvidia.com>
 <20181129171304.GB18128@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129171304.GB18128@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, edubezval@gmail.com, srikars@nvidia.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 30/11/2018 1:13 AM, Thierry Reding wrote:
> On Thu, Nov 29, 2018 at 01:55:02PM +0800, Wei Ni wrote:
>> On 28/11/2018 6:25 PM, Thierry Reding wrote:
>>> On Wed, Nov 28, 2018 at 01:44:37PM +0800, Wei Ni wrote:
> [...]
>>>> +	bool ret = false;
>>>> +	struct of_phandle_args sensor_specs;
>>>> +	struct device_node *np, *sensor_np;
>>>> +
>>>> +	np = of_find_node_by_name(NULL, "thermal-zones");
>>>> +	if (!np)
>>>> +		return ret;
>>>> +
>>>> +	sensor_np = of_get_next_child(np, NULL);
>>>> +	for_each_available_child_of_node(np, sensor_np) {
>>>
>>> Aren't we leaking np here? I think we need of_node_put() after
>>> of_get_next_child() to make sure the reference to the "thermal-zones"
>>> node is properly released.
>>
>> No, we will not leak np here. Because the
>> for_each_available_child_of_node will call
>> of_get_next_available_child(), which will call of_node_put(prev) to
>> decrease refcount of the prev node. So we just need to of_node_put the
>> last node after break from this for block.
> 
> Okay, looks like I misinterpreted what you were doing there. I thought
> that for_each_available_child_of_node() took the child as first argument
> and the parent as second and therefore np would be overwritten by the
> first assignment in the macro.
> 
> But looking at this more closely I think there's something else wrong
> here. for_each_available_child_of_node() is defined as:
> 
> 	for_each_available_child_of_node(parent, child)
> 
> so in the above, np will be the parent and sensor_np the child. Why do
> you have to do
> 
> 	sensor_np = of_get_next_child(np, NULL);
> 
> ? That's already done as part of the loop in the macro, right? So does
> that not mean we get two references and we leak the first one? Can the
> above not simply been dropped?

It's so sorry, it's my mistake, we should remove this line, it was my
develop code, forgot to remove it.
Will fix it in next version.

Thanks.

> 
> Thierry
> 
