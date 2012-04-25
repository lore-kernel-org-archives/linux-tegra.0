From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: Tegra for-next branch status check
Date: Wed, 25 Apr 2012 11:21:22 -0700
Message-ID: <CAOesGMgLDwYJBt7sn2Vg-95dZjyUDbyEhgtVeOGGJ2Kbb4Moag@mail.gmail.com>
References: <4F95C7C9.30205@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F95C7C9.30205-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Mon, Apr 23, 2012 at 2:21 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> Arnd, Olof,
>
> Could I please ask you to take a quick look at Tegra's git repo:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
>
> ... and double-check the construction of all the for-3.5 branches. I've
> tended to mostly put stuff in topic branches rather than separating
> things into the perhaps more typical soc/drivers/dt branches. Is this
> scheme going to work out OK?
>
> Note a couple dependencies in there:
>
> for-3.5/gpio-pinmux-dependency is a copy of pinctrl's "base" tag.
>
> for-3.5/gpio-pinmux depends on for-3.5/gpio-pinmux-dependency
>
> for-3.5/tegra30-audio and for-3.5/usb-ulpi both depend on
> for-3.5/gpio-pinmux.
>
> Thanks for any feedback.

Looks good. Keeping the changes per topic like that works well,
especially in cases where the cross-dependencies don't get too heavy
(and they are not at this time). Even though we will aggregate them to
fewer branches in arm-soc, getting them sent up as shorter topic
branches is great.

If you wanted to separate things out a bit more between soc and board
changes, you could split off some of the top commits from the topic
branches to a secondary board branch. But given that most of tegra now
is just two DT boards, there's no real need to keep those few commits
separated out.


-Olof
