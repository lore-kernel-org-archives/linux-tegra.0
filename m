From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH 0/9] usb: fix PHY error handling
Date: Fri, 15 Mar 2013 11:01:39 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1303151100540.1414-100000@iolanthe.rowland.org>
References: <1363338730-14581-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363338730-14581-1-git-send-email-balbi-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 15 Mar 2013, Felipe Balbi wrote:

> Hi Folks,
> 
> this patch set depends on [1] which makes PHY layer
> *always* return an error as suggested by Alan Stern.
> 
> I have compiled what I could, please go over the
> patches and give your Acked-by or NAK it if you think
> there's something wrong with any of the patches.
> 
> cheers
> 
> [1] http://marc.info/?l=linux-usb&m=136327710513124
> 
> Felipe Balbi (9):
>   usb: dwc3: fix PHY error handling
>   usb: gadget: mv_udc_core: fix PHY error handling
>   usb: gadget: s3c-hsotg: fix PHY error handling
>   usb: musb: omap2430: fix PHY error handling
>   usb: host: ehci-msm: fix PHY error handling
>   usb: host: ehci-mv: fix PHY error handling
>   usb: host: ehci-s5p: fix PHY error handling
>   usb: host: ehci-tegra: fix PHY error handling
>   usb: host: ohci-exynos: fix PHY error handling

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>

for all the EHCI and OHCI changes.  But it would be good to have 
somebody test them.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
