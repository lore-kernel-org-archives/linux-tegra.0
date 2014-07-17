From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 1/3] ARM: tegra: rework PCIe regulators
Date: Thu, 17 Jul 2014 16:20:39 +0200
Message-ID: <20140717142037.GA17494@ulmo>
References: <1403558626-13422-1-git-send-email-swarren@wwwdotorg.org>
 <20140707003854.GD8469@quad.lixom.net>
 <20140707055211.GA15216@ulmo>
 <CAOesGMjwE=xThuUwmBF02YaQ32_uFogryW5anNoGc8yfkuN_Pg@mail.gmail.com>
 <20140710101527.GC21583@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NKoe5XOeduwbEQHU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140710101527.GC21583@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--NKoe5XOeduwbEQHU
Content-Type: multipart/mixed; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2014 at 12:15:28PM +0200, Thierry Reding wrote:
> On Mon, Jul 07, 2014 at 09:45:46PM -0700, Olof Johansson wrote:
[...]
> > If you have to stay compatible, then I suggest you try to fill in
> > local driver variables with derivatives of the old properties (and
> > directly from the newer properties where you can). I haven't looked at
> > the specifics here so I don't know how hard it might be.
> >=20
> > If you are 100% sure that you don't have to stay compatible, then you
> > can remove the code handling the old bindings. Still, even then I am a
> > little worried about dependencies (and more importantly conflicts)
> > between these dtsi changes and others done by tegra platform code for
> > this release. I suppose that can be resolved by having this as a base
> > of any DT changes for tegra if needed.
>=20
> To be honest, I'm very much tempted to just drop this series. Even if
> that means keeping a totally broken DT binding. But frankly I don't have
> any energy left to debate DT stability.

