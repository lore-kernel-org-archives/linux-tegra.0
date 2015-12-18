From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH V2 6/8] irqchip/gic: Assign irqchip dynamically
Date: Fri, 18 Dec 2015 10:26:18 +0000
Message-ID: <5673DF4A.7050203@nvidia.com>
References: <1450349309-8107-1-git-send-email-jonathanh@nvidia.com>
 <1450349309-8107-7-git-send-email-jonathanh@nvidia.com>
 <567295B5.8050900@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <567295B5.8050900-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 17/12/15 11:00, Marc Zyngier wrote:
> Hi Jon,
> 
> On 17/12/15 10:48, Jon Hunter wrote:
>> Dynamically assign the irqchip structure for each GIC controller
>> instance. This is necessary in order to populate the "dev" member
>> of the irqchip structure for GIC instances that require runtime
>> power management support. This also allows us to populate a unique
>> name for each GIC controller.
>>
>> This is based upon a patch by Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This is going to clash horribly with the version I've pulled into my tree:
> 
> https://git.kernel.org/cgit/linux/kernel/git/maz/arm-platforms.git/commit/?h=irq/gic-4.5&id=58b8964990dc6b59198b25337624b8518cb1dd87
> 
> so you may want to have a look at this. I don't think it will affect the
> work you are doing in a major may though.

Ok, great. I was wondering if this change has been queued somewhere. It
is not too different from mine, however, AFAICT you could get rid of the
gic_eoimode1_chip structure, as I have done, as it is mostly the same as
gic_chip.

Cheers
Jon
