From: mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org
Subject: Re: [GIT PULL 1/3] ARM: tegra: trimslice: register i2c busses and
 devices
Date: Fri, 13 May 2011 00:37:07 +0300
Message-ID: <20110512213707.GA14128@gentoodev.compulab.local>
References: <cover.1305105580.git.mike@compulab.co.il>
 <afc96d35d332d0293dfb5baf3e1b53045627f6a1.1305105580.git.mike@compulab.co.il>
 <74CDBE0F657A3D45AFBB94109FB122FF04986AA405@HQMAIL01.nvidia.com>
Reply-To: mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04986AA405-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, May 12, 2011 at 01:26:32PM -0700, Stephen Warren wrote:
> Mike Rapoport wrote at Wednesday, May 11, 2011 5:08 AM:
> > Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> > ---
> >  arch/arm/mach-tegra/board-trimslice.c |   39 +++++++++++++++++++++++++++++++++
> >  1 files changed, 39 insertions(+), 0 deletions(-)
> 
> I think you also need the following change to board-trimslice-pinmux.c:
> 
> -	{TEGRA_PINGROUP_CDEV1, TEGRA_MUX_OSC,           TEGRA_PUPD_NORMAL,      TEGRA_TRI_NORMAL},
> +	{TEGRA_PINGROUP_CDEV1, TEGRA_MUX_PLLA_OUT,      TEGRA_PUPD_NORMAL,      TEGRA_TRI_NORMAL},
> 
> Assuming that the CDEV1 clock output from Tegra is used as the codec's
> master clock.

You're right, I've missed that one. Thanks.

--
Sincerely yours,
Mike.
