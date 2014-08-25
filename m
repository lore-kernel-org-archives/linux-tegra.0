From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/9] mailbox: Add NVIDIA Tegra XUSB mailbox driver
Date: Mon, 25 Aug 2014 13:01:52 -0600
Message-ID: <53FB8820.4010202@wwwdotorg.org>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org> <1408381705-3623-3-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408381705-3623-3-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/18/2014 11:08 AM, Andrew Bresticker wrote:
> The Tegra xHCI controller's firmware communicates requests to the host
> processor through a mailbox interface.  While there is only a single
> communication channel, messages sent by the controller can be divided
> into two groups: those intended for the PHY driver and those intended
> for the host-controller driver.  This mailbox driver exposes the two
> channels and routes incoming messages to the appropriate channel based
> on the command encoded in the message.

> diff --git a/drivers/mailbox/tegra-xusb-mailbox.c b/drivers/mailbox/tegra-xusb-mailbox.c

> +#define XUSB_CFG_ARU_MBOX_CMD			0xe4
> +#define  MBOX_FALC_INT_EN			BIT(27)
> +#define  MBOX_PME_INT_EN			BIT(28)
> +#define  MBOX_SMI_INT_EN			BIT(29)
> +#define  MBOX_XHCI_INT_EN			BIT(30)
> +#define  MBOX_INT_EN				BIT(31)

Those field names don't match the documentation in the TRM; they're 
called DEST_xxx rather than xxx_INT_EN. I'm not sure what that 
disconnect means (i.e. whether it's just a different naming choice, or 
there's some practical disconnect that will cause issues.)

> +static struct mbox_chan *mbox_cmd_to_chan(struct tegra_xusb_mbox *mbox, u32 cmd)
> +{
> +	switch (cmd) {
> +	case MBOX_CMD_INC_FALC_CLOCK:
> +	case MBOX_CMD_DEC_FALC_CLOCK:
> +	case MBOX_CMD_INC_SSPI_CLOCK:
> +	case MBOX_CMD_DEC_SSPI_CLOCK:
> +	case MBOX_CMD_SET_BW:
> +		return &mbox->mbox.chans[TEGRA_XUSB_MBOX_CHAN_HOST];
> +	case MBOX_CMD_SAVE_DFE_CTLE_CTX:
> +	case MBOX_CMD_START_HSIC_IDLE:
> +	case MBOX_CMD_STOP_HSIC_IDLE:
> +		return &mbox->mbox.chans[TEGRA_XUSB_MBOX_CHAN_PHY];
> +	default:
> +		return NULL;
> +	}
> +}

This makes me think that the CHAN_HOST/CHAN_PHY values are purely a 
facet of the Linux driver's message de-multiplexing, rather than 
anything to do with the HW.

I'm not even sure if it's appropriate for the low-level mailbox driver 
to know about the semantics of the message, rather than simply sending 
them on to the client driver? Perhaps when drivers register(?) for 
callbacks(?) for messages, they should state which types of messages 
they want to listen to?

> +static irqreturn_t tegra_xusb_mbox_irq(int irq, void *p)

> +	/* Clear mbox interrupts */
> +	reg = mbox_readl(mbox, XUSB_CFG_ARU_SMI_INTR);
> +	if (reg & MBOX_SMI_INTR_FW_HANG)
> +		dev_err(mbox->mbox.dev, "Controller firmware hang\n");
> +	mbox_writel(mbox, reg, XUSB_CFG_ARU_SMI_INTR);

> +	/*
> +	 * Set the mailbox back to idle.  The recipient of the message is
> +	 * responsible for sending an ACK/NAK, if necessary.
> +	 */
> +	reg = mbox_readl(mbox, XUSB_CFG_ARU_MBOX_CMD);
> +	reg &= ~MBOX_SMI_INT_EN;
> +	mbox_writel(mbox, reg, XUSB_CFG_ARU_MBOX_CMD);

Does the protocol not allow the remote firmware to send another message 
until the host has ack'd/nak'd the message; the code above turns off the 
IRQ that indicated to the host that a message was sent to it...

> +static int tegra_xusb_mbox_probe(struct platform_device *pdev)

> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;

Should devm_request_mem_region() be called here to claim the region?

> +	mbox->regs = devm_ioremap_nocache(&pdev->dev, res->start,
> +					  resource_size(res));
> +	if (!mbox->regs)
> +		return -ENOMEM;

Is _nocache required? I don't see other drivers using it. I assume 
there's nothing special about the mbox registers.

> +	mbox->irq = platform_get_irq(pdev, 0);
> +	if (mbox->irq < 0)
> +		return mbox->irq;
> +	ret = devm_request_irq(&pdev->dev, mbox->irq, tegra_xusb_mbox_irq, 0,
> +			       dev_name(&pdev->dev), mbox);

Is it possible for an IRQ to occur after tegra_xusb_mbox_remove() has 
returned, but before the cleanup for the devm IRQ allocation occurs? If 
that happens, will the code handle it gracefully, or crash?

> +MODULE_ALIAS("platform:tegra-xusb-mailbox");

I don't think that's required; it should auto-load based on the 
of_device_id/MODULE_DEVICE_TABLE(of,...) table.

> diff --git a/include/soc/tegra/xusb.h b/include/soc/tegra/xusb.h

> +#define TEGRA_XUSB_MBOX_NUM_CHANS 2 /* host + phy */

I'd rather see that definition in the same place as the 
TEGRA_XUSB_MBOX_CHAN_* values it refers to. Otherwise, it'd be quite 
easy to add values without updating this constant.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
