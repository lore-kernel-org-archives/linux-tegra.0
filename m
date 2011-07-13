From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: Tegra: Trimslice: Tri-state DAP2 pinmux
Date: Wed, 13 Jul 2011 11:51:41 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF049E834793@HQMAIL01.nvidia.com>
References: <1310579091-7424-1-git-send-email-swarren@nvidia.com>
 <20110713180058.GB27828@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110713180058.GB27828-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Mike Rapoport <mike.rapoport-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Wednesday, July 13, 2011 12:01 PM:
> Stephen Warren wrote:
> > DAP2 is used for a bunch of GPIOs. Not tri-stating the pins means audio
> > signals get sent out there, and this ends up resetting USB and breaking
> > SDHCI too.
...
> > -	{TEGRA_PINGROUP_DAP3,  TEGRA_MUX_DAP3,          TEGRA_PUPD_NORMAL,      TEGRA_TRI_NORMAL},
> > +	{TEGRA_PINGROUP_DAP3,  TEGRA_MUX_DAP3,          TEGRA_PUPD_NORMAL,      TEGRA_TRI_TRISTATE},
> 
> The patch subject and description say that DAP2 is tristated, not DAP3.

Oops. I've fixed that locally and will repost once Mike acks it.

Thanks!

-- 
nvpublic
