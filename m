From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 2/4] ARM: tegra114: Reprogram GIC CPU interface to
 bypass IRQ on CPU PM entry
Date: Tue, 23 Jul 2013 08:44:39 -0700
Message-ID: <20130723154438.GA2864@dhcp-172-17-186-34.nvidia.com>
References: <1374225926-26832-1-git-send-email-josephl@nvidia.com>
 <1374225926-26832-3-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1374225926-26832-3-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2013 at 05:25:24PM +0800, Joseph Lo wrote:
> There is a difference between GICv1 and v2 when CPU in power management
> mode (aka CPU power down on Tegra). For GICv1, IRQ/FIQ interrupt lines
> going to CPU are same lines which are also used for wake-interrupt.
> Therefore, we cannot disable the GIC CPU interface if we need to use same
> interrupts for CPU wake purpose. This creates a race condition for CPU
> power off entry. Also, in GICv1, disabling GICv1 CPU interface puts GICv1
> into bypass mode such that incoming legacy IRQ/FIQ are sent to CPU, which
> means disabling GIC CPU interface doesn't really disable IRQ/FIQ to CPU.
>=20
> GICv2 provides a wake IRQ/FIQ (for wake-event purpose), which are not
> disabled by GIC CPU interface. This is done by adding a bypass override
> capability when the interrupts are disabled at the CPU interface. To
> support this, there are four bits about IRQ/FIQ BypassDisable in CPU
> interface Control Register. When the IRQ/FIQ not being driver by the
> CPU interface, each interrupt output signal can be deasserted rather
> than being driven by the legacy interrupt input.
>=20
> So the wake-event can be used as wakeup signals to SoC (system power
> controller).
>=20
> To prevent race conditions and ensure proper interrupt routing on
> Cortex-A15 CPUs when they are power-gated, add a CPU PM notifier
> call-back to reprogram the GIC CPU interface on PM entry. The
> GIC CPU interface will be reset back to its normal state by
> the common GIC CPU PM exit callback when the CPU wakes up.
>=20
> Based on the work by: Scott Williams <scwilliams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi Joseph,

We've had a rather long-standing issue with PCIe and MSI related to LP2
on Tegra20. I wonder if that's somehow related to this. Given that this
is marked as Tegra114 patch explicitly I suppose not, but it certainly
sounds very similar to the description above.

Thierry

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJR7qTmAAoJEN0jrNd/PrOh2vYP/iO2JBXmfRDFBMPkdieR7Tr0
37lFvk5lCLxkGQIappka5ZT6NKrqBJO12oCO/wowLG6D+FDIuh4XNmuhAHxyIzLx
ATt+OWNT1cHwPh+o/lc6gAdYBOj0bU/AejXyqt9v6TyXDfbOaWwQtc6fHiW0o/tq
bZkmdGxuv8KF7bijup0vJ/pyQvjUALMNNXQb5K0UygQUKWMtqxptRBS8z7P/C/B5
CIqnw+IYhDRQqr9IYRhFMT7uxjVkBboNlkp+/RYLf7T1xofc7kUl3NcQxLRuSL43
kRJSK94FQT0aIIkinG2Hw+s68Yxd4cRInjZBzq7bExGvgP87VAS7lUsRZeAqhTWk
c+D49c7d6AdwHCUASzLtvAopiBHgPhvohiJhVzMaBTiVhPJj/6X31dmwtvOpVARX
VoL0B4DJQoOiL355/YK9KCwLbxcTE+W25FzKhCwB5gEj7Pq6xGB+lTV5X9X2RMz+
03kncxhXnpWtOCAxxcKEqoniwl+1YcbWZEl1iyBVWE8vKJ6MeRVzKxb32MWyDMVV
GKlpJ4ds2ovRiw4ymKOdXlz7qPQKMVEIFMrWCwObYlUzlC+urojwfB+HSyZCNvay
/voKt7+V9X2CnX5yqpa6YleO0oRFVcWGuU/OJXU1x1TGKyKmjk+I65QbrUGy4WlO
Rxho2lM4BfCQXKV+hLb7
=znPL
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
