From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] Documentation: DT bindings: Tegra AHB: note base
 address change
Date: Thu, 19 Mar 2015 15:33:13 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1503191528570.9480@utopia.booyaka.com>
References: <20150317083221.32662.14647.stgit@baseline> <20150317083221.32662.96822.stgit@baseline> <550859A0.9090500@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550859A0.9090500-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 17 Mar 2015, Stephen Warren wrote:

> On 03/17/2015 02:32 AM, Paul Walmsley wrote:
> > For Tegra132 and later chips, we can now use the correct hardware base
> > address for the Tegra AHB IP block in the DT data.  Update the DT binding
> > documentation to reflect this change.
> 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
> > b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
> > index 067c979..7692b4c 100644
> > --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
> > +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
> > @@ -2,10 +2,15 @@ NVIDIA Tegra AHB
> > 
> >   Required properties:
> >   - compatible : For Tegra20, must contain "nvidia,tegra20-ahb".  For
> > -  Tegra30, must contain "nvidia,tegra30-ahb".  Otherwise, must contain
> > -  '"nvidia,<chip>-ahb", "nvidia,tegra30-ahb"' where <chip> is tegra124,
> > -  tegra132, or tegra210.
> > -- reg : Should contain 1 register ranges(address and length)
> > +  Tegra30, must contain "nvidia,tegra30-ahb".  For Tegra114 and Tegra124,
> > must
> > +  contain '"nvidia,<chip>-ahb", "nvidia,tegra30-ahb"' where <chip> is
> > tegra114
> > +  or tegra124.  For Tegra132, the compatible string must contain
> > +  "nvidia,tegra132-ahb".
> > +
> > +- reg : Should contain 1 register ranges(address and length).  On Tegra20,
> > +  Tegra30, Tegra114, and Tegra124 chips, the low byte of the physical base
> > +  address of the IP block must end in 0x04.  On DT files for later chips,
> > the
> > +  actual hardware base address of the IP block should be used.
> 
> A table-based approach rather than prose might make this more legible?
> 
> - compatible: Must contain the following:
>   Tegra20:  "nvidia,tegra20-ahb"
>   Tegra30:  "nvidia,tegra30-ahb"
>   Tegra114: "nvidia,tegra114-ahb", "nvidia,tegra30-ahb"
>   Tegra124: "nvidia,tegra124-ahb", "nvidia,tegra30-ahb"
>   Tegra132: "nvidia,tegra132-ahb"
>   Tegra210: "nvidia,tegra210-ahb", "nvidia,tegra132-ahb"
> 
> With any luck, we can extend that final item for future chips to be:
> 
>   Tegra210, TegraNNN:
>             "nvidia,tegra<chip>-ahb", "nvidia,tegra132-ahb"
> 
> Perhaps we format the 114/124 entry that way too.

I think I'm just going to drop this patch, since Russell prefers that the 
workaround is applied in the driver.

With regards to using tables rather than narrative descriptions: perhaps 
consider a patch to 
Documentation/devicetree/bindings/submitting-patches.txt ?  I don't know 
what the DT binding documentation maintainers' future plans are with 
regards to automated documentation reflow, etc., but submitting a patch 
there would stimulate at least some coordination on the issue.

> As a historical note, I thought this issue might have been caused by the HW
> lumping together a bunch of vaguely related features into the same address
> window, with offset 0 being unrelated to AHB. This is certainly the
> explanation for some other interesting reg value in DT on other HW modules in
> Tegra. However as best I can tell that isn't the case for this HW module; we
> just mapped the start of the reg value to the first defined register for some
> reason rather than aligning it with the entry in the address map. So, this
> series makes sense to me.
> 
> The series,
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> (it'd be nice if the DT doc was modified as I described above, but not
> strictly necessary. I like Russell's ideas how to make this more
> transparent/automatic so old DTs can be converted too).

I'll add the ack on the first patch, but since the second one has been 
changed, I won't add one there yet.


- Paul
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
