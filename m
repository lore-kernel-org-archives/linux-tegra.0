From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Tue, 26 Jun 2012 21:39:29 +0200
Message-ID: <20120626193929.GA5308@avionic-0098.adnet.avionic-design.de>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de>
 <4FE9B291.2020305@nvidia.com>
 <4FE9F582.6010805@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FE9F582.6010805-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 26, 2012 at 11:46:42AM -0600, Stephen Warren wrote:
> On 06/26/2012 07:01 AM, Terje Bergstr=C3=B6m wrote:
> > On 26.06.2012 13:55, Thierry Reding wrote:
> ...
> >> An alternative would be to call of_platform_populate() from the host1x
>=20
> [alternative to making the host1x node contain compatible=3D"simple-bus".]
>=20
> >> driver. This has the advantage that it could integrate better with the
> >> host1x bus implementation that Terje is working on, but it also needs
> >> additional code to tear down the devices when the host1x driver is
> >> unloaded because a module reload would try to create duplicate devices
> >> otherwise.
> >=20
> > Yes, we already have a bus_type for nvhost, and we have nvhost_device
> > and nvhost_driver that device from device and device_driver
> > respectively. They all accommodate some host1x client device common
> > behavior and data that we need to store. We use the bus_type also to
> > match each device and driver together, but the matching is version
> > sensitive. For example, Tegra2 3D needs different driver than Tegra3 3D.
>=20
> I'd certainly like to see some upstream discussion re: why exactly we
> have a custom bus type here. What does it do that a regular platform bus
> doesn't do? Are those features something that would be generally useful
> to add to the existing platform bus? Can we instead add hooks into
> platform bus rather than creating a new bus? I recall you saying that
> the nvhost_bus duplicated a lot of code from the existing platform bus.

I don't like the idea of duplicating the code either, but host1x does
have some properties that might be convenient to have part of a bus
abstraction (sync points and channels). This could all be implemented
using a library of functions instead of a bus-type midlayer, though. I
think we've also had that discussion before.

Thierry

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP6g/xAAoJEN0jrNd/PrOhksEP/3x/RfANcHsRYNDglYMZe579
P/2Wr6xsk4MRTIRsan/3dZI3YoodhGXDZjSCI9gVCJoAi+8yLiDmEbPmrfipxL8I
X5soDHTr1+VrI+fx178vCAlAnUHkutDuW90y4vxjZ1hIoc3r6oTA1vP3yG7k6cwI
q+0pqtO2VaXpSaW3xw55trFgaNQQMr7BllsYaRV2cZ0+nmqX+2MixGz/lQwPSOQR
GoWFMqYOMhsQnPxzTmI0ZW6A3QIOwjXX7LOIv32T91oI2mxO91wrz3RDM1g2eYwZ
i4l7AFLqD4grSJOZxrwbMH9pH1zZ09Q70fqD9OD3127W3RiKeIowNOnfhGrpX3am
La5hhTgpin5t1rKy/rJyy3xr6wex4wPkVaNwFQ0hdohCsaNsLyK6L/pBf6VtVwIt
IzrkNj2rCsizT6QfL7OzdFSidnJNdUXW2cIbOC3OVOHc8c/I+15K3vf/VT41esLf
0jdB9uyXFJNVu7JKjRInqifC7lv4duLrzfCPGUmFUaPrbY074/I8N66n3GeGsBmJ
jiuZ1U8aRWSI8TIRfONd25yPGViiVwMC7CQvmh2HEyu6ygiuFeSUTYrMF4qXMvOV
TjhObSZfe8Yzn8tyGQJqNwhqxGXM922JymR86j/IC4kGiBsyfBreGn9QTFmR8lLN
Aqp5Jz+LipS9POPsyvNj
=JF7M
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
