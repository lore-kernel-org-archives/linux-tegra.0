From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] memory: tegra: Expose supported rates via debugfs
Date: Tue, 19 May 2015 16:36:39 +0200
Message-ID: <20150519143637.GF26748@ulmo.nvidia.com>
References: <1431963330-25708-1-git-send-email-thierry.reding@gmail.com>
 <CAAObsKCo7x4qMdPvBb-dNoN=j7Od-eMCxw9BNoSvDR5mUZXGtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CXFpZVxO6m2Ol4tQ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAObsKCo7x4qMdPvBb-dNoN=j7Od-eMCxw9BNoSvDR5mUZXGtA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--CXFpZVxO6m2Ol4tQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2015 at 02:21:01PM +0200, Tomeu Vizoso wrote:
> On 18 May 2015 at 17:35, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > In order to ease testing, expose the list of supported EMC frequencies
> > via debugfs.
>=20
> Looks good to me, but if this is for automated testing, why not just
> read the timings from the DT? We would be covering more code that way.
>=20
> Reviewed-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

The idea is that by putting this into debugfs we have a single source of
information to use in tests.

Now if in addition to merely testing the frequencies you want to make
sure the driver has a consistent representation of what's in device tree
we could always write another test that reads the device tree nodes and
compares them to the list of supported rates from debugfs.

Thierry

--CXFpZVxO6m2Ol4tQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVW0p1AAoJEN0jrNd/PrOhWGIP/2d1UoVsqB9wCmc+KCYEZ5gv
zFxDFeKWlA+aFoaKoCMy42gzL/BRw8lvXwbyYOpDR6+vgG7QoDEdOkcUlTkJXlEZ
Wf9BnSBQ+VemqFJMDPEDAn+t4sdGVTqtpPeC7rfXiLbzxZrjR1IqLSJUe0iXOst4
jf/ldQHNxfHwbYjuvICy1vrnzjHr5HpuOC7b7R7ERYM+c1fTjRJlJ51ew+x9TR3k
5Fw45QaC6vgH3t6x2beBdCWMMhzVPYgRW/2CCertck1GYcQD3ABUp7tPPpBk4zCt
Ku7AsH6GmRoHfH2aQAAdi4sn5UTeIIq9cluf1JZreJWje3NhyYqN7PJjkEKx9wvI
nPkyRJuOpMrdESZfjJYzSqGYKgm8vXyZbEyFVabuRMfqH1vQ1IMz4O9A2mLxWE+Y
otgJeIRLJGqykKCw+do6vTbOe5vnkMAOKLL0aGxEsl/kHRk4ll11GQVA4rFyyxut
Wd7oO+UpNpkUHt6LSWTp+AVW7Sl+zVLqU1tgkqmfZ/b36mcalDGQ/dBlYJaoq41Y
A5VnltwPsvlb6CV/dVGQeHM4NvurjOmNYnMsp6lF+IGjXi9D1snpRNNiBzDQng2p
bIXT2d2P/IPesUHqWJWuBwJl8+J8q0NMWL8N/Sr0pp4grHQ9pBV2pidq5awQbOIU
RQjKHDROEqpjZjOMrjyU
=kJ4L
-----END PGP SIGNATURE-----

--CXFpZVxO6m2Ol4tQ--
