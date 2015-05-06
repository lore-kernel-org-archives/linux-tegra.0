From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 00/20] Tegra210 Clock Support
Date: Wed, 6 May 2015 15:37:54 +0200
Message-ID: <20150506133748.GD9421@ulmo>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
 <20150505131419.GA11535@ulmo.nvidia.com>
 <5548E7E9.3040802@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OaZoDhBhXzo6bW1J"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5548E7E9.3040802@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--OaZoDhBhXzo6bW1J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2015 at 11:55:21AM -0400, Rhyland Klein wrote:
> On 5/5/2015 9:14 AM, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Mon, May 04, 2015 at 12:37:20PM -0400, Rhyland Klein wrote:
> >> This patch series updates the tegra common clock driver and adds
> >> support for the Tegra210 clocks. The clocks in Tegra210 changed
> >> significantly in some ways from earlier generations, so to support
> >> them, we need to extend our base framework a bit and add some new
> >> features.
> >>
> >> Some patches here also address issues found while adding features
> >> and other cleanup type work.
> >>
> >> v4:
> >>   - Fixed minor checkpatch errors and other typos
> >>   - Rebased ontop of linux-next 20150504
> >=20
> > Are you sure about this? It still doesn't apply cleanly to next-20150504
> > for me.
>=20
> It is based off c9256b89d92154cffd36697b412d0a0176a8e2d2 "Add linux-next
> specific files for 20150504"
>=20
> What types of problems are you running into?

I get this when applying the first patch:

	Applying: clk: tegra: Modify tegra_audio_clk_init to accept more plls
	error: patch failed: drivers/clk/tegra/clk.h:258
	error: drivers/clk/tegra/clk.h: patch does not apply
	Patch failed at 0001 clk: tegra: Modify tegra_audio_clk_init to accept mor=
e plls
	The copy of the patch that failed is found in:
	   /home/thierry.reding/src/kernel/linux-work.git/.git/rebase-apply/patch
	When you have resolved this problem, run "git am --continue".
	If you prefer to skip this patch, run "git am --skip" instead.
	To restore the original branch and stop patching, run "git am --abort".

Comparing again and looking at your internal tree it seems that in
addition to next-20150504 you also have this patch in your tree:

	clk: tegra: Fix comments for structure definitions

After applying that I can apply the series without problems. I've picked
that patch up and will carry it in the Tegra clock branch. Hopefully the
Tegra210 clock patches will be ready in time for v4.2 so that I can take
them into the same branch.

Thierry

--OaZoDhBhXzo6bW1J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVShkqAAoJEN0jrNd/PrOho6gQALYraZaGUWehu9wH9WLFu2ut
no7CiTTY5QvHjQ+DGcMaDF40wOYHIW9E12x/uIbqCG1mIEs64/cjLnOokNKb39Mj
l8wHoqmM1Sezrfsjw96X7Mwu2qBTAW+q3xGSUE1QR1pDnHGcUdSvtvYyG/xluEku
zb2RjH0AN8pIJZali0E049bNY4ldLuCm/5af+xYTGVZKgB9c9lj1nVcl8nZEt/B3
gUMQpBVrfLNOKZbpGvd3VMOAYzKzilObuE6YkVs0r+8Qz896ddfCLVDy/LlN1iCN
nu69HgJYczIiZUhJ8tClZcEAP+ozGlhQcLWY3aUfk3QLgykU3gUEKUNywzBZUsKE
fi9oO8+iDVM2YAWvZ9GwECdeGST8gX4kGcF1RZjDS/r+oVWrp3SnustaP0Rw4PuK
w5ixOpqmm6+JdOjPDNgoCTYpguwehCnvWxpD8GaGxp+FQajdiOxg85h5LIHXcVCq
2fUjuHjQfzRWQ1rbyd4QDSpByXnaqhfcqm62yq0YblUHvu+ycumXoGxBVCze9f1j
xnhL/NQQU5Gvn7T8axYnqNoyKL7NZRcX2Uwv05CJsVailx51KVoJTavwvj57ME8F
o4TgETCk3NKXXhZo9FNtCw+ooL9bRZWP5qXEhqBWgLR9FNiD+sM0853pAjcsO5/m
l7XS+yun3bMBcxHm/M+7
=qmk2
-----END PGP SIGNATURE-----

--OaZoDhBhXzo6bW1J--
