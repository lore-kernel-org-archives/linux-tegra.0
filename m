From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 2/2] drm/tegra: Do not implement runtime PM
Date: Thu, 12 Dec 2019 17:48:15 +0100
Message-ID: <CAJZ5v0hA6mz7r93_HVpfP-=72wARf9=NN1jNG3KHtzM_+oT9LA@mail.gmail.com>
References: <20191209130336.2257506-1-thierry.reding@gmail.com>
 <20191209130336.2257506-2-thierry.reding@gmail.com>
 <CAPDyKFp6cnpn4yFaEBDPBdHc1siQvJbmwedbhRNCdDBVAc2qUA@mail.gmail.com>
 <20191212123352.GA3322354@ulmo>
 <CAPDyKFodOjta0JnEEMrC0j5=XeB-wLjTNvPFtmDtUBZBMTJvQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAPDyKFodOjta0JnEEMrC0j5=XeB-wLjTNvPFtmDtUBZBMTJvQg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, dri-devel <dri-devel@lists.freedesktop.org>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 12, 2019 at 2:32 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 12 Dec 2019 at 13:33, Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > On Thu, Dec 12, 2019 at 09:52:22AM +0100, Ulf Hansson wrote:
> > > On Mon, 9 Dec 2019 at 14:03, Thierry Reding <thierry.reding@gmail.com> wrote:
> > > >
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >
> > > > The Tegra DRM driver heavily relies on the implementations for runtime
> > > > suspend/resume to be called at specific times. Unfortunately, there are
> > > > some cases where that doesn't work. One example is if the user disables
> > > > runtime PM for a given subdevice. Another example is that the PM core
> > > > acquires a reference to runtime PM during system sleep, effectively
> > > > preventing devices from going into low power modes. This is intentional
> > > > to avoid nasty race conditions, but it also causes system sleep to not
> > > > function properly on all Tegra systems.
> > >
> > > Are the problems you refer to above, solely for system suspend/resume?
> >
> > No, this patch also fixes potential issues with regular operation of the
> > display driver. The problem is that parts of the driver rely on being
> > able to shut down the hardware during runtime operations, such as
> > disabling an output. Under some circumstances part of this shutdown will
> > imply a reset and, at least on some platforms, we rely on that reset to
> > put the device into a known good state.
> >
> > So if a user decides to prevent the device from runtime suspending, we
> > can potentially run into a situation where we can't properly set a
> > display mode at runtime since we weren't allowed to reset the device.
>
> Thanks for clarifying!
>
> We have very similar issues for SDIO functional drivers (WiFi
> drivers). Typically, at some point there needs to be a guarantee that
> the power has been cut in between a "put" and "get", as to be able to
> re-program a FW.
>
> My worry in regards to this, is that we may reinvent the wheel over
> and over again, just because runtime PM today isn't a good fit.
>
> In principle, if you could, somehow forbid user-space from preventing
> the device from being runtime suspended, that would do the trick,
> wouldn't it?

Treating pm_runtime_suspend() and pm_runtime_resume() as the low-level
device power off and power on routines for the given platform is a
mistake.  It has always been a mistake and I'm not going to accept
changes trying to make it look like it isn't a mistake.

If any generic power off and power on helpers for DT-based platforms
are needed, add them and make PM-runtime use them.  That should be
straightforward enough.

Thanks!
