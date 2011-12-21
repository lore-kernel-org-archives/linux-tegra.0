From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC 2/7] pwm: Allow chips to support multiple PWMs.
Date: Wed, 21 Dec 2011 08:51:41 +0100
Message-ID: <20111221075141.GB542@avionic-0098.mockup.avionic-design.de>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
 <1324377138-32129-3-git-send-email-thierry.reding@avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF176BE92E67@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2214835515347853028=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF176BE92E67-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============2214835515347853028==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Thierry Reding wrote at Tuesday, December 20, 2011 3:32 AM:
> > many PWMs it controls using the npwm member. Each of the functions in
> > the pwm_ops structure gets an additional argument that specified the PWM
> > number (it can be converted to a per-chip index by subtracting the
> > chip's base).
>=20
> I think it'd be much more convenient for drivers if the PWM core passed
> the device-relative PWM ID to the driver functions instead of the global
> PWM ID; the common case is going to be for the driver to want to index
> into some local array using the value, which means all drivers will have
> to subtract the chip base. I doubt many drivers will care about the global
> ID at all, and if they do, they can add the base back on.

That was my initial plan as well, but then I looked to gpiolib for
inspiration and decided to go the same way. But from what I hear now that
wasn't so good. If there is a concensus that gpiolib has some flaws in this
respect, then I think we should try to avoid them in the PWM framework.

> > The total maximum number of PWM devices is currently fixed to 64, but
> > can easily be made configurable via Kconfig.
>=20
> GPIO (and IRQ?) have static sized arrays for this kind of purpose too,
> and I'm pretty sure I've seen discussions that this was a mistake, or
> at least something that will hopefully be reworked. pinctrl was similar,
> but it was requested this be reworked, and now I think the pin ID ->
> pin descriptor table is a radix tree.
>=20
> In other words, can you do away with NR_PWM, and make it completely
> dynamic?

IRQ can be configured to use a radix tree if CONFIG_SPARSE_IRQ=3Dy. I guess=
 it
doesn't hurt to always use a radix tree for PWM, so I'll read up on it and
will try to address that in the next version.

Thierry

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7xkA0ACgkQZ+BJyKLjJp8uGwCggPmDIzSKfnTamrp3cKb5DCF0
7nkAnRrvzMmVGarznVLh8kc3PKw0V+xX
=q0Qj
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--

--===============2214835515347853028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2214835515347853028==--
