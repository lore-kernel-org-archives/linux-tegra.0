From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] mmc: tegra: fix SDR50 tuning override
Date: Mon, 6 Jan 2020 13:07:18 +0100
Message-ID: <20200106120718.GA1955714@ulmo>
References: <245d569e4c258063dbd78bd30c7027638b30f059.1577960737.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <245d569e4c258063dbd78bd30c7027638b30f059.1577960737.git.mirq-linux@rere.qmqm.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Lucas Stach <dev@lynxeye.de>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 02, 2020 at 11:30:50AM +0100, Micha=C5=82 Miros=C5=82aw wrote:
> Commit 7ad2ed1dfcbe inadvertently mixed up a quirk flag's name and
> broke SDR50 tuning override. Use correct NVQUIRK_ name.
>=20
> Fixes: 7ad2ed1dfcbe ("mmc: tegra: enable UHS-I modes")
> Depends-on: 4f6aa3264af4 ("mmc: tegra: Only advertise UHS modes if IO reg=
ulator is present")
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/mmc/host/sdhci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Oh my... good catch!

Reviewed-by: Thierry Reding <treding@nvidia.com>

I also ran this through our internal test system and all tests pass, so
also:

Tested-by: Thierry Reding <treding@nvidia.com>

I'm not sure if that "Depends-on:" tag is anything that's recognized
anywhere. It might be better to turn that into an additional "Fixes:"
line. Adding Greg to see if he has a standard way of dealing with this
kind of dependency.

Greg, what's your preferred way to handle these situations? I think the
intention here was to describe that the original error was introduced by
commit 7ad2ed1dfcbe ("mmc: tegra: enable UHS-I modes"), but then commit
4f6aa3264af4 ("mmc: tegra: Only advertise UHS modes if IO regulator is
present") moved that code around, so this patch here will only be back-
portable until the latter commit, but should be backported until the
former.

I'm not sure it matters in this case because the latter went into v4.5
and the former went into v4.8, so we don't need this in v4.4 and v4.9
should already have all the prerequisites for this. But in general, do
you need anything special to model such dependencies, or is this simply
solved by requiring a manual backport if the fix stops applying cleanly
at some point?

Thierry

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4TIvQACgkQ3SOs138+
s6H+5g//ewD6ClvPl0du1byTOEdWfabrVpphli3s2QOHTcU2hCzVni2FmhanPmJv
JaiCC5Lkpjtyl79nwzkmryZCzinU9bATc3/pVomHbGj1kmsOPONqDL5rmznRq7cC
nUkz+/rSREJs08yloieM3KOXifq6yLXw2UtLsKpGPDQudduOZh3iNXIOHEZRL6xb
yzYfpM5sgD4ODeJMAS4edPwoJdrfN2CAa5YsSJ0ej2L+ksfbzlGInaUB/grckjXM
+nbxnIvVB/CjiOrlc6xgG4itNdlZG/tSMIQGQA5CjUt4/YbZHTOgLsNE1TgDwUk3
cdezxh/j2YFg6Ms5wqKn1K82mRyskGYYoe44IA764h7Fah8Jwgu4wItMZqTCNf9U
52FCbOm4yWPtjS0b7Puoljwgx/GjWqg/uhYuIYk0O6Jt94Ujqfdys2eegHUj+9kn
pfKFo1pScU6JmlPRSRkmDo1w6Lmv3FNaxmVJX3qokmyaKyNSKkJJK17lE0onDPQK
kpuounvO8sgujDNGUfUDtD62YxBfWvaPIdBueOEC82uBwnr80Sfi8d8pGs7WVJOq
TEXCeZgPPaiXe2ijchdsnsh1ttUtwkPnIXtA2N86uMj1ULId+ZDwGhqWBrxi/GJR
W06WwDMgLGzHuREyxe468mydcI8ewAlziiQ26uQKW7MUn1DduJw=
=zL2P
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
