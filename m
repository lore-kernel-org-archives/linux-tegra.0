From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Mon, 15 Oct 2012 10:11:50 -0600
Message-ID: <507C35C6.20705@wwwdotorg.org>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de> <50775803.1010209@wwwdotorg.org> <20121012050957.GA29881@avionic-0098.mockup.avionic-design.de> <507888D0.1090103@wwwdotorg.org> <20121013204223.GA24354@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121013204223.GA24354-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/13/2012 02:42 PM, Thierry Reding wrote:
> On Fri, Oct 12, 2012 at 03:17:04PM -0600, Stephen Warren wrote:
>> On 10/11/2012 11:09 PM, Thierry Reding wrote:
>>> On Thu, Oct 11, 2012 at 05:36:35PM -0600, Stephen Warren
>>> wrote:
> [...]
>>>> The code in clock.c uses lots of clk_get_sys() calls with 
>>>> hard-coded clock names. We really should be using the common 
>>>> clock DT bindings for this instead of hard-coding names. This
>>>> is especially true since the names differ on different SoCs,
>>>> so there's a ton of
>>>> of_device_is_compatible(output->dev->of_node, 
>>>> "nvidia,tegra30-hdmi") in this code.
>>> 
>>> I don't quite see how that is supposed to work. Wouldn't that
>>> mean that we needed to setup various entries in the clock
>>> tables to be able to look the clocks up by generic names? Like
>>> pll_d would need to be the "parent" clock of "tegra-hdmi" or
>>> similar. In that case we could call clk_get(hdmi->dev,
>>> "parent") instead. Is that what you had in mind?
>> 
>> There are two ways this could work:
>> 
>> 1)
>> 
>> All clocks needed could be represented in the node of that device
>> (or perhaps in the DC node?) For example, perhaps hdmi might
>> contain:
>> 
>> clocks = <&car TEGRA_CLK_PLL_D> <&car TEGRA_CLK_PLL_D_OUT_0> 
>> <&car TEGRA_CLK_HDMI> ...; clock-names = "pll_d", "pll_d_out_0",
>> "hdmi", ...;
>> 
>> That should work (I think) with pretty much no modification to
>> the current code, other than calling clk_get(dev, "hdmi") rather
>> than clk_get_sys(NULL, "hdmi").
> 
> I thought DT support didn't work for Tegra yet. If that works we
> should probably get rid of the DRM related entries in the clock
> tables and put the information in the DT regardless of which of the
> alternatives is implemented.

Certainly, the Tegra clock driver itself doesn't support DT, i.e.
isn't a DT clock provider. So, this won't work completely right now. I
believe Prashant had patches to implement this though. Prashant,
what's the status on those?

It looks like the core common clock DT support did make it into 3.7,
so any dependencies are probably contained within the Tegra tree.

Still, perhaps this is something we can clean up later; we'd probably
benefit more from having some form of tegra-drm in place earlier
rather than having it later with perfect clock usage, although DT
binding churn:-(
