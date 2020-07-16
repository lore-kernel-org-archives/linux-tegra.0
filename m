From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: VDE for tegra124 ?
Date: Thu, 16 Jul 2020 15:04:46 +0200
Message-ID: <20200716130446.GF535268@ulmo>
References: <CABr+WTm79nGMahuudkZtB6nizP8mxwwi6o4r2LUuN8ykoTrONA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9ADF8FXzFeE7X4jE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABr+WTm79nGMahuudkZtB6nizP8mxwwi6o4r2LUuN8ykoTrONA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--9ADF8FXzFeE7X4jE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2020 at 04:20:08PM +0200, Nicolas Chauvet wrote:
> Hi,
>=20
> I'm interested in having at least initial VDE support merged upstream
> for tegra124 (not yet tested).
> I was wondering if merging the dts part and the needed compatible
> along with few fixes (2) would be enough to work with the current
> userspace ? (libvdpau-tegra)
>=20
> I plan to have it tried after 5.18-rc3 land and report.
>=20
> Thanks for your advice.
>=20
> (1) https://github.com/thierryreding/linux/commits/for-4.22/vde
> (2) currently testing patches:
> ae8cd25401f9 ARM: tegra: Enable SMMU for VDE on Tegra124
> 53e4822d773a staging: media: tegra-vde: Keep VDE in reset when unused
> eb5b12a86651 staging: media: tegra-vde: Print out invalid FD
> c28810efcb90 staging: media: tegra-vde: Support BSEV clock and reset
> 55266929b386 staging: media: tegra-vde: Properly mark invalid entries
> 3aae01ea407f ARM: tegra: Add BSEV clock and reset for VDE on Tegra30
> f5e6a834c766 ARM: tegra: Add BSEV clock and reset for VDE on Tegra20
> 615bf7bab259 ARM: tegra: Enable VDE on Tegra124

I don't think those patches are enough to make this work on Tegra124. I
think you basically need all of the patches from that branch, at least
up to the point where the V4L2 conversion starts.

Given that the V4L2 conversion has stalled, it might be worth reviving
this relatively short series once more. I can look into rebasing only
the VDE patches and see if they still work.

Thierry

--9ADF8FXzFeE7X4jE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8QUG4ACgkQ3SOs138+
s6HuZg//RS0OQdrycFOvXOVqLpr1RIVzf6SuFl4Q2L+vGOG7SHRih/fePo1aahjL
oyJKyFWYsP8C+RRN2Lz53zBbdOpk5ibkJeCnHX4xr95qaxEyQD7rNOJEVY02n4vG
AN/TrR1wItgTo0XIVXFKDdyVSaBd+PNZrxKQRzdblbQJd8MYkWIpqk1O05173TT+
mRBR4JnhoQpJuYeVBuY1uJCqkluJISh3JsoFDrT7UcyamFecnE3u0spVZ46cdhlO
i8leAlGhOBY/cjWZHkZimmFzOVeCvMD4K8OoBIIcej+uTLzaJctLc4Gc8vX/qTAo
8tZ5qKAGq+dcWqBQACAMsPPjR7AgtxjszJ5cd06ouv0HH3IjTfwXUTDGUlMgHrnX
413k/tKjQmYYKSzVD1ZUwu3G/6WZyGDECIOZvElHZqdf1RmBT7F+nPcSDQahX6s6
1xdZ2CQlNXv3u44r/gKn7tYmijJb20N3dtY9JnkGN29/6/IuFM3+6zG88w7Fh1oO
GNFH7SvyE4n7WQmEJIuDqNyhNuL0Tpfd2f50S9hxDVPw8sSGyOwQMS0L6tXGeWKt
O1K1qWotjJ7+S8jIj7/gMERvIbQVjZSNBclZsPdSuc7IcHw1sA1rlXsSg5qthg8m
YejRir7fHinM2Ovu2NaZ80ehcIQE6WwbmglJNAGDuamUnTtDCvM=
=Vvaf
-----END PGP SIGNATURE-----

--9ADF8FXzFeE7X4jE--
