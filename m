From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3] platform/chrome: Use proper protocol transfer function
Date: Tue, 19 Sep 2017 17:39:56 +0100
Message-ID: <c3c5d08b-2df2-2e5b-cb09-bd4b3011e3df@nvidia.com>
References: <20170908205011.77986-1-briannorris@chromium.org>
 <02aa65e7-e967-055b-2af3-2e9b6ef77935@nvidia.com>
 <CALaWCOMj0wQk5OfYOYqU_sZUt2SQBhy=HaP-qOiB5aMf9G8inw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALaWCOMj0wQk5OfYOYqU_sZUt2SQBhy=HaP-qOiB5aMf9G8inw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn N <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Gwendal Grignou <gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Enric Balletbo <enric.balletbo-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



On 19/09/17 15:09, Shawn N wrote:
> On Tue, Sep 19, 2017 at 6:44 AM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>
>> Hi Brian,
>>
>> On 08/09/17 21:50, Brian Norris wrote:
>>> From: Shawn Nematbakhsh <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>
>>> pkt_xfer should be used for protocol v3, and cmd_xfer otherwise. We had
>>> one instance of these functions correct, but not the second, fall-back
>>> case. We use the fall-back only when the first command returns an
>>> IN_PROGRESS status, which is only used on some EC firmwares where we
>>> don't want to constantly poll the bus, but instead back off and
>>> sleep/retry for a little while.
>>>
>>> Fixes: 2c7589af3c4d ("mfd: cros_ec: add proto v3 skeleton")
>>> Signed-off-by: Shawn Nematbakhsh <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>> Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>> Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
>>> ---
>>> v3:
>>>  * Added Javier's reviewed tag
>>>  * It's been > 8 months since [1], so why not? And hey, Benson's officially in
>>>    MAINTAINERS now! Too bad no one told me.
>>>
>>>  [1] https://patchwork.kernel.org/patch/9450633/
>>>
>>>
>>> v2:
>>>  * Add Benson in 'To:'
>>>  * make subject prefix more obvious
>>>
>>>  drivers/platform/chrome/cros_ec_proto.c | 8 +++++---
>>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
>>> index 8dfa7fcb1248..e7bbdf947bbc 100644
>>> --- a/drivers/platform/chrome/cros_ec_proto.c
>>> +++ b/drivers/platform/chrome/cros_ec_proto.c
>>> @@ -60,12 +60,14 @@ static int send_command(struct cros_ec_device *ec_dev,
>>>                       struct cros_ec_command *msg)
>>>  {
>>>       int ret;
>>> +     int (*xfer_fxn)(struct cros_ec_device *ec, struct cros_ec_command *msg);
>>>
>>>       if (ec_dev->proto_version > 2)
>>> -             ret = ec_dev->pkt_xfer(ec_dev, msg);
>>> +             xfer_fxn = ec_dev->pkt_xfer;
>>>       else
>>> -             ret = ec_dev->cmd_xfer(ec_dev, msg);
>>> +             xfer_fxn = ec_dev->cmd_xfer;u
>>>
>>> +     ret = (*xfer_fxn)(ec_dev, msg);
>>>       if (msg->result == EC_RES_IN_PROGRESS) {
>>>               int i;
>>>               struct cros_ec_command *status_msg;
>>> @@ -88,7 +90,7 @@ static int send_command(struct cros_ec_device *ec_dev,
>>>               for (i = 0; i < EC_COMMAND_RETRIES; i++) {
>>>                       usleep_range(10000, 11000);
>>>
>>> -                     ret = ec_dev->cmd_xfer(ec_dev, status_msg);
>>> +                     ret = (*xfer_fxn)(ec_dev, status_msg);
>>>                       if (ret < 0)
>>>                               break;
>>>
>>
>> Tegra124 Nyan-Big is currently crashing during boot with -next [0] and
>> bisect is pointing to this commit. Reverting the above on top of -next
>> does allow the board to boot successfully. Looks like this board is
>> proto_version 3 but I have not looked into this any further. Let me know
>> if you have any thoughts.
> 
> 
> Thanks for the bug report, I'll look into this today.
> 
>> [    1.502497] kernel BUG at drivers/platform/chrome/cros_ec_proto.c:34!
>> 34 BUG_ON(ec_dev->proto_version != EC_HOST_REQUEST_VERSION);
> 
> So, ec_dev->proto_version > 3? That doesn't seem right.

You mean != 3, but yes. Looks like an initialisation problem, because if I 
add the following WARNING ...

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index e7bbdf947bbc..ad3b3a1e8d54 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -31,6 +31,7 @@ static int prepare_packet(struct cros_ec_device *ec_dev,
        int i;
        u8 csum = 0;
 
+       WARN(ec_dev->proto_version != EC_HOST_REQUEST_VERSION, "%d != %d", ec_dev->proto_version, EC_HOST_REQUEST_VERSION);
        BUG_ON(ec_dev->proto_version != EC_HOST_REQUEST_VERSION);
        BUG_ON(msg->outsize + sizeof(*request) > ec_dev->dout_size);
 
... then I see ...

[    1.502495] WARNING: CPU: 0 PID: 1 at drivers/platform/chrome/cros_ec_proto.c:35 cros_ec_prepare_tx+0x190/0x1a8
[    1.512566] 65535 != 3

Any chance this is being called before the version is initialised?

Cheers
Jon

-- 
nvpublic
