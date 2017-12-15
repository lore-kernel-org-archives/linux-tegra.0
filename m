From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v1 2/2] drm/tegra: Support disabled CONFIG_PM
Date: Fri, 15 Dec 2017 21:25:32 +0100
Message-ID: <1513369532.16053.6.camel@lynxeye.de>
References: <85902b42264b094cbf7cf30930f8c0bbccdca1b7.1512947732.git.digetx@gmail.com>
         <02bccd8c39c0e7e9d3c6733e238e291e8297c830.1512947732.git.digetx@gmail.com>
         <20171211101343.GG10671@ulmo>
         <f04f7268-bcf8-feab-bded-88a166b3b474@gmail.com>
         <20171211142727.GA19922@ulmo>
         <5c0435f4-88ae-282c-f096-b8dd7226ab0e@gmail.com>
         <1513287684.16053.4.camel@lynxeye.de>
         <f20a67a1-92c6-2dff-aa60-958801e53c06@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f20a67a1-92c6-2dff-aa60-958801e53c06-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Freitag, den 15.12.2017, 01:45 +0300 schrieb Dmitry Osipenko:
> On 15.12.2017 00:41, Lucas Stach wrote:
> > Am Montag, den 11.12.2017, 18:26 +0300 schrieb Dmitry Osipenko:
> > > On 11.12.2017 17:27, Thierry Reding wrote:
> > > > On Mon, Dec 11, 2017 at 04:53:56PM +0300, Dmitry Osipenko
> > > > wrote:
> > > > > On 11.12.2017 13:13, Thierry Reding wrote:
> > > > > > On Mon, Dec 11, 2017 at 02:19:44AM +0300, Dmitry Osipenko
> > > > > > wrote:
> > > > > > > Add manual HW power management to drivers probe/remove in
> > > > > > > order to
> > > > > > > not fail in a case of runtime power management being
> > > > > > > disabled
> > > > > > > in kernel
> > > > > > > config.
> > > > > > > 
> > > > > > > Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/tegra/dc.c   | 164
> > > > > > > +++++++++++++++++++++++++++----------------
> > > > > > >  drivers/gpu/drm/tegra/dsi.c  | 138
> > > > > > > +++++++++++++++++++++--
> > > > > > > -------------
> > > > > > >  drivers/gpu/drm/tegra/hdmi.c |  90 ++++++++++++++++-----
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/tegra/sor.c  | 103 +++++++++++++++++--
> > > > > > > ----
> > > > > > > ----
> > > > > > >  4 files changed, 310 insertions(+), 185 deletions(-)
> > > > > > 
> > > > > > I think that's the wrong way around. We unconditionally
> > > > > > select
> > > > > > PM on
> > > > > > 64-bit ARM already, and I think we should do the same on
> > > > > > 32-bit 
> > > > > > ARM.
> > > > > > There's really no excuse not to enable runtime PM these
> > > > > > days.
> > > > > 
> > > > > What is the rational behind enabling PM unconditionally? It
> > > > > is
> > > > > actually a very
> > > > > useful debug feature when there is something wrong with the
> > > > > PM.
> > > > > It looks like
> > > > > Tegra DRM driver is the only driver on Tegra that doesn't
> > > > > work
> > > > > properly with PM
> > > > > being disabled. Please, let's just fix it.
> > > > 
> > > > What's useful about disabling PM? The problem with allowing !PM
> > > > is
> > > > that
> > > > it adds one more combination that needs to be build- and
> > > > runtime
> > > > tested.
> > > 
> > > As I already stated, disabling PM is very useful for debugging
> > > when
> > > system hangs
> > > unexpectedly. I found it very helpful several times.
> > 
> > This assumes that the bootloader/firmware left the power domains
> > powered up. Without PM_GENERIC_DOMAINS, which depends on CONFIG_PM
> > the
> > kernel has no means to control the state of the power domains.
> > Probe
> > deferral based on the power domain will also not work, so driver
> > may
> > probe and try to access power-gated devices, leading to system
> > hangs in
> > the common case.
> 
> Pre-186 Tegra's do not use generic PM domains, but a custom API.
> Meanwhile T186
> always has CONFIG_PM enabled.

This is incorrect since a38045121bf4 (soc/tegra: pmc: Add generic PM
domain support), i.e. kernel 4.7.

Regards,
Lucas
