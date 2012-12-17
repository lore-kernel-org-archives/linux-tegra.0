From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH 1/2] arm: tegra: Add new DT property to USB node.
Date: Mon, 17 Dec 2012 17:04:41 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1212171704060.1409-100000@iolanthe.rowland.org>
References: <50CF89AF.3000308@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50CF89AF.3000308-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 17 Dec 2012, Stephen Warren wrote:

> On 12/13/2012 11:59 PM, Venu Byravarasu wrote:
> > As Tegra USB host driver is using instance number for resetting
> > PORT0 twice, adding a new DT property for handling this.
> 
> Alan, Greg, Felip,e
> 
> This series looks fine to me.
> 
> I'd like to take all the Tegra-related USB patches through the Tegra
> tree for 3.9 if possible (so I'm looking for your acks here). I believe
> Venu plans to significantly clean up the EHCI/PHY driver split for
> Tegra, rework the drivers, and add support for Tegra30 in addition to
> Tegra20. Some of this requires changes to some Tegra board files and
> device trees to maintain "git bisect" I don't know for sure yet, but I
> believe that rework may also end up conflicting with other clock-related
> rework that will show up for Tegra in 3.9. Are you OK with this? I'll
> certainly look for your review/acks on the patches before picking them
> up though.

Regarding the changes to drivers/usb/host/ehci-tegra.c:

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
