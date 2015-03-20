From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 3/3] Documentation: DT bindings: Tegra AHB: require
 the legacy base address for existing chips
Date: Fri, 20 Mar 2015 10:02:28 -0600
Message-ID: <550C4494.2010609@wwwdotorg.org>
References: <20150320061102.14355.4781.stgit@mcwayne> <20150320061102.14355.87959.stgit@mcwayne>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150320061102.14355.87959.stgit@mcwayne>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/20/2015 12:11 AM, Paul Walmsley wrote:
> Per Stephen Warren, note in the Tegra AHB DT binding documentation
> that we specifically deprecate any attempt to use the IP block's
> actual hardware base address, and advocate the use of the legacy
> "off-by-four" address in the 'regs' property, for Tegra chips with
> existing upstream Linux DT files that include a Tegra AHB node.  This
> patch updates the documentation accordingly.
>
> Changing the existing kernel DT data isn't under consideration because
> Linux kernel DT data policy is to preserve compatibility between newer
> DT data files and older kernels.  However, this additional step of
> changing the documentation should discourage others from sending
> kernel patches to try to change the legacy kernel DT data.
> Furthermore, for out-of-tree software (such as bootloaders or other
> operating systems) that may rely on Linux kernel DT binding
> documentation as an ABI (but not the Linux kernel DT data itself),
> such a change may allow future convergence with the Linux kernel DT
> data without additional code changes.

> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
> index 067c9790062f..9a4295b54539 100644
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
> @@ -5,9 +5,12 @@ Required properties:
>     Tegra30, must contain "nvidia,tegra30-ahb".  Otherwise, must contain
>     '"nvidia,<chip>-ahb", "nvidia,tegra30-ahb"' where <chip> is tegra124,
>     tegra132, or tegra210.
> -- reg : Should contain 1 register ranges(address and length)
> +- reg : Should contain 1 register ranges(address and length).  For
> +  Tegra20, Tegra30, and Tegra114 chips, the value must be <0x6000c004
> +  0x10c>.  For Tegra124, Tegra132 and Tegra210 chips, the value should
> +  be be <0x6000c000 0x150>.

I would have expected the exception to exist on Tegra124 too since 
that's long been supported upstream. However, since we haven't actually 
added the AHB node into the DT files on Tegra124 yet, I suppose we can 
assume that nobody has anywhere so the slightly retro-active change on 
Tegra124 is OK.

The series,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
