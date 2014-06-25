From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1 2/9] mailbox: Add NVIDIA Tegra XUSB mailbox driver
Date: Wed, 25 Jun 2014 16:02:08 -0600
Message-ID: <53AB46E0.5010908@wwwdotorg.org>
References: <1403072180-4944-1-git-send-email-abrestic@chromium.org> <1403072180-4944-3-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403072180-4944-3-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/18/2014 12:16 AM, Andrew Bresticker wrote:
> The Tegra XHCI controller communicates requests to the host through
> a mailbox interface.  Host drivers which can handle these requests,
> such as the Tegra XUSB pad controller driver and upcoming Tegra XHCI
> host controller driver, can send messages and register to be notified
> of incoming messages.

> diff --git a/include/linux/tegra-xusb-mbox.h b/include/linux/tegra-xusb-mbox.h

> +extern int tegra_xusb_mbox_register_notifier(struct tegra_xusb_mbox *mbox,
> +					     struct notifier_block *nb);
> +extern void tegra_xusb_mbox_unregister_notifier(struct tegra_xusb_mbox *mbox,
> +						struct notifier_block *nb);
> +extern int tegra_xusb_mbox_send(struct tegra_xusb_mbox *mbox,
> +				enum tegra_xusb_mbox_cmd cmd, u32 data);
> +extern struct tegra_xusb_mbox *
> +tegra_xusb_mbox_lookup_by_phandle(struct device_node *np, const char *prop);

This seems to use a custom API. I've seen mention of a mailbox
subsystem, and I assume that has a standardized API. Should this driver
implement that instead?
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
