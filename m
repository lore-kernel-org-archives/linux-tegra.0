From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 07/10] arm/tegra: Add PWFM controller device tree
 probing
Date: Sun, 4 Mar 2012 20:39:14 +0000
Message-ID: <201203042039.14848.arnd@arndb.de>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1E67@HQMAIL01.nvidia.com>
 <20120303225404.GC6661@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120303225404.GC6661-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
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
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Saturday 03 March 2012, Thierry Reding wrote:
> Not enough information to check signature validity.  Show Details
>   * Stephen Warren wrote:
> > Thierry Reding wrote at Wednesday, February 22, 2012 8:17 AM:
> > > Add auxdata to instantiate a device tree for the PWFM controller and
> > > include a corresponding node in the device tree.
> > 
> > > diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
> > 
> > > +   pwm: pwm@7000a000 {
> > > +           compatible = "nvidia,tegra20-pwm";
> > > +           reg = <0x7000a000 0x100>;
> > > +           #pwm-cells = <2>;
> > > +   };
> > 
> > The compatible value probably should list both Tegra30 and Tegra20, so
> > we can know exactly which HW is present, just in case we need to turn
> > on some bug-fix only for one of the variants:
> > 
> >     compatible = "nvidia,tegra30-pwm", "nvidia,tegra20-pwm";
> 
> I'm confused. If I know exactly that the hardware is Tegra30 (which it
> definitely should be if I include tegra30.dtsi), then why list "tegra20-pwm"
> as compatible?
> 
> Or did you mean to list tegra30-pwm as compatible value in the PWM driver?

We generally list the oldest version of the device that a specific version
is compatible to, in order to use the same driver unmodified.

E.g. an ns16550a serial port would list both ns16550a and i8250 in its
compatible fields so it works with operating systems that only know about
i8250.

It's not actually all that useful when you add device tree support for
two versions of the same device at the same time, but I think that
it's good style anyway, in particular when you consider other users of
the device tree data besides the Linux kernel.

	Arnd
