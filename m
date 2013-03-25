From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/2] ASoC: tegra: add Tegra114 support to the AHUB driver
Date: Mon, 25 Mar 2013 18:32:00 +0000
Message-ID: <20130325183159.GS18316@opensource.wolfsonmicro.com>
References: <1363895802-20484-1-git-send-email-swarren@wwwdotorg.org>
 <20130325155232.GR18316@opensource.wolfsonmicro.com>
 <515078F9.1070800@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZcSDOt7TZFizttpn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <515078F9.1070800-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ZcSDOt7TZFizttpn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 25, 2013 at 10:19:05AM -0600, Stephen Warren wrote:
> On 03/25/2013 09:52 AM, Mark Brown wrote:
> > On Thu, Mar 21, 2013 at 01:56:41PM -0600, Stephen Warren wrote:

> >> +	clocks = <&tegra_car 106>, <&tegra_car 107>, <&tegra_car 30>, +
> >> <&tegra_car 11>, <&tegra_car 18>, <&tegra_car 101>, +
> >> <&tegra_car 102>, <&tegra_car 108>, <&tegra_car 109>, +
> >> <&tegra_car 110>, <&tegra_car 162>; +	clock-names = "d_audio",
> >> "apbif", "i2s0", "i2s1", "i2s2", +		"i2s3", "i2s4", "dam0",
> >> "dam1", "dam2", +		"spdif_in";

> > ...this is exactly what I was worried about with the clock bindings
> > :/

> What's the exact issue here? The length of the list is rather
> determined by the HW, so I don't think there's much one can do about that.

The fact that it's two lists that need to be matched up.

--ZcSDOt7TZFizttpn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRUJgXAAoJELSic+t+oim9RnUP/3lwU0PopjjWG2Y2OYPiThJz
jljVI9/d1CxlbxgxNytwszFwbknd/L6fOTTow/eADzQvLIuvYLp3CB/B2imVWL49
o0TUo3sZuFWXW9oW++17fM83Ut5qyj1aXhhKUzPsOeHCgC2b1k9UgQbLGVX7nMIn
nLnTFBCQhdntiMbNS8oCtgauTsWnftNxt1S1yyX/0j0oDymMzIoFFN0yCz2k2S04
xgj9wXuLLM/YF1C+uUCkup6lAj3u3KYQEXKstVuqv9zXO5Um/QlZdibn8BCzEwTK
qG2NdNiSA4BI8/yCWEHb5wPnrLZjdmQwisVtWLt5fjL2ff45QREBFtAf+4nNvEgL
e/cGMl3UBSk/Ft3l3yF6c/CZoI7LUP0Zw+MO4LeR+5eE8oowetdXveF9cltxW967
8nLL5BkGJTfRpn7D0ITe+dERcy1l/YihN669kmSbfyz4n7+09PJi0ekpJTFuXY4h
+9hqbeI/v2tQalD0FP7Bi7d+FBLl3kDAWj/+CD2POtZ9TKMyBHwNK+spReMnS4J3
Uj5LvwwVJFHTqE5oVU/NnUaXLNn53Wt8LEl/C3P6It23mDus/VvQaK5Z5PGSluiU
o5vg1uvtj/wWyVo6RUxjOk5BgSUHgFZ5djbz1KatrUkZOKlW6LGLLofNZlgwFTFk
vsPeMmZOw6De5/+6AA8o
=cAyq
-----END PGP SIGNATURE-----

--ZcSDOt7TZFizttpn--
