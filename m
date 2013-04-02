From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] usb: host: ehci-tegra: Fix oops in error cleanup
Date: Tue, 02 Apr 2013 15:11:46 -0600
Message-ID: <515B4992.9010103@wwwdotorg.org>
References: <1364935250-26422-1-git-send-email-thierry@gilfi.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364935250-26422-1-git-send-email-thierry-TKn1d31QZ+o@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry-TKn1d31QZ+o@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/02/2013 02:40 PM, Thierry Reding wrote:
> The cleanup path checks whether the transceiver was properly initialized
> using IS_ERR(). However it can also happen that the cleanup path is run
> before the transceiver was initialized (or the operating mode isn't set
> to TEGRA_USB_OTG) and is therefore NULL. Add a separate label for error
> unwinding and initialize the transceiver field to ERR_PTR(-ENODEV) when
> the operating mode isn't TEGRA_USB_OTG to allow for consistent checking.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I also forwarded the patch to our USB expert off-list to make sure he's
OK with it; I hope he comments on it in the near future.
