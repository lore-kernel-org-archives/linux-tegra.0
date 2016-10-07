From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5] PCI: tegra: Add local struct device pointers
Date: Fri, 7 Oct 2016 19:22:43 +0200
Message-ID: <20161007172243.GC10399@ulmo.ba.sec>
References: <20161007162615.23718.84354.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <20161007162640.23718.45313.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161007162640.23718.45313.stgit-1RhO1Y9PlrlHTL0Zs8A6p/gx64E7kk8eUsxypvmhUTTZJqsBc5GL+g@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2016 at 11:26:40AM -0500, Bjorn Helgaas wrote:
> Use a local "struct device *dev" for brevity and consistency with other
> drivers.  No functional change intended.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/pci/host/pci-tegra.c |  221 ++++++++++++++++++++++--------------=
------
>  1 file changed, 114 insertions(+), 107 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJX99niAAoJEN0jrNd/PrOh6vsP/2WPm66HemjNPvf886AUylM5
L4wrR9MMMmxM7jO/lQ8QDRetZbICfAw9J0WgAPmLkpanU5TfxaVeAvYMijiJQdKq
0BVNzQkyLarQXznS1Jl4pBAEs6eNJ+iCAmXWg6CpDsbd+fWAcn2jd2WF31/6NDDU
r57kTvEPzoLPOSEb80y60F1lKXKCjkriZ9rTj0XBaS7M78duk8epOBvxVwCGudCx
8bFiFKxr3x/jd941A7QhvUCAxWdFCB6PTDrXY5evKVq3qSw/u8LY8UELhMIGkU+Q
/zawpO6KLNBRcIvtIDLf2PHl1gfz7ikFtzd52LjTkNP/c11y9Hek30P+C9j7bCcE
c2L0UYdvWx4TigkNZO2jFpsTZzVJFusx5nM+z9VUL+YbMWKODMEJZWWNsrdx1g93
s1vQbIe5Qp7IKyIWfjKQ1hyaDwcCa1SyZnRT2h9UpObzZyR0UpgbrXSSioJ7UjJw
rZlKNcc+7wbSCF247eDjDAqyndEiWqiRBEJA4uub9pQF3Btqy4qMRAHUPwkI5eq2
vOt7Hb9J7Cwv3yppCmu9UmzE66X/i45NHFbiO3ePjlSIGCQDHTiuLlzE3GcGRHw0
dMQNl9iV04sc+RBRMtUmSRrdtJIGj+X1eU5dShN52qrmvL6IbH2reCpYwssWAJWa
NEcg3rvnbO31jUstAcsD
=1NAA
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--
