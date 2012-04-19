From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Thu, 19 Apr 2012 09:52:02 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1204190948580.2070-100000@iolanthe.rowland.org>
References: <4F8F3608.5030005@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F8F3608.5030005-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 18 Apr 2012, Stephen Warren wrote:

> On 04/18/2012 02:47 PM, Alan Stern wrote:
> ...
> > Are you sure the controllers aren't getting suspending under the 
> > current driver?  It seems like they ought to be -- otherwise there 
> > would be no point in defining power_down_on_bus_suspend.
> 
> Ah. The ports are getting suspended (when nothing is plugged in), and
> tegra_ehci_bus_suspend() is returning 0. However, as soon as any port is
> suspended, it resumes immediately. I guess that's why plugging something
> in works even after the controller is suspended; it keeps waking up and
> is essentially polling for any plugged-in device.

All right.  In that case there's no point in powering down the 
controller at all.

Here's what you can do.  In the patch, change the lines

+	if (!pdata->power_down_on_bus_suspend)
+		pm_runtime_forbid(&pdev->dev);

so that pm_runtime_forbid() gets called unconditionally.  For example:

+//	if (!pdata->power_down_on_bus_suspend)
+		pm_runtime_forbid(&pdev->dev);

If you make that change, does the driver continue to work as well as it 
did before?

Alan Stern
