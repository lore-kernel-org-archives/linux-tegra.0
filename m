From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: tegra: Initialize mode
 configuration
Date: Wed, 7 Nov 2018 16:34:09 +0100
Message-ID: <20181107153409.GA7155@ulmo>
References: <20181106162415.3578-1-thierry.reding@gmail.com>
 <20181106164122.GB9144@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0626361970=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181106164122.GB9144-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============0626361970==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 06, 2018 at 06:41:22PM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Tue, Nov 06, 2018 at 05:24:15PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Irrespective of whether or not the device has any usable outputs, the
> > modesetting helpers will try to register all the resources such as CRTCs
> > and planes. Unfortunately, the helpers rely on drm_mode_config_init() to
> > properly set up internal data structures. Since the Tegra GPU does not
> > have a display engine, the Nouveau driver doesn't set this up for Tegra,
> > which results in the following oops on driver probe:
>=20
> Remove DRIVER_MODESET ?

Yeah, that works as well. Technically I suppose somebody could be
instantiating the IP in an SoC and include a display engine, in which
case we'd need the DRIVER_MODESET feature again, but I'm not aware of
anyone doing that, so it may not be worth planning for that at this
point.

Thierry

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvjBe4ACgkQ3SOs138+
s6FzsBAAnAsjVbHuwPwfSSfRahjuWb2zZhdzZ2J0En5vdg7p9nX8YFIOo+0etbyD
azqo/Vhqerl3oDu8uEh1U9sIWgkVO25qvsGSfzFC1M3xIBcBtBUob1oGMxMhZba5
D17D08xN5X9lpQOdau4xKBTznETCpEcXvuzKTXVdKyFby7lumyf5x3jz0jB76fBg
vXMzPYlWZkq4vZb47q8fYj/2w7MX8aJVhDd1nCwKfgP8QUY9TqswYdqPMgjvyyY4
P2Qn/kmsdeQLs7iWFDpAxEY8SLJJS0MhrRXcDs428UNmr330udcF3IXzAVCcxvau
C1pIXpgJVuN7kds3cdLS545THGjwKjnOm7vyVNHumx7mpUsFwjSpawEZC/gZTRLh
izCkwQE/tCz4UkuL9mQjlaq0hRvokoLadJnep5G8+ZVsJripe1ewYSoOTeOdti5H
IIsiS7yIauikROEr0wMKVc1FxHr058dgO0v6MxK4msfJpaQe6rj4eKqgbeDoweC8
GQJJ9txj7OohA8fhUj50a8a0rhoY7nHzLBa3w5URHIJl5DcZrhLzYOC7eia7fFAo
vM+lf4Mjvgx6nTVPsa5b8sTBu19NTelUx1y/QuajxvkPXeCebE6Jgg+2k6n6KW8j
7+cs/6vFIu1LHVVhNatam2IEw1BGbt/GMbdARF5k4tD+nSbBo+U=
=8UXS
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--

--===============0626361970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0626361970==--
