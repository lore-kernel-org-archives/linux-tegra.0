From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Overhaul Venice2 regulators
Date: Fri, 28 Feb 2014 16:38:15 +0100
Message-ID: <20140228153814.GA15140@ulmo.nvidia.com>
References: <1393345802-6121-1-git-send-email-thierry.reding@gmail.com>
 <530D14D2.3040008@wwwdotorg.org>
 <20140226110210.GA30008@ulmo.nvidia.com>
 <530FBA03.1050608@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <530FBA03.1050608-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2014 at 03:19:47PM -0700, Stephen Warren wrote:
> On 02/26/2014 04:02 AM, Thierry Reding wrote:
> > On Tue, Feb 25, 2014 at 03:10:26PM -0700, Stephen Warren wrote:
> >> On 02/25/2014 09:30 AM, Thierry Reding wrote:
[...]
> >>> 		vdd_3v3_run: regulator@3 {
> >>> 			compatible =3D "regulator-fixed";
> >>> 			reg =3D <3>;
> >>> 			regulator-name =3D "+3.3V_RUN";
> >>> 			regulator-min-microvolt =3D <3300000>;
> >>> 			regulator-max-microvolt =3D <3300000>;
> >>> 			vin-supply =3D <&vdd_3v3_sys>;
> >>> 		};
> >>
> >> Isn't this controlled by signal PMU_REGEN3 (AS3722 GPIO1) ; that seems
> >> to be routed into the "ON" pin on U20A7 SLG5NV1430V. Is this something
> >> you're planning on fixing later, by creating a standalone PMU_REGEN3
> >> regulator, and inserting into the hierarchy?
> >=20
> > That's something that could be done. One of the issues is that there
> > isn't a proper regulator for PMU_REGEN3, but at the same time it is used
> > to control also the +1.8V_VDDIO_LP0_OFF regulator. That means we'd have
> > to used a dummy regulator to wrap the PMU_REGEN3 GPIO just so it can be
> > used as the input for multiple other regulators.
> >=20
> > Of course in that case it isn't simply an enable pin anymore. Therefore
> > it will need to be listed in a vin-supply property, rather than the gpio
> > property for the regulator. But since the regulator is also fed by other
> > supplies this too will require multiple supply support in the regulator
> > core.
> >=20
> > One other issue is that PMU_REGEN3 is also used to discharge the
> > +1.05V_RUN, +3.3V_RUN and +1.8V_VDDIO_LP0_OFF rails. I can't claim to
> > completely understand that circuitry, but it seems that when PMU_REGEN3
> > is pulled low, then all of the above rails will be discharged. For both
> > +3.3V_RUN and +1.8V_VDDIO_LP0_OFF shouldn't be too bad because they are
> > dependent on PMU_REGEN3 anyway. But for +1.05V_RUN that's not the case.
> > That's used for PCIe and SATA (both not used on Venice2 I think) as well
> > as HDMI (AVDD_HDMI_PLL).
>=20
> Hmm. So if we turn off (pull low) PMU_REGEN3 while +1.05V_RUN is
> enabled, we'll end up shorting +1.05V_RUN to ground? Is that possible in
> the latest version of your patch? If not, then I'll just trust your
> latest patch:-) If it is possible, then I think we need to rejig the
> patch somehow so we absolutely can't do that.

Currently +1.05V_RUN is always on, so indeed if none of the regulators
supplied by +3.3V_RUN is enabled it will cause +3.3V_RUN to become
disabled as well and therefore short +1.05V_RUN to ground. However, we
currently don't use +1.05V_RUN. It's used by PCIe and SATA which aren't
even connected on Venice2 as far as I can tell, and HDMI. Since we don't
support HDMI yet it shouldn't be a problem.

One problem is that +1.05V_RUN is currently marked always-on, so I'll
resend another version of the patch with that removed, which should
cause it to always remain disabled and therefore not cause any problems
for now.

But even once we do add HDMI support there should be no issue, since
HDMI also needs the +3.3V_AVDD_HDMI_AP_GATED, which is supplied by
+3.3V_RUN. Currently the driver also enables the AVDD_HDMI regulator
before the AVDD_HDMI_PLL regulator, therefore the situation where
+1.05V_RUN could be shorted to ground should never be able to occur.

One related note below...

