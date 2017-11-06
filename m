From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 00/12] gpio: Tight IRQ chip integration
Date: Mon, 6 Nov 2017 15:36:27 +0100
Message-ID: <20171106143627.GA16836@ulmo>
References: <20171102174941.3461-1-thierry.reding@gmail.com>
 <CACRpkdZaLtpEfx6C5cqHFMk11TXnHxp-sZ+T38PCf+Jh1B2BjQ@mail.gmail.com>
 <0e96761d-a110-ff25-fa2e-319bedf3d8ac@ti.com>
 <CACRpkda888GdPdH_qkeyA64hukyqxryc1uvHWEab92PR32Xt_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda888GdPdH_qkeyA64hukyqxryc1uvHWEab92PR32Xt_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 06, 2017 at 02:22:22PM +0100, Linus Walleij wrote:
> On Sat, Nov 4, 2017 at 12:50 AM, Grygorii Strashko
> <grygorii.strashko-l0cyMroinI0@public.gmane.org> wrote:
> > On 11/03/2017 05:50 PM, Linus Walleij wrote:
>=20
> >> I guess I will consider queueing them already for v4.15 if
> >> Torvalds churns out another -rc on sunday, I do not
> >> doubt that you will finish it as we have discussed with banks and
> >> all. If v4.14 is released on sunday let's queue this early for v4.16.
> >
> > Can you see my reply?
> > https://lkml.org/lkml/2017/11/3/820
>=20
> Yes so I was considering queueing patches 1-9 with your ACK so
> Thierry can get his patch stack down and focus on the add-on
> stuff at the end of the series.
>=20
> Thierry, does it sound reasonable?

Sure. I'd still like to see Tegra186 support go into 4.15 to unblock a
bunch of things. Like I mentioned in my reply to Grygorii earlier, the
bigger part of the changes can be follow-on patches in my opinion since
they become only relevant as other drivers are converted.

I've been running with some changes proposed by Grygorii applied to my
local tree and can send they can all be squashed into patch 10 to at
least address most of Grygorii's comments. Should I send it as follow-
up or do you want me to resend a v7 of 10-12 with those changes squashed
in?

Thierry

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloAc2gACgkQ3SOs138+
s6EElA//R4z/Zn17qfFFb679Z10/iWrzREjpYnvF2T+Enek8wD85iVHlEXgdkgwI
2C/DYCgcqSP2A547RigqQqiS4Q9bG2DX8JMT8P9s5i49JIr1tV+dICCkmiHpIJLk
S7PGicKoyYPaMVsJwUHJG1u9syBzE2nIWf28Bhqe1rW4RxPJ4Hymjl1BH+j0lTi1
8x80/6g8ap3ca31hYqr+GR3We6Gbu/3hs2OYX/HRwJEkXxCRVQQE/6NNSgmr6ofR
DehzhCMhFJev+ZZArejgj2zRm/UvqB889413hUSDRVCxYA+xQYklhXyBDTWUC78O
vORbAJzS7wXnel9YP1gOGwFp73YFwgWWxOOjX5fGvmXw1p9e0RHMwMr7WxY/BdRx
PtlNyIg3YGPhl0PNTz54ALcs2Im13rxOad2MPkVjVjly8j8FxMbg4j+ViZx8kjIc
/k1tNTc37pNzokwxa0tktBAlmLRFLoq4loLCpzExmEVxb/z41fybHrzTDDUjauE/
1S09SQ6e2iU2JK8zPUWvlK7NjSRWrqgE436B9zr1QNyfRJRI6VtpCcJdCzqyc1R8
DetYZgutY7EF5SHHcDGJFmuGFhtamLJV+W5kMAXuzcDjIhch3RnCI5qlm8uzGSgY
DcRxN6+U5fVto90WLoEjX/Kclnox9Qn6ktf6c9l9jFiQN+oHmWk=
=ZVSo
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
