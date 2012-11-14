From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] tegra: ventana: display and backlight DT entries
Date: Wed, 14 Nov 2012 07:55:25 +0100
Message-ID: <20121114065525.GA12629@avionic-0098.mockup.avionic-design.de>
References: <1352802204-1740-1-git-send-email-acourbot@nvidia.com>
 <20121113123410.GA11202@avionic-0098.mockup.avionic-design.de>
 <50A2797C.9030807@wwwdotorg.org>
 <1393946.fMW2YXfOao@percival>
 <50A3329D.8000708@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A3329D.8000708-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 14, 2012 at 01:56:45PM +0800, Mark Zhang wrote:
> On 11/14/2012 01:36 PM, Alex Courbot wrote:
> > On Wednesday 14 November 2012 00:46:52 Stephen Warren wrote:
> >> I do tend to think that we should use EDID where there is one.
> >>
> >> 1) If there is an EDID in the panel HW, and the panel's I2C is hooked
> >> up to Tegra, we should read it out at runtime.
> >=20
> > According to Ventana' platform design guide the LCD panel is hooked on =
I2C2.=20
> > The panel's data sheet lists CLK_EDID and DATA_EDID pins, which I assum=
e are=20
> > for I2C, but there is no mention of an I2C address in both guides.
> >=20
>=20
> Normally the address is 0x50. Take a look at function
> "drm_do_probe_ddc_edid" as a reference.
>=20
> >> 2) Otherwise, if the panel's documentation provides an EDID, we should
> >> use that, since it's the most canonical/common/standard representation
> >> of the panel's properties.
> >=20
> > Panel's documentation indeed provides full EDID specification in append=
ix. Mark=20
> > sent me an EDID blob which works but I don't know where it comes from -=
 Mark,=20
> > could you tell us?
> >=20
>=20
> Actually I use a tool named "i2cget" to get this 128 bytes EDID. For
> Ventana, I use a script like this:
>=20
> for i in  $(seq 0 127)
> do
> 	#echo " Reading byte no : $i "
> 	i2cget -y 0 0x50 $i | xxd -r -p >> tegra20-ventana.edid
> done

There is also i2cdump but I suppose for writing the data into a binary
file it isn't as well suited as the above loop. I seem to remember a
tool that could be used to dump EDID directly, but I can't get a fix on
the name.

Anyway, if you can get the EDID data that way it should also be possible
to get it directly within tegra-drm.

Thierry

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQo0BdAAoJEN0jrNd/PrOhOCIQAKg4eu/wQjDRQ8MeTPEyKOiU
2RcNifZpFzXEFzvNBa1K3CQJUV1Xi8prr1fzMLps3YxJiWNCpgJJymqVhtyu/YcP
f1Z0Z/J3bZ9wZitqHgwSHK5OyZ9a2Gza0B/xumfyFvRecUyztCzeDdf9m71hcUDd
el2CpbRk4Stdrkc70CtzO62EnNyD+gfp32+YHnBnLZsqYAfNGNxyhWfCtf1+3n50
9J5h1Da+XCvWK5OPX/FWnjwKn6wv0/thBFde9z/8lT2qd0i5CMdAEJ2TJgz/S8DF
aI8h9Te0s5BA8RsMktfq/E81gmGaEgqsBtZS1ycXCtw0mqv4D+YBk7unMZPDDafs
20Dm5/FGfh+A+qrd9s1blhvBLQ/dv+OJHoQZF0M2NutJ/DH7mm1zXKmDSE/GzXmg
Fs78MrmufNlEYP215nRcSPAhSOTnofi4iU08+jnzWQgNqS0bam6+RAgOQ9gQpqQK
9lXcgj2OZRLdxpQ52Oj2Nzpb8IXh99biyUxsvtXqWVRJv9G0F7fR46d55CNT86mK
UtZRHI2aGHtW2/UQJWIS3Sr3gKPYOwswcoVHNEpIbtvuDGkHj50xN7Y5oyowEIjp
bWMH0lAAVdKjDcwJIvdj35Mq5TcpN/eubI6PQgUA24/wIitJdnQTIqprm7BSOeaD
X5d9D3QNDvSyUiaDKtpM
=afK0
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
