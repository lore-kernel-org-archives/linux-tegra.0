From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] pinctrl: core: Fix panic when pinctrl devices with hogs
 are unregistered
Date: Thu, 5 Jan 2017 11:27:48 -0800
Message-ID: <20170105192748.GS4310@atomide.com>
References: <1483631575-14422-1-git-send-email-jonathanh@nvidia.com>
 <CACRpkdbAv8UiqWBH5mUNpOzBeAee4ZbdF=M_AvOPz5imbv26uA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbAv8UiqWBH5mUNpOzBeAee4ZbdF=M_AvOPz5imbv26uA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [170105 08:16]:
> On Thu, Jan 5, 2017 at 4:52 PM, Jon Hunter <jonathanh@nvidia.com> wrote:
> 
> > Commit df61b366af26 ('pinctrl: core: Use delayed work for hogs')
> > deferred part of the registration for pinctrl devices if the pinctrl
> > device has hogs. This introduced a window where if the pinctrl device
> > with hogs was sucessfully registered, but then unregistered again
> > (which could be caused by parent device being probe deferred) before
> > the delayed work has chanced to run, then this will cause a kernel
> > panic to occur because:
> >
> > 1. The 'pctldev->p' has not yet been initialised and when unregistering
> >    the pinctrl device we only check to see if it is an error value, but
> >    now it could also be NULL.
> > 2. The pinctrl device may not have been added to the 'pinctrldev_list'
> >    list and we don't check to see if it was added before removing.
> >
> > Fix up the above by checking to see if the 'pctldev->p' pointer is an
> > error value or NULL before putting the pinctrl device and verifying
> > that the pinctrl device is present in 'pinctrldev_list' before removing.
> >
> > Fixes: df61b366af26 ('pinctrl: core: Use delayed work for hogs')
> >
> > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> 
> Oops. Patch applied.

OK, did not see that with my testing of hogs with omap4-duovero-parlor.
Thanks for fixing that.

Tony
