From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 10/12] PCI: tegra: Add SW fixup for RAW violations
Date: Thu, 14 Dec 2017 17:00:47 +0100
Message-ID: <20171214160047.GK13733@ulmo>
References: <1509371843-22931-1-git-send-email-mmaddireddy@nvidia.com>
 <1509371843-22931-11-git-send-email-mmaddireddy@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BOhpupldhMlYbdva"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1509371843-22931-11-git-send-email-mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--BOhpupldhMlYbdva
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2017 at 07:27:21PM +0530, Manikanta Maddireddy wrote:
> The logic which blocks read requests till AFI gets ACK for all outstanding
> MC writes does not behave correctly when number of outstanding write
> becomes more than 32.
>=20
> SW fixup to prevent this issue is to limit outstanding posted writes and
> tweak updateFC timer threshold.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V3:
> * changed soc parameter name
> V2:
> * no change in this patch
>=20
>  drivers/pci/host/pci-tegra.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--BOhpupldhMlYbdva
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloyoC8ACgkQ3SOs138+
s6EYeA/+KQIkffd4XNOpy3F1b750xtDvI09BFE3LB2g03gbceIPmfMEy8UBNz+Hs
4RjRN/ZwuYMme3WFk3Nv7ntV79f0/4447rBk6mlLOfDAMVLgmR6IRRz4JVAjbyhF
NG2JBqAGvSe31DiuLIaMLeJlbiFGWq5fdC9XAg6ykgtrhPK6+UkuNgUltu4q1ufz
qu6PCOKlTuKpm6MxQcm3gFXRuCS/oHguuEVOyJSBuKrcBMbjnP44ks+nW4yRqHdS
4ERtDCOH6Vc1UbK1x+Hp3Ebi2wQ0I/d5tn7oI++b3obXJzQUtTytFJIuPeAi8xFg
VtunrL7iL4GEbNjO7IYh6NrK0GWaGYy2Q/U/t2/pIR3e/osMAviiIoD8HZiQx4/8
o4ILObyfYoUGaUh08OcCKkrsyCndNckSTAJ5VaJe5VLps6OoislRYXVrW3vZsIHs
ciIipfcgT2DzlBJJZNF0CC+DLyQo6Trll+kZr4Sk8fwxeuigkJbGHhXEsqwB6Cwl
H6YOqnHIzK6Ad56zpVxsrp0muYEfnPJvwjFZhjFDy7zp52A+aDYBno312igVxK+N
PgN9tAf6nNL19DJ3p9Gt9bgjO+kUhkAEE8SCCRYxhFaww9W3M4VdbyB3N+u5qwFO
UoEJrOWkgW6cUbT1TSc3f1Y8nBlOUEzoLFU3ucb2EZ+CHcuDurY=
=z/uE
-----END PGP SIGNATURE-----

--BOhpupldhMlYbdva--
