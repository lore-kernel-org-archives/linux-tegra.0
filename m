From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/8] of: Add Tegra124 EMC bindings
Date: Tue, 22 Jul 2014 10:45:08 -0600
Message-ID: <53CE9514.1050903@wwwdotorg.org>
References: <1405088313-20048-1-git-send-email-mperttunen@nvidia.com>	<1405088313-20048-6-git-send-email-mperttunen@nvidia.com>	<CAL1qeaGHfjQhLHvgzt85hmbuY4FOG5-k=f80=CNvzPDEgi9_6w@mail.gmail.com>	<53CD860B.7030800@wwwdotorg.org> <CAL1qeaHtGQxCO3cGdeCRUYuk6mxei6z1B63-iZdBECEbFqGhHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaHtGQxCO3cGdeCRUYuk6mxei6z1B63-iZdBECEbFqGhHw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/21/2014 04:52 PM, Andrew Bresticker wrote:
> On Mon, Jul 21, 2014 at 2:28 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 07/11/2014 10:43 AM, Andrew Bresticker wrote:
>>> On Fri, Jul 11, 2014 at 7:18 AM, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>> Add binding documentation for the nvidia,tegra124-emc device tree
>>>> node.
>>>
>>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt b/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
>>>
>>>> +Required properties :
>>>> +- compatible : "nvidia,tegra124-emc".
>>>> +- reg : Should contain 1 or 2 entries:
>>>> +  - EMC register set
>>>> +  - MC register set : Required only if no node with
>>>> +    'compatible = "nvidia,tegra124-mc"' exists. The MC register set
>>>> +    is first read from the MC node. If it doesn't exist, it is read
>>>> +    from this property.
>>>> +- timings : Should contain 1 entry for each supported clock rate.
>>>> +  Entries should be named "timing@n" where n is a 0-based increasing
>>>> +  number. The timings must be listed in rate-ascending order.
>>>
>>> There are upcoming boards which support multiple DRAM configurations
>>> and require a separate set of timings for each configuration.  Could
>>> we instead have multiple sets of timings with the proper one selected
>>> at runtime by RAM code, as reported by PMC_STRAPPING_OPT_A_0?
>>> Something like:
>>>
>>> emc {
>>>         emc-table@0 {
>>>                 nvidia,ram-code = <0>;
>>>                 timing@0 {
>>>                         ...
>>>                 };
>>>                 ...
>>>         };
>>
>> Until recently, there was a binding for Tegra20 EMC in mainline. We
>> should make sure the Tegra124 driver (or rather binding...) is at least
>> as feature-ful as that was.
>>
>> Furthermore, I thought that with some boards, there were more RAM
>> options that there were available RAM code strap bits. I assume that in
>> mainline, we'll simply have different base DT files for the different
>> sets of configurations? Or, will we want to add another level to the DT
>> to represent different sets of RAM code values? I'm not sure what data
>> source the bootloader uses to determine which set of RAM configuration
>> to use when there aren't enough entries in the BCT for the boot ROM to
>> do this automatically, and whether we have any way to get that value
>> into the kernel, so it could use it for the extra DT level lookup?
> 
> For the ChromeOS boards at least we are neither limited by the number
> of strapping bits (4) nor the number of BCT entries supported by the
> boot ROM (since coreboot does not rely on the boot ROM for SDRAM
> initialization), so having a single set of SDRAM configurations for
> each board, indexed by APBDEV_PMC_STRAPPING_OPT_A_0[7:4] works just
> fine.

Does the bootloader adjust the DT that's passed to the kernel so that
only the relevant single set of EMC timings is contained in the DT?

On a system where the boot ROM initializes RAM, and where the HW design
might have multiple SDRAM configuration, here's what usually happens:

a) The BCT contains N sets of SDRAM configurations.

b) The boot ROM reads the SDRAM strapping bits, and uses them to pick
the correct SDRAM configuration from the N sets in the BCT.

c) The kernel DT has N sets of SDRAM configurations.

d) The kernel reads the SDRAM strapping bits, and uses them to pick the
correct SDRAM configuration from the N sets in the DT.

On the ChromeOS boards (so (a) and (b) above are irrelevant) where N is
too large to fit into APBDEV_PMC_STRAPPING_OPT_A_0[7:4], (c) and (d)
won't work. I assume the kernel DT therefore must be adjusted to only
contain the single SDRAM configuration that is relevant for the current HW?

(isn't STRAPPING_OPT_A split into 2 2-bit fields; 2 bits for SDRAM index
and 2 bits for boot flash index, so max N is quite small?)
