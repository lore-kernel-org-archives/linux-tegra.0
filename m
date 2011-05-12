From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [GIT PULL 1/3] ARM: tegra: trimslice: register i2c busses and
 devices
Date: Thu, 12 May 2011 13:26:32 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04986AA405@HQMAIL01.nvidia.com>
References: <cover.1305105580.git.mike@compulab.co.il>
 <afc96d35d332d0293dfb5baf3e1b53045627f6a1.1305105580.git.mike@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <afc96d35d332d0293dfb5baf3e1b53045627f6a1.1305105580.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mike Rapoport wrote at Wednesday, May 11, 2011 5:08 AM:
> Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> ---
>  arch/arm/mach-tegra/board-trimslice.c |   39 +++++++++++++++++++++++++++++++++
>  1 files changed, 39 insertions(+), 0 deletions(-)

I think you also need the following change to board-trimslice-pinmux.c:

-	{TEGRA_PINGROUP_CDEV1, TEGRA_MUX_OSC,           TEGRA_PUPD_NORMAL,      TEGRA_TRI_NORMAL},
+	{TEGRA_PINGROUP_CDEV1, TEGRA_MUX_PLLA_OUT,      TEGRA_PUPD_NORMAL,      TEGRA_TRI_NORMAL},

Assuming that the CDEV1 clock output from Tegra is used as the codec's
master clock.

-- 
nvpublic
