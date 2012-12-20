From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 1/5] ARM: tegra: add pending SGI checking API
Date: Thu, 20 Dec 2012 13:14:09 +0200
Message-ID: <20121220111409.GH19258@tbergstrom-lnx.Nvidia.com>
References: <1355797861-12759-1-git-send-email-josephl@nvidia.com>
 <1355797861-12759-2-git-send-email-josephl@nvidia.com>
 <CAMbhsRSorDf-BebFn+t39zOK4VX4N0Fu0iPrM7XpKZcssTgX9A@mail.gmail.com>
 <20121218101548.GO19258@tbergstrom-lnx.Nvidia.com>
 <CAMbhsRSDwSoHoEs93NZhDchCS28-vQCuW2p+kqfNKeqLygL2sQ@mail.gmail.com>
 <50D2BB51.9000109@ti.com>
 <20121220093412.GE19258@tbergstrom-lnx.Nvidia.com>
 <50D2DF45.1000305@ti.com>
 <20121220095951.GG19258@tbergstrom-lnx.Nvidia.com>
 <50D2E76C.7050309@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50D2E76C.7050309-l0cyMroinI0@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> >
> > So why does OMAP4 have working coupled idle without the SGI check then?
> >
> Because whenever the OMAP4 CPUs enter into any power states apart from
> ON, clock-domain force wakeup method us being used to wakeup
> secondary CPUs. And secondly CPU RET is not supported on purpose because
> of some known IP block issues.
> 

Aha. That explains indeed why you don't need the check.

Cheers,

Peter.
