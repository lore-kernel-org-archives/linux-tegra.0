From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v1 8/8] ARM: tegra: support for secondary cores on
 Tegra30
Date: Thu, 26 Jan 2012 12:44:45 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178CB8247E@HQMAIL01.nvidia.com>
References: <1327597641-7519-1-git-send-email-pdeschrijver@nvidia.com>
 <1327597641-7519-9-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327597641-7519-9-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Thursday, January 26, 2012 10:07 AM:
> Add support for bringing up secondary cores on Tegra30. On Tegra30 secondary
> CPU cores are powergated, so we need to turn on the domains before we can bring
> the CPU cores online. Bringing secondary cores online happens early during the
> ssytem boot, so we call powergating initialization from platform early_init
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

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

(I already saw this a few times before Peter posted it, so any concerns
I had have been fixed. Still, I'm not very familiar with this part of
the code, so it'd be awesome if e.g. Colin could review this too)

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

(Booted Tegra20 Harmony, validated 2 CPUs found in dmesg during boot,
validated top showed 2 CPUs being actively used. Booted Tegra30 Cardhu,
validated 4 CPUs found in dmesg during boot, but didn't validate anything
from user-space since the SD controller doesn't work yet and I don't have
an initrd set up to test with).

-- 
nvpublic