So this kept bugging me and I couldn't leave it alone after all. How
about if I squash in the attached patch. I've verified that that keeps
compatibility with old device trees on TrimSlice and Beaver. I think the
remainder of the series could still remain as-is (the top few commits
that you said shouldn't be there) if I squash this into

	PCI: tegra: Implement accurate power supply scheme

That way the binding will be the new one so that people don't get any
wrong ideas about taking shortcuts while still preserving compatibility
with existing DTBs.

Interestingly, despite my initial disgust for having to keep around old
code (it's in fact new code in this case) for compatibility reasons, it
ended up making the code look more mature.

Thierry

--VrqPEDrXMn8OVzN4
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: inline; filename="0001-PCI-tegra-Preserve-DT-backwards-compatibility.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 569fd6029e77f6b3ea0dc23dfc0ef32239cf55c9 Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Thu, 17 Jul 2014 15:29:46 +0200
Subject: [PATCH] PCI: tegra: Preserve DT backwards-compatibility

Parse the set of power supplies in the deprecated version of the device
tree binding to remain backwards-compatible with old device trees.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 78 ++++++++++++++++++++++++++++++++++++++++=
++--
 1 file changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 7df5aaf58921..d697587dbb7c 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -1359,6 +1359,66 @@ static int tegra_pcie_get_xbar_config(struct tegra_p=
cie *pcie, u32 lanes,
 }
=20
 /*
+ * Check whether a given set of supplies is available in a device tree nod=
e.
+ * This is used to check whether the new or the legacy device tree bindings
+ * should be used.
+ */
+static bool of_regulator_bulk_available(struct device_node *np,
+					struct regulator_bulk_data *supplies,
+					unsigned int num_supplies)
+{
+	char property[32];
+	unsigned int i;
+
+	for (i =3D 0; i < num_supplies; i++) {
+		snprintf(property, 32, "%s-supply", supplies[i].supply);
+
+		if (of_find_property(np, property, NULL) =3D=3D NULL)
+			return false;
+	}
+
+	return true;
+}
+
+/*
+ * Old versions of the device tree binding for this device used a set of p=
ower
+ * supplies that didn't match the hardware inputs. This happened to work f=
or a
+ * number of cases but is not future proof. However to preserve backwards-
+ * compatibility with old device trees, this function will try to use the =
old
+ * set of supplies.
+ */
+static int tegra_pcie_get_legacy_regulators(struct tegra_pcie *pcie)
+{
+	struct device_node *np =3D pcie->dev->of_node;
+
+	if (of_device_is_compatible(np, "nvidia,tegra30-pcie"))
+		pcie->num_supplies =3D 3;
+	else if (of_device_is_compatible(np, "nvidia,tegra20-pcie"))
+		pcie->num_supplies =3D 2;
+
+	if (pcie->num_supplies =3D=3D 0) {
+		dev_err(pcie->dev, "device %s not supported in legacy mode\n",
+			np->full_name);
+		return -ENODEV;
+	}
+
+	pcie->supplies =3D devm_kcalloc(pcie->dev, pcie->num_supplies,
+				      sizeof(*pcie->supplies),
+				      GFP_KERNEL);
+	if (!pcie->supplies)
+		return -ENOMEM;
+
+	pcie->supplies[0].supply =3D "pex-clk";
+	pcie->supplies[1].supply =3D "vdd";
+
+	if (pcie->num_supplies > 2)
+		pcie->supplies[2].supply =3D "avdd";
+
+	return devm_regulator_bulk_get(pcie->dev, pcie->num_supplies,
+				       pcie->supplies);
+}
+
+/*
  * Obtains the list of regulators required for a particular generation of =
the
  * IP block.
  *
@@ -1422,8 +1482,22 @@ static int tegra_pcie_get_regulators(struct tegra_pc=
ie *pcie, u32 lane_mask)
 		pcie->supplies[4].supply =3D "vddio-pex-clk";
 	}
=20
-	return devm_regulator_bulk_get(pcie->dev, pcie->num_supplies,
-				       pcie->supplies);
+	if (of_regulator_bulk_available(pcie->dev->of_node, pcie->supplies,
+					pcie->num_supplies))
+		return devm_regulator_bulk_get(pcie->dev, pcie->num_supplies,
+					       pcie->supplies);
+
+	/*
+	 * If not all regulators are available for this new scheme, assume
+	 * that the device tree complies with an older version of the device
+	 * tree binding.
+	 */
+	dev_info(pcie->dev, "using legacy DT binding for power supplies\n");
+
+	devm_kfree(pcie->dev, pcie->supplies);
+	pcie->num_supplies =3D 0;
+
+	return tegra_pcie_get_legacy_regulators(pcie);
 }
=20
 static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
--=20
2.0.1


--VrqPEDrXMn8OVzN4--

--NKoe5XOeduwbEQHU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTx9u1AAoJEN0jrNd/PrOhOIsQAJsI8GRwJdRYBR+9gLtBvAx0
UlBUFsb7VC/r4q7dnNoNdxOCiSq0rp3W908ti4urAfqlckYMrFe3+aSfgFHD2F6i
/j1E/P1MD6LJSGpZ92sXiYl0U85ReAM5LJ7jKrnJRX+3IHE0x4k7A/4BgZQ8Ch4L
6dS9x/PUWc6MJ5mZfEFMX3/eecoB9wKH/h2xyHbFsMf9N25vsLzV/IkLkh3sNU7v
l8vcsEhsiZ9xqekSLLhbmT/uYK8caFeyTMceTD3pZQJFhHQ8rn0wEDUT+sK+9LSi
84JhDyBPBF6U/rI6TYYCEUHbWbTt1cAd9/xXmUxgAmoMd97n6RmYCIs14BseQTLV
WHunsECGgmtDK5RKi3KIjZnK2WnH6uOtQ2+rQVy7AO0b1BOyAJg8a24TctVMeyak
BjLM4RZvt7scu7u1TwcbzFa0uVjrZUsd6nmy4TQcGk2KQjhHpXBArYHfhI7u3bAA
a7KSoSca1fcmu2NWDJJ/0SajKvNMtJzTkIInmH3m7w7CSjaNjXjLkKjt1ZYnrfxT
VrD1KJDeRzXLv2Kwb8QfgEjqBZbe7su8b0H8QzjhTQKZJji3xuL7bqSRIKraZiK9
FCRu4zz79/xCBrBG36F95FgPpciVjTp5xLcFv5L1lFHpce8sdJZVEx5DRr1SAE5B
OS4htHF8NDM5+ZQvlPRD
=5Jsx
-----END PGP SIGNATURE-----

--NKoe5XOeduwbEQHU--
