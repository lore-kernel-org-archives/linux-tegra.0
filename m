From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v4] ARM: tegra: emc: convert tegra2_emc to a platform
 driver
Date: Fri, 6 Jan 2012 09:17:48 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF177EE39E37@HQMAIL01.nvidia.com>
References: <1325743288-2460-1-git-send-email-olof@lixom.net>
 <1325814163-23980-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1325814163-23980-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Thursday, January 05, 2012 6:43 PM:
> This is the first step in making it device-tree aware and get rid of the
> in-kernel EMC tables (of which there are none in mainline, thankfully).
> 
> Changes since v3:
> 
> * moved to devm_request_and_ioremap() in probe()
> *
> Changes since v2:
> 
> * D'oh -- missed a couple of variables that were added, never used and then
>   later removed in a later patch.
> 
> Changes since v1:
> 
> * Fixed messed up indentation
> * Removed code that should be gone (was added here and removed later in series)
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-- 
nvpublic
