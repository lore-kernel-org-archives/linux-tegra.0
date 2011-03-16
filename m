From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: Move tegra in linux-next merge order
Date: Thu, 17 Mar 2011 10:13:15 +1100
Message-ID: <20110317101315.8627485f.sfr@canb.auug.org.au>
References: <AANLkTikoBGKh9DP1q3ujDBg1fH5Azkahy8RpSO=GqzOR@mail.gmail.com>
	<20110317091048.98b63924.sfr@canb.auug.org.au>
	<20110316221522.GF15605@opensource.wolfsonmicro.com>
	<20110317095016.e0fd4012.sfr@canb.auug.org.au>
	<20110316225459.GG15605@opensource.wolfsonmicro.com>
	<AANLkTinfqA4rKk2z9Hjgd-j0FS12Mm2ktmhfPZfb-HKd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__17_Mar_2011_10_13_15_+1100_od_6ez/K3Tt3ppE_"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinfqA4rKk2z9Hjgd-j0FS12Mm2ktmhfPZfb-HKd-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Linux Tegra Mailing List <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Ben Dooks (embedded platforms)" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--Signature=_Thu__17_Mar_2011_10_13_15_+1100_od_6ez/K3Tt3ppE_
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 16 Mar 2011 15:58:26 -0700 Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
>
> On Wed, Mar 16, 2011 at 3:54 PM, Mark Brown
> <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> > On Thu, Mar 17, 2011 at 09:50:16AM +1100, Stephen Rothwell wrote:
> >
> > I wouldn't even need to create a branch, that doesn't make any practical
> > difference over working directly with the commit ID. =C2=A0Colin wasn't
> > enthusiastic about merging the fairly active ASoC tree into Tegra, and
> > the Tegra side changes depend on other Tegra changes so the reverse
> > merge was an issue also.

The advantage of a branch would be that if this was ongoing and fixes
needed to be applied to the asoc code, the they could be applied to that
branch and remerged into both trees.   This actually happened this time
round with the tip:irq tree and the net tree.

> > Given how trivial the change is it may as well just get dropped in in
> > -rc1 - I really don't understand the handwringing here.

Well, I wasn't aware of how much was involved ...

> The only issue is that the branch that is being merged by linux-next
> is untestable on it's own.  But we can ignore the problem until the
> asoc tree is merged into master, at which point the problem goes away.
>  I plan to send a second pull request to Linus as soon as asoc is in,
> we shouldn't need to wait for rc1.
>=20
> We made sure the patches that depend on the asoc tree are at the top
> of the stack for 2.6.39.  I do my testing on the last patch that
> compiles without asoc (which is what got pulled into master today),
> and rely on the people working with the board that depends on asoc to
> test the last few patches.

OK, thanks guys.

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__17_Mar_2011_10_13_15_+1100_od_6ez/K3Tt3ppE_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNgUQLAAoJEDMEi1NhKgbshocIAIopge8OvkN3ZrhuBRrbFJg7
h9dzXfzmPsaUgTJr0Pkwr5/UCOVsFWuWNRrk8ohyLg+ezDurEjho2/kVWmr5z8r/
4rsRvgoZEZH7VRjFPyWnm/H1IPdA8z9EQ4cDwTIdKnS4gmnYTegbL2dyxb220s9o
3aD+4KkL0hMnNmJn7QKFQwdo4BCH4pkUo9/QTXTLi7DEM/bDcNuJxz1bYea9Ev8f
2TYxzlwZ9rgKtBoUl5vmdib/GMC+Xf6//88X4JtLBYqD7pqjjCac0zvtt8pxjgdb
5OewVRKaLo/dqaJhNxR6S7d+eh/UgtHuB+jgob5b5Qiiljgas3LvevkulldV/QM=
=s4SG
-----END PGP SIGNATURE-----

--Signature=_Thu__17_Mar_2011_10_13_15_+1100_od_6ez/K3Tt3ppE_--
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
