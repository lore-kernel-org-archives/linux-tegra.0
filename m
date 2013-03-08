From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
Date: Fri, 08 Mar 2013 10:26:45 -0700
Message-ID: <513A1F55.1000800@wwwdotorg.org>
References: <1362671126-24571-1-git-send-email-balbi@ti.com> <5138FA7D.3040104@wwwdotorg.org> <20130308070836.GB21589@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130308070836.GB21589-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/08/2013 12:08 AM, Felipe Balbi wrote:
> On Thu, Mar 07, 2013 at 01:37:17PM -0700, Stephen Warren wrote:
>> On 03/07/2013 08:45 AM, Felipe Balbi wrote:
>>> this will make sure that we have sensible names for all phy
>>> drivers. Current situation was already quite bad with too
>>> generic names being used.
>> 
>> Is phy-$name specific enough? There are other types of PHY such
>> as Ethernet, etc. What about phy-usb-$name?
> 
> we will be creating a generic (kernel-wide) phy layer, so I guess
> that matters very little. Specially since we don't want to be
> differentiating PHYs by their subsystem and rather by the IP name
> (which means phy-tegra, phy-samsung, phy-omap, are all 'wrong', but
> there were no better names).
> 
>> Venu, please comment on what conflicts, if any, this will cause
>> with the patches you'll be sending to clean up the Tegra USB/PHY
>> drivers. Thanks.
> 
> BTW, let's stop with the whole dependency between PHY driver
> cleanup and arch/arm/mach-tegra/, too many patches have gone
> upstream bypassing my tree. What we should be doing is figuring out
> how to remove arch/ dependencies so that patches can go upstream
> and not cause conflicts.

Unfortunately, there's no way to actually avoid the dependencies
themselves. The DT bindings and EHCI/PHY controller split are wrong,
and need work on both the DT and drivers to fix.

I guess I could apply all the initial DT changes to a topic branch in
the Tegra tree (item 1 below), and have you merge that branch into
yours, and then you could take all the USB-related patches (item 2
below) through your tree. Would that work better?

The only issue with that is that we would have to defer the final DT
cleanup patch until sometime after 3.10-rc1; in order to maintain
bisectability, the order needs to be: (1) add new DT content required
by fixed binding (2) make driver assume new binding (3) remove stale
DT content no longer required by the new binding. (3) is what would
have to be deferred.
