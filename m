From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v5 09/16] pwm: tegra: Add device tree support
Date: Wed, 4 Apr 2012 07:00:54 +0200
Message-ID: <20120404050054.GA30807@avionic-0098.adnet.avionic-design.de>
References: <1332945238-14897-1-git-send-email-thierry.reding@avionic-design.de>
 <1332945238-14897-10-git-send-email-thierry.reding@avionic-design.de>
 <4F7602CD.2010808@wwwdotorg.org>
 <20120402083749.GA6576@avionic-0098.adnet.avionic-design.de>
 <4F79C8D4.2000306@wwwdotorg.org>
 <20120403175511.GA26399@avionic-0098.mockup.avionic-design.de>
 <20120403234249.E292E3E03F3@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120403234249.E292E3E03F3@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Grant Likely wrote:
> On Tue, 3 Apr 2012 19:55:11 +0200, Thierry Reding <thierry.reding@avionic=
-design.de> wrote:
> > * Stephen Warren wrote:
> > > On 04/02/2012 02:37 AM, Thierry Reding wrote:
> > > > * Stephen Warren wrote:
> > > >> On 03/28/2012 08:33 AM, Thierry Reding wrote:
> > > >>> Add auxdata to instantiate the PWFM controller from a device tree,
> > > >>> include the corresponding nodes in the dtsi files for Tegra 20 and
> > > >>> Tegra 30 and add binding documentation.
> > > >>>
> > > >>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > > >>> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> > > >>
> > > >>> diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
> > > >> ...
> > > >>> +#ifdef CONFIG_OF
> > > >>> +static struct of_device_id tegra_pwm_of_match[] =3D {
> > > >>> +	{ .compatible =3D "nvidia,tegra20-pwm" },
> > > >>> +	{ .compatible =3D "nvidia,tegra30-pwm" },
> > > >>
> > > >> Could you swap those two lines, so that tegra30-pwm matches first.=
 It
> > > >> makes no difference at present, but might in the future if the dri=
ver
> > > >> actually has to differentiate the two SoCs.
> > > >=20
> > > > I thought the matching order was determined by the compatible prope=
rty in the
> > > > device tree, not the OF match table of the driver.
> > >=20
> > > At least logically, yes. However, of_match_device() appears to iterate
> > > over each match table entry, checking whether it matches any string in
> > > the compatible flag. Perhaps this could be considered a bug?
> >=20
> > It certainly is counter-intuitive. Maybe Grant or Rob can comment?
>=20
> Yes, it is a bug.  The order of of_device_id should be entirely
> irrelevant, and the order in the DT compatible property should
> determine which match entry is returned.

I've had a look at the code and it looks like a fix will not be entirely
trivial. I think moving out the compatible check out of the while loop in
of_match_node() and separately iterate over all strings in the compatible
property would be the easiest. That will also prioritize the compatible
match over matches by name and type but I think that's exactly what we
want. From a quick look it certainly seems like the large majority of
drivers match by compatible anyway.

Do you want me to prepare a patch or can you take care of it?

Stephen: Can I assume that you're fine with this Tegra PWM patch if such
a change to the matching function is committed?

Thierry

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk971YYACgkQZ+BJyKLjJp8ENQCgruc1DmjFq7WAWzto815Wb0NG
IDQAoJGq63ev6yaM0MckFSjbwikjdWvr
=5qlX
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
