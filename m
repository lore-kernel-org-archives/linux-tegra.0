From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH] ARM: v7 setup function should invalidate L1 cache
Date: Wed, 17 Jun 2015 17:31:30 -0500
Message-ID: <5581F542.708@opensource.altera.com>
References: <E1Yuk8W-0001tC-IK@rmk-PC.arm.linux.org.uk>
 <CAMuHMdX=T3CsLTT95H_07Si6Kd8SRraBfxADpn+VtAF4GmZ=mw@mail.gmail.com>
 <CAMuHMdUQkm_9PhSdGS8j85Uodm-o0jiki=Xh4h59PBShB=rCXw@mail.gmail.com>
 <20150601105319.GQ2067@n2100.arm.linux.org.uk>
 <CAMuHMdUXCy+87-pwLiJ7ynaM1AeFq0f7R3sJ4prdE3QN09z++w@mail.gmail.com>
 <CADhT+wdJX7jMO3_rafrZMeA5ZVMaA6b2U4zkksfJcUjh41mH9A@mail.gmail.com>
 <20150617213006.GC7557@n2100.arm.linux.org.uk>
 <5581F0DD.60408@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <5581F0DD.60408-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "open
 list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra@vger
List-Id: linux-tegra@vger.kernel.org

On 06/17/2015 05:12 PM, Dinh Nguyen wrote:
> On 06/17/2015 04:30 PM, Russell King - ARM Linux wrote:
>> On Wed, Jun 17, 2015 at 03:35:13PM -0500, Dinh Nguyen wrote:
>>> On Mon, Jun 1, 2015 at 6:50 AM, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>>>> Hi Russell,
>>>>
>>>> On Mon, Jun 1, 2015 at 12:53 PM, Russell King - ARM Linux
>>>> <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
>>>>> On Mon, Jun 01, 2015 at 12:41:01PM +0200, Geert Uytterhoeven wrote:
>>>>>> FWIW, I have the feeling this has a slight influence on boot reliability on
>>>>>> two of my boards:
>>>>>>   - r8a7740/armadillo, which is known to suffer from a cache-related bug in
>>>>>>     its bootloader, seems to have a higher change of booting successfully on
>>>>>>     cold boot,
>>>>>>   - sh73a0/kzm9g, which has known cache-issues with secondary CPU boot up,
>>>>>>     seems to have a lower chance of booting successfully.
>>>>>>
>>>>>> No time to spend all week turning this into a statistical significant test
>>>>>> project... The reset button is my friend...
>>>>>
>>>>> Damn it, you sent this right after I merged and pushed out this change in
>>>>> my for-arm-soc branch, and was just about to send it to the arm-soc people.
>>>>> What excellent timing you have. :)
>>>>
>>>> Don't worry, I didn't send that email to make you postpone this change.
>>>> Giving the fuzziness of reproduction, and the flakiness (esp. on Armadillo)
>>>> of the boot loader, and these are old SoCs, please go ahead.
>>>>
>>>>> What happens on the kzm9g if you revert the mach-shmobile changes?
>>>>
>>>> Seems to make no difference.
>>>>
>>>>> For armadillo, do you use the decompressor?  That should be doing all the
>>>>> cache cleaning already, prior to the kernel being entered.
>>>>
>>>> I think so.
>>>>
>>>> Corruption pattern ranges from lock up, over "Error: unrecognized/unsupported
>>>> machine ID", to booting almost completely, but lacking a few devices due to
>>>> a corrupted DTB. Been like that as long as I remember, i.e. since I got the
>>>> board ca. 1 year ago. Boots fine (100%) with kexec.
>>>>
>>>
>>> It seems like this patch is causing the SoCFPGA to not boot with SMP
>>> reliably. About 1 out of every 10 reboots, I'm seeing the boot failure
>>> below. The error seems to only happen when I do a cold or warm reboot,
>>> but never occurs during a power-up. If I revert this patch, or put
>>> back the call to v7_invalidate_l1 in socfpga_secondary_startup , then
>>> its able to boot 100% of the time.
>>
>> It really sucks that you're only just testing this change now, because
>> I've frozen my tree, and removing it for the next merge window is going
>> to be an entirely non-trivial matter.  You were copied on the original
>> patch, which you failed to test... I can't say I have _much_ sympathy
>> for a bug report at this point in time.
>>
> 
> I apologize for not catching this error while testing this patch. But I
> did test it when you first sent it out..I probably didn't do a stress
> test. Sometimes the reboot fails in the 1st attempt, sometimes it fails
> in the 9th attempt.
> 
> I only caught this error when I was testing my recent changes to use
> CPU_METHOD_OF_DECLARE.
> 
> For me, I don't think you need to revert this patch or anything, but a
> fix can go in for a -rcX?
> 

Also, I am not seeing the error on the SoCFPGA Arria 10 platform at all.
This Arria10 platform is running a different version of bootloader than
the Cyclone5. Although, I also did test with the latest version of
U-Boot on the Cyclone5.

Dinh
