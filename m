From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3] platform/chrome: Use proper protocol transfer function
Date: Tue, 19 Sep 2017 10:14:01 -0700
Message-ID: <20170919171401.GA10968@google.com>
References: <20170908205011.77986-1-briannorris@chromium.org>
 <02aa65e7-e967-055b-2af3-2e9b6ef77935@nvidia.com>
 <CALaWCOMj0wQk5OfYOYqU_sZUt2SQBhy=HaP-qOiB5aMf9G8inw@mail.gmail.com>
 <c3c5d08b-2df2-2e5b-cb09-bd4b3011e3df@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c3c5d08b-2df2-2e5b-cb09-bd4b3011e3df-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Shawn N <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Gwendal Grignou <gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Enric Balletbo <enric.balletbo-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Jon,

On Tue, Sep 19, 2017 at 05:39:56PM +0100, Jon Hunter wrote:
> On 19/09/17 15:09, Shawn N wrote:
> > On Tue, Sep 19, 2017 at 6:44 AM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> >> Tegra124 Nyan-Big is currently crashing during boot with -next [0] and
> >> bisect is pointing to this commit. Reverting the above on top of -next
> >> does allow the board to boot successfully. Looks like this board is
> >> proto_version 3 but I have not looked into this any further. Let me know
> >> if you have any thoughts.
> > 
> > 
> > Thanks for the bug report, I'll look into this today.

Yes, thanks!

> >> [    1.502497] kernel BUG at drivers/platform/chrome/cros_ec_proto.c:34!
> >> 34 BUG_ON(ec_dev->proto_version != EC_HOST_REQUEST_VERSION);
> > 
> > So, ec_dev->proto_version > 3? That doesn't seem right.
> 
> You mean != 3, but yes. Looks like an initialisation problem, because if I 
> add the following WARNING ...
> 
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index e7bbdf947bbc..ad3b3a1e8d54 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -31,6 +31,7 @@ static int prepare_packet(struct cros_ec_device *ec_dev,
>         int i;
>         u8 csum = 0;
>  
> +       WARN(ec_dev->proto_version != EC_HOST_REQUEST_VERSION, "%d != %d", ec_dev->proto_version, EC_HOST_REQUEST_VERSION);
>         BUG_ON(ec_dev->proto_version != EC_HOST_REQUEST_VERSION);
>         BUG_ON(msg->outsize + sizeof(*request) > ec_dev->dout_size);
>  
> ... then I see ...
> 
> [    1.502495] WARNING: CPU: 0 PID: 1 at drivers/platform/chrome/cros_ec_proto.c:35 cros_ec_prepare_tx+0x190/0x1a8
> [    1.512566] 65535 != 3
> 
> Any chance this is being called before the version is initialised?

If it's uninitialized, it should be 0 (the structure is kzalloc'd, and
the call stack you point to clearly shows it's at least been allocated
already). Also, if it's uninitialized, then you should be BUG'ing even
without this patch; the patch you've bisected to is only modifying the
*second* (or later) attempt to send the command, and it's using the same
'ec_dev' structure.

Furthermore, the only assignments to this 'proto_version' field look
like they're only writing one of 0, 2, 3, or

   min(EC_HOST_REQUEST_VERSION, fls(proto_info->protocol_versions) - 1)

. I don't see where 0xffff comes from.

So...is there any chance we've got a heap corruption somewhere?
Somebody's overwriting 'ec_dev->proto_version' accidentally?

Brian
