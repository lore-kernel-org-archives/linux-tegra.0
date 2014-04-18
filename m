From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/7] mfd: cros_ec: spi: Add mutex to cros_ec_spi
Date: Fri, 18 Apr 2014 14:15:09 -0700
Message-ID: <CAD=FV=XhtW9ZORJLh396FZ=eE+szrTZN94KpoZj-9HVg7TaVRA@mail.gmail.com>
References: <1397757570-19750-1-git-send-email-dianders@chromium.org>
	<1397757570-19750-3-git-send-email-dianders@chromium.org>
	<CAPnjgZ034FrVVphJCmX5jZE8LeWOEBjsH7M=2C_meM0fMss1NA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ034FrVVphJCmX5jZE8LeWOEBjsH7M=2C_meM0fMss1NA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, lk <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Simon,

On Fri, Apr 18, 2014 at 10:28 AM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> Hi Doug,
>
> On 17 April 2014 11:59, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> The main transfer function for cros_ec_spi can be called by more than
>> one client at a time.  Make sure that those clients don't stomp on
>> each other by locking the bus for the duration of the transfer
>> function.
>
> Is there no lock at the cros_ec layer?

Not with what's upstream.

Locally in the Chromium OS tree:

* You can see that Bill removed the dev_lock at
<https://chromium-review.googlesource.com/#/c/57051/> since it wasn't
used.

* Andrew moved to a common locking scheme later in
<https://chromium-review.googlesource.com/#/c/170747/> (thus adding
roughly the same lock back and using it), but in order to do that
we've got a dozen pathces in between, some of which are big
reorganizations.  This includes at least:

6820b91 CHROMIUM: cros_ec: Tweak struct cros_ec_device for clarity
5e8e562 CHROMIUM: Use struct cros_ec_command to communicate with the EC
9e7db82 CHROMIUM: cleanup: remove unused fields from struct cros_ec_device
866e62d CHROMIUM: cleanup: Remove EC wrapper functions.
8a372b2 cros_ec: move locking into cros_ec_cmd_xfer
981c4aa cros_ec: stop calling ->cmd_xfer() directly

I think we should take in some of those other changes but I'd rather
get correctness in first (since people are wanting to use this driver
in upstream kernel) and get cleanups posted after this lands.  I was
also trying not to spam the list with a 20-patch series...

-Doug
