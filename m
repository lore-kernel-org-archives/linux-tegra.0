From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Oops on Tegra30 with CPU Process: 1
Date: Fri, 11 Apr 2014 10:14:58 -0600
Message-ID: <53481502.60004@wwwdotorg.org>
References: <53440884.7010304@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53440884.7010304-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/08/2014 08:32 AM, Marcel Ziswiler wrote:
> Hi there
> 
> I have the following Toradex Colibri T30 modules with different ATE prog
> versions, Tegra30 SKUs as well as CPU process numbers:
> 
> Colibri T30 V1.1B (working)
> 
> [    0.000000] fuse_speedo_calib: ATE prog ver 3.6
> [    0.000000] Tegra30: CPU Speedo ID 2, Soc Speedo ID 2
> [    0.000000] Tegra Revision: A03 SKU: 129 CPU Process: 2 Core Process: 0
> 
> Colibri T30 V1.1C (below crash)
> 
> [    0.000000] fuse_speedo_calib: ATE prog ver 3.7
> [    0.000000] Tegra30: CPU Speedo ID 2, Soc Speedo ID 2
> [    0.000000] Tegra Revision: A03 SKU: 129 CPU Process: 1 Core Process: 0

That's unfortunate. Just so you know the reason for the delay in
responding, I'm trying to do some research to find out the issue.

...
> What exactly do those SoC speedo, CPU process and core process numbers
> indicate?

The SKU, speedo and process information all together allows us to
determine min/max limits for the various CPU/SoC voltage rails, and
frequencies at which those domains can operate. It's possible that the
voltages/frequencies set up/used by mainline U-Boot and/or kernel work
fine for some chips but not others. At present, we don't do anything
different for different SKUs or process IDs, and hence hopefully in
mainline, we chose lowest-common-denominator values that should work
across all chips. I'm trying to research what the limits are, and find
out if this is actually the case. This may take some time.
