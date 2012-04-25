From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH] USB: ehci-tegra: remove PORT_RWC_BITS when setting
 USB_PORT_FEAT_ENABLE
Date: Wed, 25 Apr 2012 15:59:43 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1204251559240.1206-100000@iolanthe.rowland.org>
References: <1335378670-26860-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1335378670-26860-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 25 Apr 2012, Stephen Warren wrote:

> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> In the SetPortFeature/USB_PORT_FEAT_ENABLE case, ehci_hub_control()
> would read from status_reg, modify the value, and write the result back to
> status_reg. This would clear any bits in PORT_RWC_BITS that were set in
> the register. Fix this by masking these bits off before the write.
> 
> This is logically the same change as 6d5f89c "USB: EHCI: remove
> PORT_RWC_BITS when clearing USB_PORT_FEAT_ENABLE", but applied to the
> Tegra driver rather than the USB core.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
