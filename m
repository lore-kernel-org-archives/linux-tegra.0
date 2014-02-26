From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Overhaul Venice2 regulators
Date: Wed, 26 Feb 2014 12:02:13 +0100
Message-ID: <20140226110210.GA30008@ulmo.nvidia.com>
References: <1393345802-6121-1-git-send-email-thierry.reding@gmail.com>
 <530D14D2.3040008@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <530D14D2.3040008-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2014 at 03:10:26PM -0700, Stephen Warren wrote:
> On 02/25/2014 09:30 AM, Thierry Reding wrote:
> > Some of the regulators and the relationships to other regulators are
> > wrong. This commit attempts to rectify this by making them more similar
> > to what the schematics contain. This starts by adding a +VDD_MUX supply
> > that represents the 12V input and derives the main +3.3V_SYS and +5V_SYS
> > supplies from that. The majority of the other regulators derive from one
> > of those three.
> >=20
> > While at it, rename the regulators to match the names in the schematics
> > to make them easier to match up.
>=20
> > diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts=
/tegra124-venice2.dts
>=20
> >  			regulators {
> > -				vsup-sd2-supply =3D <&vdd_ac_bat_reg>;
> > -				vsup-sd3-supply =3D <&vdd_ac_bat_reg>;
> > -				vsup-sd4-supply =3D <&vdd_ac_bat_reg>;
> > -				vsup-sd5-supply =3D <&vdd_ac_bat_reg>;
> > +				vsup-sd2-supply =3D <&vdd_5v0_sys>;
> > +				vsup-sd3-supply =3D <&vdd_5v0_sys>;
> > +				vsup-sd4-supply =3D <&vdd_5v0_sys>;
> > +				vsup-sd5-supply =3D <&vdd_5v0_sys>;
> >  				vin-ldo0-supply =3D <&as3722_sd2>;
> > -				vin-ldo1-6-supply =3D <&vdd_ac_bat_reg>;
> > +				vin-ldo1-6-supply =3D <&vdd_3v3_run>;
> >  				vin-ldo2-5-7-supply =3D <&as3722_sd5>;
> > -				vin-ldo3-4-supply =3D <&vdd_ac_bat_reg>;
> > -				vin-ldo9-10-supply =3D <&vdd_ac_bat_reg>;
> > -				vin-ldo11-supply =3D <&vdd_ac_bat_reg>;
> > +				vin-ldo3-4-supply =3D <&vdd_3v3_sys>;
> > +				vin-ldo9-10-supply =3D <&vdd_5v0_sys>;
> > +				vin-ldo11-supply =3D <&vdd_3v3_run>;
>=20
> Looking at the schematic, the binding should require a vin-ldo3-lv and
> vin-lod3_sw property too, although that's not really anything to do with
> this change.

Indeed. And also vin-gpio and vin-gpio-lv. I'm not sure to which degree
we really want to describe the power tree. Some of these properties are
of no relevance to the operating system. Well, maybe for some special
cases they might be.

> >  				sd0 {
> > -					regulator-name =3D "vdd-cpu";
> > +					regulator-name =3D "+VDD_CPU";
>=20
> I don't see a +VDD_CPU signal anywhere in the schematic
> (602-7R371-0000-A00.Schematics.Rev.1.23). I do see +VDD_CPU_AP, but
> that's driven by a pair of AS3728 ICs, not the AS3722. Perhaps the
> AS3728 are considered logically part of the AS3722 since it seems like
> control of the AS3728s is by wires from the AS3722?

Yes, I'll rename this to +VDD_CPU_AP. I must have confused this with the
name of the Tegra124 input (VDD_CPU).

And yes, I think in this case it makes sense to consider the AS3728 as
part of the PMIC, since it isn't in any way controllable by software it
seems.

> > =20
> >  				as3722_sd2: sd2 {
> > -					regulator-name =3D "vddio-ddr";
> > +					regulator-name =3D "+1.35V_LP0";
>=20
> can we rename this label to e.g. vdd_1v35_lp0, so that it's more obvious
> that the bin-ldo0-supply property above references the correct node.

Done.

> >  				sd3 {
> > -					regulator-name =3D "vddio-ddr-2phase";
> > +					regulator-name =3D "+1.35V_LP0";
>=20
> Both sd2 and sd3 nodes have the same value for regulator-name. I'm not
> sure that's correct, even if both the outputs are indeed wired together
> on the board?

As far as I can tell the name is only used for descriptive purposes, so
this should work. It could be annoying if either of them fails for some
reason and an error message wouldn't necessarily point to the exact
regulator.

Then again, if one of these were to fail, I'm not sure one would even
get to see any output because they power the DRAMs.

The reason why I chose to give them the same name is that they aren't
distinguishable in the schematics, so any other name would be arbitrary
again. Perhaps naming them something like +1.35V_LP0(sd2) and
+1.35V_LP0(sd3) would work?

> >  				as3722_sd5: sd5 {
> > -					regulator-name =3D "vddio-sys";
> > +					regulator-name =3D "+1.8V_VDDIO";
>=20
> Rename the label vddio_1v8?

Done.

> >  					regulator-min-microvolt =3D <1800000>;
> >  					regulator-max-microvolt =3D <1800000>;
> >  					regulator-boot-on;
> > @@ -710,7 +710,7 @@
> >  				};
> > =20
> >  				sd6 {
> > -					regulator-name =3D "vdd-gpu";
> > +					regulator-name =3D "+VDD_GPU";
>=20
> I think that's +VDD_GPU_AP on the schematics.

Okay, I renamed it.

> BTW, all the AS3728 chips (SD0, SD1, SD6) get +5V_SYS as input, as well
> as one of +VDD_MUX_GPU, +VDD_MUX_CORE, +VDD_MUX_CPU. This doesn't seem
> to be represented anywhere in the DT.

Like I said above, I think that's below the level of detail that we may
want to represent in DT.

If we decide that we need it anyway, I think we can do it in a separate
patch. It will also require changes to the regulator core to implement
multiple supply support.

Perhaps another idea would be to not support multiple regulators in one
vin-supply property, but maybe add other properties. Some of the chips
that take more than one supply use the supplies for different purposes.
As an example, the various SLG5NV1430V chips (such as U20A6) take one
supply that they derive the output from and another supply that they use
to power themselves. So one alternative to multiple phandles in
vin-supply would be to add vdd-supply. But again, I'm not sure if we
should concern ourselves with that level of detail.

> > 		vdd_3v3_run: regulator@3 {
> > 			compatible =3D "regulator-fixed";
> > 			reg =3D <3>;
> > 			regulator-name =3D "+3.3V_RUN";
> > 			regulator-min-microvolt =3D <3300000>;
> > 			regulator-max-microvolt =3D <3300000>;
> > 			vin-supply =3D <&vdd_3v3_sys>;
> > 		};
>=20
> Isn't this controlled by signal PMU_REGEN3 (AS3722 GPIO1) ; that seems
> to be routed into the "ON" pin on U20A7 SLG5NV1430V. Is this something
> you're planning on fixing later, by creating a standalone PMU_REGEN3
> regulator, and inserting into the hierarchy?

That's something that could be done. One of the issues is that there
isn't a proper regulator for PMU_REGEN3, but at the same time it is used
to control also the +1.8V_VDDIO_LP0_OFF regulator. That means we'd have
to used a dummy regulator to wrap the PMU_REGEN3 GPIO just so it can be
used as the input for multiple other regulators.

Of course in that case it isn't simply an enable pin anymore. Therefore
it will need to be listed in a vin-supply property, rather than the gpio
property for the regulator. But since the regulator is also fed by other
supplies this too will require multiple supply support in the regulator
core.

One other issue is that PMU_REGEN3 is also used to discharge the
+1.05V_RUN, +3.3V_RUN and +1.8V_VDDIO_LP0_OFF rails. I can't claim to
completely understand that circuitry, but it seems that when PMU_REGEN3
is pulled low, then all of the above rails will be discharged. For both
+3.3V_RUN and +1.8V_VDDIO_LP0_OFF shouldn't be too bad because they are
dependent on PMU_REGEN3 anyway. But for +1.05V_RUN that's not the case.
That's used for PCIe and SATA (both not used on Venice2 I think) as well
as HDMI (AVDD_HDMI_PLL).

Then again, HDMI also depends on +3.3V_RUN for AVDD_HDMI, so it won't
work anyway when PMU_REGEN3 goes low. Perhaps there are other reasons
why +1.05V_RUN can't run separately from the other two either, so maybe
my concerns aren't valid.

I do seem to remember an issue related to one of the PMU_REGEN signals
that caused eDP to not work, but perhaps that was PMU_REGEN1. That's
used to discharge the +1.8V_VDDIO, +1.35V_LP0_VDDIO_DDR_AP and +3.3V_SYS
rails. Since +3.3V_SYS is used as input to +3.3V_RUN, which in turn is
used to generate +3.3V_PANEL, I suspect that could be the explanation.

So for starters I could wire up PMU_REGEN3 to this regulator (+3.3V_RUN)
but it means we may have to change it again if we ever want to support
the +1.8V_VDDIO_LP0_OFF rail as well.

> Incidentally, that IC also takes in +5V_SYS, but perhaps it isn't worth
> worrying about that, since +5V_SYS is always-on?

Yes, I'd rather ignore that for now.

> On the same schematic page as U20A7, I also see supplies +3.3V_SD_CARD,
> +1.8V_VDDIO_LP0_OFF, and +3.3V_LP0 which I think are missing from the DT.

+3.3V_SD_CARD isn't represented as a regulator. The EN_VDD_SD pin (GPIO
R.00) is directly hooked up via the sdhci@700b0400 node's power-gpios
property.

+1.8V_VDDIO_LP0_OFF isn't used yet and might be tricky to support along
with +3.3V_RUN since they are controlled by the same GPIO (PMU_REGEN3,
see above).

+3.3V_LP0 is interesting. That's used among other things for PCIe, SATA,
HDMI CEC, but is also connected to the AVDD_USB input on Tegra124. It
seems like that's the input that will supply the VBUS outputs, so I'm
beginning to wonder if perhaps that's what causes the USB issue we've
been seeing. I'll see if adding a regulator for this will improve
things.

> > 		vdd_3v3_hdmi: regulator@4 {
> > 			compatible =3D "regulator-fixed";
> > 			reg =3D <4>;
> > 			regulator-name =3D "+3.3V_AVDD_HDMI";
>=20
> I don't see a signal of that name in the schematics.

The signal name is +3.3V_AVDD_HDMI_AP_GATED. Looking at the schematics
again the EN_VDD_HDMI pin (GPIO K.06) also isn't actually enabling this
regulator. +1.05V_RUN is.

Looking further the EN_VDD_HDMI pin is actually used to enable the U21B4
regulator that produces the +5V_HDMI signal. But there's some slight
inconsistency here.

The Tegra HDMI block has two input voltages, VDD and PLL. These are both
represented by the vdd-supply and pll-supply properties. However, at
least on Dalmore and on Venice2 now, the vdd-supply is one controllable
via a GPIO and therefore goes to the +5V pin on the HDMI connector
rather than the 3.3V AVDD_HDMI input of Tegra. For all other boards it
seems like we don't handle that pin at all, presumably because it is
always on anyway (on Beaver, the +5V pin of the HDMI connector is
supplied by +SYS_3V3 and +VDD_1V8, both of which are always on).

To rectify the situation I think we'll need another supply in the HDMI
DT bindings, say hdmi-supply, that can be used to describe the signal
that should go to the connector's +5V pin. Or perhaps add a subnode
connector to the hdmi node to represent this more accurately:

	hdmi@54280000 {
		vdd-supply =3D <&vdd_3v3_hdmi>;
		pll-supply =3D <&vdd_hdmi_pll>;

		...

		connector {
			supply =3D <&vdd_5v0_hdmi>;
		};
	};

Does that sound reasonable?

> > 		vdd_5v0_ts: regulator@6 {
> > 			compatible =3D "regulator-fixed";
> > 			reg =3D <6>;
> > 			regulator-name =3D "+5V_VDD_TS_SW";
> > 			regulator-min-microvolt =3D <5000000>;
> > 			regulator-max-microvolt =3D <5000000>;
> > 			enable-active-high;
> > 			regulator-boot-on;
> > 			gpio =3D <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_LOW>;
>=20
> I think that should be ACTIVE_HIGH; The signal name is TS_SHDN_L, so
> it's active-low as a shutdown signal, but active-high as an enable
> signal, which is presumably how the regulator subsystem wants to treat
> it (and which matches the enable-active-high property).

Yes, you're right. It probably only works because the GPIO flags are
being ignored and enable-active-high is what defines the polarity.

Thierry

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTDcmyAAoJEN0jrNd/PrOhMFMQAIqVEuA+64KVfvYARVi6oi57
BsMzawUIWxKj6Hb3jo8u7xZskitiuDEoUaAFBO59cU4z84uvxIMI+2wISfuiAkmr
fUj6pPewTfkvXHrF/yUH0fE6+5elA6S24003Qt4giGQOoOFah/5gHrE/bQuMsWsw
HazRSLyuJeJrn3lbVszuEIsrlGPrJ2Eu/HgZvBSABAkqwZ6Ue4G1thA7hSiPSpye
2dQqNLCVNDYqr7RcEZCqnwuzbI8xhgWCoHBkVuU1DrwRo7MBVWLyA7PQDE3Yu2Sy
39RqrVVaHJmq8ooKdCacUFNjZ8XEDU7kS+7R3fE4Oz4uDL3gpiALXp3ja9WTn9PD
Bz1UBeJltahR9oazQDNjv/9F67LP9JVH5IenoRtttCk65RN2aZK3qTuimR1FpyYM
ZS6YngGWOpRhHK2ZcZzrXKFhj7wtrNxCeXU+2wpgU3setxqjSeFFKxG0pFDTtMpr
oehJvl/hZkyKk3DlCT5RZyswFEyIih6Z/5ChCbsBIvXfQ2Pwd6uIYZGEUqvUBwvj
ydQxwh+p95PuWzXa7GMFPDPicXZ3y5CXTo3YdY0+4TAxS2Fat/iUhGSZBh2kuZTQ
siMpvFnT7l/yAu9UHj42TSifaDzsyrAaskQuRNenfpFFGD0M331dFtdMzZ+efkgc
9FrbkQgPuquJHgPe0DrO
=c0qb
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
