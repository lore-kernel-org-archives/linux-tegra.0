From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3 04/10] arm/tegra: Fix PWM clock programming
Date: Mon, 5 Mar 2012 09:33:51 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17BE861C2E@HQMAIL01.nvidia.com>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de>
 <1329923841-32017-5-git-send-email-thierry.reding@avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1E52@HQMAIL01.nvidia.com>
 <20120303224751.GB6661@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120303224751.GB6661-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Simon Que <sque-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Saturday, March 03, 2012 3:48 PM:
> * Stephen Warren wrote:
> > Thierry Reding wrote at Wednesday, February 22, 2012 8:17 AM:
> > > PWM clock source registers in Tegra 2 have different clock source selection bit
> > > fields than other registers.  PWM clock source bits in CLK_SOURCE_PWM_0 register
> > > are located at bit field bit[30:28] while others are at bit field bit[31:30] in
> > > their respective clock source register.
> > >
> > > This patch updates the clock programming to correctly reflect that, by adding a
> > > flag to indicate the alternate bit field format and checking for it when
> > > selecting a clock source (parent clock).
> >
> > tegra30_clocks.c needs this change too, although on Tegra30, it's bits
> > 29:28 for the PWM, and bits 31:30 for non-PWM.
> 
> Okay, I'll add code for Tegra30 in the next version. I won't be able to test
> that at all because I don't have any Tegra30 hardware.

It looks like Tegra30 is already taken care of; see periph_clk_source_mask()
in tegra30_clocks.c, assuming that tegra_list_clks[] has the correct flags
set of each entry anyway. PWM does at least.

> > > diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
> >
> > +#define PERIPH_CLK_SOURCE_4BIT_MASK	(7<<28)
> > +#define PERIPH_CLK_SOURCE_4BIT_SHIFT	28
> >
> > Why is this (and the flag that enables it) called "4 bit"; the existing
> > code supports a 2-bit mux field (4-values), whereas this new code supports
> > a 3-bit field (potentially 8 values, but only 5 actually assigned).
> > Can this be renamed something more accurate, especially since on Tegra30
> > the difference is only the bit position of the field, not the number of
> > bits in the field.
> 
> This is taken directly from the Chromium tree, so I don't really know why
> that name was chosen. But since the PWM clock source register seems to be the
> only exception, how about calling the flag PWM_CLK and prefix the shift and
> mask with PWM_CLK_SOURCE_ instead?

That sounds reasonable.

-- 
nvpublic
