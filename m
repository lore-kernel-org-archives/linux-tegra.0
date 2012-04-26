From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCHv3 2/4] ARM: tegra: Add SMMU enabler in AHB
Date: Thu, 26 Apr 2012 14:32:56 -0600
Message-ID: <4F99B0F8.4040308@wwwdotorg.org>
References: <1335352072-4001-1-git-send-email-hdoyu@nvidia.com> <1335352072-4001-2-git-send-email-hdoyu@nvidia.com> <4F99A821.2040406@wwwdotorg.org> <20120426202610.GA30690@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120426202610.GA30690-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, H Hartley Sweeten <hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/26/2012 02:26 PM, Felipe Balbi wrote:
> Hi,
> 
> On Thu, Apr 26, 2012 at 01:55:13PM -0600, Stephen Warren wrote:
>> On 04/25/2012 05:07 AM, Hiroshi DOYU wrote:
>>> Add extern func, "tegra_ahb_enable_smmu()" to inform AHB that SMMU is
>>> ready.
>>
>>> +#ifdef CONFIG_ARCH_TEGRA_3x_SOC
>>> +static int __tegra_ahb_enable_smmu(struct device *dev, void *data)
>> ...
>>> +int tegra_ahb_enable_smmu(void)
>>> +{
>>> +	return driver_for_each_device(&tegra_ahb_driver.driver, NULL, NULL,
>>> +				      __tegra_ahb_enable_smmu);
>>> +}
>>> +EXPORT_SYMBOL(tegra_ahb_enable_smmu);
>>> +#endif
>>
>> That looks like a neat solution to avoid having a global device object.
> 
> except that it won't work always. If you happen to have two AHB bridges,
> each using a separate smmu but only one smmu is ready, this will set
> SMMU_INIT_DONE on both bridges.

There is only 1.

>> However, if that driver_for_each_device finds no devices, the function
>> still succeeds. That doesn't seem right, and doesn't allow e.g. the SMMU
>> to defer its probe until the AHB driver has completed.
>>
>> Perhaps add a local int variable to tegra_ahb_enable_smmu(), pass the
>> address to __tegra_ahb_enable_smmu, and have it increment the int. Then,
>> after calling driver_for_each_device,:
>>
>> if (!ahb_device_count)
>>     return -EPROBE_DEFER
>> if (WARN_ON(ahb_device_count != 1))
>>     return -EINVAL;
>> return 0;
> 
> that would look, well, weird. Why don't you just different initcall
> leves for this ? Maybe smmu goes into postcore_initcall() and tegra_ahb
> goes into postcore_initcall_sync() ?? then you know that SMMU will be
> ready by the time you call tegra_ahb probe. Well, unless smmu's probe
> fail, but then again, IIUC it won't work anyway...

Uggh. I'd rather all these devices just got instantiated from device
tree and relied on deferred probe to manage any ordering, rather than
playing complex games with multiple initcall levels (and in the end
probably having to invent more and more initcall levels to correctly
represent all the dependencies).
