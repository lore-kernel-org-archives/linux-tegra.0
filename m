From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra30: Unknown SKU 177
Date: Tue, 08 Apr 2014 09:25:38 -0600
Message-ID: <534414F2.8080407@wwwdotorg.org>
References: <534403CD.8010303@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <534403CD.8010303-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/08/2014 08:12 AM, Marcel Ziswiler wrote:
> Hi there
> 
> Looks like the latest T30MQS-P-A3 embedded SKUs that can e.g. be found
> on Toradex Colibri T30 V1.1D modules are not yet recognised by the
> mainline speedo driver:
> 
> [    0.000000] Tegra30: Unknown SKU 177
> [    0.000000] fuse_speedo_calib: ATE prog ver 4.0
> [    0.000000] Tegra30: CPU Speedo ID 0, Soc Speedo ID 0
> [    0.000000] Tegra Revision: A03 SKU: 177 CPU Process: 2 Core Process: 0
> 
> Does this have any adverse effects?

No.

NVIDIA's downstream kernels use SKU (along with other) information to
determine clock/voltage limits, etc. However, we don't have any DVFS
code or aggressive clock settings in mainline at present, so unknown
SKUS won't be a problem. The same goes for mainline U-Boot.

Still, it would be nice to squash the warning for you.

Peter, any chance you could look up the appropriate speedo IDs and fill
in a case for this SKU in tegra30_speedo.c? Is it possible to fill in
all known SKUs?
