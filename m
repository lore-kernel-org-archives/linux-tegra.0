From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/9] drm/nouveau: Various fixes for GP10B
Date: Mon, 18 Nov 2019 14:44:49 +0100
Message-ID: <20191118134449.GG2246533@ulmo>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1447320490=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20191102175637.3065-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============1447320490==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FwyhczKCDPOVeYh6"
Content-Disposition: inline


--FwyhczKCDPOVeYh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 02, 2019 at 06:56:28PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Hi Ben,
>=20
> here's a revised subset of the patches I had sent out a couple of weeks
> ago. I've reworked the BAR2 accesses in the way that you had suggested,
> which at least for GP10B turned out to be fairly trivial to do. I have
> not looked in detail at this for GV11B yet, but a cursory look showed
> that BAR2 is accessed in more places, so the equivalent for GV11B might
> be a bit more involved.
>=20
> Other than that, not a lot has changed since then. I've added a couple
> of precursory patches to add IOMMU helper dummies for the case where
> IOMMU is disabled (as suggested by Ben Dooks).
>=20
> Joerg, it'd be great if you could give an Acked-by on those two patches
> so that Ben can pick them both up into the Nouveau tree. Alternatively I
> can put them both into a stable branch and send a pull request to both
> of you. Or yet another alternative would be for Joerg to apply them now
> and Ben to wait for v5.5-rc1 until he picks up the rest. All of those
> work for me.

Hi Joerg, Ben,

do you guys have any further comments on this series? I've got an
updated patch to silence the warning that the kbuild robot flagged, so
if there are no other comments I can send a final v3 of the series.

Thierry

--FwyhczKCDPOVeYh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3SoFEACgkQ3SOs138+
s6H1sw//TEml9ZrPUemKFYIMfOWf6dFC1MUTYzGiajNIxv4J/7FqdNnBqUm6RT1o
uROgL3iqP7fAoEHg5hVhwzRzxAH/bC75nfn9PD+yiPpVOwhqfY3OTwYXyEj3wBld
G+2TQb5RTHd1HAv14IKsw33fyTMM/P22GGkcRfOuzhu3Q6U1hJCBc7zG3VQWSSN6
u8bWNlYl0VZ8KcDlQJpYgT6QYOFYmagQGNkCRgeAgDUUKRE7rQ8vVZ6BOjtYv+SY
5nTKNujyFp1Yoagp3pv23OcyIVWPg6BKd48rb/uq+QqcsDwTXwqTUOlAfhZhyIwn
CVBDmqpuQL5BJPopvAzVFP/UKZZ0ChE7kuhAPFIOkCO6RVKpKE+1Zvqgb3QXUU4q
5U7U8hrmwPBRSEhAmTYApzDAx7rqSKIWTm5k82Nm1WfzgyqNb+NubwOwkyRr0u7Y
RobfXOEjbUCV5F6IejMN/pnufJs6CDPRTlz09roZ32kn5u+ibJyV0Nsa9L1sIwFm
yJESD3B8y1BA2NCllBwu6semP74zJ5h90Kp4/xvLX/poS+VcY3Owfs7GeO8bDijl
IwV+qD3RYSlGJmxq2ILPa/fuxxMbIsXLudNeZAtC1zmO28x6aUwYvpyDdgvEEu+P
G9k1PiUNR9g/gbTv78dAmw62CrEQoss84ESlY5A+pbjAgQh0bLg=
=74Sg
-----END PGP SIGNATURE-----

--FwyhczKCDPOVeYh6--

--===============1447320490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1447320490==--
