From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3] platform/chrome: Use proper protocol transfer function
Date: Tue, 19 Sep 2017 23:13:18 -0700
Message-ID: <20170920061317.GB13616@google.com>
References: <20170908205011.77986-1-briannorris@chromium.org>
 <02aa65e7-e967-055b-2af3-2e9b6ef77935@nvidia.com>
 <CALaWCOMj0wQk5OfYOYqU_sZUt2SQBhy=HaP-qOiB5aMf9G8inw@mail.gmail.com>
 <c3c5d08b-2df2-2e5b-cb09-bd4b3011e3df@nvidia.com>
 <20170919171401.GA10968@google.com>
 <CALaWCOPzT-BWu-YcMY+xEAWGRmvvVEoA64ceEK3zG3K-wajskQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CALaWCOPzT-BWu-YcMY+xEAWGRmvvVEoA64ceEK3zG3K-wajskQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn N <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gwendal Grignou <gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Enric Balletbo <enric.balletbo-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Tue, Sep 19, 2017 at 11:05:38PM -0700, Shawn N wrote:
> This is failing because our EC_CMD_GET_PROTOCOL_INFO host command is
> getting messed up, or the reply buffer is getting corrupted somehow.
> 
>                ec_dev->proto_version =
>                         min(EC_HOST_REQUEST_VERSION,
>                                         fls(proto_info->protocol_versions) - 1);
> 
> If proto_info->protocol_versions == 0 then ec_dev->proto_version will
> be assigned 0xffff. The logic here seems strange to me, if the EC is

Whoops...

> successfully replying to our v3 command then obviously it supports v3
> (maybe it will be useful someday if EC_HOST_REQUEST_VERSION is rev'd).
> Anyway, we need to figure out what is happening with our
> EC_HOST_REQUEST_VERSION host command.
> 
> On Tue, Sep 19, 2017 at 10:14 AM, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > Hi Jon,
> >
> > On Tue, Sep 19, 2017 at 05:39:56PM +0100, Jon Hunter wrote:
> >> On 19/09/17 15:09, Shawn N wrote:
...
> > Furthermore, the only assignments to this 'proto_version' field look
> > like they're only writing one of 0, 2, 3, or
> >
> >    min(EC_HOST_REQUEST_VERSION, fls(proto_info->protocol_versions) - 1)
> >
> > . I don't see where 0xffff comes from.

...I'm an idiot. While the rvalue (the expression above) is an int (e.g,
-1), it's getting cast into a uint16_t (ec_dev->proto_version). So
that's where the 0xffff can come from.

Sorry if I misled you Shawn :(

Brian
