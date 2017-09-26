From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3] platform/chrome: Use proper protocol transfer function
Date: Tue, 26 Sep 2017 16:40:37 +0100
Message-ID: <d8aff55f-796b-4e8d-edf3-b8d55a65eda0@nvidia.com>
References: <20170908205011.77986-1-briannorris@chromium.org>
 <02aa65e7-e967-055b-2af3-2e9b6ef77935@nvidia.com>
 <CALaWCOMj0wQk5OfYOYqU_sZUt2SQBhy=HaP-qOiB5aMf9G8inw@mail.gmail.com>
 <c3c5d08b-2df2-2e5b-cb09-bd4b3011e3df@nvidia.com>
 <20170919171401.GA10968@google.com>
 <CALaWCOPzT-BWu-YcMY+xEAWGRmvvVEoA64ceEK3zG3K-wajskQ@mail.gmail.com>
 <20170920061317.GB13616@google.com>
 <CALaWCOPEiWHMeOb-9_fpbyYuNzGdy0favnPS37u5_zz1AG_86w@mail.gmail.com>
 <CALaWCOM87ikjzK-zFJ7WT37L_w58AwZwC_nq0hNXuzh5x87n5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALaWCOM87ikjzK-zFJ7WT37L_w58AwZwC_nq0hNXuzh5x87n5w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn N <shawnn@chromium.org>
Cc: Olof Johansson <olof@lixom.net>, Benson Leung <bleung@chromium.org>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Brian Norris <computersforpeace@gmail.com>, Brian Norris <briannorris@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, Enric Balletbo <enric.balletbo@collabora.co.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 26/09/17 00:15, Shawn N wrote:
> On Wed, Sep 20, 2017 at 1:22 PM, Shawn N <shawnn@google.com> wrote:
>> On Tue, Sep 19, 2017 at 11:13 PM, Brian Norris <briannorris@chromium.org> wrote:
>>> Hi,
>>>
>>> On Tue, Sep 19, 2017 at 11:05:38PM -0700, Shawn N wrote:
>>>> This is failing because our EC_CMD_GET_PROTOCOL_INFO host command is
>>>> getting messed up, or the reply buffer is getting corrupted somehow.
>>>>
>>>>                ec_dev->proto_version =
>>>>                         min(EC_HOST_REQUEST_VERSION,
>>>>                                         fls(proto_info->protocol_versions) - 1);
>>>>
>>
>> Checking this closer, the first host command we send after we boot the
>> kernel (EC_CMD_GET_PROTOCOL_INFO) is failing due to protocol error
>> (see 'SPI rx bad data' / 'SPI not ready' on the EC console). Since
>> this doesn't seem to happen on the Chromium OS nyan_big release
>> kernel, I suggest to hook up a logic analyzer and see if the SPI
>> master is doing something bad.
>>
>> The error handling in cros_ec_cmd_xfer_spi() is completely wrong and
>> we return -EAGAIN / EC_RES_IN_PROGRESS, which the caller interprets
>> "the host command was received by the EC and is currently being
>> handled, poll status until completion". So the caller polls status
>> with EC_CMD_GET_COMMS_STATUS, sees no host command is in progress
>> (which is interpreted to mean "the host command I sent previously has
>> now successfully completed"), and returns success. The problem here is
>> that the initial host command was never received at all, and no reply
>> was ever received, so our reply data is all zero.
>>
>> Two things need to be fixed here:
>>
>> 1) Find out why the first host command after boot is failing. Probe
>> SPI pins and see what's going on.

Yes, I will see if I can look into this.

>> 2) Fix error handling so we properly return an error (or properly
>> retry the entire command) when a protocol error occurs (I made some
>> attempt in https://chromium-review.googlesource.com/385080/, probably
>> I should revisit that).
> 
> The below patch will fix error handling and will make things mostly
> work on nyan_big, because we'll fall back to V2 protocol after the
> initial failure. But we should still investigate why we're getting
> errors on the first host command. We aren't seeing these errors when
> we send commands from firmware, so I suspect something is wrong in
> kernel SPI HW initialization that causes the first command to fail.
> 
> From: Shawn Nematbakhsh <shawnn@chromium.org>
> Date: Mon, 25 Sep 2017 14:32:38 -0700
> Subject: [PATCH] mfd: cros ec: spi: Fix "in progress" error signaling
> 
> For host commands that take a long time to process, cros ec can return
> early by signaling a EC_RES_IN_PROGRESS result. The host must then poll
> status with EC_CMD_GET_COMMS_STATUS until completion of the command.
> 
> None of the above applies when data link errors are encountered. When
> errors such as EC_SPI_PAST_END are encountered during command
> transmission, it usually means the command was not received by the EC.
> Treating such errors as if they were 'EC_RES_IN_PROGRESS' results is
> almost always the wrong decision, and can result in host commands
> silently being lost.
> 
> Signed-off-by: Shawn Nematbakhsh <shawnn@chromium.org>
> ---
>  drivers/mfd/cros_ec_spi.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index c9714072e224..d33e3847e11e 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -377,6 +377,7 @@ static int cros_ec_pkt_xfer_spi(struct
> cros_ec_device *ec_dev,
>         u8 *ptr;
>         u8 *rx_buf;
>         u8 sum;
> +       u8 rx_byte;
>         int ret = 0, final_ret;
> 
>         len = cros_ec_prepare_tx(ec_dev, ec_msg);
> @@ -421,25 +422,22 @@ static int cros_ec_pkt_xfer_spi(struct
> cros_ec_device *ec_dev,
>         if (!ret) {
>                 /* Verify that EC can process command */
>                 for (i = 0; i < len; i++) {
> -                       switch (rx_buf[i]) {
> -                       case EC_SPI_PAST_END:
> -                       case EC_SPI_RX_BAD_DATA:
> -                       case EC_SPI_NOT_READY:
> -                               ret = -EAGAIN;
> -                               ec_msg->result = EC_RES_IN_PROGRESS;
> -                       default:
> +                       rx_byte = rx_buf[i];
> +                       if (rx_byte == EC_SPI_PAST_END  ||
> +                           rx_byte == EC_SPI_RX_BAD_DATA ||
> +                           rx_byte == EC_SPI_NOT_READY) {
> +                               ret = -EREMOTEIO;
>                                 break;
>                         }
> -                       if (ret)
> -                               break;
>                 }
> -               if (!ret)
> -                       ret = cros_ec_spi_receive_packet(ec_dev,
> -                                       ec_msg->insize + sizeof(*response));
> -       } else {
> -               dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
>         }
> 
> +       if (!ret)
> +               ret = cros_ec_spi_receive_packet(ec_dev,
> +                               ec_msg->insize + sizeof(*response));
> +       else
> +               dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
> +
>         final_ret = terminate_request(ec_dev);
> 
>         spi_bus_unlock(ec_spi->spi->master);
> 

Thanks! Works for me ...

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
