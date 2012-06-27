From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Wed, 27 Jun 2012 07:07:33 +0200
Message-ID: <20120627050733.GA7177@avionic-0098.mockup.avionic-design.de>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de>
 <4FE9FB22.1090902@wwwdotorg.org>
 <20120626195108.GB5308@avionic-0098.adnet.avionic-design.de>
 <4FEA3C2E.3030109@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FEA3C2E.3030109-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 26, 2012 at 04:48:14PM -0600, Stephen Warren wrote:
> On 06/26/2012 01:51 PM, Thierry Reding wrote:
> > On Tue, Jun 26, 2012 at 12:10:42PM -0600, Stephen Warren wrote:
> >> On 06/26/2012 04:55 AM, Thierry Reding wrote:
> >>> Hi,
> >>>=20
> >>> while I haven't got much time to work on the actual code right
> >>> now, I think it might still be useful if we could get the
> >>> device tree binding to a point where everybody is happy with
> >>> it. That'll also save me some time once I get to writing the
> >>> code because I won't have to redo it over again. =3D)
> >>>=20
> >>> So here's the current proposal:
> >>>=20
> >>> host1x { compatible =3D "nvidia,tegra20-host1x", "simple-bus";=20
> >>> reg =3D <0x50000000 0x00024000>; interrupts =3D <0 64 0x04   /* cop
> >>> syncpt */ 0 65 0x04   /* mpcore syncpt */ 0 66 0x04   /* cop
> >>> general */ 0 67 0x04>; /* mpcore general */
> >>>=20
> >>> #address-cells =3D <1>; #size-cells =3D <1>;
> >>>=20
> >>> ranges =3D <0x54000000 0x54000000 0x04000000>;
> >>>=20
> >>> status =3D "disabled";
> >>=20
> >> The idea behind status=3D"disabled" is that some HW only makes
> >> sense to use on particular boards. This concept really only
> >> applies to HW modules that drive external interfaces on the SoC,
> >> which in turn the board can choose whether to connect anything to
> >> (or whether to even connect to any external pins using the
> >> pinmux, or not).
> >>=20
> >> As such, I don't think it makes sense to set status=3D"disabled"
> >> on host1x, nor many other internal-only engines such as say mpe,
> >> epp, i2sp, gr2d, gr3d, dc1, dc2.
> >=20
> > What about power management and resource usage? If a board for
> > instance doesn't need gr3d at all it could just leave it at status
> > =3D "disabled" to not have the corresponding driver loaded and not
> > waste the power and resources.
>=20
> The driver should be turning off all the clocks and power if the
> devices aren't actually used (or not turning it on in the first
> place). I guess there will be some slight overhead for the
> device/driver instantiation.

I think it would be great if we provided true runtime power-management
for the host1x children at some point. Then this should all work pretty
much automatically.

> However, in all likelihood, all/most boards will enable this feature
> once it's in place. For very resource-constrained scenarios without
> display, presumably one would be building a custom kernel without the
> display driver enabled, so the DT content for display wouldn't ever
> come into play.

Resource-constrained systems could always choose to override the default
and set the corresponding nodes to status =3D "disabled". Anyway, I agree
that this functionality will likely be used by most boards so I'll
enable everything except the outputs by default.

