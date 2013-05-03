From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Fwd: Tegra 30 System hangs because of commit "pinctrl: move
 subsystem mutex to pinctrl_dev struct"
Date: Fri, 3 May 2013 16:22:41 +0200
Message-ID: <CACRpkdboCQmV_Aam3EDcSG6PRVnpEmGkC78m3h7rXT68V2a9Qg@mail.gmail.com>
References: <CAK5ve-KXdS8az=Gtja-mF=Z3_EeZVA7bLYSU0EE2mf5bHmSUKw@mail.gmail.com>
	<CAK5ve-KBDyvjNRVMcXgfnhYcajdcGsuAKaepzCBt+epiXoYvSw@mail.gmail.com>
	<517ED12B.8080502@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <517ED12B.8080502-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 29, 2013 at 9:59 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:

> I would suggest simply dropping or reverting this patch; I had pointed out a
> long time ago that it was unlikely to be correct.
>
> My guess/suspicion is a recursive lock attempt during processing hogs during
> pinctrl device registration, or perhaps during dt->map conversion. Bryan,
> are you able to confirm this?

This was not the case at all, it was an mutex_unlock misspelled as
mutex_lock()... totally unrecursive dual locking :-)

I did test the patch quite extensively, albeit not on a system using
DT to populate the pinctrl tables so I missed this, mea culpa.

I really want to get rid of the big pinctrl lock and make this more
fine-granular, and that is why the patch is being pushed, bear
with me.

Yours,
Linus Walleij
