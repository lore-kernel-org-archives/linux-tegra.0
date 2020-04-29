From: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [TEGRA194_CPUFREQ Patch 1/3] firmware: tegra: adding function
 to get BPMP data
Date: Wed, 29 Apr 2020 13:51:19 +0530
Message-ID: <e320f849-bbd0-3ab9-64b2-d54da97500a4@nvidia.com>
References: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
 <20191203174229.GA1721849@ulmo>
 <9404232d-84ce-a117-89dd-f2d8de80993e@kapsi.fi>
 <20191204091703.d32to5omdm3eynon@vireshk-i7> <20191204093339.GA2784830@ulmo>
 <20191204095138.rrul5vxnkprfwmku@vireshk-i7> <20200407100520.GA1720957@ulmo>
 <20200427071800.GA3451400@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200427071800.GA3451400@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>
Cc: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



On 27/04/20 12:48 PM, Thierry Reding wrote:
> On Tue, Apr 07, 2020 at 12:05:20PM +0200, Thierry Reding wrote:
>> On Wed, Dec 04, 2019 at 03:21:38PM +0530, Viresh Kumar wrote:
>>> On 04-12-19, 10:33, Thierry Reding wrote:
>>>> Yeah, the code that registers this device is in drivers/base/cpu.c in
>>>> register_cpu(). It even retrieves the device tree node for the CPU from
>>>> device tree and stores it in cpu->dev.of_node, so we should be able to
>>>> just pass &cpu->dev to tegra_bpmp_get() in order to retrieve a reference
>>>> to the BPMP.
>>>>
>>>> That said, I'm wondering if perhaps we could just add a compatible
>>>> string to the /cpus node for cases like this where we don't have an
>>>> actual device representing the CPU complex. There are a number of CPU
>>>> frequency drivers that register dummy devices just so that they have
>>>> something to bind a driver to.
>>>>
>>>> If we allow the /cpus node to represent the CPU complex (if no other
>>>> "device" does that yet), we can add a compatible string and have the
>>>> cpufreq driver match on that.
>>>>
>>>> Of course this would be slightly difficult to retrofit into existing
>>>> drivers because they'd need to remain backwards compatible with existing
>>>> device trees. But it would allow future drivers to do this a little more
>>>> elegantly. For some SoCs this may not matter, but especially once you
>>>> start depending on additional resources this would come in handy.
>>>>
>>>> Adding Rob and the device tree mailing list for feedback on this idea.
>>>
>>> Took some time to find this thread, but something around this was
>>> suggested by Rafael earlier.
>>>
>>> https://lore.kernel.org/lkml/8139001.Q4eV8YG1Il-sKB8Sp2ER+y1GS7QM15AGw@public.gmane.org/
>>
>> I gave this a try and came up with the following:
>>
>> --- >8 ---
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
>> index f4ede86e32b4..e4462f95f0b3 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
>> @@ -1764,6 +1764,9 @@ bpmp_thermal: thermal {
>>   	};
>>   
>>   	cpus {
>> +		compatible = "nvidia,tegra194-ccplex";
>> +		nvidia,bpmp = <&bpmp>;
>> +
>>   		#address-cells = <1>;
>>   		#size-cells = <0>;
>>   
>> --- >8 ---
>>
>> Now I can do something rougly like this, although I have a more complete
>> patch locally that also gets rid of all the global variables because we
>> now actually have a struct platform_device that we can anchor everything
>> at:
>>
>> --- >8 ---
>> static const struct of_device_id tegra194_cpufreq_of_match[] = {
>> 	{ .compatible = "nvidia,tegra194-ccplex", },
>> 	{ /* sentinel */ }
>> };
>> MODULE_DEVICE_TABLE(of, tegra194_cpufreq_of_match);
>>
>> static struct platform_driver tegra194_ccplex_driver = {
>> 	.driver = {
>> 		.name = "tegra194-cpufreq",
>> 		.of_match_table = tegra194_cpufreq_of_match,
>> 	},
>> 	.probe = tegra194_cpufreq_probe,
>> 	.remove = tegra194_cpufreq_remove,
>> };
>> module_platform_driver(tegra194_ccplex_driver);
>> --- >8 ---
>>
>> I don't think that's exactly what Rafael (Cc'ed) had in mind, since the
>> above thread seems to have mostly talked about binding a driver to each
>> individual CPU.
>>
>> But this seems a lot better than having to instantiate a device from
>> scratch just so that a driver can bind to it and it allows additional
>> properties to be associated with the CCPLEX device.
>>
>> Rob, any thoughts on this from a device tree point of view? The /cpus
>> bindings don't mention the compatible property, but there doesn't seem
>> to be anything in the bindings that would prohibit its use.
>>
>> If we can agree on that, I can forward my local changes to Sumit for
>> inclusion or reference.
> 
> Rob, do you see any reason why we shouldn't be able to use a compatible
> string in the /cpus node for devices such as Tegra194 where there is no
> dedicated hardware block for the CCPLEX?
> 
> Thierry
> 

Ping.
Please suggest if we can add compatible string in the '/cpus' node.
If not then i propose accepting the current patch to get BPMP data 
without adding any property in respective driver's DT node.
We can push separate patch later if we need to add compatible string in 
the '/cpus' node or create new DT node for cpufreq.

Regards,
Sumit
