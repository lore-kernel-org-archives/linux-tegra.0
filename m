From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [v2 1/4] ARM: tegra20: create a DT header defining CLK IDs
Date: Fri, 15 Feb 2013 09:45:45 -0700
Message-ID: <511E6639.1090909@wwwdotorg.org>
References: <1360868369-20093-1-git-send-email-hdoyu@nvidia.com>
 <1360868369-20093-2-git-send-email-hdoyu@nvidia.com>
 <511D45E0.1080105@wwwdotorg.org>
 <20130215092407.GO3073@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130215092407.GO3073-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/15/2013 02:24 AM, Peter De Schrijver wrote:
> On Thu, Feb 14, 2013 at 09:15:28PM +0100, Stephen Warren wrote:
>> On 02/14/2013 11:59 AM, Hiroshi Doyu wrote:
>>> To replace magic number in tegra_car:
>>>
>>> -               clocks = <&tegra_car 28>;
>>> +               clocks = <&tegra_car CLK_HOST1X>;
>>
>>> diff --git a/arch/arm/boot/dts/tegra20-car.h b/arch/arm/boot/dts/tegra20-car.h
>>
>> Sorry, forgot a couple small comments the last time around.
>>
>> This file should probably have some header indicating which binding it
>> describes, rather like the GPIO header in my patch series.
>>
>>> +#define CLK_CPU 0
>>
>> I'd suggest naming that TEGRA20_CLK_CPU, so that the various different
>> clock headers don't conflict. It's not too likely that more than one of
>> the /Tegra/ clock headers will be included at once, but it doesn't seem
>> that unlikely that a board file could end up having a Tegra clock header
>> included plus various other clock headers for some other chip that has
>> some clock outputs.
>>
> 
> I would suggest removing this clock. It's not actually implemented in the CCF
> and rather useless. If you would gate the CPU clock from the CPU by writing to
> this register, how would you ungate it? :) Note that this would gate the clock
> to all CPUs.

(Note that my comment was re: all clocks, not just that one clock)

Can't the PMC or flow-controller ungate the clock based on some event?
Either way, that clock definition exists in HW, right? So I don't think
there's actually any harm in including the definition in the binding
even if we never implement/use it.
