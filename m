From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4] Tegra: DT: add device tree binding doc for QSPI
Date: Mon, 9 Nov 2015 13:45:47 +0100
Message-ID: <20151109124545.GD23941@ulmo.nvidia.com>
References: <1445898140-3561-1-git-send-email-twarren@nvidia.com>
 <562EB11D.5040706@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="at6+YcpfzWZg/htY"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562EB11D.5040706-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, tomcwarren3959-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--at6+YcpfzWZg/htY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2015 at 05:02:53PM -0600, Stephen Warren wrote:
> On 10/26/2015 04:22 PM, Tom Warren wrote:
> >This patch adds the device tree binding doc for the Tegra
> >QSPI controller on Tegra210.
>=20
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> (I assume if others approve the binding, Thierry will take it through the
> Tegra tree)

Do we have a kernel driver and hardware where this can be tested? I'm
slightly reluctant to merge a binding through the Tegra tree without a
driver that implements it.

Thierry

--at6+YcpfzWZg/htY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWQJV2AAoJEN0jrNd/PrOhSqQP/jd+a4EU6v+/tV5CEjbj2us7
t39LE6fN5ObNmwlpEsoBEAzApaaOu+N7fzDxvVgxMjwRBWQo6fHcubePolQMzx9d
dLkY9bGC7ShSDc3wfhqx3+FgfBgXS4e8k2nzRogmKUh9JkZaYGaShhrRYySPuD0C
WW5CbWoQEQ0lxcwSc9YXqJF/AxEldkaP0bZmxvs+lQjWLDPU+3OTRaEGM6abqhTO
LSgE+lp74EGq7Mll6VCS6VmOiRYPAmbjbu5DzSrG4cNqaUsom3YQ1AzQH7+94x5P
hueQ1fzonBz0KJ60/JYNvpZSXob+bNxYI4BjGdpfxXV/2tzMxeEcR3DmcwWuYwsU
EEtUyDp/VLI3zZenvynO2ZhSh3EoG8sSP8nXOvRnQ7uwWF9tV0bkL8UoCP6JsfMH
ourZ8KTr89TQBez6rZo2Um0RBy8RqTRFclzwJ3cLjNPK/MvVPxx8+bsU3KvPV7R5
SUKuCHh2kYik/ldDYWhoTGHZ2OO4XLb54fE2NbkjgH4raLRqSJIszzRKLWsJoJ3k
neEUWFjM/0TAWHFohxE4/Y5mfFK+0UzQmcLNLlmEFDxHYXpW71xlrUQ5eWbGVKKe
xogOsQHlBnCJiVdRjUfPFDWKh6EqHh1QLgbqsIy7E+IHJhWeBa/Oe1uten3dm/Yx
fbTId+WrxFCzcp5ePaD/
=oMsO
-----END PGP SIGNATURE-----

--at6+YcpfzWZg/htY--
