From: Shawn N <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3] platform/chrome: Use proper protocol transfer function
Date: Tue, 14 Nov 2017 07:59:33 -0800
Message-ID: <CALaWCONZvCu+iXkv20bXBbpU-P67KcAQaNd=CBa4G=bUc10Tdg@mail.gmail.com>
References: <20170908205011.77986-1-briannorris@chromium.org>
 <02aa65e7-e967-055b-2af3-2e9b6ef77935@nvidia.com> <CALaWCOMj0wQk5OfYOYqU_sZUt2SQBhy=HaP-qOiB5aMf9G8inw@mail.gmail.com>
 <c3c5d08b-2df2-2e5b-cb09-bd4b3011e3df@nvidia.com> <20170919171401.GA10968@google.com>
 <CALaWCOPzT-BWu-YcMY+xEAWGRmvvVEoA64ceEK3zG3K-wajskQ@mail.gmail.com>
 <20170920061317.GB13616@google.com> <CALaWCOPEiWHMeOb-9_fpbyYuNzGdy0favnPS37u5_zz1AG_86w@mail.gmail.com>
 <CALaWCOM87ikjzK-zFJ7WT37L_w58AwZwC_nq0hNXuzh5x87n5w@mail.gmail.com>
 <d8aff55f-796b-4e8d-edf3-b8d55a65eda0@nvidia.com> <4cf2fa5b-f909-1ab1-f743-e1cb9a66c604@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4cf2fa5b-f909-1ab1-f743-e1cb9a66c604-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gwendal Grignou <gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Enric Balletbo <enric.balletbo-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Jon,

On Tue, Nov 14, 2017 at 7:56 AM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> Hi Shawn,
>
> On 26/09/17 16:40, Jon Hunter wrote:
> > On 26/09/17 00:15, Shawn N wrote:
>
> ...
>
> >> From: Shawn Nematbakhsh <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> Date: Mon, 25 Sep 2017 14:32:38 -0700
> >> Subject: [PATCH] mfd: cros ec: spi: Fix "in progress" error signaling
> >>
> >> For host commands that take a long time to process, cros ec can return
> >> early by signaling a EC_RES_IN_PROGRESS result. The host must then poll
> >> status with EC_CMD_GET_COMMS_STATUS until completion of the command.
> >>
> >> None of the above applies when data link errors are encountered. When
> >> errors such as EC_SPI_PAST_END are encountered during command
> >> transmission, it usually means the command was not received by the EC.
> >> Treating such errors as if they were 'EC_RES_IN_PROGRESS' results is
> >> almost always the wrong decision, and can result in host commands
> >> silently being lost.
> >>
> >> Signed-off-by: Shawn Nematbakhsh <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> ---
> >>  drivers/mfd/cros_ec_spi.c | 26 ++++++++++++--------------
> >>  1 file changed, 12 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> >> index c9714072e224..d33e3847e11e 100644
> >> --- a/drivers/mfd/cros_ec_spi.c
> >> +++ b/drivers/mfd/cros_ec_spi.c
> >> @@ -377,6 +377,7 @@ static int cros_ec_pkt_xfer_spi(struct
> >> cros_ec_device *ec_dev,
> >>         u8 *ptr;
> >>         u8 *rx_buf;
> >>         u8 sum;
> >> +       u8 rx_byte;
> >>         int ret = 0, final_ret;
> >>
> >>         len = cros_ec_prepare_tx(ec_dev, ec_msg);
> >> @@ -421,25 +422,22 @@ static int cros_ec_pkt_xfer_spi(struct
> >> cros_ec_device *ec_dev,
> >>         if (!ret) {
> >>                 /* Verify that EC can process command */
> >>                 for (i = 0; i < len; i++) {
> >> -                       switch (rx_buf[i]) {
> >> -                       case EC_SPI_PAST_END:
> >> -                       case EC_SPI_RX_BAD_DATA:
> >> -                       case EC_SPI_NOT_READY:
> >> -                               ret = -EAGAIN;
> >> -                               ec_msg->result = EC_RES_IN_PROGRESS;
> >> -                       default:
> >> +                       rx_byte = rx_buf[i];
> >> +                       if (rx_byte == EC_SPI_PAST_END  ||
> >> +                           rx_byte == EC_SPI_RX_BAD_DATA ||
> >> +                           rx_byte == EC_SPI_NOT_READY) {
> >> +                               ret = -EREMOTEIO;
> >>                                 break;
> >>                         }
> >> -                       if (ret)
> >> -                               break;
> >>                 }
> >> -               if (!ret)
> >> -                       ret = cros_ec_spi_receive_packet(ec_dev,
> >> -                                       ec_msg->insize + sizeof(*response));
> >> -       } else {
> >> -               dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
> >>         }
> >>
> >> +       if (!ret)
> >> +               ret = cros_ec_spi_receive_packet(ec_dev,
> >> +                               ec_msg->insize + sizeof(*response));
> >> +       else
> >> +               dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
> >> +
> >>         final_ret = terminate_request(ec_dev);
> >>
> >>         spi_bus_unlock(ec_spi->spi->master);
> >>
> >
> > Thanks! Works for me ...
> >
> > Tested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> I can't find the formal patch you sent out for the above, but I have not
> seen it picked up yet. I am guess that Lee did not pick it up because
> there was still an open question. Anyhow we may want to circle back with
> Lee on this so that this does get picked up.

The formal patch is here:

https://lkml.org/lkml/2017/9/27/707

I will circle back to ensure that it gets picked up.

>
> Cheers
> Jon
>
> --
> nvpublic
