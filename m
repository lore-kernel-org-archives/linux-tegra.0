From: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 00/13] remove_conflicting_framebuffers() cleanup
Date: Wed, 03 Jan 2018 16:04:15 +0100
Message-ID: <1733339.3qeImzqeL4@amdc3058>
References: <cover.1511544782.git.mirq-linux@rere.qmqm.pl>
        <CGME20171127103053epcas2p1b42cdcd817182cf468eb96ec16de9370@epcas2p1.samsung.com>
        <20171127103044.faakzch7ehlkc3or@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20171127103044.faakzch7ehlkc3or-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Teddy Wang <teddy.wang-S9cbI//bT0v8C245oKUbwQC/G2K4zDHf@public.gmane.org>, Sudip Mukherjee <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, libnux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Monday, November 27, 2017 11:30:44 AM Daniel Vetter wrote:
> On Fri, Nov 24, 2017 at 06:53:25PM +0100, Micha=C5=82 Miros=C5=82aw w=
rote:
> > This series cleans up duplicated code for replacing firmware FB
> > driver with proper DRI driver and adds handover support to
> > Tegra driver.

Please Cc: me on and linux-fbdev ML on fbdev related patches
(I was Cc:-ed only on the cover letter and patch #10, linux-fbdev
was not Cc:-ed at all).

> > The last patch is here because it uses new semantics of
> > remove_conflicting_framebuffers() from this series. This
> > can be considered independently, though.
>=20
> Except for that patches I've commented on:
>=20
> Acked-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
>=20
> Since this is for tegra and Thierry has drm-misc commit rights, it's
> probably simplest when Thierry pushes this all to drm-misc once drive=
r
> maintainers had a chance to look at it. Also needs and ack from Bart =
for
> the fbdev sides.

For fbdev changes:

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
