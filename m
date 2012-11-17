From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v4 2/2] ARM: tegra: paz00: enable backlight
Date: Sat, 17 Nov 2012 08:35:34 +0100
Message-ID: <20121117073534.GD26391@avionic-0098.mockup.avionic-design.de>
References: <138e6f406aef20f6257a8f90af45865bd9c88092.1353107865.git.marvin24@gmx.de>
 <4de446eaf895ffa01d397cf70cec02620e16f690.1353107865.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="llIrKcgUOe3dCx0c"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4de446eaf895ffa01d397cf70cec02620e16f690.1353107865.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--llIrKcgUOe3dCx0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 17, 2012 at 12:20:32AM +0100, Marc Dietrich wrote:
[...]
> +				step1 {
> +					type = "gpio";
> +					gpio = <&gpio 4 0>;   /* gpio PA4, en_vdd_pnl  */
> +					value = <1>;
> +				};
> +				step2 {
> +					type = "gpio";
> +					gpio = <&gpio 176 0>; /* gpio PW0, bl_vdd */
> +					value = <1>;
> +				};

These look like regulators, so maybe they should be abstracted as such?

Thierry

--llIrKcgUOe3dCx0c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQpz5GAAoJEN0jrNd/PrOhqWoP/RkdMeJmWbO11qdARVffG5+f
Rgyk1ZMbjEGi9jaxhpOzSqKyyszLLwB7CaPFRtM91SUNP8Mb2VdXW4I6PWU9G4RD
p5cVnzZbVLrkrWFiGyWi8GsvSgf9sKzGlBiwg104qb/RvegNASZf6wSmeVIa+uXv
FsHg7PkMW4gWp607aMwSeRdcSS31YldVVbJZQTKibE92olm+vl1D2GOWl6rbyQOp
paiRKPOseMz6xwlQ4se9QhtDY5XfcCO2EKikgytt5svhfB0RJ+qdjMoRKRwq76vf
L+mYDb7vxAle2YD0KCmIer2ywv/d0KQ011pgL2djPSCkOKAf84r7R/WMNoH/0hbW
8czjxwIK/XpgNNokH2ExigMghDTvJzUII9HRphUKuSlvWX7NS7kgC/FmBOcF6p6D
9phnBAJIjXJfHj6kQbIh5+zyi3DsQ9cFauw59e+9/O1hlaOkrd+z20eFQ8cE5a1M
ehFZPYaFJsVhtAfQJVtTf2kZzVm/wdAYRs/9UuLiBwOHgiuCJDMB2qnRQBwezI+v
lJjnv1pIgZnN61cOeBKNNQE076uZSxLox07Z8jG9LcqGkZKAAlSLkv570VJxudQf
ZAGdBSi/HmCrQP+o4WwngOiXxvnPuq1o6WPv6WtPweMwVYjEt8JmleIBt6SzsKNg
e7TouQtmH4o6uYa7RJoq
=yRYQ
-----END PGP SIGNATURE-----

--llIrKcgUOe3dCx0c--
