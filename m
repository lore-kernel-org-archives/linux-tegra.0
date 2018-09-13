From: Thierry Reding <thierry.reding@gmail.com>
Subject: Multi-parent IRQ domains
Date: Thu, 13 Sep 2018 17:59:45 +0200
Message-ID: <20180913155945.GA19903@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

I've been trying to implement a feature on recent Tegra chips that's
called "wake events". These wake events are implemented as part of the
power management controller (PMC) and they control which events can be
used to wake the system from suspend. Events include things like an
alarm interrupt from an RTC, or the GPIO interrupt hooked up to a
power button for example.

We already have a driver for a couple of other things that the PMC does,
so I thought it'd be natural to implement this functionality as an IRQ
chip in the PMC driver. The way that this would work is that for all the
devices that are wakeup sources, we'd end up specifying the PMC as the
interrupt parent and the PMC would then itself have the main GIC as its
parent. That way, the hierarchical IRQ domain infrastructure would take
care of pretty much everything.

Unfortunately I've run into some issues here. One problem that I'm
facing is that PMC could have more than one parent. For example, the RTC
alarm interrupt goes straight to the GIC, but the power button GPIO goes
through the GPIO controller first and then to the GIC. This doesn't seem
to be something that's currently possible.

The way I imagine this to work from a DT perspective is as follows:

	rtc: rtc@c2a0000 {
		compatible = "nvidia,tegra194-rtc", "nvidia,tegra20-rtc";
		reg = <0x0c2a0000 0x10000>;
		interrupt-parent = <&pmc>;
		interrupts = <73 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
		status = "disabled";
	};

	pmc: pmc@c360000 {
		compatible = "nvidia,tegra194-pmc";
		reg = <0x0c360000 0x10000>,
		      <0x0c370000 0x10000>,
		      <0x0c380000 0x10000>,
		      <0x0c390000 0x10000>,
		      <0x0c3a0000 0x10000>;
		reg-names = "pmc", "wake", "aotag", "scratch", "misc";

		#interrupt-cells = <5>;
		interrupt-controller;
	};

	gpio-keys {
		compatible = "gpio-keys";

		power {
			label = "Power";
			gpios = <&gpio_aon TEGRA194_AON_GPIO(EE, 4)
					   GPIO_ACTIVE_LOW>;
			linux,input-type = <EV_KEY>;
			linux,code = <KEY_POWER>;
			debounce-interval = <10>;
			interrupt-parent = <&pmc>;
			interrupts = <29 &gpio_aon TEGRA194_AON_GPIO(EE, 4)
						   IRQ_TYPE_LEVEL_LOW 0>;
			wakeup-source;
		};
	};

The above is somewhat brittle because the PMC needs to be able to cover
both GIC and GPIO interrupt specifiers, so it gets 5 interrupt cells
(one for the wake event ID, one for a phandle to the parent controller
and two or three for the parent specifier). It'd be nicer if we could
actually have specifiers that exactly match the bindings for the
respective parent controllers (so that the GPIO specifier didn't have to
contain the dummy 0 at the end), but I don't see a way how that can be
achieved, given how we have to "embed" the specifier in another. We
could probably make it work in code, but DTC would still flag these as
errors.

One thing I briefly looked into was using interrupt-map to implement
this, which would give us a nice way of mapping arbitrary parent
interrupts to wake events. However, since we need to program some of the
PMC registers at ->irq_set_wake() time, using simply an interrupt-map
wouldn't do the trick, since we wouldn't be implementing an IRQ chip and
hence wouldn't be able to install any callbacks.

Perhaps a simple way to implement this would be to just blindly enable
all wake events, but that's not really what we want. We really only want
to enable them for devices that can be wakeup sources. Otherwise we may
get wakeups for completely unrelated GPIO activity.

I tried implementing support for multiple parents within the PMC driver
by looking up the parent domain based on the phandle from the specifier
at IRQ domain ->alloc() and ->translate() time, but I run into deadlock
when I do that, so before I go and open up a can of worms I wanted to
get your input on what the best way forward would be.

Does anyone have any ideas on how to solve this? Perhaps there's a
better solution to this that doesn't involve IRQ infrastructure that I'm
not aware of?

Thanks,
Thierry

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluaiW0ACgkQ3SOs138+
s6HYJA/9HViIu3YoQMRYX9pH199SbtFo8nEFrlXyUbAr9fCcTGKz6FnoNYqlN/wD
GlSP0mpfAn76N8E3V+xuWtgLRihPIew7K1q8Uynxy9RussCZPIyyD4rwOFvbmvX2
1HHtCl/Phh0fYF+oCmM5H3JTj/Na6a5fTN+9357FFXteMnyqzpNvHbdZIEKvv4qt
r1iYIDlGoqQX5zwIBgCxlFB+vDsbNaSCBY4cZKxfKMuLLqAH/ITMWK9T4ANTn/u1
DZWvx9fl3zZiN1enMJ+8oz9rX3EKXkj8RdcYwSl4HL8+quCrCauslz1yQo+Ahw+q
SEo9IIJIoxNy5FGEWg3m2G455oQ7KtsksZJO9KXusrtcbOhptuk9I4B0A3GfR+Az
vMM1j2f7I2KiyrDCxqvo+2e9pBUWUZfp0uNHlFno5jXoSK7x27NRnJdLYb/ac2lP
BfsfY1OJRONOkOvsHXnK7YxCbKJY7yT7/c3C3PjQKB/5yDAP8ULwvlCN2Zc1sz/p
usONA2fziuXHhWCCke0YNeKYXb2oQqXNPAq9UDn2AaZKzPQaewnF82Q/zcwbZ+Ut
jVcW0S6wIxQC7R56BZaGjuhpl9elSLD4idl8u1LWxkmM2cphxf+Cj8zaBLV4HcWV
DC0fe7bC73x0rmknhdt5WFK7L8wnsa1nt2bvHVcWPZjO1WBtOak=
=gT9u
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
