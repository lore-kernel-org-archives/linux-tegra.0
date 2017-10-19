From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v7 3/4] usb: dwc3: of-simple: Add support to get resets for the device
Date: Thu, 19 Oct 2017 12:38:13 +0300
Message-ID: <87y3o7h3zu.fsf@linux.intel.com>
References: <1500479948-29988-1-git-send-email-p.zabel@pengutronix.de> <1500479948-29988-4-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500479948-29988-4-git-send-email-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Philipp Zabel <p.zabel@pengutronix.de> writes:

> From: Vivek Gautam <vivek.gautam@codeaurora.org>
>
> Add support to get a list of resets available for the device.
> These resets must be kept de-asserted until the device is
> in use.
>
> Cc: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> [p.zabel@pengutronix.de: switch to hidden reset control array]
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

now this seems like it depends on patch 1/4, right? Is the reset API
change going on v4.15?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlnocoUACgkQzL64meEa
mQarzhAA2OqfjvXqtNKGGCG0piflCXtYv9dZEjQGHBzU910V7FGp/nCilqt3/Vh0
bZpFcw4v8MANM7gm1v58Nb15hSzvvvIkeuhPOkDxAR7QcVoc6AUjkZC5W7CaE3di
djeCfef8xK5+1neygRZ3m+vZbUYE2GzW9C0kvtHJPgCotxfN4RoYXYgkdgmwhca0
YXqZn3U2eN1/OOzMiu+fvXFbU96YU2kXYJILuaxuymYUWwheJyFQWg6C5mJ33X4Q
TfS7itZFXzciDoCbWJG3Kzl2K5/vVtdYHvp3UXLN2l9dohdTAsw2sQ/Q1dofRTqU
6MfqNL/6t7p9e7XUiyjbyJr4SPVQlazdE1ookJ7ily35+LVsIHE4J275kKan7USu
dF9SMxzIq1qkIlBFOODXUSMhezt8vXhM6hCEs7SD34jBDhl6dDjElBKc7/faq1Yz
C0XX7U/clEM+jZwU8Jt+IdPeMecSXEGv+I6wtD0fZWDgeXGD+OwjHZOZr40k86iQ
hNrEfMY4eUHkd9rxV9ws9a62FkJbFggu9lCM5Tpabt7gg+Su90vSyqdiGWnFHF5Q
tzW3Nv/LnXRsZtuKh3GsPcwE5MNJWx9dxVWzuZB38/6CyBuJa8C/OqzhrtdQUtyU
r1R4dQ/RS24h1g25T4LP3gUIetRVV3wyeR589C/hHy8p10ABDZ8=
=PYYY
-----END PGP SIGNATURE-----
--=-=-=--
