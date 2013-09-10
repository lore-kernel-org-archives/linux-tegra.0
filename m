From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 1/5] ARM: add basic Trusted Foundations support
Date: Tue, 10 Sep 2013 14:04:31 +0100
Message-ID: <20130910130431.GE27966@mudshark.cambridge.arm.com>
References: <1378351680-14696-1-git-send-email-acourbot@nvidia.com>
 <1378351680-14696-2-git-send-email-acourbot@nvidia.com>
 <5228CEDB.1090306@gmail.com>
 <CAAVeFu+MGGBfmm1jwtKGP_d3EjkLdf5B_E_5RT___PVh1e=8jw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAVeFu+MGGBfmm1jwtKGP_d3EjkLdf5B_E_5RT___PVh1e=8jw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Dave P Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi guys,

On Mon, Sep 09, 2013 at 07:15:31AM +0100, Alexandre Courbot wrote:
> On Fri, Sep 6, 2013 at 3:35 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On 09/04/2013 10:27 PM, Alexandre Courbot wrote:
> >> Trusted Foundations is a TrustZone-based secure monitor for ARM that
> >> can be invoked  using a consistent SMC-based API on all supported
> >> platforms. This patch adds initial basic support for Trusted
> >> Foundations using the ARM firmware API. Current features are limited
> >> to the ability to boot secondary processors.

[...]

> >> +Example:
> >> +     firmware {
> >> +             compatible = "tl,trusted-foundations";
> >> +             version-major = <2>;
> >> +             version-minor = <8>;
> >> +     };
> >
> > I'm wondering how we fit this in with PSCI bindings? Both are pieces of
> > firmware functionality and may co-exist. There's nothing incompatible
> > here, but there should be some commonality. Will future versions of
> > Trusted Foundations follow the SMC calling conventions doc? What about
> > armv8 support.
> 
> I don't have any information about the future of TF unfortunately,
> excepted that it should remain backward-compatible. What is this SMC
> calling convention doc your are talking about btw? Is there a standard
> calling convention defined by ARM?

SMC calling convention:

https://silver.arm.com/download/download.tm?pv=1435186

PSCI:

https://silver.arm.com/download/download.tm?pv=1421585

Although access to these documents requires you to go through a
click-through license.

Will
