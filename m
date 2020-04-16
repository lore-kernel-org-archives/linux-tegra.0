From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 02/14] of: reserved-memory: Support lookup of regions
 by name
Date: Wed, 15 Apr 2020 19:58:33 -0500
Message-ID: <CAL_JsqK6Ku3woyc+9kxzjN_fih_ygWWnt3EFdVRi6UBd7=2iFw@mail.gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-3-thierry.reding@gmail.com> <20200415162449.GA1842@bogus>
 <20200415233532.GA211822@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200415233532.GA211822@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 15, 2020 at 6:35 PM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Wed, Apr 15, 2020 at 11:24:49AM -0500, Rob Herring wrote:
> > On Thu,  9 Apr 2020 19:52:26 +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >
> > > Add support for looking up memory regions by name. This looks up the
> > > given name in the newly introduced memory-region-names property and
> > > returns the memory region at the corresponding index in the memory-
> > > region(s) property.
> > >
> > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >  drivers/of/of_reserved_mem.c    | 19 +++++++++++++++++++
> > >  include/linux/of_reserved_mem.h | 11 +++++++++++
> > >  2 files changed, 30 insertions(+)
> > >
> >
> > Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Hi Rob,
>
> thanks for the review. Do you want me to apply this and patch 3/14 to a
> stable branch and send to you as a pull request? That way I could use
> that same branch to resolve the dependency in the Tegra tree for the
> memory controller driver patches.

I think it is fine for you to just take the patches.

Rob
