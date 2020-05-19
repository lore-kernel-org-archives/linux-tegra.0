From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: sram: add documentation for
 reserved-only flag
Date: Tue, 19 May 2020 17:03:26 -0600
Message-ID: <20200519230326.GA827289@bogus>
References: <20200512144803.24344-1-ykaukab@suse.de>
 <20200512144803.24344-2-ykaukab@suse.de>
 <52f099e4-5c03-2141-f049-cd3adeb04c5b@wwwdotorg.org>
 <20200513104127.GA2309@suse.de>
 <efcc6b5e-423c-8ae1-8a46-d6a06c1a1bab@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <efcc6b5e-423c-8ae1-8a46-d6a06c1a1bab-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>, robin.murphy-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, May 19, 2020 at 10:16:43AM -0600, Stephen Warren wrote:
> On 5/13/20 4:41 AM, Mian Yousaf Kaukab wrote:
> > On Tue, May 12, 2020 at 01:45:28PM -0600, Stephen Warren wrote:
> >> On 5/12/20 8:48 AM, Mian Yousaf Kaukab wrote:
> >>> Add documentation for the new optional flag added for SRAM driver.
> >>
> >>> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> >>
> >>> +  reserved-only:
> >>> +    description:
> >>> +      The flag indicating, that only SRAM reserved regions have to be remapped.
> >>> +      remapping type is selected depending upon no-memory-wc as usual.
> >>> +    type: boolean
> >>
> >> This feels a bit like a SW flag rather than a HW description, so I'm not
> >> sure it's appropriate to put it into DT.
> > 
> > Reserved regions themselves are software descriptions, no? Then we have 'pool'
> > flag which is again a software flag and so on. This flag falls into same
> > category and nothing out of ordinary.
> 
> I suppose that's true to some extent. This is indeed a description of
> the system environment presented to the SW that consumes the DT, which
> is a bit more than pure HW description but still a description of
> something imposed externally rather than describing something that's up
> to the discretion of the consuming SW. So, go ahead.
> 
> >> Are there any cases where the SW should map all of the SRAM, i.e. where
> >> we wouldn't expect to set reserved-only? [...]
> > 
> > Yes, here are a few examples:
> > arch/arm/boot/dts/aspeed-g*.dtsi
> > arch/arm/boot/dts/at91*.dtsi
> > arch/arm/boot/dts/bcm7445.dtsi
> > Then arch/arm/boot/dts/dra7.dtsi is an example where we should map everything
> > except the reserved region.
> > 
> >> [...] I'd expect reserved-only to be
> >> the default, and perhaps only, mode of operation for the SRAM driver.
> > 
> > It will break compatibility with existing dtbs.
> > 
> >> If we can't do that because some SW currently expects to be able to map
> >> arbitrary portions of the SRAM, shouldn't that SW be fixed to tell the
> >> SRAM driver which parts it's using, hence still allowing the driver to
> >> only map in-use portions?
> > 
> > User doesn’t need sram driver in that case. It can use genalloc api directly.
> 
> This sounds a bit odd. Without a driver for the reserved region, nothing
> should be touching it, since otherwise there's no code that owns an
> manages the region. If any code needs to consume the region, it should
> obtain info about the region from some form of provider code that can
> handle both the allocation and mapping. Anything else sounds like some
> consumer code directly making use of DT nodes it doesn't own. But since
> I'm not familiar enough with the SRAM driver and genalloc code that you
> mention to fully understand the allocation paths I guess I won't object
> for now, although it does still sound fishy.

I'm fine with the concept, but I don't think a single flag is adequate. 
If there are reserved regions within the SRAM, then define child nodes 
to mark those regions reserved. I don't think you need a new flag. Just 
a 'reg' property and nothing else.

Rob
