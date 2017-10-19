From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 3/4] usb: dwc3: of-simple: Add support to get resets for the device
Date: Thu, 19 Oct 2017 14:31:55 +0300
Message-ID: <87shefgyqc.fsf@linux.intel.com>
References: <1500479948-29988-1-git-send-email-p.zabel@pengutronix.de> <1500479948-29988-4-git-send-email-p.zabel@pengutronix.de> <87y3o7h3zu.fsf@linux.intel.com> <1508409939.7665.7.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508409939.7665.7.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
> Hi Felipe,
>
> On Thu, 2017-10-19 at 12:38 +0300, Felipe Balbi wrote:
>> Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
>>=20
>> > From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> >=20
>> > Add support to get a list of resets available for the device.
>> > These resets must be kept de-asserted until the device is
>> > in use.
>> >=20
>> > Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> > Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> > [p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org: switch to hidden reset control array]
>> > Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>=20
>> now this seems like it depends on patch 1/4, right? Is the reset API
>> change going on v4.15?
>
> Thank you for the reminder. Patch 1 has made it into v4.14-rc1, commit
> 17c82e206d2a ("reset: Add APIs to manage array of resets"). The other
> patches could be picked up for v4.15 without any dependency issues.

patch 2 applied fine. patch 3 fails to apply hunk 2.

checking file drivers/usb/dwc3/dwc3-of-simple.c
Hunk #1 succeeded at 28 (offset -1 lines).
Hunk #2 FAILED at 98.
1 out of 5 hunks FAILED


Care to rebase on my testing/next?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlnojSsACgkQzL64meEa
mQYi+hAAwJE9crDu/3CCfSGlAUVCO9kl+hl70O6N9UMlGaJHOvE4ZvP3dFOIy2z/
P+eXtrBLUqNYTT7il9Fay+cADJsTLDAa29e+F1MIBjYy2tU8sz66iFbxCgQaZ2p0
vO+NXMZcHBdPr1s1qez2r2F/mnobSz79963i7Jfpl1ywLmYOj2ubULHyVCuyfnea
2H3EA2mYjngZDqnW6Cfb0DXpMBv1W7sDcD6fYtp7CsPSQoUN6fAcOlvd4l2qhMR/
pPo57UFpj+3/VW5xgIxyi9/oK7TBtpQmwTzVoayjcRXjLTCGP0UpAKrwNnWZRjFH
8WwbkP+Y4o10LzGd8sTSvxPKWbLIsjsFjt4m/rEeXsqaYzeUHofvGms3E6nM5EOg
bvrZvz49/SUk9/IbJy5WU20Ca+n2BDz5diMhjW0yBEmduIkePkJKIZiZoPMwRvde
IDkx+v2DlwE8Oojv2RGu/9kUm3QfmSI7LlnsCQAqBUsdcPy1wpVXdTH3WOuCCyyr
8IjjboXVTG/IPDisUfnGXmTGt3PZBsdPDdu1mipXWDJxCyXeO1N3+55pG4ZueVFq
F1x2ArZzaXXMLPCUQDJBpygfnvvvBWXdOarGr1fVYaAGx6kOR7pNDmydiagA2vWf
9L6vEf01J9pyk9+Dx3GigGG9lCpq9OO/3xQ6NpLSfOlH4HVCpXM=
=Bimx
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
