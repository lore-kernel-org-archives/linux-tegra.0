From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra 2 T20 NAND Flash Support
Date: Sat, 03 Jan 2015 23:33:25 -0700
Message-ID: <54A8DEB5.4030208@wwwdotorg.org>
References: <538E6FB5.5020806@ziswiler.com> <1401866283.2173.3.camel@tellur>	 <538EC96A.4050702@ziswiler.com> <20140604144134.GH28484@ulmo>	 <1401903129.9454.2.camel@tellur> <1420314624.2169.6.camel@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420314624.2169.6.camel-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/03/2015 12:50 PM, Lucas Stach wrote:
> Am Mittwoch, den 04.06.2014, 19:32 +0200 schrieb Lucas Stach:
>> Am Mittwoch, den 04.06.2014, 16:41 +0200 schrieb Thierry Reding:
>>> On Wed, Jun 04, 2014 at 09:23:22AM +0200, Marcel Ziswiler wrote:
>>>> On 06/04/2014 09:18 AM, Lucas Stach wrote:
>>>>> I took the Linux Tegra NAND driver from Thierry and cleaned it up quite
>>>>> a bit. It now works with both ONFI and non-ONFI NAND, at least for
>>>>> reading. Writing doesn't quite work yet and I've got side-tracked with
>>>>> other stuff.
>>>>>
>>>>> If you are interested in moving this forward I can put up my WIP patches
>>>>> to some public location.
>>>>
>>>> Sounds great, yes. That would be perfect, thanks.
>>>>
>>>> We even once got an universal NAND test infrastructure from Micron based on
>>>> a re-worked Colibri T20 which we could use to validate it with various NAND
>>>> flash parts.
>>>
>>> Excellent, I would've had a hard time digging up those patches. It's
>>> really been quite a while.
>>>
>> I've put up a rebased version of the patches at
>>
>> git://git.pengutronix.de/git/lst/linux.git tegra-nand
>>
> For those still interested:
> I've continued to work on this for the last few days and pushed a new
> version of my WIP to the above location.
> 
> It is now in a state where the in-kernel mtd tests seem to be happy with
> it. Also creating/using a filesystem on top of the mtdblock device seems
> to work properly.
> 
> I still need to validate that anything using the OOB areas is working
> properly. The last missing feature is BCH ECC support, but that should
> be easy to add.
> 
> I don't know if it still needs some performance tuning. 5MB/s write and
> 12,5MB/s read on a Colibri T20 seem pretty slow me, but I have nothing
> to compare with ATM.
> Marcel could you maybe dig out some benchmarks with L4T?

That sounds pretty similar to the eMMC on devices of that age (at least
with the upstream drivers that don't support fast transfer modes) so
it's probably not bad...
