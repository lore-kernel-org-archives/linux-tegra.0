From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] host1x: MIPI: Preserve the contents of
 MIPI_CAL_CTRL
Date: Thu, 2 Oct 2014 14:17:43 +0200
Message-ID: <20141002121742.GB13906@ulmo>
References: <1410360725-4286-1-git-send-email-seanpaul@chromium.org>
 <1410360725-4286-3-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410360725-4286-3-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2014 at 10:52:03AM -0400, Sean Paul wrote:
> By paving the CTRL reg value, the current code changes
> MIPI_CAL_PRESCALE ("Auto-cal calibration step prescale")
> from 1us to 0.1us (val=3D0). In the description for phy's noise
> filter (MIPI_CAL_NOISE_FLT), the TRM states that if the value
> of the prescale is 0 (or 0.1us), the filter should be set
> between 2-5. However, the current code sets it to 0.
>=20
> For now, let's keep the prescale and filter values as-is, which
> is most likely the power-on-reset values of 0x2 and 0xa, respectively.
>=20
> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes in v2:
> 	- Improved the commit description

Applied, thanks. I did reformat the commit description to take advantage
of the full 72 columns.

Thierry

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJULUJmAAoJEN0jrNd/PrOhDsoP/RuI5liRwhZdVV8Pt5/h5+FS
Mn1fqkUgCidnkY3SkavpEtHBQ9B3m4c5m1vuGa6iQqe0+DbUBeYYaNpIy+1sr9Yc
FbJ+JYq/UGM7Kx8j5UJcZ37kWo0x4U/GgPX80aRbHBk5fT3KzK+BObUjEvH+oYJw
mQPfEuCUc08Cz3M26VSoziV4uqsu4xAm8Xkw06YA9k+N8ms0+qq93s2l8PafkESR
9su6tPbh/nt6lnkxnR9fVP0Y+rUP80eXjbaaCJJcJqyQbpdYV9+ujo5suq/bQkxn
k6xailIspWMOZ8gWPCQ4a++elH3VtnLXQGAuJZ3oDeslbGe9Opt+9KdycaXJqucI
m5DaLU5owOIaqVHWEkW29h1qlPVrhl2+2AWHM32z4Ou3pgsmkcvafaj/drduKNL8
nUUaKyIHMXEFn8AM8KZOGbahQ+pKZlK2WTckgqaKmAF1rlTqTfy5Slttn426/pTb
7ecu1QraVe88oiriMj8KvhZV4+WTSDGlHx3P8d47z0w9rjKIy6I/3QxDgy1QPbR4
8itDyxhe+QaA+wc5GWMq/hTt668rfj9NdY5GjfyrtJKpDdZW0skKbFfC9fISBGh0
kYhdsvKYislolXG+EdP6AirZRZcITGaJIa4x2cpb1Q1q/GuqCnplNsW+D45VYrb7
AoHGgJKEsEN9AMSMvCBR
=gZ74
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--
