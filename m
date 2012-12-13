From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: Tegra3 ehci_suspend and ehci_resume
Date: Thu, 13 Dec 2012 10:04:18 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1212130959400.1415-100000@iolanthe.rowland.org>
References: <50C999D8.4090507@riseup.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50C999D8.4090507-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timur <timur.mehrvarz-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 13 Dec 2012, Timur wrote:

> On 12/12/2012 07:34 PM, Alan Stern wrote:
> 
> > Okay.  Then how about this: Unplug both the power connector and the
> > slave connector.  After the N7 goes into deep sleep, plug the power
> > connector back in but leave the slave unplugged.  Then a few seconds
> > later, plug in the slave.
> 
> This always fails (-71 / SET_ADDRESS). The issues can then only be 
> solved, by unplugging the "OTG" adapter. In other words, by switching to 
> peripheral mode (and back).
> 
> > Also try doing the same thing, but don't wait for the N7 to go into
> > deep sleep.  If this works but the other test doesn't, then clearly the
> > slave is working correctly and the problem lies in the host controller.
> 
> This works well most of the time. Some issues in a few cases, not sure 
> why. (It is possible to debug over WiFi. But doing so would prevent LP0.)

So it seems clear that the problem is the deep sleep implementation in 
ehci-tegra.  That implementation is very non-standard in the 3.7 
kernel.

To fix it will require assistance from the people responsible for the 
ehci-tegra driver.  I can be of only limited help because I don't have 
any Tegra hardware and I don't know how it's supposed to work.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
