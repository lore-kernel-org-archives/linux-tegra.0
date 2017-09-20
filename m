From: Shawn N <shawnn-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3] platform/chrome: Use proper protocol transfer function
Date: Wed, 20 Sep 2017 13:22:37 -0700
Message-ID: <CALaWCOPEiWHMeOb-9_fpbyYuNzGdy0favnPS37u5_zz1AG_86w@mail.gmail.com>
References: <20170908205011.77986-1-briannorris@chromium.org>
 <02aa65e7-e967-055b-2af3-2e9b6ef77935@nvidia.com> <CALaWCOMj0wQk5OfYOYqU_sZUt2SQBhy=HaP-qOiB5aMf9G8inw@mail.gmail.com>
 <c3c5d08b-2df2-2e5b-cb09-bd4b3011e3df@nvidia.com> <20170919171401.GA10968@google.com>
 <CALaWCOPzT-BWu-YcMY+xEAWGRmvvVEoA64ceEK3zG3K-wajskQ@mail.gmail.com> <20170920061317.GB13616@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170920061317.GB13616-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gwendal Grignou <gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Enric Balletbo <enric.balletbo-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 19, 2017 at 11:13 PM, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> Hi,
>
> On Tue, Sep 19, 2017 at 11:05:38PM -0700, Shawn N wrote:
>> This is failing because our EC_CMD_GET_PROTOCOL_INFO host command is
>> getting messed up, or the reply buffer is getting corrupted somehow.
>>
>>                ec_dev->proto_version =
>>                         min(EC_HOST_REQUEST_VERSION,
>>                                         fls(proto_info->protocol_versions) - 1);
>>

Checking this closer, the first host command we send after we boot the
kernel (EC_CMD_GET_PROTOCOL_INFO) is failing due to protocol error
(see 'SPI rx bad data' / 'SPI not ready' on the EC console). Since
this doesn't seem to happen on the Chromium OS nyan_big release
kernel, I suggest to hook up a logic analyzer and see if the SPI
master is doing something bad.

The error handling in cros_ec_cmd_xfer_spi() is completely wrong and
we return -EAGAIN / EC_RES_IN_PROGRESS, which the caller interprets
"the host command was received by the EC and is currently being
handled, poll status until completion". So the caller polls status
with EC_CMD_GET_COMMS_STATUS, sees no host command is in progress
(which is interpreted to mean "the host command I sent previously has
now successfully completed"), and returns success. The problem here is
that the initial host command was never received at all, and no reply
was ever received, so our reply data is all zero.

Two things need to be fixed here:

1) Find out why the first host command after boot is failing. Probe
SPI pins and see what's going on.
2) Fix error handling so we properly return an error (or properly
retry the entire command) when a protocol error occurs (I made some
attempt in https://chromium-review.googlesource.com/385080/, probably
I should revisit that).

>> If proto_info->protocol_versions == 0 then ec_dev->proto_version will
>> be assigned 0xffff. The logic here seems strange to me, if the EC is
>
> Whoops...
>
>> successfully replying to our v3 command then obviously it supports v3
>> (maybe it will be useful someday if EC_HOST_REQUEST_VERSION is rev'd).
>> Anyway, we need to figure out what is happening with our
>> EC_HOST_REQUEST_VERSION host command.
>>
>> On Tue, Sep 19, 2017 at 10:14 AM, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> > Hi Jon,
>> >
>> > On Tue, Sep 19, 2017 at 05:39:56PM +0100, Jon Hunter wrote:
>> >> On 19/09/17 15:09, Shawn N wrote:
> ...
>> > Furthermore, the only assignments to this 'proto_version' field look
>> > like they're only writing one of 0, 2, 3, or
>> >
>> >    min(EC_HOST_REQUEST_VERSION, fls(proto_info->protocol_versions) - 1)
>> >
>> > . I don't see where 0xffff comes from.
>
> ...I'm an idiot. While the rvalue (the expression above) is an int (e.g,
> -1), it's getting cast into a uint16_t (ec_dev->proto_version). So
> that's where the 0xffff can come from.

I saw that before and overlooked it too, so we're both idiots.

>
> Sorry if I misled you Shawn :(
>
> Brian
