From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra: Fix CPU compatible string for Tegra132
Date: Thu, 26 May 2016 10:29:12 -0600
Message-ID: <57472458.1010802@wwwdotorg.org>
References: <20160523074221.7135-1-josephl@nvidia.com>
 <574509E7.4030208@nvidia.com> <5745C7E4.2050908@wwwdotorg.org>
 <5746C1F1.6070703@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5746C1F1.6070703-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/26/2016 03:29 AM, Joseph Lo wrote:
> On 05/25/2016 11:42 PM, Stephen Warren wrote:
>> On 05/24/2016 08:11 PM, Joseph Lo wrote:
>>> On 05/23/2016 03:42 PM, Joseph Lo wrote:
>>>> As per commit f634da375fc96 ("Documentation: DT bindings: add nvidia,
>>>> tegra132-denver compatible string"), fixing the CPU compatible string
>>>> for
>>>> Tegra132 to match the binding document currently.
>>>>
>>>> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>   arch/arm64/boot/dts/nvidia/tegra132.dtsi | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
>>>> b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
>>>> index 2013f8916084..7b1cdc029de3 100644
>>>> --- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
>>>> @@ -964,13 +964,13 @@
>>>>
>>>>           cpu@0 {
>>>>               device_type = "cpu";
>>>> -            compatible = "nvidia,denver", "arm,armv8";
>>>> +            compatible = "nvidia,tegra132-denver", "arm,armv8";
>>>
>>> Hi Stephen, Thierry,
>>>
>>> Should we fix this or fix the compatible string in the binding document
>>> as just "nvidia,denver" to represent all the Devner CPU revisions just
>>> like some other CPUs did? e.g. arm,cortex-a57, which represents all the
>>> A57 revisions.
>>
>> I would expect compatible to be:
>>
>> compatible = "nvidia,tegra132-denver", "nvidia,denver", "arm,armv8";
>
> Because we don't have "nvidia,denver" binding in the document, to do
> what you said, supposely I should add that first and fix the binding for
> Tegra132, right?

Yes.

>> The "nvidia,denver" entry is already present, and hence probably
>> shouldn't be removed. It can represent "Denver 1.0". We should add the
>> T132 entry to indicate the specific implementation. Admittedly right now
>> there's a 1:1 relation between SoC and Denver version. Either/both of
>> those could in theory be required to trigger specific bug-fixes/WARs.
>>
>> For later chips which have a different Denver version, I'd expect to see
>> something like:
>>
>> compatible = "nvidia,tegraNNN-denver", "nvidia,denverMMM", "arm,armv8";
>>
>> ... where NNN is the SoC version/name and MMM is the Denver version.
>> There could be extra entries in the property if the new versions are
>> backwards-compatible with old versions.
>
> Because it's 1:1 relationship, if we have new cores coming later, we
> should add both of the compatible string of SoC version and CPU core
> version in the ARM CPU binding document, is that correct?

Yes. I suspect that on some future SoCs, it won't be a 1:1 relation; 
we'll re-use a Denver version across multiple SoCs, just like we do with 
some ARM CPU models, but we'll see.
