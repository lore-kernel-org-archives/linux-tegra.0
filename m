From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: Break insecure users by disabling
 bypass by default
Date: Thu, 2 May 2019 14:45:25 +0200
Message-ID: <20190502124525.GA3579@ulmo>
References: <20190301192017.39770-1-dianders@chromium.org>
 <20190404145957.GA25912@fuggles.cambridge.arm.com>
 <4754bcf1-6423-f1fe-64d4-da4a35b164ad@free.fr>
 <20190424115231.GA14829@fuggles.cambridge.arm.com>
 <20190502105912.GA943@ulmo>
 <20190502110821.GD30966@fuggles.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4341793161477368990=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190502110821.GD30966@fuggles.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>, Joerg Roedel <joro@8bytes.org>, Douglas Anderson <dianders@chromium.org>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org


--===============4341793161477368990==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 12:08:21PM +0100, Will Deacon wrote:
> On Thu, May 02, 2019 at 12:59:12PM +0200, Thierry Reding wrote:
> > On Wed, Apr 24, 2019 at 12:52:31PM +0100, Will Deacon wrote:
> > > On Wed, Apr 24, 2019 at 01:36:58PM +0200, Marc Gonzalez wrote:
> > > > On 04/04/2019 17:00, Will Deacon wrote:
> > > >=20
> > > > > On Fri, Mar 01, 2019 at 11:20:17AM -0800, Douglas Anderson wrote:
> > > > >
> > > > >> If you're bisecting why your peripherals stopped working, it's
> > > > >> probably this CL.  Specifically if you see this in your dmesg:
> > > > >>   Unexpected global fault, this could be serious
> > > > >> ...then it's almost certainly this CL.
> > > > >>
> > > > >> Running your IOMMU-enabled peripherals with the IOMMU in bypass =
mode
> > > > >> is insecure and effectively disables the protection they provide.
> > > > >> There are few reasons to allow unmatched stream bypass, and even=
 fewer
> > > > >> good ones.
> > > > >>
> > > > >> This patch starts the transition over to make it much harder to =
run
> > > > >> your system insecurely.  Expected steps:
> > > > >>
> > > > >> 1. By default disable bypass (so anyone insecure will notice) bu=
t make
> > > > >>    it easy for someone to re-enable bypass with just a KConfig c=
hange.
> > > > >>    That's this patch.
> > > > >>
> > > > >> 2. After people have had a little time to come to grips with the=
 fact
> > > > >>    that they need to set their IOMMUs properly and have had time=
 to
> > > > >>    dig into how to do this, the KConfig will be eliminated and b=
ypass
> > > > >>    will simply be disabled.  Folks who are truly upset and still
> > > > >>    haven't fixed their system can either figure out how to add
> > > > >>    'arm-smmu.disable_bypass=3Dn' to their command line or revert=
 the
> > > > >>    patch in their own private kernel.  Of course these folks wil=
l be
> > > > >>    less secure.
> > > > >>
> > > > >> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> > > > >> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > >> ---
> > > > >>
> > > > >> Changes in v2:
> > > > >> - Flipped default to 'yes' and changed comments a lot.
> > > > >>
> > > > >>  drivers/iommu/Kconfig    | 25 +++++++++++++++++++++++++
> > > > >>  drivers/iommu/arm-smmu.c |  3 ++-
> > > > >>  2 files changed, 27 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > Cheers, I'll pick this one up for 5.2.
> > > >=20
> > > > Hello Will,
> > > >=20
> > > > You haven't pushed this patch out to linux-next AFAICT.
> > > >=20
> > > > Is that expected?
> > >=20
> > > It's on my branch for Joerg:
> > >=20
> > > https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=
=3Dfor-joerg/arm-smmu/updates
> > >=20
> > > which I'll send to him today. My SMMU stuff doesn't go directly into =
-next.
> >=20
> > This made it to linux-next yesterday (less than a week before the merge
> > window opens) and deliberately breaks existing configurations. That's a
> > little rude.
> >=20
> > At least give people a fair heads-up and a chance to fix things before
> > you start break things.
>=20
> Sorry about the inconvenience here.
>=20
> This patch has been floating around for a while (albeit not in -next, sin=
ce
> I send my stuff via Joerg)

You can't expect people to test random patches from the list if they're
not on Cc. I don't think it's safe to claim that patches have been well
tested until they've been in linux-next for at least a couple of days.

>                            and is heading for 5.3, so you have ages to fix
> up your config!

Last I checked, Joerg applied this for 5.2 because you sent it as part
of your "Updates for 5.2" pull request.

>                 It would, of course, be better to configure the IOMMU to
> provide mappings for your DMA peripherals, but the trivial config change
> will be enough to keep things working. We won't remove that as long as
> people are relying on it.

I don't think the Kconfig option is really useful. People nowadays want
to run standard distribution kernels on their devices, and distribution
maintainers will often rely on kernel developers' guidance on what good
defaults are. This patch suggests that the default should be to disable
bypass, so if this hits 5.2 final and distributions create their kernel
packages, they're likely going to go with this default and potentially
break things for many of their users.

Luckily this seems like it's fairly easy to fix, but given that we're
past v5.1-rc6, fixes for this now need to get special treatment. That
would've been okay if this was a pressing issues, but this is changing
something that's worked this way for ages, so it's hardly urgent.

> I don't expect most people to run into problems with this change (the new
> behaviour matches what SMMUv3 does already).

I see the ARM SMMU v2 used in quite a few DTS files. Not all of these
may be problematic, but I'd be somewhat surprised if Tegra was the only
one impacted.

Thierry

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzK5mIACgkQ3SOs138+
s6HzUw/9Ho3gx6dnIoGJ+5uU7d1SAgAKBBPOWQvaPjm0w91NvvEkkcLuL9YpKLif
O3rxBvCTDshxmb4sjOtqF9KSmVHA2FDp3KGJbi6UXkr+mPSijk3sqsx3qU+dzXl8
8BEzHkVYO4ja/DUODp6lJIzilZSAcBt8h5aoKugDUm953ahF82wLlpXb44VblX0z
lVE0qBYEjkKcENfOhcwvqqsjtYoEp7jEFwoC51XlQSG9Eq07Tg+iyS8+3Sf8Zm1U
vq8ohSIFn9i2uDbLfrVkiLtHV/mAVPH14KQZ92r2HFso7pP2xdJm5gVeVznK2QLj
lmNiCPV+1n4nRfFZQX+9BcweIyUKIZH1xk98fRNuL1AFdsnurdoJwa0sNd9keBXN
TIv5aKm/vu7TYCu7f6IOQyYMhWXCkobL3a1skYoBDzBSzlChIPKu7r5bbvWhZSxh
xrsbihEFdyvVLYikJK7qW372O9NM+GhDlGf4FlR5zMjun0C9+OQ/vOJen0sItmA+
lE1xMvTt6YvtMiYig8z2ne221mYdDU45dSioE8Bv1SI+9eEia5szTucUfAtz0cep
8IW/tygT6hrRFWWCyfVsh9tOJpiIews7FVeYTgEKqVSTIJrUrTwJOArj1iYHsAiH
U0be0Tk+I695rWFeTQu2rLNVETq4RmRHxvU6Ke4QBo3/ycP1aAc=
=BAzO
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--


--===============4341793161477368990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4341793161477368990==--
