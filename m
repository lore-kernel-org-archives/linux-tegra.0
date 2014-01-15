From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/2] drm/tegra: Obtain head number from DT
Date: Wed, 15 Jan 2014 10:25:52 -0700
Message-ID: <52D6C4A0.5070807@wwwdotorg.org>
References: <1389710758-29444-1-git-send-email-treding@nvidia.com> <1389710758-29444-3-git-send-email-treding@nvidia.com> <52D5798F.1020500@wwwdotorg.org> <20140115090627.GC27135@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140115090627.GC27135-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/15/2014 02:06 AM, Thierry Reding wrote:
> On Tue, Jan 14, 2014 at 10:53:19AM -0700, Stephen Warren wrote:
>> On 01/14/2014 07:45 AM, Thierry Reding wrote:
>>> The head number of a given display controller is fixed in hardware and
>>> required to program outputs appropriately. Relying on the driver probe
>>> order to determine this number will not work, since that could yield a
>>> situation where the second head was probed first and would be assigned
>>> head number 0 instead of 1.
>>>
>>> By explicitly specifying the head number in the device tree, it is no
>>> longer necessary to rely on these assumptions. As a fallback, if the
>>> property isn't available, derive the head number from the display
>>> controller node's position in the device tree. That's somewhat more
>>> reliable than the previous default but not a proper solution.

>>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
>>
>>> +static int tegra_dc_parse_dt(struct tegra_dc *dc)
>>> +{
>>> +	struct device_node *np;
>>> +	u32 value = 0;
>>> +	int err;
>>> +
>>> +	err = of_property_read_u32(dc->dev->of_node, "nvidia,head", &value);
>>
>> If of_property_read_u32() returns an error, does it guarantee that value
>> is left unchanged? I suspect it'd be safer to add ...
> 
> That's the way it's always been at least. of_property_read_u32() ends up
> calling of_property_read_u32_array(), which looking at the code only
> modifies the out_values parameter when it knows that it will succeed.
> 
> Furthermore the function's kernel-doc explicitly says that "out_values
> is modified only if a valid u32 value can be decoded" (i.e. on success).

OK, that last bit is the important part. So, this is fine.
