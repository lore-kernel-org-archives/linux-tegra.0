From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/4] power: tps65090: Add support for tps65090-charger
Date: Mon, 4 Mar 2013 12:31:17 -0500
Message-ID: <5134DA65.1010902@nvidia.com>
References: <1362006450-4979-1-git-send-email-rklein@nvidia.com> <1362006450-4979-5-git-send-email-rklein@nvidia.com> <20130303000325.GA29046@lizard.sbx05280.losalca.wayport.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130303000325.GA29046-SAfYLu58TvsKrcn4e17nTyIbA2bwYUBrKwcig+XE9tjR7s880joybQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 3/2/2013 7:03 PM, Anton Vorontsov wrote:
> Hello Rhyland,
>
> Thanks for the driver! A few comments down below...
>
> On Wed, Feb 27, 2013 at 06:07:30PM -0500, Rhyland Klein wrote:
>> This patch adds support for the tps65090 charger driver.
> Would be nice to get a few more words about the hardware and the driver.
> Why it is cool, main features, what is missing (if any), what is planned.

Yah, this is really a child driver of the tps65090 mfd chip, so a lot of 
the driver coolness
is already defined there :) I'll look into the hw some and see what 
other coolness might
be possible to add around here :)

> ...
> +
> +     irq = platform_get_irq(pdev, 0);
> +     if (irq <= 0) {
> +             dev_warn(&pdev->dev, "Unable to get charger irq = %d\n", irq);
> +             return irq;
> +     }
> +
> +     ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> +             tps65090_charger_isr, 0, "tps65090-charger", charger_data);
> You should request irq after power_supply object (and charger_data) are
> fully usable. Otherwise, if irq suddenly comes midway in the registration
> process, we'll get an oops.

Yah the first time I looked at this the order struck me as kinda off, 
but I guess I got
sidetracked and forgot to go back to it. Thanks for catching this!

-rhyland

-- 
nvpublic
