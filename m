From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: tegra on 3.11
Date: Tue, 3 Dec 2013 11:30:45 +0100
Message-ID: <20131203103043.GI21178@ulmo.nvidia.com>
References: <20130820150418.GI27560@redacted.bos.redhat.com>
 <5213C0F2.9060909@wwwdotorg.org>
 <20130827213445.GI8764@redacted.bos.redhat.com>
 <521D1D7F.7060006@wwwdotorg.org>
 <20130904183815.GC16338@redacted.bos.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WR+jf/RUebEcofwt"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130904183815.GC16338-nxOev/eQj6CGu0OVIAPS5KfLeoKvNuZc@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kyle McMartin <kmcmarti-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--WR+jf/RUebEcofwt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2013 at 02:38:15PM -0400, Kyle McMartin wrote:
> > > [   29.198018] PCI: enabling device 0000:01:00.0 (0140 -> 0143)
> > > [   29.198180] Unhandled fault: imprecise external abort (0x406) at
> > > 0xb6f49000
> > > [   29.205136] Internal error: : 406 [#1] SMP ARM
> > >=20
> > > looks to be the first time we touch the HW in rtl_init_one.
> > >=20
> > > Seen anything similar, or should I start debugging further?
> >=20
> > PCIe isn't expected to work usefully until 3.12, unless you've manually
> > merged in Thierry's Tegra PCIe driver rewrite. It's probably worth
> > disabling it in your .config file.
>=20
> fwiw, the problem was CONFIG_PCIEPORTBUS in our config, I've not had
> a chance to track down what the issue actually is, but that driver
> busted things in 3.11.

I came across another occurrence of this only recently and now stumbled
across this old email. Did you by any chance find out what the issue is
with PCIEPORTBUS?

Thierry

--WR+jf/RUebEcofwt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnbLTAAoJEN0jrNd/PrOh4PQP/3Npbj+KfQdrZdlb9B3nLRIt
RWhxEWw9doQwIDl7vS2KLAVI/ZyO4e22EmIR/+3taggy8Qto39LCbS0vBlj/Fu4n
thRoWxBYGVIVY7XLxeiIRzeMVGhEYDQYGEfWEnenKfaFs1Iw7dSoSZ57ZPqtSOdT
kPqzokNBzqxRNbPxJxWWSah5fcLqp/3vEO1ncrGpeeNXgSenhh7bJHEfxPyPIXNb
Doh6XhvwHKFt6jygvmjGy6qzxsNQXeLZ1QHZKSVsORsasg5LdbSzc2694rI5NjUN
gzEXu27wu+EHh0+L14uOMPyzWQbbXvxai2RCWcNVelWSEGPIpCQQ8And6fW9ZPFX
E9mkmhA07+A8VpTQSHwgJt6JubRwcLOUjyU4VtAjxmkOgH2XYh21csB/LTkYYV02
79TjiCLhzReBMcXeBrU7z364tm1h0NHiAU3qw25/sUjD2qyaYn2R5M5h6Q4nVDIa
RlqLNsXoXqhU9gg22lLCasuFKyVuuG53qkozCE9m6oxxcTenZLyRTSYUAmP+ohWe
1j7GzBl+Vn+28dV0HqBrWv34drQ2TK9NdtAXac/o98IXW7rOK++xCL4/w31SewoD
nrV1IOdTtTgKhCvA170mksjf1FVeXAIWSUHqmoia42Fz8eZZCj9Aaj/AWBCQHgEm
a9AMpMHWGXCDTySEuW4/
=z78O
-----END PGP SIGNATURE-----

--WR+jf/RUebEcofwt--
