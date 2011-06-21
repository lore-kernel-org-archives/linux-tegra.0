From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/1] fix compilation with binutils 2.21
Date: Tue, 21 Jun 2011 11:35:03 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF049D2EB8E8@HQMAIL01.nvidia.com>
References: <ada666126c7d574b5ca808dca32850b1a2ae3422.1308679260.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ada666126c7d574b5ca808dca32850b1a2ae3422.1308679260.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Tuesday, June 21, 2011 12:31 PM:
> binutils since version 2.21 is more pedantic regarding naming and will wail if
> e.g. the name of a function is not exactly the same as in the ENDPROC directive.

Colin, FYI, this issue was also recently discovered internally at NVIDIA, and the
same fix was derived and validated.

> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> ---
>  arch/arm/mach-tegra/headsmp-t2.S |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/headsmp-t2.S b/arch/arm/mach-tegra/headsmp-t2.S
> index 9da0ed6..a550cb7 100644
> --- a/arch/arm/mach-tegra/headsmp-t2.S
> +++ b/arch/arm/mach-tegra/headsmp-t2.S
> @@ -108,7 +108,7 @@ __restart_plls:
>  	/* FIXME: need to record actual power transition here */
>  	mov	r0, #0
>  	b	__cortex_a9_l2x0_restart
> -ENDPROC(__restart_pllx)
> +ENDPROC(__restart_plls)
>  /*
>   *	__enable_coresite_access
>   *
> --
> 1.7.4.1

-- 
nvpublic
