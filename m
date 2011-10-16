From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: tegra: paz00: Fix board pinmux table.
Date: Sun, 16 Oct 2011 08:37:51 +0200
Message-ID: <CALq1K=+OA7+w4_p-HDdede==GTK42SsbiAUpqy53u9X1nDL-=A@mail.gmail.com>
References: <1318691913-9597-1-git-send-email-leon@leon.nu> <201110151834.22732.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201110151834.22732.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

> Am Samstag 15 Oktober 2011, 17:18:33 schrieb Leon Romanovsky:
> > This fix updates the CDEV1 pinmux for the paz00 board to be as in t=
he
> > Harmony board. Paz00 board is originally based on Harmony design.
>
> the fact that this patch makes sound work on paz00 does not necessary=
 mean
> that this is the "right thing" to do. First, the initial state should=
 be
> TRISTATE, because sound layer should switch between NORMAL/TRISTATE
> automaticly to save some power. Second, Android has TEGRA_PUPD_PULL_D=
OWN
> with sound working and I didn't found out yet why this also works.

I already said before, but will say again. Our board has many commons
to the Harmony board, so our reference is
arch/arm/mach-tegra/board-harmony-pinmux.c
http://git.kernel.org/?p=3Dlinux/kernel/git/olof/tegra.git;a=3Dhistory;=
f=3Darch/arm/mach-tegra/board-harmony-pinmux.c;hb=3D103e1e14441ea864549=
21cdaf552c9f5c1f7c7c1
In the initial commit (42a7bf4d2686145bea03ff9b87d83868cc514f47)
pushed by Colin, the CDEV1 indeed has TEGRA_PUPD_PULL_DOWN and
TEGRA_TRI_TRISTATE
(http://git.kernel.org/?p=3Dlinux/kernel/git/olof/tegra.git;a=3Dblob;f=3D=
arch/arm/mach-tegra/board-harmony-pinmux.c;h=3D50b15d500cacc73817258202=
178b0b79fc42478b;hb=3D42a7bf4d2686145bea03ff9b87d83868cc514f47#l28),
but later in the commit (ef2b1a0f1eb299c2d00addfee3a2631395d9bdb5)
pushed by Stephen, the CDEV1 was changed.

I did the same.

>
> So there is something strange going on and we should first find out w=
hat
> it is. Furthermore, there is no codec (ALC5632) and no glue for paz00=
 yet
> in the mainline kernel (and of course no board support for it) so thi=
s can
> still wait IMHO.

I have a different view on it. For me, everything that fixes incorrect
behavior=C2=A0and doesn't brake anything, must be included as soon as
possible.possible.

>
> I will include your patch in the series which will add sound support =
once
> the fog has lifted a bit.
>
> Thanks
>
> Marc
>
> > Signed-off-by: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
> > ---
> > =C2=A0arch/arm/mach-tegra/board-paz00-pinmux.c | =C2=A0 =C2=A02 +-
> > =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/arch/arm/mach-tegra/board-paz00-pinmux.c b/arch/arm/ma=
ch-tegra/board-paz00-pinmux.c
> > index bdd2627..7de8182 100644
> > --- a/arch/arm/mach-tegra/board-paz00-pinmux.c
> > +++ b/arch/arm/mach-tegra/board-paz00-pinmux.c
> > @@ -27,7 +27,7 @@ static struct tegra_pingroup_config paz00_pinmux[=
] =3D {
> > =C2=A0 =C2=A0 =C2=A0 {TEGRA_PINGROUP_ATC, =C2=A0 TEGRA_MUX_GMI, =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TEGRA_PUPD_NORMAL, =C2=A0 =C2=A0TEGRA_T=
RI_NORMAL},
> > =C2=A0 =C2=A0 =C2=A0 {TEGRA_PINGROUP_ATD, =C2=A0 TEGRA_MUX_GMI, =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TEGRA_PUPD_NORMAL, =C2=A0 =C2=A0TEGRA_T=
RI_NORMAL},
> > =C2=A0 =C2=A0 =C2=A0 {TEGRA_PINGROUP_ATE, =C2=A0 TEGRA_MUX_GMI, =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TEGRA_PUPD_NORMAL, =C2=A0 =C2=A0TEGRA_T=
RI_NORMAL},
> > - =C2=A0 =C2=A0 {TEGRA_PINGROUP_CDEV1, TEGRA_MUX_PLLA_OUT, =C2=A0 =C2=
=A0 =C2=A0TEGRA_PUPD_PULL_DOWN, TEGRA_TRI_TRISTATE},
> > + =C2=A0 =C2=A0 {TEGRA_PINGROUP_CDEV1, TEGRA_MUX_PLLA_OUT, =C2=A0 =C2=
=A0 =C2=A0TEGRA_PUPD_NORMAL, =C2=A0 =C2=A0TEGRA_TRI_NORMAL},
> > =C2=A0 =C2=A0 =C2=A0 {TEGRA_PINGROUP_CDEV2, TEGRA_MUX_PLLP_OUT4, =C2=
=A0 =C2=A0 TEGRA_PUPD_PULL_DOWN, TEGRA_TRI_NORMAL},
> > =C2=A0 =C2=A0 =C2=A0 {TEGRA_PINGROUP_CRTP, =C2=A0TEGRA_MUX_CRT, =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TEGRA_PUPD_NORMAL, =C2=A0 =C2=A0TEGRA_T=
RI_TRISTATE},
> > =C2=A0 =C2=A0 =C2=A0 {TEGRA_PINGROUP_CSUS, =C2=A0TEGRA_MUX_PLLC_OUT=
1, =C2=A0 =C2=A0 TEGRA_PUPD_PULL_DOWN, TEGRA_TRI_TRISTATE},
> >
>



--
Leon Romanovsky | Independent Linux Consultant
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0www.leon.nu=C2=A0| leon-2ukJVAZIZ/Y@public.gmane.org
