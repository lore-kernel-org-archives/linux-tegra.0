From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/10] ARM: tegra: Add AS3722 PMIC on Venice2
Date: Fri, 20 Dec 2013 12:14:42 +0100
Message-ID: <20131220111442.GK27787@ulmo.nvidia.com>
References: <1387469182-14398-1-git-send-email-treding@nvidia.com>
 <1387469182-14398-2-git-send-email-treding@nvidia.com>
 <52B3695D.70601@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qDymnuGqqhW10CwH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52B3695D.70601-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qDymnuGqqhW10CwH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2013 at 02:47:09PM -0700, Stephen Warren wrote:
> On 12/19/2013 09:06 AM, Thierry Reding wrote:
> > This also adds the vmmc-supply property to the SDMMC node on Venice2.
> > Otherwise the core will turn the regulator off automatically because it
> > is unused.
>=20
> Note: If I revert Laxman's "" and apply your patches 01/10 and 02/10 in
> its place, then I see the following during boot, and audio playback
> doesn't work any more:
>=20
> > [   14.768649] max98090 0-0010: ASoC: Right Receiver Mixer DAPM update =
failed: -121
> > [   14.776715] max98090 0-0010: ASoC: Left Receiver Mixer DAPM update f=
ailed: -121
> > [   14.784601] max98090 0-0010: ASoC: Right Speaker Mixer DAPM update f=
ailed: -121
> > [   14.792602] max98090 0-0010: ASoC: Left Speaker Mixer DAPM update fa=
iled: -121
> > [   14.800423] max98090 0-0010: ASoC: Right Headphone Mixer DAPM update=
 failed: -121
> > [   14.808655] max98090 0-0010: ASoC: Left Headphone Mixer DAPM update =
failed: -121
> > [   14.817628] max98090 0-0010: ASoC: Right ADC Mixer DAPM update faile=
d: -121
> > [   14.825582] max98090 0-0010: ASoC: Left ADC Mixer DAPM update failed=
: -121

That's odd, I don't those errors in my local tree. When I try to play
back audio I do get this one:

	[  380.093679] max98090 0-0010: No audio clocks configured

But other than that everything seems to work fine. I don't hear anything
on the speakers or the headphones, but I'm likely missing the proper
mixer settings. Can you provide an asound.conf that works for you?

Thierry

--qDymnuGqqhW10CwH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJStCaiAAoJEN0jrNd/PrOhFswQALOFtM/xLXplBzCyG5kkG62r
RRVY3wlVbFnUDhjpGPQ+1CMQnGPLjDUnn6YNQI5GAtYyRTwaTS5BSeXPZW7Cid6w
E90jspPbuQXLl2Q06ErykkMIDBi6iiBoj1E5QWnLfm+xTh8XJdEgBZrPxmbypQYx
e57O0TufxPnVosuUWBhjmF0tBDT6DWFBoYMfelQW8gLN1j2SZ/bGIlLvb0OFGtwj
CtIgJ1AxJYZGrN42g4ieAEM2qjZfjFsc6drOSKpEMH9ROFjDlmVU/BtpzyPnAalx
+SnQNoXPma5hgVzKkPJn2LK1o3Qhpmvv2k7Vnj2a2Vvec1llUkT8HYjRqVa97ok6
PcWTMr0BE+SZZLvNSFg1f/k+sSN0HsUhplMk/R06lzh4lB1irXVxMQIlrQhWLv1j
mAMCBcBo1Xy8/Fc6kqtGd7E6SkhOeEuR0yUvGqA1dbW22h2uqvz+yyrBM6Gj6bj3
UQuFiOIznpnKkRZfVsysubHdLNAxtR0rFj3tbhBH7V87kRJZVYtTHVu6M+6ldmID
5mJF1Ln4rUOfSDkiOO5xadk6/BDk2yimULlCvYBxUw1jGnHDSLeWbqBfxGXmwhjU
9cNk42gC1rLUkoa8ANgSBizpg0JsSa4KVkbCElFPSZUTBFPQ1PL1h7moiA/8PO2O
9/FdA9Krb53Fe3tVrLxY
=GOyw
-----END PGP SIGNATURE-----

--qDymnuGqqhW10CwH--
