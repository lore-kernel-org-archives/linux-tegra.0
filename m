From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC 7/7] pwm-backlight: Add rudimentary device-tree support
Date: Thu, 22 Dec 2011 08:45:05 +0100
Message-ID: <20111222074505.GB21973@avionic-0098.mockup.avionic-design.de>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
 <1324377138-32129-8-git-send-email-thierry.reding@avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF176BE92EBE@HQMAIL01.nvidia.com>
 <20111221093257.GF542@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF176BE9302E@HQMAIL01.nvidia.com>
 <4EF22DCB.10502@firmworks.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8030846339884227577=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EF22DCB.10502-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============8030846339884227577==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Content-Disposition: inline


--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Mitch Bradley wrote:
> To further complicate matters, the relationship between PWM duty
> cycle and perceived brightness is usually nonlinear, so
> equally-spaced duty cycle percentages might not result in the best
> perceived brightness ramp.

Yes, I've seen that on numerous devices as well.

> One useful way to describe a given hardware system would be to have
> properties reporting values that work well for that hardware.  You
> would need to report a good base clock frequency, a good base
> period, and an array of N values that give a good perceived
> brightness ramp.

I'm not sure I quite understand what you mean by base period. Would the
base period not be simply the inverse of the frequency? Or should the base
period be the "step size" to multiply each element of the brightness levels
with?

> The backlight control on my PC laptop has 16 levels, 0 to 15.  That
> seems adequate to me.

I have a laptop that uses 8 level, 0 to 7. Combining that with the above it
should be easy to represent in the DT:

	bl: backlight {
		pwms = <&pwm 0 5000000>;
		base-period = <...>;
		brightness-levels = <...>;
	};

However, that would entail some major modifications to the pwm-backlight
driver to make it compute the actual duty cycle based on the array of
brightness levels.

This also raises a more general question: in a lot of drivers the DT binding
is used to provide an alternative source for platform data. With that
assumption, is it still reasonable to describe data in DT is such a different
way from the platform data? I mean in this particular case, there will be no
way to convert the DT data to the corresponding platform data because there
simply is no correspondence.

Thierry

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7y4AEACgkQZ+BJyKLjJp8DbACeNAYDZRXUFuSi+OAOdiQiNSG0
NyAAmwUX0QjUq1x9v81hmi4XWgMM5Z46
=gNfA
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--

--===============8030846339884227577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8030846339884227577==--
