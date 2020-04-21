From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH v8 0/9] Add Tegra driver for video capture
Date: Tue, 21 Apr 2020 22:50:32 +0200
Message-ID: <20200421205032.GD3233341@ulmo>
References: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
 <5c44beca-4016-6e4f-01bb-e38480bfc34b@xs4all.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mSxgbZZZvrAyzONB"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5c44beca-4016-6e4f-01bb-e38480bfc34b@xs4all.nl>
Sender: linux-clk-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi, helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--mSxgbZZZvrAyzONB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2020 at 01:09:50PM +0200, Hans Verkuil wrote:
> Hi Sowjanya,
>=20
> On 21/04/2020 02:11, Sowjanya Komatineni wrote:
> > This series adds Tegra210 VI and CSI driver for built-in test pattern
> > generator (TPG) capture.
> >=20
> > Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
> > CSI port is one-to-one mapped to VI channel for video capture.
> >=20
> > This series has TPG support only where it creates hard media links
> > between CSI subdevice and VI video device without device graphs.
> >=20
> > v4l2-compliance results are available below the patch diff.
>=20
> I'm ready to merge this v8. Looking at the series I should only merge
> patches 6 and 7, all other patches go through different subsystems, right?

You could also pick up patch 5 because it adds the bindings that are
implemented by the driver in patch 6. But I can also pick that up into
the Tegra tree. In fact, I do have a set of patches to convert some
Tegra bindings to the new json-schema format and the host1x file is
among them. If I do get around to finish those up for v5.8 it might be
better for me to pick up patch 5 so that I can base my conversion patch
on top of that.

Either way is fine with me, so I've acked the three patches. Take which
ones you want and I'll pick up the rest.

Thanks again for your guidance on this patch set!

Thierry

--mSxgbZZZvrAyzONB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6fXJcACgkQ3SOs138+
s6FBjg/9FimcqXOseP9+byIOz8utrw/aQW03bxfp+khGtSfVES8b9+2uyWnlc+IM
qW2Kc56/5wDuBs2nXSxzJAadqov9o5381zJiiacxwuW84/SHA2csj5UVz8ymb/Uw
/Sfmk6RDZUb6y+TK4SWzWpwJmsvElhnxAidTh1Q2yDs7nyvqmBC1itkZOLHXibRL
u5/V7VVeIpEiqIoluxlj5pS9o54KJRNZwDknrXbzkgEzOnYMH9cuGpMsqwdUbFAb
74dKbjgYMzKcdlf8jz0oo1MBYisCemp760JQnWeI/Grp26xgDPCwU9nmPaapmpMP
+yAYWCg6Nj51sdwiU1/EsTDVXlP3tUjGB2l5IxkepGKGyc7KydbX9+WUXD7b8m/P
39Olhf1/jswjtwBPgitwSEX66ZheWbNwIykJo6RiRnu9F1Vnc8aJPbnJMuxqERix
TqCN2cIKWPJNr9TGOnuHfADbsCNWUpFBIaRxgqM1hTmSYeoMTwgYRCDLkVbK6q58
LTdMKeYu3iS4QpW0VwQ1JBZwzM8EezsUO63THUXKn+HUj0SiLpTE+5S7OmQvYf1K
Yo2liZF7SC45LCPFY1UvlbU3/1k6QpDMLIF923iGBRk6NebcHrIqBaJTjaum08uq
M/tFejv+n6cXergSPcHXgy4/oPyzEUrCJEt/ZfjLuldZuV2ZeKw=
=qERF
-----END PGP SIGNATURE-----

--mSxgbZZZvrAyzONB--
