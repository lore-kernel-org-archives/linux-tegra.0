From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: Unstable Kernel behavior on an ARM based board
Date: Tue, 5 Mar 2019 11:32:22 +0100
Message-ID: <20190305103222.GB26369@ulmo>
References: <CA+_ZnZR_aTubOh3PJEVK0hbcDxxfK3vW1eLoknVo1yRBExawsw@mail.gmail.com>
 <20190302115729.zbowssfwf4j7jf22@shell.armlinux.org.uk>
 <CA+_ZnZS48d0OOTQJjktieO-yf09Ch6MRQLFoCjRtUgcXMrjWmg@mail.gmail.com>
 <20190302123907.qoe46qs6qmx7qnjs@shell.armlinux.org.uk>
 <453072a9-52e2-7591-750f-624ca27e0bbf@gmx.net>
 <CA+_ZnZTrGCzPLKWZdxBzV1Z9b+c-Sp27DeUeV2XFW0+ZNZipGw@mail.gmail.com>
 <e530ec49-942d-a993-9081-901c0ce29c75@arm.com>
 <CA+_ZnZTCtghS+oUdXGW+h6SVD6nMPfsyDAvOwEugrhx6NJ3yFg@mail.gmail.com>
 <20190304142546.GB24676@ulmo>
 <CA+_ZnZQRV_7ytmbQZvWZUuyYiai0+Yo-pqV19RKebWAwSQokxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0751647037107379463=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CA+_ZnZQRV_7ytmbQZvWZUuyYiai0+Yo-pqV19RKebWAwSQokxQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Embedded Engineer <embed786@gmail.com>
Cc: linux-tegra@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Vladimir Murzin <vladimir.murzin@arm.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0751647037107379463==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2019 at 03:01:35PM +0500, Embedded Engineer wrote:
> On Mon, Mar 4, 2019 at 7:25 PM Thierry Reding <thierry.reding@gmail.com> =
wrote:
> > Perhaps also try to run a recent linux-next just to exclude any issues
> > that may have been part of the 4.8.0-rc7 that you tested.
>=20
> Thierry I have disabled cache as per Andrew's suggestion by calling
> dcache_disable() and icache_disable() just before kernel_entry() in
> u-boot source. I have also build the linux-next kernel and tested by
> booting from microSD card but it is not going upto login console and
> hangs midway. Please have a look at kernel logs in below link:
>=20
> https://pastebin.com/ByuaLxTt

Okay, looks fairly normal so far, except for the corrupted data. That's
definitely not normal and I think we need to fix that first, otherwise
we can't really be certain what's going on later.

One thing besides memory timings in BCT that comes to mind that could be
causing memory corruption are power supplies. Are you sure they're all
correctly configured and enabled as required? It might be worth looking
at all of them and marking them "regulator-always-on" just to make sure
an essential one isn't disabled inadvertently during boot. The
corruption happens long before unused regulators are disabled, so that
doesn't sound like it would be very relevant here. But perhaps best to
check it anyway, just in case.

> P.S: If I replace zImage and DTB of downstream same microSD card, it
> successfully takes me to login console (although it has hanging issues
> as I mentioned in previous posts)

Does the upstream kernel and DTB boot reliably, even if it doesn't get
you to a login prompt? Or does it also behave erratically like the
downstream kernel and DTB that you have?

Thierry

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlx+UDQACgkQ3SOs138+
s6GQDQ//VNF9sD7PgebF+52KUsPNtDIx+S+mHxFR+2+OVFDtzuk9F8EzTDothgkK
9OpEbx5PbSlI2U+eMPyX8E4MwxVNSB4s7rNKuJTpn+SY1qKnyvHZgAo9ylLP4KFU
q2OYRaUCbxlFAIuDe8Ao2DLSgZWe8vLSziVkWOVt7DDSoExcoAhOWy/TmGrq430F
qnvYroJLVyt6+21WXBK/gSqifQyHeJF2RaQqmuBc9waKrnANHJ5rnfSW3V0EzfFV
V9gJL2RpkBjr4ekB6JVmghUJrm6rzzDOukcIxKOaD/ehvHirvOdXXUkXgJLObOoQ
kUVvA16lCkTYjc/rZAW7DypXTCAl318LVrx2kRL3tljGyLMk6JYL1oEU7WVooe0P
auYVCioV53WxFUuV1SLaEBBJ9yikGKbqZVKv6ecDlJoqtLvz63irZx95Kkjds4B1
uTuJbJ5gIDyQv3vZuxCvt7dS+fxGsitHCj7aJVpOcIwnTaN17koj9k43/3E63rmm
vy3w1t7WvgJVRUo6UJ3QVzSQq8Tcy8VDgzNDJqDQGrBdiufrXPN42P4FEvRuzCmY
zBw3F5geeqDQRKx88P2WvKcynLkI4LBukOMyAJtlHRbAg7KJs15e4EqYhopvjrrR
59bbIfYOwanhycNgoFXOGy+lyxA471xfRdjCZvi+geJZbWsiRPw=
=WR3Q
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--


--===============0751647037107379463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0751647037107379463==--
