From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3 07/10] arm/tegra: Add PWFM controller device tree
 probing
Date: Mon, 5 Mar 2012 10:39:22 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17BE861C74@HQMAIL01.nvidia.com>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de>
 <1329923841-32017-8-git-send-email-thierry.reding@avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1E67@HQMAIL01.nvidia.com>
 <20120303225404.GC6661@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF17BE861C46@HQMAIL01.nvidia.com>
 <20120305181555.GA22459@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120305181555.GA22459-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Monday, March 05, 2012 11:16 AM:
> * Stephen Warren wrote:
> > Thierry Reding wrote at Saturday, March 03, 2012 3:54 PM:
...
> > > > Could you also write binding documentation, in particular explaining
> > > > what the two pwm-cells are specifically for Tegra:
> > > >
> > > > Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
> > > >
> > > > (although perhaps that'd be part of the previous patch which implements
> > > > the driver)
> > >
> > > Actually for Tegra the values would be those documented in the generic
> > > binding because Tegra uses of_pwm_simple_xlate(). Does it still make sense to
> > > add a Tegra-specific binding?
> >
> > There should still be a Tegra-specific binding. Without it, there's no
> > definite way to know whether the "standard" properties actually apply,
> > or someone simply forgot to document it.
> 
> Understood. I assume that both the Tegra20 and Tegra30 variants should have
> explicit bindings then as well, right?

To date, the bindings for the two chips have been similar enough we've
only written a single bindings document that covers both. For the
different compatible values, I've been assuming that's such a base part
of standard DT usage that those differences didn't even require
documenting in the individual bindings. For example, I've written e.g.:

Required properties:
- compatible : "nvidia,tegra20-i2s"

Or:

Required properties:
- compatible: Should be "nvidia,<chip>-apbdma"

And assumed these would be expanded as appropriate by the DT author.

Of course, if there were significant bindings differences (rather than
HW differences that were largely transparent to bindings) then yes I'd
expected separate nvidia,tegra20-foo.txt and nvidia,tegra30-foo.txt.

-- 
nvpublic
