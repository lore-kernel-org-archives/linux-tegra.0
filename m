From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [v2 1/1] ARM: dt: tegra{20,30}.dtsi: Rename "MC" to "Memory Controller"
Date: Wed, 16 May 2012 11:20:40 -0600
Message-ID: <4FB3E1E8.1050408@wwwdotorg.org>
References: <1337151226-7266-1-git-send-email-hdoyu@nvidia.com><1337172241-28677-1-git-send-email-hdoyu@nvidia.com><4FB3CC87.4030505@wwwdotorg.org> <20120516.201540.1972877673672045065.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120516.201540.1972877673672045065.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/16/2012 11:15 AM, Hiroshi Doyu wrote:
> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote @ Wed, 16 May 2012 17:49:27 +0200:
> 
>> On 05/16/2012 06:44 AM, Hiroshi DOYU wrote:
>>> Use a more plain english name.
>>
>> It's probably too late taking this cosmetic change for 3.5.
>>
>> There is also an "emc" node that probably should be renamed to
>> memory-controller too. In that case, since there will be two
>> memory-controller nodes, you'll need to add the unit address
>> ("@xxxxxxxx") back on the end of both the node names.
>>
>> Can I get a patch series that does all that and updates the binding
>> documentation for both MC and EMC? Probably separate patches for MC and EMC.
> 
> Sure. How should we deal with "emc" for emc-table in seaboard?

> arch/arm/boot/dts/tegra-seaboard.dts:337:       emc {
> arch/arm/boot/dts/tegra-seaboard.dts:338:               emc-table@190000 {

I'd be inclined to leave that as-is. Olof, any objections?

By the way, be sure to base your patch on the very latest Tegra tree or
linux-next; I did a lot of .dts cleanup in the last couple days.

Thanks.
