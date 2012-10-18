From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Thu, 18 Oct 2012 16:14:11 -0600
Message-ID: <50807F33.1050805@wwwdotorg.org>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de> <50775803.1010209@wwwdotorg.org> <20121012050957.GA29881@avionic-0098.mockup.avionic-design.de> <507888D0.1090103@wwwdotorg.org> <20121016082827.GI3196@tbergstrom-lnx.Nvidia.com> <20121017065547.GE21783@avionic-0098.mockup.avionic-design.de> <507ECCCD.7000600@wwwdotorg.org> <D6C615D3E4730340AE82D5BD856631C0A1DA306B31@HQMAIL02.nvidia.com> <20121017191240.GA22570@avionic-0098.mockup.avionic-design.de> <507F0A03.2050008@wwwdotorg.org> <D6C615D3E4730340AE82D5BD856631C0A1DA306B39@HQMAIL02.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D6C615D3E4730340AE82D5BD856631C0A1DA306B39-QfAaPSPn5qZDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/17/2012 02:08 PM, Jon Mayo wrote:
> Stephen Warren wrote at Wednesday, October 17, 2012 12:42 PM:
>> On 10/17/2012 01:12 PM, Thierry Reding wrote:
>>> On Wed, Oct 17, 2012 at 11:04:05AM -0700, Jon Mayo wrote:
...
>>>> On T30, HDMI will work with pll_d, but I'm tipping my hand and
>>>> telling you that if you always use pll_d2 you won't have to mess
>>>> with this code in the next few chips. :)
>>>
>>> If we make this configurable in the device tree, we could provide
>>> both the "hdmi" and "base-clock" clocks, where base-clock defaults
>>> to pll_d or pll_d2 depending on the Tegra generation. If some board
>>> requires a more exotic setup it can override the clocks in the
>>> board DTS.
>>
>> I think if the parenting is going to be static, lets not have tegradrm
>> do it, but rather encode it into one of
>> arch/arm/mach-tegra/{common,board-dt-tegra[23]0}.c. Eventually, we
>> wish to replace the clock setup tables in those files with tables in
>> device tree, so they can differ easily per-board, which would also
>> handle the DSI situation well.
> 
> Well it's not entirely static. The clock parent should depend on the
> output type. rather than on which display controller you are using.
> Each DC can be configured for various output types. The output types
> can be represented in device-tree if you wish to have them fixed (I'd
> interpret it as a default rather than a fixed setting).

(Jon, the lack of line-wrapping makes your email a little hard to read)

Yes, that makes sense. We should leave the clock definitions up to the
OR driver rather than statically set them up based on the DC then.

Once clocks come from DT, that probably requires each OR to define two
clocks; the peripheral clock and the parent PLL, e.g.:

clocks = <&car CLK_HDMI> <&car CLK_PLL_D>;
clock-names = "output", "parent";

... and then do a clk_set_parent() when being activated.
