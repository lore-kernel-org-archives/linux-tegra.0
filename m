From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/6] brcmfmac: Handling the interrupt in ISR directly
 for non-OOB
Date: Tue, 28 Aug 2012 19:13:33 +0800
Message-ID: <1346152413.3516.211.camel@tegra-chromium-2>
References: <1346063114-30361-1-git-send-email-wni@nvidia.com>
	 <1346063114-30361-3-git-send-email-wni@nvidia.com>
	 <503B9F31.5050502@broadcom.com>  <503BD345.6030501@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <503BD345.6030501-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "Franky (Zhenhui) Lin" <frankyl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "rvossen-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <rvossen-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rakesh Kumar <krakesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "brcm80211-dev-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <brcm80211-dev-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2012-08-28 at 04:06 +0800, Stephen Warren wrote:
> On 08/27/2012 09:24 AM, Arend van Spriel wrote:
> > On 08/27/2012 12:25 PM, Wei Ni wrote:
> >> In case of inband interrupts, if we handle the interrupt in dpc thread,
> >> two level of thread switching takes place to process wifi interrupts.
> >> One in SDHCI driver and the other in Wifi driver. This may cause the
> >> system
> >> instability.
> > 
> > Looking into the sdhci/mmc code indeed shows that the brcmfmac irq
> > handler is not called in true IRQ context. So the dpc thread may add
> > unnecessary complexity, but to me there is not indication that there is
> > a stability issue.

The brcmfmac irq handler is called in the thread sdio_irq_thread(), this
thread indeed is driven by the sdhci irq, although it's not the true IRQ
context. If the brcmfmac doesn't clear the IRQ condition ASAP, the
sdio_irq_thread will be triggered again and again, and in this condition
it's too difficult to run the brcmfmac dpc thread, more and more
interrupt can't be handled.

> > 
> >> Because the SDHCI calls sdio_irq_thread() to handle the irq, this
> >> thread locks
> >> mmc host and calls wifi handler. It expects WiFi handler to be quick and
> >> enables sdio interrupt from card at end. If wifi handler defers this
> >> work for
> >> a different thread, sdio_irq_thread() will be stuck on next wifi
> >> interrupt
> >> since mmc lock is not freed.
> > 
> > Not sure if I can follow this explanation. The isr is called with host
> > claimed (by sdio_irq_thread) and all it does is at a linked list member
> > and signal the dpc thread. After doing this the host is released.
> 
> Is the issue something like the ISR handler or first level of threading
> does:
> 
> * Trigger DPC
> * Re-enable interrupt
> 
> So that the interrupt then fires again before the triggered DPC can run
> to handle/clear it, thus causing an interrupt storm?
> 
> Whereas handling the interrupt directly prevents this race condition?

Above is my understanding.


--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
