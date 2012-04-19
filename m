From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Changes to power management in ehci-tegra
Date: Thu, 19 Apr 2012 12:23:22 -0600
Message-ID: <4F90581A.70109@wwwdotorg.org>
References: <Pine.LNX.4.44L0.1204190948580.2070-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1204190948580.2070-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/19/2012 07:52 AM, Alan Stern wrote:
> On Wed, 18 Apr 2012, Stephen Warren wrote:
> 
>> On 04/18/2012 02:47 PM, Alan Stern wrote:
>> ...
>>> Are you sure the controllers aren't getting suspending under the 
>>> current driver?  It seems like they ought to be -- otherwise there 
>>> would be no point in defining power_down_on_bus_suspend.
>>
>> Ah. The ports are getting suspended (when nothing is plugged in), and
>> tegra_ehci_bus_suspend() is returning 0. However, as soon as any port is
>> suspended, it resumes immediately. I guess that's why plugging something
>> in works even after the controller is suspended; it keeps waking up and
>> is essentially polling for any plugged-in device.
> 
> All right.  In that case there's no point in powering down the 
> controller at all.
> 
> Here's what you can do.  In the patch, change the lines
> 
> +	if (!pdata->power_down_on_bus_suspend)
> +		pm_runtime_forbid(&pdev->dev);
> 
> so that pm_runtime_forbid() gets called unconditionally.  For example:
> 
> +//	if (!pdata->power_down_on_bus_suspend)
> +		pm_runtime_forbid(&pdev->dev);
> 
> If you make that change, does the driver continue to work as well as it 
> did before?

Yes, I believe so.

Note: I found that the immediate resume is because hcd_bus_suspend()
aborts part-way through due to "suspend raced with wakeup event", which
is due to ehci_hub_status_data() finding that port_status has all of
PORT_CSC | PORT_PEC | PORT_OCC set. Is it worth tracking that down
further? I have no idea if it's an ehci-tegra.c issue or quirk in our
EHCI HW.