> >>> Board DTS files could then extend this with board-specific
> >>> requirements and connectors. The following describes the Medcom
> >>> Wide:
> >>=20
> >>> connectors { #address-cells =3D <1>; #size-cells =3D <0>;
> >>>=20
> >>> };
> >>=20
> >> The connector seems to be a property of the individual output
> >> resources. I'd expect to see the connector configuration be a
> >> child of the outputs that a particular board had enabled;
> >> something more like:
> >>=20
> >> host1x { rgb { status =3D "okay";
> >>=20
> >> connector@0 { nvidia,edid =3D /incbin/("tegra-medcom.edid"); }; };=20
> >> hdmi { status =3D "okay";
> >>=20
> >> connector@0 { nvidia,ddc-i2c-bus =3D <&tegra_i2c1>; }; }; };
> >>=20
> >> Perhaps even completely omit the connector node, and put the
> >> properties directly within the rgb/hdmi node itself. After all
> >> the HDMI output really is the connector as far as Tegra goes.
> >=20
> > Heh. I seem to remember you objecting to this in a previous
> > series[0] which is actually the reason that I moved them to the
> > top-level in the first place. =3D)
> >=20
> > Thierry
> >=20
> > [0]: http://www.spinics.net/lists/linux-tegra/msg05298.html
>=20
> I don't think I was objecting to exactly what I wrote above; in that
> email, there were already separate connector nodes, but they were
> placed directly inside the host1x node (at that time called graphics),
> so still rather disconnected from the HW they represent.
>=20
> The argument for sharing e.g. an HDMI port between both video and
> audio still exists though. That said, I think now I'd still be
> inclined to put all the connector information for video into the
> hdmi/rgb/tvo nodes. If DT does grow to represent the user-connectors
> at the top-level perhaps in conjunction with drivers/extcon, perhaps
> the hdmi node can point at the extcon node with a phandle, or
> vice-versa, to set up the link between the components of the
> user-visible port.
>=20
> Still, the decision here is possibly a little arbitrary; many schemes
> would work. I think at this point I don't care /too/ strongly about
> which is used, so the separate-connectors-at-top-level concept in your
> email is probably OK. I wonder if the hdmi node doesn't need a phandle
> pointing at the connector node though, so they can both "find" each-other?

I actually like what you proposed above a lot, so if you don't mind
either way I'll go with that proposal. Keeping the connector nodes as
children of the outputs has the advantage of being able to reference
them if we need it at some point. But it is also redundant in that a
single output doesn't usually (never?) driver more than one connector.

The same issue will have to be addressed for the CSI and VI nodes, but
as I currently use neither of those I don't feel qualified to propose a
binding for them. Also for the VI part we're completely missing
documentation. Maybe somebody could push this to be released as well?

If I understand correctly, most of the host1x children can also be
chained in a processing pipeline to do postprocessing an video input for
example. I suppose that's generic and doesn't need to be represented
in DT either, right?

Thierry

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP6pUVAAoJEN0jrNd/PrOh1P0QAJBYyKzPYsnSuyQk5B5Gwuzc
Hq27lda9YWywurQrjRXBJgtlEhNtOGQ3N/fG/cqz2/p90im4sF1Ayj+ymXe/yacI
ehJfr/oKmBUzHmeCyjMCq/y0Op/psxflV0mPGbJ6NlNuK7X1OKm35QHtl5rSmXyL
mowWuYMcmrLK89eld6hWjTL2zdq+NevjbYhiMUJj90xrAPNqAY7elIF4QiJ+grlj
m1za6+RFqIpljqSAdBBsmocJf8NH6kGhKYQ2/wujBBko++oXpqWBpkWToOJL+dmd
KsgCqkcGwIXvSb7rmdsaQBbX9wGHWwgRCxKk/RF+Ga3SD9O/Hqw/2ERHnqfvuCc3
9Yje0Ji5c1KW1Xh4BVuBfhP1Bk7idZYOzVWGKfb4DMt7tyxJMYafI6rpfq7FbgBx
qK2scg1fy8lCspkxf4YYZ+DdUj3y95qJAVVirnwrqi1EuY97YbeIhmsYbOxP9orj
tTAUDmtAWDfiCUQX5n7Pj7IV2SuGpN7cxobjSj1wqMSQ88F5Zb4GFntuhqhgbzjr
iFPSwReeI2ptSN3kaGUnT7eC4g4PrJMJfWDcdnlpc5DnpjdrN4aTwP6IWzjqixzi
ZVfpiZI0fXYr1k+9uKzbty/AT/rxFUqr1bEdborpKrperdLP1Z56l5QVUMQQHPuQ
P3DDa7ZkdQhRU6R8gcvk
=tneM
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
