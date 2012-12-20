From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM: tegra: # of CPU cores detection w/ & w/o
 HAVE_ARM_SCU
Date: Thu, 20 Dec 2012 20:18:18 +0200
Message-ID: <20121220181818.GA26861@arwen.pp.htv.fi>
References: <1355996654-6579-1-git-send-email-hdoyu@nvidia.com>
 <1355996654-6579-4-git-send-email-hdoyu@nvidia.com>
 <20121220100625.GB24693@arwen.pp.htv.fi>
 <20121220.132136.1599315430686323669.hdoyu@nvidia.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2476010934553930599=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121220.132136.1599315430686323669.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "andrew-g2DYL2Zd6BY@public.gmane.org" <andrew-g2DYL2Zd6BY@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org" <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--===============2476010934553930599==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 20, 2012 at 12:21:36PM +0100, Hiroshi Doyu wrote:
> Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote @ Thu, 20 Dec 2012 11:06:25 +0100:
> ...
> > > @@ -149,7 +154,26 @@ done:
> > >   */
> > >  static void __init tegra_smp_init_cpus(void)
> > >  {
> > > -	unsigned int i, ncores =3D scu_get_core_count(scu_base);
> > > +	unsigned int i, cpu_id, ncores;
> > > +	u32 l2ctlr;
> > > +	phys_addr_t pa;
> > > +
> > > +	cpu_id =3D read_cpuid(CPUID_ID) & CPU_MASK;
> > > +	switch (cpu_id) {
> > > +	case CPU_CORTEX_A15:
> > > +		asm("mrc p15, 1, %0, c9, c0, 2\n" : "=3Dr" (l2ctlr));
> > > +		ncores =3D ((l2ctlr >> 24) & 3) + 1;
> > > +		break;
> > > +	case CPU_CORTEX_A9:
> > > +		/* Get SCU physical base */
> > > +		asm("mrc p15, 4, %0, c15, c0, 0" : "=3Dr" (pa));
> > > +		scu_base =3D IO_ADDRESS(pa);
> > > +		ncores =3D scu_get_core_count(scu_base);
> > > +		break;
> > > +	default:
> > > +		BUG();
> >=20
> > instead of bugging out, how about setting ncores to 1 instead ?
>=20
> Maybe that would be useful in the case of adding new ARM core in the
> future.

right, kernel would at least boot in that case.

--=20
balbi

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ01ZqAAoJEIaOsuA1yqREZoAQAKmi82hURVFWWzf8DVFGy5Gg
talOWJzhA28D0JM5wahDhth1sImiSh0GyZWSH/d3nc0zxXKARs/I5qjL0X0lmb7q
zivcdNZv8eJOqAYTwWTBK9ye6Ld3soELKZuxzGBbD11M0k6K9OEsSS4Rr19OBL9V
ThdKbSRr6gfss6Gv1jq5vxDF13xR3dASgnSaUOzyxu0ZjxfUaNxeJZ9gCcK9lVyH
CQQKVPkLXTu7K/GZ3k4VxBzTlA7bRz5JVHv2GFIpN4+YbFMEKQ0SSa5Cow2d9Fcr
KXLRozZW9t5Hd287HAWKagCfYQEMSow1iu7J3ljZVGIHU+xgIykLxZMx3/rp4+bG
FkabxLtntqwaTp+7QJzN210LmEOToFviztq9D9rTPL9fILEGwsQOlOdEiqB4DFR7
7g2OmZnIhlm8/+R47bRzx0P7sXhBCtuqdwfOhr6C0dBkoXwhGb+MJBAIIsFDTXoG
BqdjcQmu/OFIYepLLy22HsAjNWrkVZxSa5d5rvfF02V4TjJnI//ayEFEdENtlp2w
Wd+/gWRLSolLujoHD+lMkASnQf7+RKBx+k5HSBbQ11rJe/y8mG41G9P1LvUhbKdC
qb9Mdxnu90LUvnpo+aeEbfjrP8eK+rMEf5vPWiA+cCBRf+gInJNrsGcpFsjbh+K1
FILqq+wKz98cKdLyMSio
=LlYW
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--

--===============2476010934553930599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2476010934553930599==--
