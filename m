From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: Regression due to d29f3ef "tty_lock: Localise the lock"
Date: Tue, 8 May 2012 09:09:30 -0700
Message-ID: <20120508160930.GB20433@kroah.com>
References: <4FA8557E.5080402@wwwdotorg.org>
 <20120508103512.42db1c4b@pyramind.ukuu.org.uk>
 <4FA93FEB.2060200@wwwdotorg.org>
 <20120508170442.409ccbe4@bob.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120508170442.409ccbe4-Z/y2cZnRghHXmaaqVzeoHQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 08, 2012 at 05:04:42PM +0100, Alan Cox wrote:
> On Tue, 08 May 2012 09:46:51 -0600
> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> 
> > On 05/08/2012 03:35 AM, Alan Cox wrote:
> > > On Mon, 07 May 2012 17:06:38 -0600
> > > Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> > > 
> > >> Alan,
> > >>
> > >> Commit d29f3ef "tty_lock: Localise the lock" appears to cause a
> > >> problem for me.
> > >>
> > >> With this commit (as in next-20120507), I can no longer log into my
> > >> system (NVIDIA Tegra device with ARM CPU) over the serial console,
> > >> since the login prompt no longer appears. If I wait a few minutes,
> > >> I see the following console spew:
> > > 
> > > Eep. If it's reproducable can you test whether adding the
> > > unlock/relock in drivers/tty/pty.c does the trick ?
> > > 
> > > ie:
> > > 	tty_unlock(tty);
> > > 	tty_vhangup(tty);
> > > 	tty_lock(tty);
> > 
> > Yes, that change in pty_close() solves the problem.
> 
> Ok Greg - I think we should go with putting that unlock back until we
> understand exactly what is going on.

Ok, care to send a patch that does this so I get it correct, and we get
a reported-by from Stephen?

thanks,

greg k-h
