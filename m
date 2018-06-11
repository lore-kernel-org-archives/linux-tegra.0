From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 5/5] memory: tegra: Introduce Tegra20 EMC driver
Date: Mon, 11 Jun 2018 13:41:33 +0200
Message-ID: <20180611114133.GD31977@ulmo>
References: <20180603223654.23324-1-digetx@gmail.com>
 <20180603223654.23324-6-digetx@gmail.com>
 <20180606110258.GL11810@ulmo>
 <c17a1edf-f87d-e5f6-b446-34505a2bbc07@gmail.com>
 <20180611113503.GC31977@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hxkXGo8AKqTJ+9QI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180611113503.GC31977@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 11, 2018 at 01:35:03PM +0200, Thierry Reding wrote:
> On Wed, Jun 06, 2018 at 04:42:01PM +0300, Dmitry Osipenko wrote:
> > On 06.06.2018 14:02, Thierry Reding wrote:
> > > On Mon, Jun 04, 2018 at 01:36:54AM +0300, Dmitry Osipenko wrote:
[...]
> > >> +	if (!child_count) {
> > >> +		dev_err(emc->dev, "no memory timings in DT node\n");
> > >> +		return -ENOENT;
> > >> +	}
> > >> +
> > >> +	emc->timings =3D devm_kcalloc(emc->dev, child_count, sizeof(*timin=
g),
> > >> +				    GFP_KERNEL);
> > >> +	if (!emc->timings)
> > >> +		return -ENOMEM;
> > >> +
> > >> +	emc->num_timings =3D child_count;
> > >> +	timing =3D emc->timings;
> > >> +
> > >> +	for_each_child_of_node(node, child) {
> > >> +		err =3D load_one_timing_from_dt(emc, timing++, child);
> > >> +		if (err) {
> > >> +			of_node_put(child);
> > >> +			return err;
> > >> +		}
> > >> +	}
> > >> +
> > >> +	sort(emc->timings, emc->num_timings, sizeof(*timing), cmp_timings,
> > >> +	     NULL);
> > >> +
> > >> +	return 0;
> > >> +}
> > >> +
> > >> +static struct device_node *
> > >> +tegra_emc_find_node_by_ram_code(struct tegra_emc *emc, u32 ram_code)
> > >> +{
> > >> +	struct device_node *np;
> > >> +	int err;
> > >> +
> > >> +	for_each_child_of_node(emc->dev->of_node, np) {
> > >> +		u32 value;
> > >> +
> > >> +		err =3D of_property_read_u32(np, "nvidia,ram-code", &value);
> > >> +		if (err || value !=3D ram_code)
> > >> +			continue;
> > >> +
> > >> +		return np;
> > >> +	}
> > >> +
> > >> +	dev_info(emc->dev, "no memory timings for RAM code %u found in DT\=
n",
> > >> +		 ram_code);
> > >=20
> > > This seems like it should be dev_warn() or perhaps even dev_err() giv=
en
> > > that the result of it is the driver failing to probe. dev_info() may =
go
> > > unnoticed.
> > >=20
> >=20
> > Absence of memory timings is a valid case, hence dev_info() suit well h=
ere.
> >=20
> > I can't see anything wrong with returning a errno if driver has nothing=
 to do
> > and prefer to keep it because in that case managed resources would be f=
ree'd by
> > the driver core, though returning '0' also would work.
>=20
> I disagree. A driver failing to probe will show up as a kernel log entry
> and is something that people will have to whitelist if they're filtering
> for error messages in the boot log.
>=20
> I think it's more user-friendly to just let the driver succeed the probe
> in an expected case, even if that means there's really nothing to do. If
> you're really concerned about the managed resources staying around, I
> think you could probably get rid of them explicitly. By the looks of it
> devres_release_all() isn't an exported symbol, so it can't be called
> from driver code, but perhaps that's something that we can change.

Maybe an easier way to avoid keeping the managed resources around would
be to move the check a little further up. That way, we can abort earlier
if no EMC timings are available, before any resources are even
allocated.

The tegra_emc_find_node_by_ram_code() function would need to take a
struct device * instead of struct tegra_emc *, but otherwise it should
work fine.

Thierry

--hxkXGo8AKqTJ+9QI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlseX+0ACgkQ3SOs138+
s6FkahAAwxC0A5qAl1JqwFoKzCRt6HubfHuyf5m0f60RrW+fXg/3Z4nfSBnEcS0D
uni1OKg+5jfh4Wfg5PyEhfcXa1haxAOgQj6FvrIPiPdIPRV8WfAjpwh2OPejPKwd
GyA59x5k9ieGZ8ekOw2ynWgjBoel8Ckv0uEqDFfX4ZGJkMSyIge/eb4dQUQnsYjj
aYCf14NOH5SLWzcboLvHI+Hu9/yB14B6uqMiQjZCdxrpP6Uq7MD333OKout+4UGZ
lRzpqLosD5J4fTcvsx2TX6WXLK2lYSmd/RJBOvyb+ZVjdGeIal7csRTZksLzCuqP
5A5QJTgbHIpegR21xxyOUKLb5BjJdaCsxW/3cfeqt3I59sA/V//Qw69TsVl7FYxJ
rD3QdcFFGObKfmopnj6Hjk7ldA5C0cgoGiKLF0QuCDYXZ25wMkygLwu0BpltuCWU
PsQWhgrx9rPbALqIE7e9JystHjvzHxQOvRwaLzNhgrGxULXdayeUOfvzZF2WvTMW
5q4Bq9ck7/JN6OU3U35TN9pe85SDNt85B4IxJUaCvL3vKyrM13a5l5DQsgjxhqc5
woQUz+rnbeJP9LWt2Re7aIhHVUUq00Lo3lNK2/M75YCFBqO4Fw5cfu23E8FiEl2s
qm4kIRwbMsR689omAi1EtM9gtd0XfmLIZ3mv/BDttqAnb19CRkk=
=68ft
-----END PGP SIGNATURE-----

--hxkXGo8AKqTJ+9QI--
