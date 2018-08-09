From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] gpu: host1x: Ignore clients initialization failure
Date: Thu, 09 Aug 2018 15:53:03 +0300
Message-ID: <1672653.y032a1rHIh@dimapc>
References: <20180801150807.15926-1-digetx@gmail.com> <4457259.6qKMIOUXSS@dimapc> <20180809104541.GC21639@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180809104541.GC21639@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Kyle Evans <kvans32@gmail.com>, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thursday, 9 August 2018 13:45:41 MSK Thierry Reding wrote:
> On Fri, Aug 03, 2018 at 02:30:47PM +0300, Dmitry Osipenko wrote:
> > On Friday, 3 August 2018 13:50:55 MSK Thierry Reding wrote:
> > > On Wed, Aug 01, 2018 at 06:08:07PM +0300, Dmitry Osipenko wrote:
> > > > From time to time new bugs are popping up, causing some host1x client
> > > > to
> > > > fail its initialization. Currently a single clients initialization
> > > > failure
> > > > causes whole host1x device registration to fail, as a result a single
> > > > DRM
> > > > sub-device initialization failure makes whole DRM initialization to
> > > > fail.
> > > > Let's ignore clients initialization failure, as a result display panel
> > > > lights up even if some DRM clients (say GR2D or VIC) fail to
> > > > initialize.
> > > > 
> > > > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > > > ---
> > > > 
> > > >  drivers/gpu/host1x/bus.c | 18 +++++++-----------
> > > >  1 file changed, 7 insertions(+), 11 deletions(-)
> > > 
> > > This is actually done on purpose. I can't think of a case where we would
> > > actively like to keep a half-broken DRM device operational. The errors
> > > that you're talking about should only happen during development,
> > 
> > [only in a perfect world]
> 
> gr2d and VIC are fairly deterministic. What are the errors you are
> seeing that cause initialization failure?

Right now there are no specific errors. There is only a known trouble with the 
ARM_DMA_USE_IOMMU, but that causes to fail all of the clients.

> Note that it is possible for
> these devices to malfunction even if initialization succeeds. A failure
> to initialize can only happen if there's something wrong in the device
> tree, firmware is missing (in case of VIC) or a regression was
> introduced in some subsystem that causes a failure (maybe deferred probe
> or something similar).

A missing firmware is an actual good example. Though can't VIC driver be 
changed to load firmware at the time of a its first use by userspace? It 
should be very annoying that kernel driver forces you to churn with initramfs.

> > > and the
> > > device not showing up is a pretty good indicator that something is wrong
> > > as opposed to everything booting normally and then getting some cryptic
> > > error at runtime because one of the clients didn't initialize.
> > 
> > If machine doesn't have a serial port and it doesn't have ssh server
> > running or network doesn't come up, you'll end up with a completely
> > dysfunctional piece of hardware. Hence there is no chance for you to even
> > check what is wrong. The argument about a cryptic error doesn't make much
> > sense, you have to improve your runtime as well (and you'll get a error
> > message in the kernels log).
> 
> You make a good point here. I'm not aware of any devices we support in
> the kernel that don't have a serial console, but that doesn't mean the
> kernel could be used on an "unsupported" device  that doesn't have one.

AFAIK, enabling serial on AC100 require soldering iron.

> > > From my perspective, all clients should always be operational in
> > > whatever baseline version you use. If it isn't that's a bug that should
> > > be fixed. Ideally those bugs should get fixed before making it into a
> > > baseline version (mainline, linux-next, ...), so that this never impacts
> > > even developers, unless they break it themselves, in which case refusing
> > > to register the DRM device is a pretty good incentive to fix it.
> > 
> > Sounds like you're assuming that only kernel developers are supposed to
> > use
> > Tegra, though at least (for now) for upstream it is kinda true. Of course
> > that could be changed ;-)
> 
> That's not at all what I'm saying. What I am saying is that we should
> make it difficult for developers to break the kernel in a way that would
> put users into a position that is difficult to get themselves out of. If
> we refuse to register the complete DRM device in case some subdevice
> fails to initialize we increase the chances of developers noticing and
> fixing it.
> 
> If all we do on failure is output an error message, it's very likely to
> go unnoticed. Developers are likely to check specifically the
> functionality that they're working on and ignore failures that they may
> have caused in other parts of the code as a side-effect of their current
> work.

I can try to help with improving of your automated testing suite, if you'll 
make it accessible to the public.

> Perhaps a good middle ground would be to turn initialization failures
> into WARN_ON() to increase the chances of them getting notified and then
> continue on a best effort basis in the hopes of having enough
> initialized to get a message to users.

Good to me, I'll make v2.

> Another alternative would be to
> mark essential subdevices (such as the display controller) so that only
> they will cause failure to register the whole DRM device.

I don't think that making some subdevice more valuable than the others is a 
feasible approach, how you are going to differentiate what of the two display 
controllers is more important than the other.
