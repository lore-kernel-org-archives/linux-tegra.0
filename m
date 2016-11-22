From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpio: tegra186: Add support for T186 GPIO
Date: Tue, 22 Nov 2016 18:30:42 +0100
Message-ID: <20161122173042.GA3239@ulmo.ba.sec>
References: <1478083719-14836-1-git-send-email-smangipudi@nvidia.com>
 <0e3e89a8-a2f1-68c2-0586-58902fb91587@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0e3e89a8-a2f1-68c2-0586-58902fb91587@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Suresh Mangipudi <smangipudi@nvidia.com>, ldewangan@nvidia.com, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 12:07:55PM -0700, Stephen Warren wrote:
> On 11/02/2016 04:48 AM, Suresh Mangipudi wrote:
> > Add GPIO driver for T186 based platforms.
> > Adds support for MAIN and AON GPIO's from T186.
>=20
> I'm not sure how you/Thierry will approach merging this with the other GP=
IO
> driver he has, but here's a very quick review of this one in case it's
> useful.

This puts me in an unfortunate situation. I'd really like to avoid being
the maintainer for this driver, but on the other hand, the version of
the driver that I wrote is pretty much what we'd end up if Stephen's
comments were all addressed. Suresh's driver does a couple of things in
addition (like the accessibility checks), but then I find my driver to
be more easily related to the TRM because it uses the register names
=66rom that.

So I don't really know how to go about merging both. I'll reply to this
email later with a copy of the patch that I wrote, maybe we can take it
=66rom there.

> > +	tgi->gc.ngpio			=3D tgi->soc->nports * 8;
>=20
> This will leave some gaps in the GPIO numbering, since not all ports have=
 8
> GPIOs. I think this is the correct thing to do, but IIRC Thierry found th=
is
> caused some issues in the GPIO core since it attempts to query initial
> status of each GPIO. Did you see this issue during testing?

I think the immediate issue that I was seeing is avoided in this driver
by the call to gpio_is_accessible() in the ->get_direction() callback.
In the driver that I have there's no such check, and hence I would get
an exception on probe.

However there's another problem with this patch. If you try and export
a non-existing GPIO via sysfs and try to read the value file you can
easily make the driver hang a CPU. This only seems to happen for the
AON GPIO controller.

The approach that I chose was to compact the range of GPIOs that the
GPIO subsystem knows about to the ones that actually exist. This has the
slight disadvantage that we can't use a simple port * 8 + offset to
compute the pin number anymore. However for the primary use-case (GPIO
specifier in DT) that's not a problem because we can translate the pin
number into the compacted space. That means the only issue will be with
sysfs support because if we use the simple formula we'll eventually get
a pin number that's outside of the range.

One way to solve this is to make a massive change to the GPIO subsystem
to check for the validity of a GPIO before any access. I'm not sure if
that's desirable, maybe Linus has some thoughts about that.

If we stick with a compacted number space, there are two solutions that
I can think of to remedy the sysfs problem. One would be to register a
separate struct gpio_chip for each controller. That's kind of a sledge-
hammer solution because it will create multiple number spaces and hence
completely avoid the sparse number space for the whole controller. I
think Stephen had originally proposed this as a solution.

The other possibility would be for the GPIO subsystem to gain per-chip
GPIO export via sysfs. That is, instead of the global export file that
you write a global GPIO number to, each per-chip directory would get
an export file. Values written into that file could get translated via
driver-specific callbacks (much like the ->xlate() callback for GPIO
specifiers). I think that's a change that makes sense anyway. Usually
users will know what GPIO controller they want to access and the offset
of the pin therein. Currently they have to somewhat jump through hoops
to get at the right pin (find controller, read GPIO base, add offset to
base and write that to the export file). The new sequence would be much
more straightforward: find controller, write offset to export file. The
new per-chip export file would be flexible enough to deal with compacted
number spaces, which is obviously something we can't do with the global
export file.

Thierry

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYNIC/AAoJEN0jrNd/PrOh+NoP/i/sdTVv3Q751oGnoZlIEEDF
q5b7Yauk+rxtvhjnG8/+h9e7kPgFybbPhfB1XOs6oHTcXhv8eYd/kbF5NrWPoN+H
kljoXyuKhTidaPD5yx1n5/HHnNZrwQNjZDXLIVV6MzTC0A85nTiVow6muNd5CO0t
tWJ80wLb+ZFt5T2Cz7GN2ocaIFo6b3bCRekxOSP7e4wGq41sfqCfJ+Uwqpec3uzq
H+4FS6sHXyfhtI3ekq0inT6bxNBPehaAiv9IUrSbzzCs9Pq1fL+/3wbmnfoC5e7t
nC8dG4vaSen2C4aYuHUEg4eIr3bu81FG1gX69dppMFZBVJHHOfVtF7H2T5u4z5Ig
PRyfCVpAZVIiB4VubFpDNYQyg4AfBBYTlcdRnj/8b4DGo9C8tlwkR0StWIrT74SW
0wMIedPb2RXpth/w/LM7KG/JGmPgjN7moE8y5NeZq5vIHIAvT0Yh1imgKnu5djBG
QSbvSNn5fUWyK02bEgdDSgdnntU2MjkuN0p67d3mA2o7gjkMb/KC9wKrjBwHZH9P
7c6JEhSdfp3A1wPaXCBZ69vSehlwc5PaRyxNMybfIDgjgmyrFyHOTbKV4joUaEnY
LfbxKF+dCybbd+fKFNVagydUHhHKOtGN7lRD1Ry/Dsrr33hprxgoeew82vmK/9lg
48YZFCf17LBz5rTI4Wlg
=AoWD
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
