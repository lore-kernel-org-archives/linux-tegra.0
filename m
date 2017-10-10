From: Shawn N <shawnn@chromium.org>
Subject: Re: [PATCH v3] platform/chrome: Use proper protocol transfer function
Date: Tue, 10 Oct 2017 08:33:00 -0700
Message-ID: <CALaWCOP=0O7AMobu4YX0z=fJLopcQwv1Vm1_Bbp3XTaty1y6fA@mail.gmail.com>
References: <20170908205011.77986-1-briannorris@chromium.org>
 <02aa65e7-e967-055b-2af3-2e9b6ef77935@nvidia.com> <CALaWCOMj0wQk5OfYOYqU_sZUt2SQBhy=HaP-qOiB5aMf9G8inw@mail.gmail.com>
 <c3c5d08b-2df2-2e5b-cb09-bd4b3011e3df@nvidia.com> <20170919171401.GA10968@google.com>
 <CALaWCOPzT-BWu-YcMY+xEAWGRmvvVEoA64ceEK3zG3K-wajskQ@mail.gmail.com>
 <20170920061317.GB13616@google.com> <CALaWCOPEiWHMeOb-9_fpbyYuNzGdy0favnPS37u5_zz1AG_86w@mail.gmail.com>
 <CALaWCOM87ikjzK-zFJ7WT37L_w58AwZwC_nq0hNXuzh5x87n5w@mail.gmail.com> <6beb7b8c-f602-112b-73b2-22188dcea28e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6beb7b8c-f602-112b-73b2-22188dcea28e@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Olof Johansson <olof@lixom.net>, Benson Leung <bleung@chromium.org>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Brian Norris <computersforpeace@gmail.com>, Brian Norris <briannorris@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, Enric Balletbo <enric.balletbo@collabora.co.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, amstan@chromium.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 10, 2017 at 6:35 AM, Jon Hunter <jonathanh@nvidia.com> wrote:
>
> On 26/09/17 00:15, Shawn N wrote:
>> On Wed, Sep 20, 2017 at 1:22 PM, Shawn N <shawnn@google.com> wrote:
>>> On Tue, Sep 19, 2017 at 11:13 PM, Brian Norris <briannorris@chromium.org> wrote:
>>>> Hi,
>>>>
>>>> On Tue, Sep 19, 2017 at 11:05:38PM -0700, Shawn N wrote:
>>>>> This is failing because our EC_CMD_GET_PROTOCOL_INFO host command is
>>>>> getting messed up, or the reply buffer is getting corrupted somehow.
>>>>>
>>>>>                ec_dev->proto_version =
>>>>>                         min(EC_HOST_REQUEST_VERSION,
>>>>>                                         fls(proto_info->protocol_versions) - 1);
>>>>>
>>>
>>> Checking this closer, the first host command we send after we boot the
>>> kernel (EC_CMD_GET_PROTOCOL_INFO) is failing due to protocol error
>>> (see 'SPI rx bad data' / 'SPI not ready' on the EC console). Since
>>> this doesn't seem to happen on the Chromium OS nyan_big release
>>> kernel, I suggest to hook up a logic analyzer and see if the SPI
>>> master is doing something bad.
>>>
>>> The error handling in cros_ec_cmd_xfer_spi() is completely wrong and
>>> we return -EAGAIN / EC_RES_IN_PROGRESS, which the caller interprets
>>> "the host command was received by the EC and is currently being
>>> handled, poll status until completion". So the caller polls status
>>> with EC_CMD_GET_COMMS_STATUS, sees no host command is in progress
>>> (which is interpreted to mean "the host command I sent previously has
>>> now successfully completed"), and returns success. The problem here is
>>> that the initial host command was never received at all, and no reply
>>> was ever received, so our reply data is all zero.
>>>
>>> Two things need to be fixed here:
>>>
>>> 1) Find out why the first host command after boot is failing. Probe
>>> SPI pins and see what's going on.
>>> 2) Fix error handling so we properly return an error (or properly
>>> retry the entire command) when a protocol error occurs (I made some
>>> attempt in https://chromium-review.googlesource.com/385080/, probably
>>> I should revisit that).
>>
>> The below patch will fix error handling and will make things mostly
>> work on nyan_big, because we'll fall back to V2 protocol after the
>> initial failure. But we should still investigate why we're getting
>> errors on the first host command. We aren't seeing these errors when
>> we send commands from firmware, so I suspect something is wrong in
>> kernel SPI HW initialization that causes the first command to fail.
> I have been looking into this a bit more and it appears to be timing
> related. I found that enabling some debug in the Tegra SPI driver the
> problem would go away and seems that adding a delay before sending the
> SPI message would also workaround the problem.
>
> Looking back at the Tegra Linux test history [0], it appears that after
> v4.10-rc5 [1] I start to see the following message which is the first
> indication of some SPI issues ...
>
>  cros-ec-spi spi32766.0: packet too long (249 bytes, expected 4)
>
> I attempted to bisect this, but I was not successful because each time
> I would ended up somewhere different. I found that even with v4.9 I may
> see the issue 1 in 20 times and so I realised that I am not even sure
> when the problem really started or if has always been there. It seems
> that for older kernels it is harder to reproduce. I am wondering now if
> some timing has changed somewhere causing us to see the problem more
> frequently with newer kernels?
>
> I see the the cros-ec binding defines the following ...
>
> "google,cros-ec-spi-pre-delay: Some implementations of the EC need a
>  little time to wake up from sleep before they can receive SPI transfers
>  at a high clock rate. This property specifies the delay, in usecs,
>  between the assertion of the CS to the start of the first clock pulse."
>
> I found that adding the following also worked around the problem ...
>
> diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
> index 5cf987b5401e..0baa6bfc0f36 100644
> --- a/arch/arm/boot/dts/tegra124-nyan.dtsi
> +++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
> @@ -317,6 +317,7 @@
>                         interrupts = <TEGRA_GPIO(C, 7) IRQ_TYPE_LEVEL_LOW>;
>                         reg = <0>;
>
> +                       google,cros-ec-spi-pre-delay = <10>;
>                         google,cros-ec-spi-msg-delay = <2000>;
>
>                         i2c-tunnel {
>
> I have tried 50 boots with the above and I have seen no SPI failures
> on boot.
>
> I did look to see if it is possible to probe the SPI signals with a
> scope but from the schematics I am not sure if they are accessible or
> buried in the PCB.
>
> Is it possible that Tegra is sending the SPI message too soon for the
> EC?

I have not worked much with the cros_ec stm32 SPI host interface, but
I think it's possible. Also note that we define
"google,cros-ec-spi-pre-delay = <30>;" for the veyron family of
devices, which also use an stm32-family embedded controller. Some of
the folks on cc worked more on veyron and may have more insight.

I'm still not clear on why we see an error only on the first
transaction after boot. In this case, the embedded controller
previously handled host commands from firmware just fine, and the
handoff between firmware and the kernel shouldn't be significant, from
the EC point of view. If host command timing is consistent from the
master, I would expect to see some constant error rate, eg. some
chance any host command will fail, rather than the first host command
always failing.

>
> Cheers
> Jon
>
> [0] https://nvtb.github.io/linux/
> [1] https://nvtb.github.io/linux/test_v4.10-rc5/20170123023102/boot/tegra124-nyan-big/tegra124-nyan-big/tegra_defconfig_log.txt
>
> --
> nvpublic
