From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input driver
 for Tegra210
Date: Wed, 29 Jan 2020 11:09:06 +0100
Message-ID: <20200129100906.GE2479935@ulmo>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
 <3cdea635-a9ca-7b9c-3c99-8f489f4d669a@collabora.com>
 <162488d0-4e74-963a-3366-e4c1f7cf04ca@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BZaMRJmqxGScZ8Mx"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <162488d0-4e74-963a-3366-e4c1f7cf04ca@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Helen Koike <helen.koike@collabora.com>, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--BZaMRJmqxGScZ8Mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 28, 2020 at 02:13:17PM -0800, Sowjanya Komatineni wrote:
> On 1/28/20 1:45 PM, Helen Koike wrote:
[...]
> > On 1/28/20 4:23 PM, Sowjanya Komatineni wrote:
[...]
> > > +const struct tegra_csi_fops csi2_fops = {
> > > +     .hw_init = csi2_hw_init,
> > > +     .csi_start_streaming = csi2_start_streaming,
> > > +     .csi_err_status = csi2_error_status,
> > > +};
> > If I saw correctly, you don't have other instances of struct tegra_csi_fops with different functions.
> > So why not exposing the functions directly instead of creating a global variable?
> Currently driver supports Tegra210 only. Later we will add for Tegra186 and
> Tegra184 support too where we will have separate csi fops.

Perhaps this structure should be prefixed with a tegra210_ to make that
more obvious?

> > > +EXPORT_SYMBOL(csi2_fops);

Also, why do we need to export these? These will be built as linked into
the Tegra VI driver, which is the only one that uses these, right? Would
it not be enough to just make it global? Why the need to export?

Thierry

--BZaMRJmqxGScZ8Mx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4xWb8ACgkQ3SOs138+
s6F1hA/9GY8167sFUVNO8KAreHJSXbIQSrdcxKTgKjZfBglU/9QzkA+r1/DV8uo+
uIqzdDwVcEcJCl8muMVSPCUt0oUSy7NZF/OFwZAVod20aFsse59HO0zogDrekJhC
co8t2A4foXyQiiFV/fxL2tT8jLmojdS8I4wciqiECAw+V5jsyKe8GkoRGVfX6twV
7MW05Bv1FW20Rt0H4lqP9gMolFHS3y/ZpU9rT29Fx9t1EgdKYPzwbjjCYqPGCEvi
NAqLxgqlczodpmMM0BgjTOs/6N0Fp5fnEgjU6focsRXSQbi2vkb2XpN2t08i+Vpn
cvMLJLZhmb4l2sJ71QnhTGmhOpfepPnE5KcHyh5irzLcX4XeDSb+Ldj6DT8pcROd
wbfBXOXnRAxwmTndCvnd+njWKN8I8MzQ3X8QDL18o6NABhNsFWTNQIJ6FZMzBZZU
llMRtRn9AlAKbJs/KAYiH+hPHDea0j/pO9gI4R8QWST+DmdEYl0FcZI6g2DrI0D7
LqcwS4feOIOUHyAAr8wMCHFMWpgK/9Qp9wwXp9u98Xm7j/6FHU8+uDp/AnTdWFD/
obJsoimu7Pmy82cSH7Bm/NL37aIOuDmnmCSansSo4m5wizC0pFejKmR0QCcTHufJ
LEzX36NaAED0ZaGyfgQivPdBbvize02W30xhprd+6noVxmnS57Y=
=cT4U
-----END PGP SIGNATURE-----

--BZaMRJmqxGScZ8Mx--
