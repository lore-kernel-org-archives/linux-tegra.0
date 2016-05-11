From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 27/35] drm/tegra: Use lockless gem BO free callback
Date: Wed, 11 May 2016 09:35:30 +0200
Message-ID: <20160511073530.GL27098@phenom.ffwll.local>
References: <1461691808-12414-1-git-send-email-daniel.vetter@ffwll.ch>
 <1461691808-12414-28-git-send-email-daniel.vetter@ffwll.ch>
 <20160510133300.GA30323@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160510133300.GA30323-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 10, 2016 at 03:33:00PM +0200, Thierry Reding wrote:
> On Tue, Apr 26, 2016 at 07:30:00PM +0200, Daniel Vetter wrote:
> > No dev->struct_mutex anywhere to be seen.
> >=20
> > Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Terje Bergstr=F6m <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Signed-off-by: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/gpu/drm/tegra/drm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied to drm-misc.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
