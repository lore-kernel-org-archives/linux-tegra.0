From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 8/8] ARM: tegra: HACK: remove set_irq_flags() from driver
Date: Thu, 1 Mar 2012 21:33:03 +0100
Message-ID: <CACRpkdZK+9gF7N2akyWw=tvcBS2X2FmSd2-SiNKiuRgUCYXx7w@mail.gmail.com>
References: <1330630010-11241-1-git-send-email-alan@signal11.us>
	<1330630010-11241-9-git-send-email-alan@signal11.us>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330630010-11241-9-git-send-email-alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 1, 2012 at 8:26 PM, Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org> wrote:

> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>
> The driver should not call set_irq_flags itself, and
> cannot do this from a loadable module.
>
> Remove the call for now, which might break the driver
> but at least lets the kernel link again.
>
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
> =A0drivers/usb/host/ehci-tegra.c | =A0 =A01 -
> =A01 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-te=
gra.c
> index dbc7fe8..ab91f26 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -729,7 +729,6 @@ static int tegra_ehci_probe(struct platform_devic=
e *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D -ENODEV;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto fail;
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 set_irq_flags(irq, IRQF_VALID);

The kernel is full of this kind of stuff (drivers/mfd/twl4030-irq.c):

#ifdef CONFIG_ARM
        /* ARM requires an extra step to clear IRQ_NOREQUEST, which it
         * sets on behalf of every irq_chip.  Also sets IRQ_NOPROBE.
         */
        set_irq_flags(irq, IRQF_VALID);
#else
        /* same effect on other architectures */
        irq_set_noprobe(irq);
#endif

Can't we try to fix this for real instead of breaking the universe,
hehe :-)

Yours,
Linus Walleij
