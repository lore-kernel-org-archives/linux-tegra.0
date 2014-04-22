From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2] gpu: host1x: handle the correct # of syncpt regs
Date: Tue, 22 Apr 2014 09:15:27 +0200
Message-ID: <20140422071526.GA11766@ulmo>
References: <1396650665-6992-1-git-send-email-swarren@wwwdotorg.org>
 <534C4ADF.7010607@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0464651804=="
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


--===============0464651804==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline


--ikeVEW9yuYc//A+q
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

Just in case you haven't noticed, this this was merged in v3.15-rc2.
I've also Cc'ed stable so that it can be applied as far back as 3.10
when the code it fixes was introduced.

Thierry

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTVhcOAAoJEN0jrNd/PrOhxzcP/0+bjHYwBpGuH15k6MEHcZZh
/tc1ArpzQ2gUZhVnFK+PhZrf3GWGs73s279a4T1+7S/6hCSIdrduNDr8PxnETsR8
XWG+5EA5dJo++YDXTNP32nmMoPskEsXs7gsfSFsqZaUG4dzTrYnJx87FdxcKsrG7
8x3v+SsS8qqTwr6oYZ+YI38r96BLO7UtN56chKQVUUJ17njJ60jUP4D5HC2LbZWF
AK75vFsjh6JIQokbrRipiFIw5p8wRQZPugSlhD/bjlmNTD2m41qsXLH6JjV/rwVB
uhP7XyZO5wZuRjxcK+ZvyYvLCnDlzjQCZzvzcwGavMfXZypnatiCV8c77NdONfwq
h0T3iU1LUFmnNRwuls4XKNO6T861l9meLgch7hWdcsuiKhCXb7c6Rj4IURGnCeGc
lBodEFFonpHcaZUz0NqouwWOACdqxS6jjOfKZhvkMMfdCGoZV/UlSLYavQ/6Bkpi
Yq1sMDKmaJvpoYvIrP9CwKAc2O48hrLAuOQifHQ7Jgi+57hO8DVIPhJ18FIEacCc
OJ1IhkDc/Ci7IMWlc+X8G3hR6DdI7WW1QnOE6kF4uVb5C9eWbS8PYvuNo2afjcpb
xelTYASX7aMlQC5ez/3bZir5H27FL8xKTv8BqJqdCJdxOcINUlKL83w7VWMxDgcV
Bk9fcw8lZ8UgUBA2WwVr
=232Y
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--

--===============0464651804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0464651804==--
