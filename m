From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra210: Fix default rates for HDA clocks
Date: Wed, 5 Jun 2019 14:38:30 +0200
Message-ID: <20190605123830.GA1012@ulmo>
References: <1559121501-8566-1-git-send-email-jonathanh@nvidia.com>
 <20190529134625.GD17223@ulmo>
 <5f2b8f8d-f3e5-fab8-8cf0-fa8a3e917845@nvidia.com>
 <f2757c84-363c-cef0-db9d-c4e4423200b5@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f2757c84-363c-cef0-db9d-c4e4423200b5@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 12:30:31PM +0100, Jon Hunter wrote:
>=20
> On 31/05/2019 15:58, Jon Hunter wrote:
> >=20
> > On 29/05/2019 14:46, Thierry Reding wrote:
> >> On Wed, May 29, 2019 at 10:18:21AM +0100, Jon Hunter wrote:
> >>> Currently the default clock rates for the HDA and HDA2CODEC_2X clocks
> >>> are both 19.2MHz. However, the default rates for these clocks should
> >>> actually be 51MHz and 48MHz, respectively. Correct the default clock
> >>> rates for these clocks by specifying them in the clock init table for
> >>> Tegra210.
> >>>
> >>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >>> ---
> >>>  drivers/clk/tegra/clk-tegra210.c | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>
> >> Does this fix anything? Should this be backported to stable releases?
> >=20
> > Good point. We are aligning the clock configuration with what we ship.
> > So I thought for completeness it would be good to test HDA playback
> > across the various sample-rates we support (32kHz to 192kHz) but with or
> > without this patch I am not hearing anything. Let me check on this with
> > Sameer as I would like to see if we need to mark this for stable or not.
> >=20
> >> Acked-by: Thierry Reding <treding@nvidia.com>
>=20
> I have confirmed that this does fix HDA playback on Tegra210. Without
> this fix, I am seeing the following messages during playback and
> playback is distorted ...
>=20
> Write error: -32,Broken pipe
> [   15.069335] tegra-mc 70019000.memory-controller: hdar: read
> @0x0000000000000000: EMEM address decode error (EMEM decode error)
> Write error: -32,Broken pipe
> [   15.465362] tegra-mc 70019000.memory-controller: hdar: read
> @0x0000000000000000: EMEM address decode error (EMEM decode error)
> Write error: -32,Broken pipe
> [   15.858615] tegra-mc 70019000.memory-controller: hdar: read
> @0x0000000000000000: EMEM address decode error (EMEM decode error)
> W
>=20
> Do you want me to update the change and resend?

Honestly I'm not sure if it's worth it. I haven't seen any bug reports
for this and we haven't had audio over HDMI support for very long, so a
backport may not be necessary.

I guess there'd be some use to backport this so that our stable kernel
testing passes these. So it's really up to you. I have a slight tendency
towards backporting, because it's really tiny and then we just have it
out of the way and it's not going to haunt us.

Thierry

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz3t8YACgkQ3SOs138+
s6HDVw//fVw0ZwJVA8M4iHuRpPgj6iIfoP9raM5gEG0eUfa6FEr3iDtfOIW+rB7G
GQqEtIR/l6GaPKrRWQX/0AwTOKb3uIoVxACSye7jh/M4o8A4ml8faPvQGpx97Oe3
3hq6aEaU3lwTCOv4hJy3QWXAYqNJAyEFv9puOm0iiNuTODVNHO4dlAg8SYZQMzG+
FqBPH08pEZaQ0sRktNX00wcWrrLPEnRJwHZr0yWfnajdeWJAhNtrU5d5vD5ffUsn
sdu5PnEOxZdpuzqPFdwZDYAmj5i+D7cw1aLF9vN+Vzuju4dxtVgb+0uWSD4osmyy
l8TDbLrVNx2IRqMe6EaMl8tg5ZCubNtVbA/cuo+XdBGjNBzXQVTPK/sni/Tt/g3K
+gl5cyOcCdGDjNyER6Ve2g1hmnBld4mkKrH1A20IDlIhO1WTa3Eej0eWpfJzpIvR
nS0Zds+7tNDsjDlSjlBFSxmgzUtmhtQdJ7M4ymdXZNt5BVcQGBK4fteewDYZgf2T
23+LpkKudJxWPVTLc60Bzu+EYUOOyrdOMoITAKWmzw5k0ZaLwSpmgcrvPi+xGrgk
THaYxb8LgJENFvOZQF7MFepAGRfaeknYptfUKV2Qw/+Rrjjyg2ZqIbT86bBq5obj
izICkwk+/IWwz0efRc0kMYu6+S9Tpfr5rewS7hB2uzg+EM8AMqQ=
=AXlW
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
