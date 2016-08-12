From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: Re: [RESEND PATCH] ARM: tegra: fix erroneous address in dts
Date: Fri, 12 Aug 2016 19:26:27 +0200
Message-ID: <d2469177-0eae-cd11-aa43-74baa374cc6c@ramses-pyramidenbau.de>
References: <1468835208-13426-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <20160718095802.GA422@ulmo.ba.sec> <3087941.oHflrW9cm7@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3087941.oHflrW9cm7@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/10/2016 10:46 PM, Arnd Bergmann wrote:
> On Monday, July 18, 2016 11:58:02 AM CEST Thierry Reding wrote:
>> On Mon, Jul 18, 2016 at 11:46:48AM +0200, Ralf Ramsauer wrote:
>>> c90bb7b enabled the high speed UARTs of the Jetson TK1. Due to a merge
>>> quirk, wrong addresses were introduced. Fix it and use the correct
>>> addresses.
>>>
>>> Thierry let me know, that there is another patch (b5896f67ab3c in
>>> linux-next) in preparation which removes all the '0,' prefixes of unit
>>> addresses on Tegra124 and is planned to go upstream in 4.8, so
>>> this patch will get reverted then.
>>>
>>> But for the moment, this patch is necessary to fix current misbehaviour.
>>>
>>> Fixes: c90bb7b9b9 ("ARM: tegra: Add high speed UARTs to Jetson TK1 device tree")
>>> Signed-off-by: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
>>> Acked-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> ---
>>>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> ARM-SoC maintainers,
>>
>> Just to clarify, this is targetted at v4.7 because the offending patch
>> was merged in v4.7-rc1. If at all possible it'd be great to get this in,
>> even if this is terribly last minute.
>>
> 
> I just notice this was still missing in v4.8-rc1, so I added it to
> the fixes branch now, with a stable tag for v4.7
Hi Arnd,

Ahm - this patch should have only be applied if it would have been
possible to commit it before the release of v4.7.

Mainline Patch b5896f6 ("ARM: tegra: Remove commas from unit addresses
on Tegra124") which was introduced during the merge window of v4.8 makes
this patch superfluous and introduces the same error again that we
initially wanted to fix :-)

This patch is only required for stable v4.7.x.

I think the best is to revert it on mainline, as long as stabilization
window is still open.

  Ralf
> 
> 	Arnd
> 

-- 
Ralf Ramsauer
PGP: 0x8F10049B
