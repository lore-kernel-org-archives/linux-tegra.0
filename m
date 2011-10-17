From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fix drivers/staging/nvec linkage error when keyboard is
 disabled
Date: Mon, 17 Oct 2011 15:20:55 -0700
Message-ID: <20111017222055.GA2427@kroah.com>
References: <20112.34922.209107.730268@pilspetsen.it.uu.se>
 <1534774.fR3YHUzZE9@fb07-iapwap2>
 <74CDBE0F657A3D45AFBB94109FB122FF173B23B539@HQMAIL01.nvidia.com>
 <20111017222019.GA2410@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111017222019.GA2410-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Mikael Pettersson <mikpe-1zs4UD6AkMk@public.gmane.org>, "Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Greg KH (gregkh-l3A5Bk7waGM@public.gmane.org)" <gregkh-l3A5Bk7waGM@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 17, 2011 at 03:20:19PM -0700, Greg KH wrote:
> On Mon, Oct 10, 2011 at 10:25:07AM -0700, Stephen Warren wrote:
> > Marc Dietrich wrote at Sunday, October 09, 2011 9:48 AM:
> > > Hi Mikael,
> > > 
> > > thanks for review. The nvec driver received some overhaul in the 3.1 release cycle
> > > and he fruids can be viewed in linux-next tree. The nvec client drivers were
> > > converted to mfd children in the mean time. This solves the build error, but is not
> > > very flexible. We are planing to move the mfd stuct to the board file(s) in the next
> > > cycle.
> > 
> > Indeed, the code in v3.1-rc9 is quite different to that in linux-next, so
> > this exact problem doesn't exist in linux-next.
> > 
> > However, don't we still want to solve build problems for the final v3.1
> > release, or a stable update to that? As such,
> > 
> > Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > I also CC'd the staging maintainer Greg KH and Tegra maintainers Olof and
> > Colin on this email.
> 
> I'm confused, what patch should I apply here?  Can someone please resend
> it in a format that I can apply it in?  With the proper acks?

Nevermind, it already was, sorry for the noise...
