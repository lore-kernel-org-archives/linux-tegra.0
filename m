From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [GIT PULL] ARM: tegra: DT-related fixes needed by the USB tree
Date: Tue, 28 May 2013 20:47:04 +0300
Message-ID: <20130528174704.GH15794@arwen.pp.htv.fi>
References: <1368831045-19105-1-git-send-email-swarren@wwwdotorg.org>
 <51A4E62D.7020206@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4C6bbPZ6c/S1npyF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51A4E62D.7020206-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--4C6bbPZ6c/S1npyF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2013 at 11:15:25AM -0600, Stephen Warren wrote:
> On 05/17/2013 04:50 PM, Stephen Warren wrote:
> > Felipe, (and Alan, Greg),
> >=20
> > These are the changes from the Tegra tree that need to be merged
> > before the Tegra USB driver patches 4-8 from Venu can be applied. Recall
> > that we had previously agreed on this approach for v3.9, but Venu's
> > patches didn't end up being ready until now, unfortunately. I note
> > that Venu's patches affect both the Tegra USB and PHY drivers.
>=20
> Felipe, do you know when you plan to pull this into the USB tree, and
> apply Venu's patches? Thanks.

got 35 commits testing right now. This pull is in my list for tomorrow.

sorry for the delay, have been on a trip for the last 3 weeks and now
I'm catching up with emails during my vacations (next 2 weeks).

--=20
balbi

--4C6bbPZ6c/S1npyF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRpO2YAAoJEIaOsuA1yqREzNMQAJgAdlo8eOXVgPggcHSj6cTO
2Iq4rScNmxs231pL9tyBtsBr5T179H5KCiqB1KWFMWJYpoirXeEuTvIwaKKYnv2P
ltGlpOi5vWp/gyHBJ4u7wbNZvayYLqkVz/iAr3/cb96YZ2nnsDMPd05i0qSWaMJg
CV5XiTjaXDF7vJIXe3QZFuD3HL2mU+GRKlJMLTvfVGfKZU3pRzo34xibiN83x2Qn
iFMXSreTh4N3K6OpXXvdg8T3P2nrBVivPFfXZi5XSdlwFembiZTh6E8OnUTfRg50
ekBgK8cHIhTROKOlKLQM20CjjLXQ93N2f1pcobmDLMquk0GTVw4A47bkd6iKuIAz
0frrThacbANqhHuNcg2JcbwiiOcDtXcaZQUif3lVAiLoD9WWKaMuWJ5zDucc4d5j
z+3r9o+Hojs9J8jABzEooWhZ/6joAyU2tl5b3nOzhjSshVNeGkMgUv8rxYvO3UFD
kUmdQDOS6MTuE6a46DFCXpIZuNCJn5UBeBVmiFBbRngH1HI+4xh/B5E0I6Mu27Mq
+LiJ+rxx00Nx1FW3w4svjaR3dspEV4+vbrfBWXHUHaLXEIWWw3IEFaN3jjyfyNTu
RD84zwTkJi9UOAkF041Vu4rWMriXc1XzjjBSE0QwE43AiRQfGXKUpukAi8fuS7iB
83yj0+pWryJ3Tx2IcsoR
=VceN
-----END PGP SIGNATURE-----

--4C6bbPZ6c/S1npyF--
