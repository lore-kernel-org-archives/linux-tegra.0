From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v4 3/4] gpio/tegra: Convert to a platform device
Date: Wed, 12 Oct 2011 17:08:57 -0600
Message-ID: <CACxGe6u2Ae=6Fso1NEGA1wymczRykBGs0XB=pt7j8XyKmy6b+w@mail.gmail.com>
References: <1318371375-4083-1-git-send-email-swarren@nvidia.com> <1318371375-4083-3-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318371375-4083-3-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 11, 2011 at 4:16 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> v3: Make regs variable static. Remove empty init of tegra_gpio_banks.
>
> v2: Retrieve IRQ and memory addresses from resources instead of hard-
> coding them. Add back initialization of tegra_gpio_chip.of_node.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

One comment below however.

> @@ -333,28 +335,55 @@ static struct irq_chip tegra_gpio_irq_chip =3D =
{
> =A0*/
> =A0static struct lock_class_key gpio_lock_class;
>
> -static int __init tegra_gpio_init(void)
> +static int __init tegra_gpio_probe(struct platform_device *pdev)

__devinit because this is put in the .probe hook of the driver.

g.
