From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 8/8] ARM: tegra: HACK: remove set_irq_flags() from driver
Date: Thu, 1 Mar 2012 20:12:00 +0000
Message-ID: <201203012012.01266.arnd@arndb.de>
References: <1330630010-11241-1-git-send-email-alan@signal11.us> <1330630010-11241-9-git-send-email-alan@signal11.us> <20120301193643.GA607@kroah.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120301193643.GA607-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 01 March 2012, Greg Kroah-Hartman wrote:
> On Thu, Mar 01, 2012 at 02:26:50PM -0500, Alan Ott wrote:
> > From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > 
> > The driver should not call set_irq_flags itself, and
> > cannot do this from a loadable module.
> > 
> > Remove the call for now, which might break the driver
> > but at least lets the kernel link again.
> > 
> > Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> 
> Um, I think you should test this out before submitting it anywhere :)
> 
> As it is, I can't accept it.

Right, this one was not meant for inclusion, similar to patch 5 in this
series.

Alan:
Part of the reason I asked for help getting the patches out is that
they need a lot of auditing, both for whether they still apply to
current kernels and for whether they are a good solution to the problem
at hand. When in doubt, it's probably better to leave out any patch
that looks like it might not be ready for inclusion, or that might
make thinks uglier in some way.

	Arnd
