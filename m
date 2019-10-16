From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 00/17] NVIDIA Tegra20 CPUFreq driver major update
Date: Wed, 16 Oct 2019 16:01:21 +0200
Message-ID: <20191016140121.GA1862769@ulmo>
References: <20191015211618.20758-1-digetx@gmail.com>
 <20191016052716.yipztnpg7bcuzhfn@vireshk-i7>
 <8cf055a3-57fd-c275-9e74-a9fb5d284866@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8cf055a3-57fd-c275-9e74-a9fb5d284866@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2019 at 04:16:27PM +0300, Dmitry Osipenko wrote:
> 16.10.2019 08:27, Viresh Kumar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On 16-10-19, 00:16, Dmitry Osipenko wrote:
> >> Hello,
> >>
> >> This series moves intermediate-clk handling from tegra20-cpufreq into
> >> tegra-clk driver, this allows us to switch to generic cpufreq-dt driver
> >> which brings voltage scaling, per-hardware OPPs and Tegra30 support out
> >> of the box. All boards need to adopt CPU OPPs in their device-trees in
> >> order to get cpufreq support. This series adds OPPs only to selective
> >> boards because there is assumption in a current device-trees that CPU
> >> voltage is set for 1GHz freq and this won't work for those CPUs that
> >> can go over 1GHz and thus require voltage regulators to be set up for
> >> voltage scaling support (CC'ed Marcel for Toradex boards). We could
> >> probably add delete-node for OPPs over 1GHz if there are not actively
> >> maintained boards.
> >=20
> > How do you want to get these patches merged ? Can I just pick the cpufr=
eq bits
> > alone ?
> >=20
>=20
> The cpufreq bits strictly depend on the clk patches and the regulators
> coupler/balancer series. Hence all patches in this series should collect
> acks from relevant maintainers and then Thierry will pick up the
> patchsets in a correct order via tegra tree, at least that's my vision.
>=20
> Thierry, are you okay with that approach?

Works for me. I already have a set of clock patches that I'd like to
merge via the Tegra tree because of a runtime dependency, so it'd be
easy to apply these on top of that.

Thierry

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2nIq8ACgkQ3SOs138+
s6GKPg//XbFKPZrgCH3A4swB3MFOPVjalYqN2cVsMYZH/R73AJYSjqvMPnj44UM1
ecM/LKBu0RC/xZ9C6mU2DDKEbRDDLDSVIrNLhjh9tulMl267gWIqyCE5tqrkVnjy
3S50icwwg+Sxs4mgdnox6ZoPPWiCQrfq4bvv+03OMMZqgXISEKzegvOETGziIhaL
FANIUKkpZ8Kv+9+egwIcjCM32611IfpNAub/KuRpmZghvib1SV/SxgpLZ1hc3jND
ZkpzmUmAuwZbB/sco/f17FlfZ16+cIRE5D0NSlWH1cTt9YHfhuD1Rv/o4C9HLHly
rpXCJC/WHmevNz7RqheqKwXMc8ixqTcWeNoRpKFDiYfscGB0rR73uzmTMlRXdbch
JDD+Xa5BYBZrneP6GfIVHdouiDD3DhPkHoDvXdmyWmnrpZwQG6465b4+TAgEpR/o
uXmaYn4HtjGic6mYpbPUopYCg5awM7u4Of4PQdJLZcDI45UJzlpNVTXMS+pRpbkZ
YHPbcvPDL+jRE9Jnbl/rxHu+KQV/UmmKV5JPIEyoQKSaVkw/cFnXSyqARqaWds56
QJ2vZ7kZ2O08MkWzMamVcVqbdx8U1FX//09377bHHFbWhRsrAMcAX6keNq7hz7ZM
/a2zZszFLhQnisBXpX9RMUW37jiFYFn4rZYFM1feQZ/E+rtvIJ8=
=td2z
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
