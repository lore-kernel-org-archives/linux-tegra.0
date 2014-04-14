From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2] gpu: host1x: handle the correct # of syncpt regs
Date: Mon, 14 Apr 2014 23:13:21 +0200
Message-ID: <20140414211319.GC9123@mithrandir>
References: <1396650665-6992-1-git-send-email-swarren@wwwdotorg.org>
 <534C4ADF.7010607@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0675738684=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <534C4ADF.7010607@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0675738684==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2014 at 02:53:51PM -0600, Stephen Warren wrote:
> On 04/04/2014 04:31 PM, Stephen Warren wrote:
> > From: Stephen Warren <swarren@nvidia.com>
> >=20
> > BIT_WORD() truncates rather than rounds, so the loops in
> > syncpt_thresh_isr() and _host1x_intr_disable_all_syncpt_intrs() use <=3D
> > rather than < in an attempt to process the correct number of registers
> > when rounding of the conversion of count of bits to count of words is
> > necessary. However, when rounding isn't necessary because the value is
> > already a multiple of the divisor (as is the case for all values of
> > nb_pts the code actually sees), this causes one too many registers to
> > be processed.
> >=20
> > Solve this by using and explicit DIV_ROUND_UP() call, rather than
> > BIT_WORD(), and comparing with < rather than <=3D.
>=20
> I don't see this in linux-next yet.

I've queued this locally but haven't pushed anything out yet.

Thierry

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTTE9vAAoJEN0jrNd/PrOhSJgP/RxMkA+BOZHKZLwjtXtPcApk
NB/AswZWg49uV+gPos1yB5mgNCl8imvsJ3d+9GRQGTa/DbOX7Rkgu5YdEtGV8zoW
nVnF0N59/EeZPpzQLRU1ogEKsb9PvoHhpaki4MoY4EE6bAlhP9lbr8xunGqKfmIz
7A8hyeGjOWgVYoATna4DPa8b26JNv/+971hdX9dH+/1EXkQ4zmfAA9AfwZCdoB7G
EiC23FbsxqEaVscJJuaB2bJm+SKRTLQReT7HA6qqIV9zBC77Aclnba6Z1b0D9o8r
SHI5IzvadjzFHXCxVXGL/fyAg+YkmTsLfGajxjXzlfSHhLtniclj8a/keT1IXEGd
QkeMgAraNn6XxSn5vxd565zqNGaoDK/MbwiBHFgZametlcOal3OFm9HeMc8gLVaN
uHU+Hx4218SIlmowWSSE8kKlaiq8eCG+LaTMYAyNJpAGUFY4WQJ1if0+J87mHvge
ru8MpV78/mCMs6AVqnkXbOILDwQNpOb7oJASWINbKSQIhx2CK1oCzavvvaJOtvCQ
C8fOpenhhVVGjXTCHBLMncNmEMnidzQlONRogDURxvJbacrd7UR/nAH3tU7wV+P8
KIyqEvFI04SDPiVD2+UEnir2ucc24DaIuPxPpFd4SAmN2OaAr2/PUNXFxrciQhKZ
qBbKDQnym17e9hyXEKpm
=kvLZ
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--

--===============0675738684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0675738684==--
