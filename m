From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 10/21] drm/tegra: remove checks for debugfs functions
 return value
Date: Mon, 16 Mar 2020 09:33:09 +0100
Message-ID: <20200316083309.GD2363188@phenom.ffwll.local>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-11-wambui.karugax@gmail.com>
 <20200311143753.GC494173@ulmo>
 <alpine.LNX.2.21.99999.375.2003111750360.14786@wambui>
 <20200311232446.GA998881@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200311232446.GA998881@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Wambui Karuga <wambui.karugax@gmail.com>, daniel@ffwll.ch, airlied@linux.ie, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 12, 2020 at 12:24:46AM +0100, Thierry Reding wrote:
> On Wed, Mar 11, 2020 at 05:54:46PM +0300, Wambui Karuga wrote:
> > Hey Thierry,
> > 
> > On Wed, 11 Mar 2020, Thierry Reding wrote:
> > 
> > > On Thu, Feb 27, 2020 at 03:02:21PM +0300, Wambui Karuga wrote:
> > > > Since 987d65d01356 (drm: debugfs: make
> > > > drm_debugfs_create_files() never fail) there is no need to check the
> > > > return value of drm_debugfs_create_files(). Therefore, remove the
> > > > return checks and error handling of the drm_debugfs_create_files()
> > > > function from various debugfs init functions in drm/tegra and have
> > > > them return 0 directly.
> > > > 
> > > > This change also includes removing the use of drm_debugfs_create_files
> > > > as a return value in tegra_debugfs_init() and have the function declared
> > > > as void.
> > > > 
> > > > Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/tegra/dc.c   | 11 +----------
> > > >  drivers/gpu/drm/tegra/drm.c  |  8 ++++----
> > > >  drivers/gpu/drm/tegra/dsi.c  | 11 +----------
> > > >  drivers/gpu/drm/tegra/hdmi.c | 11 +----------
> > > >  drivers/gpu/drm/tegra/sor.c  | 11 +----------
> > > >  5 files changed, 8 insertions(+), 44 deletions(-)
> > > 
> > > Applied, thanks.
> > > 
> > There's a newer version[1] of this patch series as this specific patch
> > depends on other work in drm.
> 
> Oh yeah, I just noticed that this patch causes a build failure, so I
> backed it out again.
> 
> If there's dependencies on other work, it's probably best to take this
> through drm-misc, in which case:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 
> Let me know if you'd prefer me to apply this to drm/tegra instead.

Yeah I'm going to pull in the entire series through -misc rsn.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
