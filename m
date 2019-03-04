From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: Unstable Kernel behavior on an ARM based board
Date: Mon, 4 Mar 2019 15:25:46 +0100
Message-ID: <20190304142546.GB24676@ulmo>
References: <CA+_ZnZTpES5bGZ0Cprnpy7HapMP3i=VTHgMZco6jq2zcKQzAVg@mail.gmail.com>
 <20190302113651.zerdonykcvv5ex3e@shell.armlinux.org.uk>
 <CA+_ZnZR_aTubOh3PJEVK0hbcDxxfK3vW1eLoknVo1yRBExawsw@mail.gmail.com>
 <20190302115729.zbowssfwf4j7jf22@shell.armlinux.org.uk>
 <CA+_ZnZS48d0OOTQJjktieO-yf09Ch6MRQLFoCjRtUgcXMrjWmg@mail.gmail.com>
 <20190302123907.qoe46qs6qmx7qnjs@shell.armlinux.org.uk>
 <453072a9-52e2-7591-750f-624ca27e0bbf@gmx.net>
 <CA+_ZnZTrGCzPLKWZdxBzV1Z9b+c-Sp27DeUeV2XFW0+ZNZipGw@mail.gmail.com>
 <e530ec49-942d-a993-9081-901c0ce29c75@arm.com>
 <CA+_ZnZTCtghS+oUdXGW+h6SVD6nMPfsyDAvOwEugrhx6NJ3yFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6044456638626528228=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CA+_ZnZTCtghS+oUdXGW+h6SVD6nMPfsyDAvOwEugrhx6NJ3yFg@mail.gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============6044456638626528228==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline


--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2019 at 05:25:28PM +0500, Embedded Engineer wrote:
> On Mon, Mar 4, 2019 at 3:26 PM Vladimir Murzin <vladimir.murzin@arm.com> =
wrote:
> >
> > You can try in-kernel memtest:
> >
> > - CONFIG_MEMTEST=3Dy
> > - pass memtest in kernel's command line
> >
>=20
> Thanks Vladimir, I tried running mtest as suggested by Clemens in
> u-boot and memtest in kernel as suggested by you. Both tests didn't
> show any errors, however the board sometime hangs at "Starting kernel
> ...". Following logs were obtained when it booted but ended in a
> crash:
>=20
> https://pastebin.com/sZZjUcbh

Other than the memory corruption issue this looks like a fairly regular
boot. It's not clear whether the crash of your /sbin/init is related to
any memory issues. The earlier boot log that you had posted showed that
it was failing to mount the root filesystem and dropped you to a
maintenance shell, so that could be an indication that something isn't
right about the root filesystem. Or it could indicate that something is
wrong when loading files from the root filesystem.

The earlier log showed EMEM address decode errors, which are odd because
the addresses clearly lie in regions that should be system memory. EMEM
address decode usually only happens if the memory controller thinks you
are trying to access memory outside of system memory.

The good news is that I think you're pretty close. The memory corruption
is somewhat worrying, but at the same time it's unlikely that you'd get
as far as you do if your memory timings are completely off. However, I
think we need to gather more information to narrow down what's going
wrong.

All of the memory related configuration is part of a file called the
BCT. I think if you could provide that it would be very useful to have.
Also, it looks like you're using the Jetson TK1 device tree to boot, so
can I assume you haven't modified it at all?

Other bits of information that would be good to know are how you are
generating the BCT and your boot images, what exactly you do to flash
the board and which release of L4T you use.

Perhaps also try to run a recent linux-next just to exclude any issues
that may have been part of the 4.8.0-rc7 that you tested.

Also adding Jon and linux-tegra for a broader audience.

Thanks,
Thierry

--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlx9NWcACgkQ3SOs138+
s6GofA//doOYFzTD0CyBiYRTvwMCRFPDoVeepK8xLxdE45UjgQ0UnQ0EGHjzb89g
UgxE5AFm3mH1IDrvyQ43A0/zhU31U34IKrjXbnk+mgxm6VnssFFrpIldoNKiw5p8
szKgahtpJfcN9YU3c9a9j6J5IT1OMhSqJdow1BaMQ9jBBpH7Hoxs0X/AG45r8ecr
pqpR/CpUKH87hw/QLmjGMh5tBwG0NWblcmelr64Qlyf3uNSfKZXrUQoKA7U4NOFU
mtQKO/k3G9qrlkAk8NMVy+BRLN0OccRGUzLqLMOcpJ4gx7EZbDDC9rpbUh7GTD/U
hcqDo2UyBlfCFAsrCdpQXscJ1KJv60lAh3GO5kJXLty80fLuH8eK7kp8n81+Pg2s
Nof/y1x6BcWF3Y35k3FxfF1ILLpRbGjiyZnP2PK+ahIMSBNCK2356L/ZcSHzEEa7
c8FUPNJSYonqcz4jocZuexeKTp+RNY+yX1ev6EyQIsLNFH5hJzdQDL8gh+s1euSI
VzUPjN0MWNb6kZ43EdMCJWCzk1Dp6/J+opkiDZtP8DkNDJHITtxrxjrjvmyEc7RN
vWjXzd+kDSuNFdUoRcfKp8scVI0Q6FhkI55RXQZaxHhhkdfMlsNPYazb6iBZ2NUU
oeuP8Lmh56pL8fm8RvKwNOCTLyGDId9OERIw5OnsbdoCO5Uj8iQ=
=rkMS
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--


--===============6044456638626528228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6044456638626528228==--
