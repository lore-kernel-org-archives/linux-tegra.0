From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] arm64: tegra: Lost patches for v4.10-rc1
Date: Fri,  2 Dec 2016 20:57:54 +0100
Message-ID: <20161202195756.16562-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi ARM SoC maintainers,

As discussed on IRC, resending these two that seem to have fallen
through the cracks. At least the first patch had been part of a pull
request for v4.8 but ended up not being merged (although all the other
patches in the request did).

Anyway, it'd be great to get these applied for v4.10-rc1.

Thanks,
Thierry

Alexandre Courbot (2):
  arm64: tegra: Add VDD_GPU regulator to Jetson TX1
  arm64: tegra: Add missing Smaug revision

 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 18 ++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  |  3 ++-
 2 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.10.2
