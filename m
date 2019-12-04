From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [TEGRA194_CPUFREQ Patch 1/3] firmware: tegra: adding function to
 get BPMP data
Date: Wed, 4 Dec 2019 10:33:39 +0100
Message-ID: <20191204093339.GA2784830@ulmo>
References: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
 <20191203174229.GA1721849@ulmo>
 <9404232d-84ce-a117-89dd-f2d8de80993e@kapsi.fi>
 <20191204091703.d32to5omdm3eynon@vireshk-i7>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191204091703.d32to5omdm3eynon@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Sumit Gupta <sumitg@nvidia.com>, rjw@rjwysocki.net, catalin.marinas@arm.com, will@kernel.org, jonathanh@nvidia.com, talho@nvidia.com, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bbasu@nvidia.com, mperttunen@nvidia.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2019 at 02:47:03PM +0530, Viresh Kumar wrote:
> On 04-12-19, 10:45, Mikko Perttunen wrote:
> > Now, my original patchset (which this series is based on) did add
> > nvidia,bpmp properties on the CPU DT nodes itself and query BPMP based =
on
> > that. A change is still required for that since tegra_bpmp_get() curren=
tly
> > takes a 'struct device *' which we don't have for a CPU DT node.
>=20
> I may be missing the context, but the CPUs always have a struct device
> * for them, which we get via a call to get_cpu_device(cpu), isn't ?

Yeah, the code that registers this device is in drivers/base/cpu.c in
register_cpu(). It even retrieves the device tree node for the CPU from
device tree and stores it in cpu->dev.of_node, so we should be able to
just pass &cpu->dev to tegra_bpmp_get() in order to retrieve a reference
to the BPMP.

That said, I'm wondering if perhaps we could just add a compatible
string to the /cpus node for cases like this where we don't have an
actual device representing the CPU complex. There are a number of CPU
frequency drivers that register dummy devices just so that they have
something to bind a driver to.

If we allow the /cpus node to represent the CPU complex (if no other
"device" does that yet), we can add a compatible string and have the
cpufreq driver match on that.

Of course this would be slightly difficult to retrofit into existing
drivers because they'd need to remain backwards compatible with existing
device trees. But it would allow future drivers to do this a little more
elegantly. For some SoCs this may not matter, but especially once you
start depending on additional resources this would come in handy.

Adding Rob and the device tree mailing list for feedback on this idea.

Thierry

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3nfW4ACgkQ3SOs138+
s6EIBg//a33VPigHL3zRzIUiZIv2SFgdhCGaVV3e7V9z0U/4X7XG5IjvjUG7ISo6
9/GToldoBLjsmrJ9RmHniEBjuR9af4X3MwnqjRwXMkCKIU64wV70CmTluzFsjV79
SLwNhFLHqkjQlBXyuk6/DTvTcouVR2jlmQqffGDCzI7ZYmlHI/Xy9aLR6bdmwtgU
TfaGwkRbI7uzy1QOWQv5Ed/02JJUT/vWoeL77SN7lBIY39ublmVSO9rB7Y+ZMnpJ
bv2oxl8Gfq0Re5Qfv+vU/aigDlzg8E3aKlHKv7B0yfKcYexN6q3zP3kAwWlwiybn
XYhKfO7BUnocYKojIUKnufQa4Zh3DIvseivUmSVPchNEcyUPNyDY+kr9ENcrxO18
Nim4nwnVPtOq8IXVnAtl+96AMp5bsrDDJIbTkhRAX4+A16y3BWtxcpVE1oxXdBVc
itup4GIYycanGGdlrkVwtbvehoZGVnleMiJ47naJBZK6HnRqp9T46H50i2SEXp7V
kJHhLpSFaiCqxfSAHcjLnm+rpc4S0aNJ0s4W9Q2NKGpZvfpEid4a+sW5L7pWPL56
Q5ozI4pP8STS2DsbMRtiXYXYHoG9NQFtfWQwhWgtNHQgqlVKnJc2wGAE4lLQx0dU
aEDCx5ImpUEngi26C7Zd+8ja0Y1FHbg+tELsHWytryF+YfUNmUI=
=uBL9
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
