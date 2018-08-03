From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] gpu: host1x: Ignore clients initialization failure
Date: Fri, 03 Aug 2018 14:30:47 +0300
Message-ID: <4457259.6qKMIOUXSS@dimapc>
References: <20180801150807.15926-1-digetx@gmail.com> <20180803105055.GC28546@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180803105055.GC28546@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Kyle Evans <kvans32@gmail.com>, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Friday, 3 August 2018 13:50:55 MSK Thierry Reding wrote:
> On Wed, Aug 01, 2018 at 06:08:07PM +0300, Dmitry Osipenko wrote:
> > From time to time new bugs are popping up, causing some host1x client to
> > fail its initialization. Currently a single clients initialization failure
> > causes whole host1x device registration to fail, as a result a single DRM
> > sub-device initialization failure makes whole DRM initialization to fail.
> > Let's ignore clients initialization failure, as a result display panel
> > lights up even if some DRM clients (say GR2D or VIC) fail to initialize.
> > 
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> > 
> >  drivers/gpu/host1x/bus.c | 18 +++++++-----------
> >  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> This is actually done on purpose. I can't think of a case where we would
> actively like to keep a half-broken DRM device operational. The errors
> that you're talking about should only happen during development,

[only in a perfect world]

> and the
> device not showing up is a pretty good indicator that something is wrong
> as opposed to everything booting normally and then getting some cryptic
> error at runtime because one of the clients didn't initialize.

If machine doesn't have a serial port and it doesn't have ssh server running 
or network doesn't come up, you'll end up with a completely dysfunctional 
piece of hardware. Hence there is no chance for you to even check what is 
wrong. The argument about a cryptic error doesn't make much sense, you have to 
improve your runtime as well (and you'll get a error message in the kernels 
log).

> From my perspective, all clients should always be operational in
> whatever baseline version you use. If it isn't that's a bug that should
> be fixed. Ideally those bugs should get fixed before making it into a
> baseline version (mainline, linux-next, ...), so that this never impacts
> even developers, unless they break it themselves, in which case refusing
> to register the DRM device is a pretty good incentive to fix it.

Sounds like you're assuming that only kernel developers are supposed to use 
Tegra, though at least (for now) for upstream it is kinda true. Of course that 
could be changed ;-)
