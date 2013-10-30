From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] HACK: clk: tegra: Do not mark PLLE as fixed
Date: Wed, 30 Oct 2013 21:44:33 +0100
Message-ID: <20131030204432.GA7686@mithrandir>
References: <1383057631-32668-1-git-send-email-treding@nvidia.com>
 <52700F86.2080103@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52700F86.2080103-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2013 at 01:41:58PM -0600, Stephen Warren wrote:
> On 10/29/2013 08:40 AM, Thierry Reding wrote:
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> What does this patch solve? A description would be nice.
>=20
> I thought that this PLL essentially was fixed; while it may have some
> registers than /can/ change the rate, hasn't the HW team only
> characterized it to run at the single frequency that PCIe requires,
> hence SW is supposed to treat it as fixed?

Peter fixed it up properly. As indicated by the HACK: tag, this was
really only a workaround to make Dalmore boot again. PLLE didn't use to
be marked as fixed, which seems to be the reason why we've never seen
this.

Thierry

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJScW+wAAoJEN0jrNd/PrOhrNAQAI+BiwAAfOITE9BlrqPrzYR6
8hJzMvrb9w+GB+dKCjKFGo7e8fHjy5G/4TNNNRJCeay6EKT0MMmtzm+QyjHcrOCT
1pIWkhiTvEcsRr8B/wPi7DkG/J+bsJhMhzHDpg6yTSwBcz2zpqtvQRPhMZ0OhrSK
joVvMRxu6Xpyy9nZ24zvHE01C+Q2Y+4ip3Jy7vfmIaMo447VxS9/JcxmJKv8G3BP
1ph29t5ZVI75tWXJaeyg6JlpnzZiCbKHv8sXFWKpoXwofhufvwWDiDbUKmQUVsu9
eIqeHQ2dpIDh7c5GwxBhSt6qWHornaPwi0g6jSZBjgYwBM+bKwFIG0mP9OkPtkok
Z6ai2tfNIvyzP3DPl8tYiIGLWw/eSYsFMndn5c3kp1IQZmgcV9n4MVUqPCT+mvbX
cb9DGlHlmlp0aRMd/g23S4OBma24hzrvGvmwB1Bsq/ra05OjjuGF8PRykwICO8EC
MeLJNSu4vi7tyLer1Jbto5dkUS6SXm/D/yWBDSWorhF53i5TBXywUu5UP/DdRAKH
4ISQhX5Z0xipaSyUmoI+TxY1oMTyH7Hol4sVZ1hxo+bkYvLvxfAgZ84HLWp6FoGw
MAzhLMFB0fMBMYkaziF4dXcv+REHMgbIuqoz5oXTOw0AtKKJwV1/HqDrspfVNWT1
R3lqX+UN8aEraDdZeD1V
=NR9C
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
