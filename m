From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC PATCH] dt: Tegra XUSB padctl: per-lane PHYs and USB lane map
Date: Thu, 22 Oct 2015 01:40:25 +0530
Message-ID: <5627F131.7070008@ti.com>
References: <1445297442-21439-1-git-send-email-swarren@wwwdotorg.org>
 <20151021121513.GA24168@ulmo> <5627CE09.3090304@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5627CE09.3090304-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Wednesday 21 October 2015 11:10 PM, Stephen Warren wrote:
> On 10/21/2015 06:15 AM, Thierry Reding wrote:
>> On Mon, Oct 19, 2015 at 05:30:42PM -0600, Stephen Warren wrote:
>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> Convert the binding to provide a PHY per lane, rather than a PHY per
>>> "pad" block in the hardware. This will allow the driver to easily know
>>> which lanes are used by clients, and thus only enable those lanes, and
>>> generally better aligns with the fact the hardware has configuration per
>>> lane rather than solely configuration per "pad" block.
>>>
>>> Add entries to pinctrl-tegra-xusb.h to enumerate all "pad" blocks on
>>> Tegra210, which will allow an XUSB DT node to reference the PHYs it
>>> needs.
>>>
>>> Add an nvidia,ss-port-map register to allow configuration of the
>>> XUSB_PADCTL_SS_PORT_MAP register.
> 
>> According to Kishon's latest recommendation, the padctl binding should
>> probably look more like this:
>>
>>     padctl@0,7009f000 {
>>         ...
>>
>>         phys {
>>             pcie {
>>                 /* 5 subnodes on Tegra124, 7 on Tegra210 */
>>                 pcie-0 {
>>                     ...
>>                 };
>>
>>                 ...
>>             };
> 
> I noticed that he mentioned a separate node per PHY brick or PHY.
> 
> That seems like an odd requirement, or even recommendation, since the
> PHY bindings, like (almost?) all other DT provider/consumer bindings,
> use a phandle+specifier to indicate which resource is being provided. As

A lot of that was added before PHY core was better able to handle multi
phy PHY provider. Using phandle+specifier makes the driver code do lot
of stuff just to find the PHY which was unnecessary. This can be avoided
just by modeling the dt node properly and using the correct phandle in
the controller dt node.

> such, there's no absolute need to represent objects as DT nodes,
> although there may be other good arguments for doing so.

yeah, that would be a better representation of the hw and avoid lot of
useless stuff in the driver.

Thanks
Kishon
