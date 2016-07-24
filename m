From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: Re: [RESEND PATCH] ARM: tegra: fix erroneous address in dts
Date: Sun, 24 Jul 2016 22:38:38 +0200
Message-ID: <c44f8315-d9dd-cf0b-775b-231af99ba7d3@ramses-pyramidenbau.de>
References: <1468835208-13426-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <20160718095802.GA422@ulmo.ba.sec> <6423681.52qkIkgFBQ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6423681.52qkIkgFBQ@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/21/2016 02:28 PM, Arnd Bergmann wrote:
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
> I've applied it to the fixes branch, but as Linus is currently offline
> and hasn't pulled the previous set of fixes, I suspect it's not
> going to make it.
Yep, didn't make it. I'll resend the fix with stable in Cc tomorrow.
Keep you also in Cc.

Thierry, this fix is only required for 4.7.x and gets superfluous when
b5896f67ab3c is applied. So I guess there is no need to fix mainline, right?
  Ralf
> 
> Olof, do you think we should send an amended pull request, or are
> we at the point where nothing gets pulled anyway?
> 
> 	Arnd
> 


-- 
Ralf Ramsauer
GPG: 0x8F10049B
