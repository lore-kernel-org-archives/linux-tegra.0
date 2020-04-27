From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Mon, 27 Apr 2020 12:50:29 +0200
Message-ID: <20200427105029.GB3464906@ulmo>
References: <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <20200427084424.GA28817@kunai>
 <820200ce-17f3-18c0-6f79-3e582f45492d@gmail.com>
 <20200427103553.GA24446@kunai>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200427103553.GA24446@kunai>
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Manikanta Maddireddy <mmaddireddy@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 12:35:53PM +0200, Wolfram Sang wrote:
> On Mon, Apr 27, 2020 at 12:07:19PM +0300, Dmitry Osipenko wrote:
> > 27.04.2020 11:44, Wolfram Sang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > >=20
> > >> Wolfram, can you revert the following two patches for v5.7, please?
> > >>
> > >> 	8814044fe0fa i2c: tegra: Synchronize DMA before termination
> >=20
> > This patch has nothing to do with your trouble, why do you want to
> > revert it?
>=20
> I'll wait some more before pushing out, so you can discuss it.

Okay, let me run a quick test with that second patch still applied to
make sure it really is harmless.

Thierry

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6muPUACgkQ3SOs138+
s6HeRA//R1ZgI3RIgFRMumlzLgXjk9E0ydZrGpjmIXD2Yq1hKWN7rDxl77D5X1z+
JemdX2sML4h6JIMiXGercu0mI5SrjO0LHh7L2AYITbdRtfHVjpK4ed96NewY9CNZ
ruYoVRDYIehUwq6jzX6aQmASBXnnrPiztYEMYqV/2SpTVLJDsAFBFcDI4VpaBpgm
Sy/tACPUi1JYn6zn5hu96sFqOEvG6BFRwYFVRqDFG8zNWS25YoogvgnKfbL4Yr+X
CGTw9+1iiMZ7YShdsOj9m/iQaCk8wPI4Nl10KzyEGQlsWDSfce/hcqtG6V0QZqnV
T0z8GdrKY/o6NqX+iHcEWCySq7aTtZQ42rYKU6zu2awHgxle0a/Y4O6uw+A0CIF8
eL3joxZcYWUG1Ns8mthGChimL8CVyioMrz7AoLyhcRv+nN6zHnAKi2ODqBFDe7HN
0UniHlFxJosmw5CE2KtSMzigrcDib6keHaqx7j3riafDORQchOeJh3QxmnhyaO1W
5KnB63lCx/sph1lPjgUuULp3lYQr8yJozcgTq3by5DvmEdnTNRHBo4FVI62uO2YR
KvURjkEhTn2OOcs+X6cRTI+mum3BlGHUGMF4vg0a8LVcYYZ1kH1lhDd9ZuhPZ9I4
CXPot1AVOsY9w//Nm5K4az98xyGkS3UbqL6SNu4psx8tMEFh6KI=
=dg8T
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
