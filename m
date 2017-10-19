From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v7 3/4] usb: dwc3: of-simple: Add support to get resets for the device
Date: Thu, 19 Oct 2017 14:30:08 +0300
Message-ID: <87vajbgytb.fsf@linux.intel.com>
References: <1500479948-29988-1-git-send-email-p.zabel@pengutronix.de> <1500479948-29988-4-git-send-email-p.zabel@pengutronix.de> <87y3o7h3zu.fsf@linux.intel.com> <1508409939.7665.7.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508409939.7665.7.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
List-Id: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Philipp Zabel <p.zabel@pengutronix.de> writes:
> Hi Felipe,
>
> On Thu, 2017-10-19 at 12:38 +0300, Felipe Balbi wrote:
>> Philipp Zabel <p.zabel@pengutronix.de> writes:
>>=20
>> > From: Vivek Gautam <vivek.gautam@codeaurora.org>
>> >=20
>> > Add support to get a list of resets available for the device.
>> > These resets must be kept de-asserted until the device is
>> > in use.
>> >=20
>> > Cc: Felipe Balbi <balbi@kernel.org>
>> > Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>> > [p.zabel@pengutronix.de: switch to hidden reset control array]
>> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>>=20
>> now this seems like it depends on patch 1/4, right? Is the reset API
>> change going on v4.15?
>
> Thank you for the reminder. Patch 1 has made it into v4.14-rc1, commit
> 17c82e206d2a ("reset: Add APIs to manage array of resets"). The other
> patches could be picked up for v4.15 without any dependency issues.

Thanks, I'll put other dwc3 patches in my tree :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlnojMAACgkQzL64meEa
mQaYbBAAgk4cpIZHN5EZ2OD8U9GWKyUruTskIsDScpZV/UZnpRrJdfwZO4y3biHH
IKgGNcXFjyZaQVjzsqMUF6qO+1UcghtoiSgjj3SSRWinQL8THUq6sm8/VrJqAUad
Ovog06sKcDJkeY/wYde+xp8PMnWU+LGMgoRMD1yMiL3wNgnABiG8rbcZ2w9zWUyC
ydx6EkeYhLQV5AFytQNSBEcdYE1/WBzTuFYM4B3u3y6cl3EHegXwctbAL7Rb2a1Q
yXisbpfKG73gAIAgoRlTzdAh39Ocz1OoQzNkTZIsg/2vyZedBaVvLMqCCzOEqVPU
7k8DruBcccJLBoSbac5Dhq0F3VcHbWnn1JNFCns7BeyEx6R5pJbCtVF/lz7KGSjI
i9aTCLJvzsiI4IWa16myJSdq/Wr2U4AY4pqS55Jo35PZ2lDs/LInQ2aDn+d/Oog+
sQUBJrUC0oc/TRNERVGLbRe0wMIyE65/UIoL15sQP9PHgqWXw/eDVCNXmLx+zZmJ
0Oe8uvQ8AaiOAO5lqmcaTGrqkgJFVQlriEWjlOIbaJiItlTbgs8oSk3w25Vz968f
8L9yqLpmwFkSEJMjQW4gQkbpVhrBUIkjaJBeUrROvJreYoHUysMfyKb2wPVWOfqI
DNEvU1HWPj5lzr43UpiqCy21d1LXFv9tOrq4Pz4UdKTxXwde/Mc=
=yIxs
-----END PGP SIGNATURE-----
--=-=-=--
