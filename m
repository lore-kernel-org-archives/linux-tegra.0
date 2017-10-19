From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v7 2/4] usb: dwc3: of-simple: Re-order resource handling in remove
Date: Thu, 19 Oct 2017 12:36:40 +0300
Message-ID: <871slziimv.fsf@linux.intel.com>
References: <1500479948-29988-1-git-send-email-p.zabel@pengutronix.de> <1500479948-29988-3-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500479948-29988-3-git-send-email-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
List-Id: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Philipp Zabel <p.zabel@pengutronix.de> writes:
> From: Vivek Gautam <vivek.gautam@codeaurora.org>
>
> Move clock handling after of_platform_depopulate to achieve
> a sequence that is reverse of the probe sequence.
>
> Cc: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>

does this depend on the rest of the series? Doesn't seem like it does.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlnocigACgkQzL64meEa
mQbtMA/7BWWUjmO3/mjWBkMJ3X7UYhlV8+stKywuSJhyBJLv1SHp59iJdb+MqcQN
iMt7+fAPAiDy1HsfS+/G2k4N31FAQfKwdPXREOrv5chwlDlGXnKyZ6kRn/RUrzu6
INvypVS9o7wdymVO9JlvhttGpoeb1UXjHhvjyQhfRFjrrzOtXaW9ref7z9gX2eb1
/SM5enlUnHlEjyqGrwrmvjZSWXM0Tpw2LnvYMLV4rg0SFcMrz/eontKyTYuhfmuw
kiIa8KfUQ7pEOqfT/gZ9VsFbvBrGOG1nVqu4MyRG2gRHuK5asZBHKnSNsJwcQL69
j79IpThGRnoBX3jwFdOsPsh7EtZcDY7WXT7QitURK615OSwGYGmUUvbLDDBIkuZW
KOkVyWVFUFznVgKQAHwnoWoLFl/h2d7jz2CzanQ9rye7vtVlPzq+SP/mwY97HS5i
/aXoXk/Nf1WOkFv+3AkoQFOc1XaEdWVdmygj8sXpuvXuvyahJVF8RnR+SG2Ie5HF
wJlOa2fCxYv9iR8kR71pZh7amOcI/k42L3rWISY1yTwnH/DvLzef0Zm/ZqmGW3/W
oJbeNYSXlv1VbjWmTvyIQIT09Q5qJpkiu2h7b91xDokvmw/GicEbgSRC7vM9p3JF
PJgm5N8h9Ip7psnffDGMj3XnN3Kns5nWhUrbDnwaymI45ez21cc=
=b1Tq
-----END PGP SIGNATURE-----
--=-=-=--
