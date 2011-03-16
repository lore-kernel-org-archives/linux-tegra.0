From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: Move tegra in linux-next merge order
Date: Thu, 17 Mar 2011 09:10:48 +1100
Message-ID: <20110317091048.98b63924.sfr@canb.auug.org.au>
References: <AANLkTikoBGKh9DP1q3ujDBg1fH5Azkahy8RpSO=GqzOR@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__17_Mar_2011_09_10_48_+1100_Cs034us9N65LwMrW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikoBGKh9DP1q3ujDBg1fH5Azkahy8RpSO=GqzOR-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Linux Tegra Mailing List <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Ben Dooks (embedded platforms)" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--Signature=_Thu__17_Mar_2011_09_10_48_+1100_Cs034us9N65LwMrW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Colin,

On Mon, 14 Mar 2011 13:37:01 -0700 Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
>
> I am going to push changes to tegra's for-next branch that will only
> build after the asoc branch is merged, and will include a merge of a
> small part of Ben's next-i2c branch.  Can you move tegra after these
> branches?
>=20
> Should I merge the asoc branch in below the patches that depend on it
> in tegra's for-next tree, or should I push a branch that will not
> build without merging into linux-next?

Sorry I didn't get back to you sooner.  I note that some of the tegra
code has gone into Linus' tree now.

Is the asoc tree you are talking about the sound-asoc tree
(git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound-2.6.git)?
If so, I could move the tegra tree merge to after that.   However, I
dilike having such dependencies in linux-next and much prefer for the
maintainers of the two trees to work it out themselves.

The usual way to do that is for (in this case) the asoc tree to have a
branch that contains the commits that the tegra tree depends on and for
both trees to merge the branch.   This is much better than (say)
cherry-picking the commits into the tegra tree.

The question in my mind is: How are you testing the tegra tree without
merging in the asoc tree anyway?
--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__17_Mar_2011_09_10_48_+1100_Cs034us9N65LwMrW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNgTVoAAoJEDMEi1NhKgbsc6cIAI7qn74IIx3PK/Qs6YBJu2Ia
HF1UrIXMqBSHF3aeoGKkI992smvpvXj/V7elfpN8VXT9KIBO6ygruxZJoB31sxyN
RulZ4b2EnMWn7oDkOfEhTxkdBqldUtsphGO7z0EIetDw7jW0C8iwBRrWMigYx5Tr
CRuDBrjI3zyNubt5kHT8v57WtBExpNHw8ZK/A3HzJ5YTXFn5Zlg8S9dtvbkKUPuG
5QP/KTDZTV5btbyLZt1PJN+h6HhMpmF73pbwN7EW3WtJGOZ2Eelpvej5ZmD7oTF7
6Htj7WkTkfTlTFbx6vhVsElU/gNJjFvJvEUO0Z+YLJtI8oMrkI8J9wtERVelAdE=
=WRWz
-----END PGP SIGNATURE-----

--Signature=_Thu__17_Mar_2011_09_10_48_+1100_Cs034us9N65LwMrW--
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
