From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] ARM: tegra: Register host1x node with iommu binding on
 tegra124
Date: Mon, 10 Jul 2017 09:05:39 +0300
Message-ID: <1499666739.1313.1.camel@paulk.fr>
References: <20170709163614.6746-1-contact@paulk.fr>
 <20170710052140.GA18089@ulmo.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2590625313743231018=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170710052140.GA18089@ulmo.fritz.box>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============2590625313743231018==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-eAc9fSCsLW+aXj1wRO/0"


--=-eAc9fSCsLW+aXj1wRO/0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 10 juillet 2017 =C3=A0 07:21 +0200, Thierry Reding a =C3=A9crit :
> On Sun, Jul 09, 2017 at 07:36:14PM +0300, Paul Kocialkowski wrote:
> > This registers the host1x node with the SMMU (as HC swgroup) to
> > allow
> > the host1x code to attach to it. It avoid failing the probe
> > sequence,
> > which resulted in the tegra drm driver not probing and thus nothing
> > being displayed on-screen.
> >=20
> > Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
> > ---
> >  arch/arm/boot/dts/tegra124.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
>=20
> Thanks for tracking this down. However, I don't think this is an
> appropriate fix for v4.12 because it requires an update to the DTB in
> order to preserve functionality, which means we've broken DT ABI. The
> proper fix I think needs to be to make usage of the IOMMU completely
> optional in the host1x driver.

I see, that makes sense.

> So I think what happens without this DT change is that the call to
> iommu_attach_device() fails and we have no way to recover from that.

That is exactly what is happening, indeed.

> I think what we need to do is to free the domain in that case and make
> sure we can continue without one. It's probably best to add an error
> message, or maybe a warning to make sure people are aware.

By freeing the domain, do you mean continuing without IOMMU support?
If so, then we should make sure to only behave that way for -ENODEV and
generally still fail for other errors.

> Do you have the time to address this? If not, perhaps Mikko can take a
> look?

I can craft a patch this evening, but if someone else wants to work on
it earlier, they are totally welcome to do it!

--=20
Paul Kocialkowski,

developer of free digital technology and hardware support.

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-eAc9fSCsLW+aXj1wRO/0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlljGTUACgkQhP3B6o/u
lQyBFBAAklfXJFr1Bkh7ynLOmSykIeRAa9I+bFt9BiniZEPhlebT0X/trDqBNSjf
ZJu1d5LF6KBIHA7+oRHzdVXhXdgn6QC1AzxNYmz2M0AFT1YdSOigUpJhf92383sW
OBgasBdRxH4f8te8h1KkF6F4VA88jy1spJh1XJIoa29xPWHSHsbcCxBrIEaigO3v
hTGE6oecO4i22fFoxW6HgN/RHQ0vEEIDOLQhOpFrnDY+WyJwSM8S4PWGuS/GUsLT
acWOG1XYw6lNFA3g2dITpPYEP1Xiw42QR9snAmI4+e1HVbhngm4uwTbNfZ/+yEK6
9V7lTRMVh0pwLdpU2fSuuRC4mgfatgGOXm5vc0J5XPcZ7Gze8eiMqHJaImMuyK2F
QztjwEx95WbQG2xbiGqhDk+lzdy0S6fZ/V821Gsn13nOv/jk1Dy4NhO8nDfbVAbo
H4llXve8OD65YShzlRA8HsExCattresukm05z/SYOJaS6myXzdbYin5Sxy3KZsXf
xYSYBZaLZut+y7ZYMtB1irdQmU7PzxDyBwfmQMPX5o5VasJD83I3KTZQhuJ9StfB
1xFqFs5avVruONP8V0WHhClhxwJSihNAmICU6oNXCKfCTAgYfnTlBoQXY+TbopZ1
zKd1RKjCWQmsKiaE2wc2tRVoR3jppkqbhevYj7xl6MegakV+QEs=
=GKKs
-----END PGP SIGNATURE-----

--=-eAc9fSCsLW+aXj1wRO/0--



--===============2590625313743231018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2590625313743231018==--
