From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: tamonten: Add temperature sensor support
Date: Fri, 9 Nov 2012 19:38:19 +0100
Message-ID: <20121109183819.GA7663@avionic-0098.mockup.avionic-design.de>
References: <1352466474-27581-1-git-send-email-thierry.reding@avionic-design.de>
 <509D3CD0.4070006@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <509D3CD0.4070006-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 09, 2012 at 10:26:40AM -0700, Stephen Warren wrote:
> On 11/09/2012 06:07 AM, Thierry Reding wrote:
> > The Tamonten SOM has an ON Semiconductor NCT1008 connected to the DVC
> > bus which is used to measure the ambient (local) temperature as well as
> > the on-die (remote) temperature.
>=20
> > diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dt=
s/tegra20-tamonten.dtsi
>=20
> > +		nct1008@4c {
>=20
> Given nodes are typically named after object type, should that be:
>=20
> 		temperature-sensor@4c {
>=20
> as it is on Seaboard?

I'll do that.

Thierry

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQnU2bAAoJEN0jrNd/PrOh+KgP/11QZcVdS3bz2R2CIPg95HcZ
aI4IVuAj6mu+LgrugWfWcVcPdkVFCA+D9l96SfPmWT47zBwmawg9QmSF94pw4lnR
aw0V0ot8aJPfSughOT1M177jl8D87ShLM+ZgBOWOXkoeXOcNYE4kPhhIbkIouxrO
mX16abxe4gvP3kvZPTjlM132X6XxMhDSHpbMvLMpEsrAAcSRPiy27K0575pPYPQ+
4Ca3g4LuPGBtASf5nRJTXqs1RTiJmhLuJPnrplXRhVXDhmcb4esoadDJTbv24dKk
iFn6zRDXUjN6Gvc5Xz6RXWjSI2Kn4jT3HC7wwTp+XWu58A2gT93KaxgG7dFef0Q2
4QjXB2r27tdRv4+EX15tEYOvntU0AzrcOC0lC3MhVX0Bl6GhLsuHmX+SfLP5kI8n
VezfqRcea6alyXJOS0KXuKFO0pfTqFwDR7/ek+5wiYjIs9qq9JEm7yL4j9etHBuM
lxa8fg0uHIrlAuY4slYgh2PmBea4NMgbOkU4ymUogh3om0x8nV2To1migaw7X0Jb
dqJ+dJISsI+2LrvDXauh/uoiGoZtkDXKLO+/2c/v5tPkwoistFcbZHjJgQFUMfqW
q6RWWlDaHAy3V1GmqcFGSCC7XmNqo/d+UWwXwy+EDZUu/90E9GX7sPTmftEpVmpE
Wl6zBkKcIj+03LFy0hE8
=Vf4/
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
