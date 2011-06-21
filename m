From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] fix compilation with binutils 2.21
Date: Tue, 21 Jun 2011 08:28:33 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF049D2EB84E@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Marc Dietrich (marvin24-Mmb7MZpHnFY@public.gmane.org)" <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Wed, 27 Apr 2011 17:47:59 +0200:
> I need the following patch to compile the tegra kernel with binutils 2.21 (as in 
> Ubuntu Natty and soon everywhere else). As far as I can see, it produces 
> identical binaries (and boots of course).

Can you resend this patch with a Signed-off-by line. Then, I hope Colin
can commit it.

Thanks.

> --- a/arch/arm/mach-tegra/headsmp-t2.S
> +++ b/arch/arm/mach-tegra/headsmp-t2.S
> @@ -108,7 +108,7 @@ __restart_plls:
>         /* FIXME: need to record actual power transition here */
>         mov     r0, #0
>         b       __cortex_a9_l2x0_restart
> -ENDPROC(__restart_pllx)
> +ENDPROC(__restart_plls)
>  /*
>   *     __enable_coresite_access
>   *

-- 
nvpublic
