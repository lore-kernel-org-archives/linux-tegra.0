From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RESEND PATCH v2 0/3] Tegra30 clockframework
Date: Mon, 9 Jan 2012 13:30:05 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF177EE3A286@HQMAIL01.nvidia.com>
References: <1326123315-32670-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1326123315-32670-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Monday, January 09, 2012 8:35 AM:
> This patchset introduces the tegra30 clockframework. Clocks which require
> voltage scaling are not included in this version. The implementation doesn't
> use the generic clock code yet. It's the intention to move to it, once the
> semantics are fully clarified.
> 
> ---
> 
> Changes in v2:
>  * Fix parent clocks for TWD. This makes the SMP configuration booting again.

Peter,

This version seems to still boot as well as without these patches.

I hacked some AUXDATA into board-dt-tegra30.c in an attempt to get SDHCI
working, but found that:

a) sdhci_add_host() fails due to:

mmc0: Hardware doesn't specify timeout clock frequency.

I haven't investigated why this happens.

b) More directly related to these patches, when sdhci_add_host() fails,
sdhci_tegra_probe() calls clk_disable() and clk_put() on its clock. One
of these hangs somehow. I assume that's a bug in this clock patch?

A couple of I2C devices did end up probing OK with these patches plus
AUXDATA, although I doubt any I2C accesses were actually performed.

-- 
nvpublic