> > The Tegra HDMI block has two input voltages, VDD and PLL. These are both
> > represented by the vdd-supply and pll-supply properties. However, at
> > least on Dalmore and on Venice2 now, the vdd-supply is one controllable
> > via a GPIO and therefore goes to the +5V pin on the HDMI connector
> > rather than the 3.3V AVDD_HDMI input of Tegra. For all other boards it
> > seems like we don't handle that pin at all, presumably because it is
> > always on anyway (on Beaver, the +5V pin of the HDMI connector is
> > supplied by +SYS_3V3 and +VDD_1V8, both of which are always on).
> >=20
> > To rectify the situation I think we'll need another supply in the HDMI
> > DT bindings, say hdmi-supply, that can be used to describe the signal
> > that should go to the connector's +5V pin. Or perhaps add a subnode
> > connector to the hdmi node to represent this more accurately:
> >=20
> > 	hdmi@54280000 {
> > 		vdd-supply =3D <&vdd_3v3_hdmi>;
> > 		pll-supply =3D <&vdd_hdmi_pll>;
> >=20
> > 		...
> >=20
> > 		connector {
> > 			supply =3D <&vdd_5v0_hdmi>;
> > 		};
> > 	};
> >=20
> > Does that sound reasonable?
>=20
> Yes. I think a hdmi-supply property would be fine; I don't think we need
> another node? Either way is fine though.

As far as I remember, the reason for commit 18ebc0f404d5 "drm/tegra:
hdmi: Enable VDD earlier for hotplug/DDC" was that the +5V to the HDMI
connector needs to be enabled early in order to allow hotplug detection
since the HDMI sink uses those 5V to return the HPD signal.

Now like I mentioned above, there seems to have been a mixup and on
Dalmore the vdd-supply is used to control both the AVDD_HDMI input (via
the Palmas' ldoln supply) and the +5V that goes to the HDMI connector
(via GPIO K.01). With the above proposal those would be split up into
two supplies, vdd_3v3_hdmi that is really only the ldoln supply and the
new vdd_5v0_hdmi that's controlled by GPIO K.01 (and supplied by
VDD_5V0_SYS it would seem).

With that change in place, the new hdmi-supply property can be used in
the driver to obtain a reference to that regulator and enable it early
and for the whole time during which HDMI is loaded. That means that
commit 18ebc0f404d5 can be reverted, because we can potentially save
some power by only enabling the AVDD_HDMI supply when HDMI is actually
enabled (as opposed to just loaded, as in the driver needs to be able
to receive hotplug events).

But looking at that commit, before that change was made, the VDD supply
was always enabled before the PLL supply, which means that for Venice2's
PMU_REGEN3 issue this should ensure that +1.05V_RUN supply can never be
shorted to ground.

As a side-note, the regulators on Dalmore seem to suffer from the same
issues as Venice2. The regulator names don't map to signal names in the
schematics and some of the uses seem to be plain wrong. So perhaps I
should make a similar pass over the Dalmore DTS file and fix things up.
Perhaps it isn't worth the churn, though, but either way we should make
sure this is done more properly for future boards.

Thierry

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTEK1mAAoJEN0jrNd/PrOhmQYP/3LhvvlhSXKmNX/eC6AVQJH6
SEUpYsBDBPNqr9356IgsJVjwBPaytLPHvcwNgwrtf6pt/08H6LtemNfNTdqbzEoN
MgYjgDqKfSSLCaJGnqQNwuMjOnyIhjfHn9Ya1xfGdXsU2JA4K0FVYuGAVYyAGyV8
sB1s0SKTCtdCnv5Hg8ODNdPumEEN20LdljnjcODj61owGk3XePJ6lQjW0KOwouzE
1KZuRS+uyKX+AwdPIlve/G1kAo0Hn74+7XK2eiJoThXXyIO/znxXSWPlnMn1KT9G
OERAIxZBsanixnu+enakX+rg29LNgnWpkMYhd52ohLd7nY/fRNTcioprXLxCzIop
nZbFXC3Vo8CETmXG9/c5+fnspQkz84EzCJgh2+FnvLotyDDHwTgMHEZAkQ2nYJ8E
+vt6A+HgLgV6837Fsj6LhR6Mzw2oK+V1nvtiy2VPhyEW9ellpahpolqNCJJ9NUVC
lHStn0xCE/Rje64KxoX+JVBm0YVXU6OUblmHfnOvN/9GQa+c9jGLiNn5d9PIGjad
4ToLuEe+uaId+uS66Q1CGp7508FV0qnDeHc8bCX/tcWAuEJ7YbrQbh6ft8IsMEDx
AjHCFGQFDyS8NMMCMmpS2QOJUDKxbdc85eTH2jKwqjcAfV47yqBPilx9a1srxsUG
/wlGwrfIsWlcf7cRurbi
=rsR4
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
