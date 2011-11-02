From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] arm/tegra: remove unused defines
Date: Wed, 2 Nov 2011 09:34:40 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173F9A46E0@HQMAIL01.nvidia.com>
References: <1320247524-22425-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1320247524-22425-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Wednesday, November 02, 2011 9:25 AM:
> PPI_NR is never used in arch/arm/mach-tegra/irq.c. Remove it.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

For reference, I investigated why the defines aren't used, and found:

Those defines were introduced by:

commit 460907bc26f5565aced3cf35a10e3579c671ef50
[ARM] tegra: add suspend and mirror irqs to legacy controller

3524b70ef3336a4f1351a489e83894b88106ab7c moved those defines
into legacy_irq.c (and appears to have added define NUM_ICTLRS to replace
them) and d1d8c666683cdbef18329ff8f3743ddaca8842ee moved them back.

> -#define INT_SYS_NR	(INT_GPIO_BASE - INT_PRI_BASE)
> -#define INT_SYS_SZ	(INT_SEC_BASE - INT_PRI_BASE)
> -#define PPI_NR		((INT_SYS_NR+INT_SYS_SZ-1)/INT_SYS_SZ)

-- 
nvpublic
