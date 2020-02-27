From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V5 00/21] Tegra XUSB OTG support
Date: Thu, 27 Feb 2020 18:32:26 +0100
Message-ID: <20200227173226.GA1114616@ulmo>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
 <20200217085130.GJ1339021@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200217085130.GJ1339021@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 09:51:30AM +0100, Thierry Reding wrote:
> On Mon, Feb 10, 2020 at 01:41:26PM +0530, Nagarjuna Kristam wrote:
> > This patch series adds OTG support on XUSB hardware used in Tegra210 and
> > Tegra186 SoCs.
> >=20
> > This patchset is composed with :
> >  - dt bindings of XUSB Pad Controller
> >  - dt bindings for XUSB device Driver
> >  - Tegra PHY driver for usb-role-switch and usb-phy
> >  - Tegra XUSB host mode driver to support OTG mode
> >  - Tegra XUSB device mode driver to use usb-phy and multi device mode
> >  - dts for XUSB pad controller
> >  - dts for xudc for Jetson TX1 and TX2
> >  - dts for Jetson-TK1
> >  - dts for Jetson-Nano
> >=20
> > Tegra Pad controller driver register for role switch updates for
> > OTG/peripheral capable USB ports and adds usb-phy for that corresponding
> > USB ports.
> >=20
> > Host and Device mode drivers gets usb-phy from USB2's phy and registers
> > notifier for role changes to perform corresponding role tasks.
> >=20
> > Order of merging Patches:
> > Please merge DT changes first followed Tegra PHY driver changes and then
> > USB driver changes.
>=20
> Felipe, Greg, Kishon,
>=20
> Given the runtime dependencies between these various parts, I could pick
> these up into the Tegra tree if you provide an Acked-by.

Ping. Are you guys okay if I pick these up into the Tegra tree?

Thierry

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5X/SQACgkQ3SOs138+
s6E7uxAAwLgVZKM5o1rrps7EuTuKsMpZ5xxl3xBXrfsXA3ySvIC3W0H6sNDuQsD7
bKHID3zunA0/6EnDGEyn62wyo58e489dCiPseSTr/t0cSTks5f2dDM46BrTDug3A
iyAIH71LcFvd9+SoNNiIFwQxs3Qx6E+oU/uFqdgPKqO+uqjlI//V28syeVHCmeW2
50HLMU91gS/Wc7+nU/TMaSBDh98kayfyVihMSyVC1llle2O8ADhVrCY/ATO8Pno0
kKV/i7GCYnvhW6I/6260WLWrgOKaru5Yzo9oWGR02LPukuJMGsw/jci0MhhTZp7e
qj4Pa5oc9+hMkjXVEV6pcNmJBOVs3hfx9dR4Ipvl+KJBBQrCeeclKfPbFVFJI/mC
uMdJFc5ode+XmVDxc2VbEtwPN7/+UGrhwIN27gjPlVeVyVjwLS4tUt+hj0QOMgrS
p7q8ilN5VZ0TV4Kwa7aqUntx60yTDFsDSj+eFEUbp46QZzIBncUdpIqxFYqMc4Hz
Wa6QBAHjT4Pad9DviKRDR/71nZknkBbtAnq822gkk5Ax3gUShgZo37CbAim7su66
pwdQsoOpoJOmZHf8mcLB2t+99qAzBbZepOnQ1bw7iNo58q4SMXqTki5geomJ+JDs
wxFOqWQb8B+0Fw8J3VHS3X/j2KIRs9hEnl5qD+Z8g3CPZBlqpmo=
=u05R
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
