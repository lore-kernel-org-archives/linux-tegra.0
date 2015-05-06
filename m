From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: Fix comments for structure definitions
Date: Wed, 6 May 2015 15:40:02 +0200
Message-ID: <20150506134001.GA22098@ulmo.nvidia.com>
References: <1428943097-2768-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1428943097-2768-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2015 at 12:38:17PM -0400, Rhyland Klein wrote:
> Some fields moved from the tegra_clk_pll struct to
> the tegra_pll_params struct. Update the struct comments
> to reflect where the fields really are.
>=20
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/clk/tegra/clk.h |   74 +++++++++++++++++++++++------------------=
------
>  1 file changed, 37 insertions(+), 37 deletions(-)

Applied to the for-4.2/clk branch.

Thanks,
Thierry

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVShmxAAoJEN0jrNd/PrOhHRIQALDpS3y93UDqK/O9PTurUqT7
i/iDh1R/ea0tmG50isnIwBRbeYav3NHEv2DliKEwUd2agQ3px/td4ua13RbznNhM
1/zZ/J161fhGrI65FV38+VPe47QKZh8yVGlCwr74XapUBJ14CzKuuFZaHnVImZla
dobZoWQAjoYQ0AWSx3c8v5o7hytFjOSpTmqd3ymYdLmdWEKtrREtfaGrUx2C0p3W
YK4AO5vUZUs+QntVMUJgjaGzSaFd9bRhB3h60AcSc0iBntMqO0ptkqf8iD2Hmcyc
OidXUJMqQPFZP3tODdTfhp8XnJJHfz7iUE41Rfr1vtZuo0i1i1+8vX9/MhV7iVwm
HhTtdeVUEhKvoohNqINfynDm885ZIX3IuKv1puWCc3HKBA7+1Ht3sB4beWah1mRf
SKHSXpykT3eixfsE9wAlRDX6Kzr//Vlf74VDZJoowUozwTEmGJvIJF5Z1OPIVhDL
A9ds/ZD0rQUs4Bf0PDJ5/h8DAGzVN/7EKz1/Cqz8oq42LozWnaqXBzMKztAAQw6v
eLPOnQRm4qCMAIoI+tXumqDsvc6V8Q+R/kKILyTOirDb+hp9QC4PdrXG9xLa8/x7
SVMh20VoZDpcfJEjvAwVcbr8TH8m1JnvAXxJg5keLCBn+NZdyiUxUj/fXITLf199
LNpwGFRv/slE2Sb5lh72
=OH/4
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
