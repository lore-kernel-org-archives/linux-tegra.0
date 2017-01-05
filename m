From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: core: Fix panic when pinctrl devices with hogs
 are unregistered
Date: Thu, 5 Jan 2017 17:15:34 +0100
Message-ID: <CACRpkdbAv8UiqWBH5mUNpOzBeAee4ZbdF=M_AvOPz5imbv26uA@mail.gmail.com>
References: <1483631575-14422-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483631575-14422-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 5, 2017 at 4:52 PM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> Commit df61b366af26 ('pinctrl: core: Use delayed work for hogs')
> deferred part of the registration for pinctrl devices if the pinctrl
> device has hogs. This introduced a window where if the pinctrl device
> with hogs was sucessfully registered, but then unregistered again
> (which could be caused by parent device being probe deferred) before
> the delayed work has chanced to run, then this will cause a kernel
> panic to occur because:
>
> 1. The 'pctldev->p' has not yet been initialised and when unregistering
>    the pinctrl device we only check to see if it is an error value, but
>    now it could also be NULL.
> 2. The pinctrl device may not have been added to the 'pinctrldev_list'
>    list and we don't check to see if it was added before removing.
>
> Fix up the above by checking to see if the 'pctldev->p' pointer is an
> error value or NULL before putting the pinctrl device and verifying
> that the pinctrl device is present in 'pinctrldev_list' before removing.
>
> Fixes: df61b366af26 ('pinctrl: core: Use delayed work for hogs')
>
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Oops. Patch applied.

Yours,
Linus Walleij
