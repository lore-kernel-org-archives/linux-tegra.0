From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: tegra: cpuidle: separate cpuidle driver for
 different chips
Date: Thu, 11 Oct 2012 14:42:11 +0800
Message-ID: <1349937731.19413.80.camel@jlo-ubuntu-64.nvidia.com>
References: <1349691981-31038-1-git-send-email-josephl@nvidia.com>
	 <1349691981-31038-2-git-send-email-josephl@nvidia.com>
	 <5074A3C3.1080006@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5074A3C3.1080006-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2012-10-10 at 06:22 +0800, Stephen Warren wrote:
> On 10/08/2012 04:26 AM, Joseph Lo wrote:
> > The different Tegra chips may have different CPU idle states and data.
> > Individual CPU idle driver make it more easy to maintain.
> 
> > diff --git a/arch/arm/mach-tegra/cpuidle.c b/arch/arm/mach-tegra/cpuidle-tegra20.c
> > similarity index 72%
> > copy from arch/arm/mach-tegra/cpuidle.c
> > copy to arch/arm/mach-tegra/cpuidle-tegra20.c
> > index 4e0b07c..e2fc26a 100644
> > --- a/arch/arm/mach-tegra/cpuidle.c
> > +++ b/arch/arm/mach-tegra/cpuidle-tegra20.c
> > @@ -1,24 +1,22 @@
> >  /*
> > - * arch/arm/mach-tegra/cpuidle.c
> > + * CPU idle driver for Tegra20 CPUs
> >   *
> > - * CPU idle driver for Tegra CPUs
> > - *
> > - * Copyright (c) 2010-2012, NVIDIA Corporation.
> > + * Copyright (c) 2010-2012, NVIDIA Corporation. All rights reserved.
> >   * Copyright (c) 2011 Google, Inc.
> >   * Author: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> >   *         Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >   *
> > - * Rework for 3.3 by Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > - *
> > - * This program is free software; you can redistribute it and/or modify
> > - * it under the terms of the GNU General Public License as published by
> > - * the Free Software Foundation; either version 2 of the License, or
> > - * (at your option) any later version.
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2, as published by the Free Software Foundation.
> >   *
> >   * This program is distributed in the hope that it will be useful, but WITHOUT
> >   * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> >   * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> >   * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> >   */
> 
> While that is the correct (c) header for new work submitted upstream,
> given this file is existing, just renamed and tweaked a bit, I don't
> believe you want to be changing the (c) header at all. Same for
> cpuidle-tegra30.c.

OK. I would just remove this line.
- * arch/arm/mach-tegra/cpuidle.c

Thanks,
Joseph
