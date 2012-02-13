From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V1 0/3] Support for open drain gpios in gpilib/fixed regulators.
Date: Mon, 13 Feb 2012 21:02:03 +0100
Message-ID: <CACRpkdb5VA4GJpB_0Xra=R0LUD9fz4CoDLjuwFHZ8SnTMz3fpg@mail.gmail.com>
References: <1329114588-15430-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1329114588-15430-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, dunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 13, 2012 at 7:29 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>=
 wrote:

> This is series of patches =A0to add support of the open drain gpios
> in standard gpio library and using this in fixed regulators.
> - Added GPIOF_OD flag so that client can request the gpio with this f=
lag.
> - Added support for the sysfs interface for open-drain.
> - Handle open drain gpio configuration properly.
> - Use this flag in fixed regualtor to tell that gpio is open drain.
> - Gpio documentation changes to have support for open-drain.

My gut feeling is that this stuff needs to go into pinctrl.

The reason, which has been discussed when similar patches (from me,
for example) were NACK:ed in the past, is that if we put in OD pin
properties, we put in all pin properties (open source, drive strength,
biasing pull-up/pull-down etc etc) and that is the reason to why the
orthogonal pinctrl subsystem was created in the first place.

So I'd opt for moving the driver you need to drivers/pinctrl and
expose the gpiolib interface from there, while adding pinctrl
on the side.

Also, we had a flamefest a while back as to whether we should
enumerate all config options (like OD, OS...) or have it all-custom,
and I was sort of shot down on that. But I have a generic control patch
set boiling so if you like that kind of stuff I'll respin it.

Yours,
Linus Walleij
