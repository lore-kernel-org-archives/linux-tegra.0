From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v3 4/4] usb: Add APIs to access host registers from Tegra
 PHY
Date: Fri, 18 Jan 2013 10:30:02 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1301181029350.1988-100000@iolanthe.rowland.org>
References: <1358489737-32273-1-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358489737-32273-1-git-send-email-vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 18 Jan 2013, Venu Byravarasu wrote:

> As Tegra PHY driver needs to access one of the Host registers,
> added few APIs.
> 
> Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> delta from v2:
> Renamed USB_PORTSC1 to TEGRA_USB_PORTSC1.
> Removed tegra_ehci_set_wakeon_events() and its references.
> Used standard defines for accessing PORTSC fields defined in ehci_def.h
> Included OCC bit of PORTSC as part of TEGRA_PORTSC1_RWC_BITS.
> 
> delta from v1:
> Taken care of RWC bits, while accessing PORTSC register.

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
