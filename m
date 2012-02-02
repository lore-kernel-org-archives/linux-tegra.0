From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 8/8] ARM: tegra: support for secondary cores on
 Tegra30
Date: Thu, 2 Feb 2012 10:04:12 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178E124AA5@HQMAIL01.nvidia.com>
References: <1328028051-24271-1-git-send-email-pdeschrijver@nvidia.com>
 <1328028051-24271-9-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328028051-24271-9-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Tuesday, January 31, 2012 9:41 AM:
> Add support for bringing up secondary cores on Tegra30. On Tegra30 secondary
> CPU cores are powergated, so we need to turn on the domains before we can bring
> the CPU cores online. Bringing secondary cores online happens early during the
> sytem boot, so we call powergating initialization from platform early_init
> function.
> 
> Based on work by:
> 
> Scott Williams <scwilliams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> Alex Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The series,

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This time, since I now have the SD card working, I managed to test real
user-space processes running on all 4 cores.

Note, patch 3 shouldn't compile due to a typo in a .size directive. It
does for me, so I could test this! But, it didn't for Olof. Aside from
that (which perhaps Olof would fixup during patch application?),

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I also have a query on patch 3 about enabling coresight, but that's more
for my education than something that'd block patch application.

-- 
nvpublic
