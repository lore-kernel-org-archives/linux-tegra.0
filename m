From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V5 05/12] mailbox: Add NVIDIA Tegra XUSB mailbox driver
Date: Mon, 24 Nov 2014 14:04:49 +0530
Message-ID: <CAJe_ZhdTvZZqERttAM_o6U6MZCOjk=oXpWFPf8W=DdW1j=Nx=g@mail.gmail.com>
References: <1416264102-1323-1-git-send-email-abrestic@chromium.org>
	<1416264102-1323-6-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416264102-1323-6-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>Kumar Gala <g>
List-Id: linux-tegra@vger.kernel.org

On 18 November 2014 at 04:11, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:

> +
> +static int tegra_xusb_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +       struct tegra_xusb_mbox *mbox = to_tegra_mbox(chan->mbox);
> +       struct tegra_xusb_mbox_msg *msg = data;
> +       unsigned long flags;
> +       u32 reg, owner;
> +
> +       dev_dbg(mbox->mbox.dev, "TX message %#x:%#x\n", msg->cmd, msg->data);
> +
> +       /* ACK/NAK must be sent with the controller as the mailbox owner */
> +       if (msg->cmd == MBOX_CMD_ACK || msg->cmd == MBOX_CMD_NAK)
> +               owner = MBOX_OWNER_FW;
> +       else
> +               owner = MBOX_OWNER_SW;
> +
> +       spin_lock_irqsave(&mbox->lock, flags);
> +
> +       /* Acquire mailbox */
> +       if (mbox_readl(mbox, XUSB_CFG_ARU_MBOX_OWNER) != MBOX_OWNER_NONE) {
> +               dev_err(mbox->mbox.dev, "Mailbox not idle\n");
> +               goto busy;
> +       }
> +       mbox_writel(mbox, owner, XUSB_CFG_ARU_MBOX_OWNER);
> +       if (mbox_readl(mbox, XUSB_CFG_ARU_MBOX_OWNER) != owner) {
> +               dev_err(mbox->mbox.dev, "Failed to acquire mailbox");
> +               goto busy;
> +       }
> +
> +       mbox_writel(mbox, mbox_pack_msg(msg), XUSB_CFG_ARU_MBOX_DATA_IN);
> +       reg = mbox_readl(mbox, XUSB_CFG_ARU_MBOX_CMD);
> +       reg |= MBOX_INT_EN | MBOX_DEST_FALC;
> +       mbox_writel(mbox, reg, XUSB_CFG_ARU_MBOX_CMD);
> +
> +       spin_unlock_irqrestore(&mbox->lock, flags);
> +
> +       return 0;
> +busy:
> +       spin_unlock_irqrestore(&mbox->lock, flags);
> +       return -EBUSY;
> +}
> +
> +static int tegra_xusb_mbox_startup(struct mbox_chan *chan)
> +{
> +       return 0;
> +}
> +
> +static void tegra_xusb_mbox_shutdown(struct mbox_chan *chan)
> +{
> +}
> +
> +static bool tegra_xusb_mbox_last_tx_done(struct mbox_chan *chan)
> +{
> +       /*
> +        * Transmissions are assumed to be completed as soon as they are
> +        * written to the mailbox.
> +        */
> +       return true;
>
In .send_data() you you mark the channel busy by setting the
XUSB_CFG_ARU_MBOX_OWNER to !MBOX_OWNER_NONE, which remains so until
you get an IRQ. So maybe you should check for the OWNER_NONE flag in
.last_tx_done()?

-Jassi
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
