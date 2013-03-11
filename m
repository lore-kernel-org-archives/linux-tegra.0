From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
Date: Mon, 11 Mar 2013 13:54:54 -0600
Message-ID: <513E368E.3070507@wwwdotorg.org>
References: <1362671126-24571-1-git-send-email-balbi@ti.com> <5138FA7D.3040104@wwwdotorg.org> <20130308070836.GB21589@arwen.pp.htv.fi> <513A1F55.1000800@wwwdotorg.org> <20130311065903.GE12860@arwen.pp.htv.fi> <513E0E33.1020105@wwwdotorg.org> <20130311184933.GA8228@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130311184933.GA8228-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/11/2013 12:49 PM, Felipe Balbi wrote:
> Hi,
> 
> On Mon, Mar 11, 2013 at 11:02:43AM -0600, Stephen Warren wrote:
>>>> On 03/08/2013 12:08 AM, Felipe Balbi wrote:
>>>>> On Thu, Mar 07, 2013 at 01:37:17PM -0700, Stephen Warren 
>>>>> wrote:
>>>>>> On 03/07/2013 08:45 AM, Felipe Balbi wrote:
>>>>>>> this will make sure that we have sensible names for
>>>>>>> all phy drivers. Current situation was already quite
>>>>>>> bad with too generic names being used.
>>>>>> 
>>>>>> Is phy-$name specific enough? There are other types of
>>>>>> PHY such as Ethernet, etc. What about phy-usb-$name?
>>>>> 
>>>>> we will be creating a generic (kernel-wide) phy layer, so
>>>>> I guess that matters very little. Specially since we don't
>>>>> want to be differentiating PHYs by their subsystem and
>>>>> rather by the IP name (which means phy-tegra, phy-samsung,
>>>>> phy-omap, are all 'wrong', but there were no better
>>>>> names).
>>>>> 
>>>>>> Venu, please comment on what conflicts, if any, this
>>>>>> will cause with the patches you'll be sending to clean up
>>>>>> the Tegra USB/PHY drivers. Thanks.
>>>>> 
>>>>> BTW, let's stop with the whole dependency between PHY
>>>>> driver cleanup and arch/arm/mach-tegra/, too many patches
>>>>> have gone upstream bypassing my tree. What we should be
>>>>> doing is figuring out how to remove arch/ dependencies so
>>>>> that patches can go upstream and not cause conflicts.
>>>> 
>>>> Unfortunately, there's no way to actually avoid the
>>>> dependencies themselves. The DT bindings and EHCI/PHY
>>>> controller split are wrong, and need work on both the DT and
>>>> drivers to fix.
>>> 
>>> but those changes don't need to come together, right ? I mean,
>>> for the DT part you could add the bindings to driver A without
>>> removing from driver B and span the changes accross 2 merge
>>> windows.
>> 
>> There is only a single driver. It's being reworked to support the
>> new binding.
> 
> alright, so what's the problem of adding new binding without
> removing old one for v3.10 and remove old on v3.11 ? It gives a 3
> month grace period for all boards to be converted, at least.

By binding, I assume you mean the driver code that implements the
binding, so you want the driver to support both the old and new
bindings at once? I don't think that's practical in this case.

Currently the EHCI driver parses a single EHCI DT node, and passes
some information down to the PHY driver. The PHY driver is in fact
just a set of functions and not actually any kind of driver.

The patches will split the single EHCI DT node into a separate EHCI
and PHY DT nodes, convert the PHY driver to an actual (platform)
driver, move the parsing of the PHY DT node into the new PHY DT
driver, and remove the parsing of the PHY-related properties from the
EHCI driver. Supporting both sets of DT content across that transition
would be rather difficult I think.

The patches will convert all in-tree boards, and I'm pretty confident
that there aren't actually any out-of-tree boards for Tegra (that use
a mainline kernel; there are plenty that don't use DT and are based on
much older kernels). Hence, I don't see any need for a grace period
here. Even if there are out-of-tree boards, the conversion of the DT
content would take about 30 seconds. I'll volunteer to even do it
(without testing!) for any out-of-tree boards if there are any.

One reason that I really care about moving this forward quickly, is
that you had indicated the driver cleanup was a pre-requisite to
continuing to extend the code. Right now, the Tegra USB drivers only
support Tegra20. We'd really like to get Tegra30 and now Tegra114 USB
support into mainline ASAP.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
