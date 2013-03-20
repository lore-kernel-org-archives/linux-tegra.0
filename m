From: Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Reboot/shutdown failure due to "USB: EHCI: work around silicon bug in Intel's EHCI"
Date: Wed, 20 Mar 2013 17:54:02 +0100
Message-ID: <878v5ic8r9.fsf@turtle.gmx.de>
References: <Pine.LNX.4.44L0.1303201026310.1701-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1303201026310.1701-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
	(Alan Stern's message of "Wed, 20 Mar 2013 10:40:04 -0400 (EDT)")
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Andreas Bombe <aeb-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, "linux-tegra@vger.kernel.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 2013-03-20 15:40 +0100, Alan Stern wrote:

> Anyway, there _is_ a mistake in the "work around silicon bug" patch; I
> forgot to update the timeout handler.  Does the patch below help?  You 
> should build it without CONFIG_USB_DEBUG; I changed the ehci_vdbg to 
> ehci_info so that it would show up in the log regardless and we can see 
> if it gets triggered.
>
> (Sven, this patch should replace the one I sent you earlier.)

Works fine for me.

Cheers,
       Sven

> Index: 3.8/drivers/usb/host/ehci-timer.c
> ===================================================================
> --- 3.8.orig/drivers/usb/host/ehci-timer.c
> +++ 3.8/drivers/usb/host/ehci-timer.c
> @@ -305,7 +305,8 @@ static void ehci_iaa_watchdog(struct ehc
>  	 * (a) SMP races against real IAA firing and retriggering, and
>  	 * (b) clean HC shutdown, when IAA watchdog was pending.
>  	 */
> -	if (ehci->async_iaa) {
> +//	if (ehci->async_iaa) {
> +	if (1) {
>  		u32 cmd, status;
>  
>  		/* If we get here, IAA is *REALLY* late.  It's barely
> @@ -329,7 +330,7 @@ static void ehci_iaa_watchdog(struct ehc
>  			ehci_writel(ehci, STS_IAA, &ehci->regs->status);
>  		}
>  
> -		ehci_vdbg(ehci, "IAA watchdog: status %x cmd %x\n",
> +		ehci_info(ehci, "IAA watchdog: status %x cmd %x\n",
>  				status, cmd);
>  		end_unlink_async(ehci);
>  	}
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
