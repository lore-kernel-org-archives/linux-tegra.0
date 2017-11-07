From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3] platform/chrome: Use proper protocol transfer function
Date: Tue, 7 Nov 2017 09:22:57 -0800
Message-ID: <CAD=FV=WBKDm5r=7UP0RxYOfC8Uk8oR2xL2iKOLXvZKsBY0YNeg@mail.gmail.com>
References: <20170908205011.77986-1-briannorris@chromium.org>
 <02aa65e7-e967-055b-2af3-2e9b6ef77935@nvidia.com> <CALaWCOMj0wQk5OfYOYqU_sZUt2SQBhy=HaP-qOiB5aMf9G8inw@mail.gmail.com>
 <c3c5d08b-2df2-2e5b-cb09-bd4b3011e3df@nvidia.com> <20170919171401.GA10968@google.com>
 <CALaWCOPzT-BWu-YcMY+xEAWGRmvvVEoA64ceEK3zG3K-wajskQ@mail.gmail.com>
 <20170920061317.GB13616@google.com> <CALaWCOPEiWHMeOb-9_fpbyYuNzGdy0favnPS37u5_zz1AG_86w@mail.gmail.com>
 <CALaWCOM87ikjzK-zFJ7WT37L_w58AwZwC_nq0hNXuzh5x87n5w@mail.gmail.com>
 <6beb7b8c-f602-112b-73b2-22188dcea28e@nvidia.com> <CALaWCOP=0O7AMobu4YX0z=fJLopcQwv1Vm1_Bbp3XTaty1y6fA@mail.gmail.com>
 <CAD=FV=VobwsHyo96JxAgEPqG2ji5gMoNz6JJxQaQmZ3MD+dxRg@mail.gmail.com> <5ae1292d-14dc-b917-84cc-2758e82c4795@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5ae1292d-14dc-b917-84cc-2758e82c4795-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Shawn N <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gwendal Grignou <gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Enric Balletbo <enric.balletbo-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Tue, Nov 7, 2017 at 3:28 AM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> On 10/10/17 17:52, Doug Anderson wrote:
>
> ...
>
>>> I'm still not clear on why we see an error only on the first
>>> transaction after boot. In this case, the embedded controller
>>> previously handled host commands from firmware just fine, and the
>>> handoff between firmware and the kernel shouldn't be significant, from
>>> the EC point of view. If host command timing is consistent from the
>>> master, I would expect to see some constant error rate, eg. some
>>> chance any host command will fail, rather than the first host command
>>> always failing.
>>
>> The AP itself is often quite busy at boot and so the timings for
>> everything change.  That could easily explain the problems.
>
> Sorry for the delay, but I have finally had some time to look at this a
> bit closer. I have been able to track down where the additional delay is
> really needed and seems to explain what is going on.
>
> For starters, the SPI chip-select is under h/w control and so the
> software delay has no impact on the timing between the chip-select
> going active and the transaction starting as I had first thought.
>
> I found that a delay is needed between completing the probe the Tegra
> SPI device and the first SPI transaction issued to the EC. In the Tegra
> SPI probe the SPI controller is programmed for master mode, but at the
> same time it clears the chip-select inactive polarity bit meaning that
> initially the SPI chip-select default to active-high (rather that low
> which seems odd). I believe that this then drives the chip-select low
> (active for the EC) and until it is then configured when spi_setup() is
> called which configures it as active-low for the EC.
> To get the first transaction to work for the EC there needs to be a
> delay after we program the chip-select polarity when spi_setup() is
> called. For example ...
>
> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index 584367f3a0ed..c1075c3c60c8 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -648,6 +648,8 @@ static int cros_ec_spi_probe(struct spi_device *spi)
>         if (err < 0)
>                 return err;
>
> +       udelay(100);
> +

This isn't totally crazy, but actually you could probably do this:

ec_spi->last_transfer_ns = ktime_get_ns();

...that will leverage already existing code and constants and also
will avoid doing a delay if it wasn't needed.  You could also then get
rid of some "if (ec_spi->last_transfer_ns)" tests in the code.  I'd
support landing that.


>         ec_spi = devm_kzalloc(dev, sizeof(*ec_spi), GFP_KERNEL);
>         if (ec_spi == NULL)
>                 return -ENOMEM;
>
>
> You may say why not put a delay in the tegra_spi_setup() itself, but we
> have some other SPI devices such as flash devices which are also use an
> active-low chip-select which don't have any issues with this to date.
> Furthermore, this delay is also probably device specific.
>
> From an EC perspective, if the chip-select is asserted is there a
> turnaround time before it can be asserted again? Or in this case maybe
> the issue is that the chip-select is asserted but no transaction occurs
> before it is de-asserted and so is causing a problem. Please note that a
> delay of around ~50us above still fails but 100us seems to be ok.

Really nice detective work!


> Finally, this also works-around the problem by avoiding the chip-select
> from being pulsed low by defaulting all chip-selects to active-low but
> maybe this just masks the problem.
>
> diff --git a/drivers/spi/spi-tegra114.c b/drivers/spi/spi-tegra114.c
> index a76acedd7e2f..7c18204e61d9 100644
> --- a/drivers/spi/spi-tegra114.c
> +++ b/drivers/spi/spi-tegra114.c
> @@ -1117,7 +1117,7 @@ static int tegra_spi_probe(struct platform_device
>                 goto exit_pm_disable;
>         }
> -       tspi->def_command1_reg  = SPI_M_S;
> +       tspi->def_command1_reg = SPI_M_S | SPI_CS_POL_INACTIVE_MASK;

Note that even though I'd support adding some sort of delay to the
cros_ec driver, I'd also say that it _might_ make sense to mess with
the SPI driver too, just to avoid glitching the lines at bootup.  As
you said, you shouldn't just willy nilly change the default but it
seems like it could make sense to define an initial (board level)
pinctrl state that's in effect until the first call to setup_bus().

That's a bit like the "init" pinctrl state that exists precisely to
address these types of glitches, but unfortunately you can't use the
automatic-ness of the "init" pinctrl state.  That code assumes that by
the end of probe you know how your pins should be configured.  In your
case you don't know how your pins should be configured until the first
setup_bus() is called...

Presumably you could add your own pinctrl state that mimics "init", or
you could figure out how to improve the way the "init" pinctrl state
works to allow a driver to defer the transition to "default".

Another option might be to try to use the "idle" state, maybe in
conjunction with the "init" pinctrl state.  AKA use "init" to avoid
glitches during probe and then require that by the end of probe that
the device is Runtime Suspended, which would leave you in "idle"
state.  Then in setup_bus you make sure you keep track of the polarity
in such a way that when you Runtime Resume you can come out of "idle"
state without glitching.  The board would need to define "init" and
"idle" in a way that won't glitch things.


As with my advice always, note that I'm not an expert so feel free to
call into question my advice if it looks wrong.  :-P


>         tegra_spi_writel(tspi, tspi->def_command1_reg, SPI_COMMAND1);
>         pm_runtime_put(&pdev->dev);
>
> Cheers
> Jon
>
> --
> nvpublic
