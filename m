From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 0/9] Tegra xHCI support
Date: Tue, 5 May 2015 16:42:36 +0200
Message-ID: <20150505144234.GA29813@ulmo.nvidia.com>
References: <1430761002-9327-1-git-send-email-abrestic@chromium.org>
 <5548D389.2080609@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7508327344067809769=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5548D389.2080609@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, devicetree@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============7508327344067809769==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2015 at 03:28:25PM +0100, Jon Hunter wrote:
> Hi Andrew,
>=20
> On 04/05/15 18:36, Andrew Bresticker wrote:
> > This series adds support for xHCI on NVIDIA Tegra SoCs.  This includes:
> >  - patches 1, 2, and 3: minor cleanups for mailbox framework and xHCI,
> >  - patches 4 and 5: adding an MFD driver for the XUSB cmoplex,
> >  - patches 6 and 7: adding a driver for the mailbox used to communicate
> >    with the xHCI controller's firmware, and
> >  - patches 8 and 9: adding a xHCI host-controller driver.
> >=20
> > The addition of USB PHY support to the XUSB padctl driver has been drop=
ped.
> > Thierry will be posting those patches later.
> >=20
> > Given the many compile and run-time dependencies in this series, it is =
probably
> > best if the first 3 patches are picked up by the relevant maintainers i=
n topic
> > branches so that the remainder of the series can go through the Tegra t=
ree.
> >=20
> > Tested on Jetson TK1 and Nyan-Big with a variety of USB2.0 and USB3.0 m=
emory
> > sticks and ethernet dongles.  This has also been tested, with additional
> > out-of-tree patches, on Tegra132 and Tegra210 based boards.
>=20
> For the series, you can add my ...
>=20
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
>=20
> I have tested this on a t124 nyan-big with USB3.0 and USB2.0 devices.

How can this be tested without the corresponding USB PHY patches that
I'm supposed to be sending out?

Also, can anyone point me at patches that add the device tree nodes
which this driver makes use of?

Thierry

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVSNbXAAoJEN0jrNd/PrOhn7sQAJJWiN133vEGNtrIME+OjR16
ISwri/mdNYxsaorBu1IwbCyIva0T7PSMk1u2Wag9ty8y3g4fcB3+JmwPwRS4KW8p
uPxAN6LxKhhnYpoXKdoPicx5FJBJFqqL1St30eB3s8IsBPZAbGP4EyMyOAxt3SyA
4gle8KeNbO4Nlhq+KrhW3vWaKLYgDNnPJWR009IPOohwALKjergszk9BPqZypwxN
KcwP1LVE3OKAPiT9bAgA23YOeP7BJIHU+MTaYnH0Usig265dlWGBzt+8XCJGHj40
xVVat0zeS9IQWQvzxsbj4djDdyBTddluy1dsLIz/se6/vR0d9iJTs5lTl1TTqMBV
m7rrebLVvsBZkkLKC8LfsmxxkmA8B00j1LXoglHCoRNp2V1fPHcb3QEWXo6AYBYG
PsrycfMjpM7gLqQ29BXS1+puwPRMDlT1tySqsgbQ8tnyYJzkdKbtu2aapz/2qER1
JcaE2kf1M4SInYdenBHFhSCuZulpw9hXnvmW+sX01zhbYYba+LI/CTpvO/6uonDd
OQWAyR6ayHFjbssmq/bI2sAUFA6hAHHKNluBC1wpedJN5Q0uHYV7Et3DdI/skhWw
qc4HcSiGX66/yOE6TkdwU9juE9+fHDUr0zZLuPMgUWeCMEdSxq59HMigCynEErNu
+XOFyT8DODuJoxOAq3KL
=ZgGJ
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--


--===============7508327344067809769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7508327344067809769==--
