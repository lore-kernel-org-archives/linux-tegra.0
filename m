From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2 3/3] Documentation: DT bindings: Tegra AHB: note base
 address change
Date: Thu, 19 Mar 2015 18:46:59 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1503191845060.9480@utopia.booyaka.com>
References: <20150317083221.32662.14647.stgit@baseline> <20150317083221.32662.96822.stgit@baseline> <20150317103806.GU8656@n2100.arm.linux.org.uk> <alpine.DEB.2.02.1503191525450.9480@utopia.booyaka.com> <550AEE6B.5080301@wwwdotorg.org>
 <alpine.DEB.2.02.1503191601520.9480@utopia.booyaka.com> <550AFF52.6070503@wwwdotorg.org> <alpine.DEB.2.02.1503191706340.9480@utopia.booyaka.com> <550B155E.9050308@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550B155E.9050308-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 19 Mar 2015, Stephen Warren wrote:

> We should not document Linux 4.1 as the cut-off. DT bindings are supposed to
> be OS agnostic. While it's practically unlikely, it is entirely possible for
> some other OS to have already implemented support for this binding, and the
> current binding is an ABI. We have no control over if/when any non-Linux code
> is updated to add support for a 0-based offset for existing SoCs, and
> certainly no versions of Linux or any other OS can be updated retro-actively
> except perhaps a few linux-stable versions. We can however write the binding
> in such a way as support for new SoCs requires the new 0-based address, since
> there is no binding specification for those new chips yet, and the time when
> you add the new binding documentation is the first time any OS could possibly
> add conformant support for it.
> 
> In summary, I believe the binding document must state that T20/30/114/124
> require the offset of 4 in reg value, and newer chips require no offset in the
> reg value. We can still always accept either in the Linux kernel going forward
> based on the principle of being lenient re: input data.

That's fine.  I'll send a patch for that.


- Paul
