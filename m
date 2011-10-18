From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: tegra: paz00: Fix board pinmux table.
Date: Tue, 18 Oct 2011 17:50:07 +0200
Message-ID: <9849440.cSOtOCBmUT@ax5200p>
References: <1318691913-9597-1-git-send-email-leon@leon.nu> <201110151834.22732.marvin24@gmx.de> <74CDBE0F657A3D45AFBB94109FB122FF173BE1A4A4@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A4A4-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Monday 17 October 2011 08:29:01 Stephen Warren wrote:
> Marc Dietrich wrote at Saturday, October 15, 2011 10:34 AM:
> > Am Samstag 15 Oktober 2011, 17:18:33 schrieb Leon Romanovsky:
> > > This fix updates the CDEV1 pinmux for the paz00 board to be as in the
> > > Harmony board. Paz00 board is originally based on Harmony design.
> > 
> > the fact that this patch makes sound work on paz00 does not necessary mean
> > that this is the "right thing" to do.
> 
> > First, the initial state should be
> > TRISTATE, because sound layer should switch between NORMAL/TRISTATE
> > automaticly to save some power.
> 
> None of the other boards do that, and the drivers don't support it. I
> believe the clock would need to be started as soon as the audio driver
> module were loaded, and kept running as long as it was loaded, so there's
> not much chance of optimizing power here at the moment.

Which driver? I guess this could be done by the board specific code e.g. in
in sound/soc/tegra/paz00.c I haven't checked if the clock is disabled, because
the whole clock setup is a bit confusing...

Here is androids pinmux diff "without and with music":

--- pinmux_no_music.txt
+++ pinmux_with_music.txt
@@ -3,11 +3,11 @@
        {TEGRA_PINGROUP_ATC,   TEGRA_MUX_GMI,           TEGRA_PUPD_NORMAL,    TEGRA_TRI_NORMAL},
        {TEGRA_PINGROUP_ATD,   TEGRA_MUX_GMI,           TEGRA_PUPD_NORMAL,    TEGRA_TRI_NORMAL},
        {TEGRA_PINGROUP_ATE,   TEGRA_MUX_GMI,           TEGRA_PUPD_NORMAL,    TEGRA_TRI_NORMAL},
-       {TEGRA_PINGROUP_CDEV1, TEGRA_MUX_PLLA_OUT,      TEGRA_PUPD_PULL_DOWN, TEGRA_TRI_TRISTATE},
+       {TEGRA_PINGROUP_CDEV1, TEGRA_MUX_PLLA_OUT,      TEGRA_PUPD_PULL_DOWN, TEGRA_TRI_NORMAL},
        {TEGRA_PINGROUP_CDEV2, TEGRA_MUX_PLLP_OUT4,     TEGRA_PUPD_PULL_DOWN, TEGRA_TRI_NORMAL},
        {TEGRA_PINGROUP_CRTP,  TEGRA_MUX_CRT,           TEGRA_PUPD_NORMAL,    TEGRA_TRI_TRISTATE},
        {TEGRA_PINGROUP_CSUS,  TEGRA_MUX_PLLC_OUT1,     TEGRA_PUPD_PULL_DOWN, TEGRA_TRI_TRISTATE},
-       {TEGRA_PINGROUP_DAP1,  TEGRA_MUX_DAP1,          TEGRA_PUPD_NORMAL,    TEGRA_TRI_TRISTATE},
+       {TEGRA_PINGROUP_DAP1,  TEGRA_MUX_DAP1,          TEGRA_PUPD_NORMAL,    TEGRA_TRI_NORMAL},
        {TEGRA_PINGROUP_DAP2,  TEGRA_MUX_GMI,           TEGRA_PUPD_NORMAL,    TEGRA_TRI_NORMAL},
        {TEGRA_PINGROUP_DAP3,  TEGRA_MUX_DAP3,          TEGRA_PUPD_NORMAL,    TEGRA_TRI_TRISTATE},
        {TEGRA_PINGROUP_DAP4,  TEGRA_MUX_GMI,           TEGRA_PUPD_NORMAL,    TEGRA_TRI_TRISTATE},

 
> > Second, Android has TEGRA_PUPD_PULL_DOWN
> > with sound working and I didn't found out yet why this also works.
> 
> I don't know why there's a pull-down there in the Android kernel; there's
> no need as far as I know, since it's a clock signal. I'd go so far as to
> believe that a pull-down would distort the clock signal slightly.

Is there some docu somewhere about what PUPD_NORMAL and POPD_PULL_DOWN means? 
I know the meaning of TRISTATE and PULL_DOWN/UP from electronics, but
that does not define what the NORMAL state is.

I also don't see why you can't get a nice clock signal out of a pull down pin. 
If inactive, the pin is high (e.g. +3.3V), while when active it is pulled to
zero (ok, it's logical inverted). 

Marc


> But yes, it probably makes sense to include this patch in a series that
> enables audio on PAZ00 whenever that appears.
