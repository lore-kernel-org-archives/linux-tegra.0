From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
Date: Fri, 08 Mar 2013 11:33:48 -0700
Message-ID: <513A2F0C.8090201@wwwdotorg.org>
References: <1362671126-24571-1-git-send-email-balbi@ti.com> <5138FA7D.3040104@wwwdotorg.org> <20130308070836.GB21589@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130308070836.GB21589-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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

On other thought here: The Tegra PHY in question here very
specifically is a USB PHY. There's no way it could be used as e.g. a
SATA PHY, either as a HW block or given the driver code that program
is. Is sharing a PHY IP block or driver ever possible for any HW?

Hence, I don't think removing "USB" from the filename makes sense, nor
even moving it into a generic PHY directory.

By the same logic, any code for Tegra30's SATA PHY should also be in
phy-tegra.c, but that name would conflict. Naming them phy-tegra-usb.c
and phy-tegra-sata.c, or something specific like that, would avoid any
issue. And actually, better phy-tegra20-usb.c since Tegra114 has some
XHCI support, and I have no idea if the PHY code for that will end up
being at all related to the existing Tegra20 code, so we might need a
separate phy-tegra114-usb.c down the road.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
