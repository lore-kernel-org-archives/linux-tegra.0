From: David =?iso-8859-1?Q?Lanzend=F6rfer?= <david.lanzendoerfer@o2s.ch>
Subject: Re: Naming convention DSI + device tree
Date: Thu, 16 May 2013 21:50:49 +0200
Message-ID: <20130516195049.GA17092@mail.o2s.ch>
References: <20130514181745.GA2762@mail.o2s.ch>
 <51940C22.4050802@wwwdotorg.org>
 <20130516071537.GA13573@mail.o2s.ch>
 <519522C1.5010107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3561386443356548616=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <519522C1.5010107@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============3561386443356548616==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> No, we haven't yet posted DSI support upstream.
Ok.

> Honestly, I'm not sure. I assume (and it is just an assumption) that
> if you look at the CDF patches, you should find some examples of panel
> drivers that use it, although perhaps there aren't any yet...
Ok. If there's an API already flying around somewhere, which will
be posted to upstream at some point of time, and won't change drastically
anymore I can work with it.=20

> No. That branch of mine is basd on linux-next, so whatever is in
> linux-next is in my branch, and I certainly haven't applied the CDF
> locally.
Ok.

> I believe the CDF has been posted to various mailing lists a few
> times, but it isn't checked in yet since there isn't a final version.
> I CC'd Alex; he might know the status better than me.
Ok. Thank you very much!
The best would be a patchset for CDF against linux-next (which will most
likely be the case anyway) in order to track the changes and post my own
changes upstream as soon as CDF is in next.

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGVOJgACgkQAeZw77btGjpZUQCfQpT7Yo3+9zVfw88idrmd22Xg
x/IAoJjByFx8WrKkwmrHbwNInvp6DLp4
=lUUM
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--


--===============3561386443356548616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3561386443356548616==--
