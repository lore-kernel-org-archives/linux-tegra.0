From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 03/10] Documentation: dt-bindings: firmware: tegra: add
 bindings of the BPMP
Date: Wed, 13 Jul 2016 13:41:14 -0600
Message-ID: <5786995A.1090706@wwwdotorg.org>
References: <20160705090431.5852-1-josephl@nvidia.com>
 <20160705090431.5852-4-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160705090431.5852-4-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matthew Longnecker <MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/05/2016 03:04 AM, Joseph Lo wrote:
> The BPMP is a specific processor in Tegra chip, which is designed for
> booting process handling and offloading the power management, clock
> management, and reset control tasks from the CPU. The binding document
> defines the resources that would be used by the BPMP firmware driver,
> which can create the interprocessor communication (IPC) between the CPU
> and BPMP.

> diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt

> +- Documentation/devicetree/bindings/mailbox/mailbox.txt
> +- Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt

> +- Documentation/devicetree/bindings/clock/clock-bindings.txt
> +- include/dt-bindings/clock/tegra186-clock.h
> +- Documentation/devicetree/bindings/reset/reset.txt
> +- include/dt-bindings/reset/tegra186-reset.h

If you end up needing to repost this, it would be nice to make all those 
file references more generic. In particular, some SW projects store 
binding docs somewhere other than Documentation/devicetree/bindings/ 
(e.g. U-Boot uses doc/device-tree-bindings/), and it's possible that the 
header files aren't stored in include/ but somewhere else. To make these 
file references valid everywhere, I'd suggest using relative paths for 
the binding docs, and #include style paths for the headers, e.g.:

../clock/clock-bindings.txt

<dt-bindings/clock/tegra186-clock.h>
