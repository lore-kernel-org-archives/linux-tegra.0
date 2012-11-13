From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra20 host1x support
Date: Tue, 13 Nov 2012 07:41:36 +0100
Message-ID: <20121113064135.GA31443@avionic-0098.mockup.avionic-design.de>
References: <1352467202-27903-1-git-send-email-thierry.reding@avionic-design.de>
 <1352467202-27903-2-git-send-email-thierry.reding@avionic-design.de>
 <50A0C3BF.90509@nvidia.com>
 <50A1CECA.3090804@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A1CECA.3090804-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 12:38:34PM +0800, Mark Zhang wrote:
> On 11/12/2012 05:39 PM, Mark Zhang wrote:
> > On 11/09/2012 09:20 PM, Thierry Reding wrote:
[...]
> >> @@ -1036,9 +1041,6 @@ static struct clk_duplicate tegra_clk_duplicates=
[] =3D {
> >>         CLK_DUPLICATE("usbd",   "utmip-pad",    NULL),
> >>         CLK_DUPLICATE("usbd",   "tegra-ehci.0", NULL),
> >>         CLK_DUPLICATE("usbd",   "tegra-otg",    NULL),
> >> -       CLK_DUPLICATE("hdmi",   "tegradc.0",    "hdmi"),
> >> -       CLK_DUPLICATE("hdmi",   "tegradc.1",    "hdmi"),
> >> -       CLK_DUPLICATE("host1x", "tegra_grhost", "host1x"),
> >>         CLK_DUPLICATE("2d",     "tegra_grhost", "gr2d"),
> >>         CLK_DUPLICATE("3d",     "tegra_grhost", "gr3d"),
> >>         CLK_DUPLICATE("epp",    "tegra_grhost", "epp"),
> >> @@ -1051,6 +1053,9 @@ static struct clk_duplicate tegra_clk_duplicates=
[] =3D {
> >>         CLK_DUPLICATE("pll_p_out3", "tegra-i2c.1", "fast-clk"),
> >>         CLK_DUPLICATE("pll_p_out3", "tegra-i2c.2", "fast-clk"),
> >>         CLK_DUPLICATE("pll_p_out3", "tegra-i2c.3", "fast-clk"),
> >> +       CLK_DUPLICATE("pll_p", "tegra-dc.0", "parent"),
> >> +       CLK_DUPLICATE("pll_p", "tegra-dc.1", "parent"),
> >> +       CLK_DUPLICATE("pll_d_out0", "tegra-hdmi", "parent"),
> >>  };
>=20
> Why we need this "CLK_DUPLICATE"? Set the clock parent of the dc
> controllers to pll_p?

This was the method proposed by Stephen to abstract away the clock tree
differences between Tegra20 and Tegra30. The way this works is that we
can {devm_,}clk_get(&pdev->dev, "parent") in the display and HDMI
controllers' .probe() and it'll obtain the correct parent clock
independent of which version of Tegra is used.

Thierry

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQoeufAAoJEN0jrNd/PrOh+mYP/16MVLgTLhc+1Mby+Fg10P6W
/R8IJkngnH62m8z09dCBRTzOM1m1AaCmIW9nB2TYCCjQMA4g0Q1aqKwypEkaqItu
TRUDBTrsYakWx3JEtRl+20dzAuW7tVinLsZZXg2d39LOYKm4rHokdD1pmEDRVvvN
DzH+fIMQpyAShew0TYD70ExZM90YKV7uYmpAObenFqDph7YRn0gpVq6VXNWmvi7B
S4ZTCGKUQlBX/dZphIC0cJQASO/xz8tiUMjl5BfNwzfkP9z0ez+w2kDWe2RkiaBH
9IUUCg6iW7rfKIEO4FVrU/M/lxGhIcKEx56UGTjvT9avhB9vL4JZ0BSGoikoXO0e
RnCRvF59ZM+DBFDtJzjZ1qvcGBiyG2vouiYDGueaQW/7nUdShYizYyv1LVj8iUp8
VDksJDRV97uVx8QfhoCEQWs1r3K8aHHmqgIVJICDpBxDVbusYFI3xwygFl0tbcul
Af9CQyTS1bXY/ot+rsKMNOB6tPCrw6xzR9tIddcDnaNuVLaPUOu/k8bvHkMHGnK1
YMFQvGM4ehTb+BYV4pq2CCNoOQfQUA0/9yUKK+rZ78AnHrwc3HwW/Tg8BJa8/pea
Y4Vbe7UZfHpWCKMpfBZKpRKNbpGXj2Ogt9EeKzfogPjFv+JWuFIeIcht72lkBWr6
pp2NNO4hsUTPADGKhyu3
=pKcX
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
