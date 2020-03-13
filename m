From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [Patch V5 00/21] Tegra XUSB OTG support
Date: Fri, 13 Mar 2020 16:48:06 +0200
Message-ID: <87r1xwfh09.fsf@kernel.org>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com> <20200217085130.GJ1339021@ulmo> <20200227173226.GA1114616@ulmo> <20200304070100.GA1271591@kroah.com> <20200312092232.GA1199023@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200312092232.GA1199023@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nagarjuna Kristam <nkristam@nvidia.com>, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Thierry Reding <thierry.reding@gmail.com> writes:
> On Wed, Mar 04, 2020 at 08:01:00AM +0100, Greg Kroah-Hartman wrote:
>> On Thu, Feb 27, 2020 at 06:32:26PM +0100, Thierry Reding wrote:
>> > On Mon, Feb 17, 2020 at 09:51:30AM +0100, Thierry Reding wrote:
>> > > On Mon, Feb 10, 2020 at 01:41:26PM +0530, Nagarjuna Kristam wrote:
>> > > > This patch series adds OTG support on XUSB hardware used in Tegra2=
10 and
>> > > > Tegra186 SoCs.
>> > > >=20
>> > > > This patchset is composed with :
>> > > >  - dt bindings of XUSB Pad Controller
>> > > >  - dt bindings for XUSB device Driver
>> > > >  - Tegra PHY driver for usb-role-switch and usb-phy
>> > > >  - Tegra XUSB host mode driver to support OTG mode
>> > > >  - Tegra XUSB device mode driver to use usb-phy and multi device m=
ode
>> > > >  - dts for XUSB pad controller
>> > > >  - dts for xudc for Jetson TX1 and TX2
>> > > >  - dts for Jetson-TK1
>> > > >  - dts for Jetson-Nano
>> > > >=20
>> > > > Tegra Pad controller driver register for role switch updates for
>> > > > OTG/peripheral capable USB ports and adds usb-phy for that corresp=
onding
>> > > > USB ports.
>> > > >=20
>> > > > Host and Device mode drivers gets usb-phy from USB2's phy and regi=
sters
>> > > > notifier for role changes to perform corresponding role tasks.
>> > > >=20
>> > > > Order of merging Patches:
>> > > > Please merge DT changes first followed Tegra PHY driver changes an=
d then
>> > > > USB driver changes.
>> > >=20
>> > > Felipe, Greg, Kishon,
>> > >=20
>> > > Given the runtime dependencies between these various parts, I could =
pick
>> > > these up into the Tegra tree if you provide an Acked-by.
>> >=20
>> > Ping. Are you guys okay if I pick these up into the Tegra tree?
>>=20
>> That's up to Felipe, I have no opinion :)
>
> Felipe, Kishon,
>
> I've picked up the device tree changes into the Tegra tree. Let me know
> if you also want me to pick up the USB and PHY driver changes.

Sorry for the super long delay, no problems if you want to pick it
through your tree:

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5rnSYACgkQzL64meEa
mQbcOw/+PHC2C6s2hZma+wKIIWRf2etmytep7PH5htS6qBEqiZclRJChw9ks8nh6
87xBYHbPcR3ajUbf/qLdU53B/P/fv18aBnG+v26qoE6KusJ/SwIuo7IqMtxS4h1e
SteaHHsqvsQuYpq2Jy10nHTGLszKzjkjKt/ZGgyZ9Naq5IT9A/dyWPjkwOr1Cfen
ufJ+uqH/aEMcrfL/ejGJLZMVvmi8hIppZnld02J02/Ip4pzp+fSn4/NhXDUlnIa3
Ru9Zdzs5upEva8KZb7oUiWqZLEUIXHPP4tGDl6AaXmR774EhPXD4vCEo+8SIX2NI
gQ8zODCKOfEwYCblxhwI5AK+W2i6BEqeKUo+H7PdyU5lFA/SvKnEvrlmL9XECnSL
2+boUbAC4VdDRQ0ZE4jMep8ehPTBK7SyUVYYGI5TOC4p6O8JvdlSIJS9Bbemo0Lj
7Z+/zyumOuy4WHe0w6I357LpTv8M6N2jEgOLHqQXqs7ROgQKo8EBgFT9n1lmYZAs
0zWLZioos7Vy31c3MWWTQdwtvCBz8iSlW+EciKcoYEZt27i2petNrQh0i7hTSyfv
rakKekvpyBXXSt5BITvCpP0SuvJ6IwXpeWZq7v38juDR2wYh6qWnogSww0pRmjqc
PMyDMRHSu9WpmR2a+ftAvFmEhIkBV/9bPb10jWwWcXdiwCPhLjM=
=6Pve
-----END PGP SIGNATURE-----
--=-=-=--
