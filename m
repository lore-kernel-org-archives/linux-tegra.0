From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Wed, 18 Apr 2012 15:45:44 -0600
Message-ID: <4F8F3608.5030005@wwwdotorg.org>
References: <Pine.LNX.4.44L0.1204181640550.1149-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1204181640550.1149-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/18/2012 02:47 PM, Alan Stern wrote:
...
> Are you sure the controllers aren't getting suspending under the 
> current driver?  It seems like they ought to be -- otherwise there 
> would be no point in defining power_down_on_bus_suspend.

Ah. The ports are getting suspended (when nothing is plugged in), and
tegra_ehci_bus_suspend() is returning 0. However, as soon as any port is
suspended, it resumes immediately. I guess that's why plugging something
in works even after the controller is suspended; it keeps waking up and
is essentially polling for any plugged-in device.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
