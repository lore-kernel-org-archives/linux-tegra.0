From: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [U-Boot] [PATCH 0/2] ARM: tegra: enable GPU DT node
Date: Tue, 4 Aug 2015 23:24:13 +0000
Message-ID: <17113c2735bb46caa20531a106f8e15d@HQMAIL104.nvidia.com>
References: <1436427181-23904-1-git-send-email-acourbot@nvidia.com>
 <55B0D427.2000704@suse.de> <55C0C474.5090200@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, "u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org" <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Guillaume Gardet <guillaume-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Alex/Andreas,

> -----Original Message-----
> From: Tom Warren
> Sent: Tuesday, August 04, 2015 8:41 AM
> To: 'Andreas F=E4rber'; u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
> Cc: Alex Courbot; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; Step=
hen
> Warren; Guillaume Gardet
> Subject: RE: [U-Boot] [PATCH 0/2] ARM: tegra: enable GPU DT node
>=20
> Andreas,
>=20
> > -----Original Message-----
> > From: Andreas F=E4rber [mailto:afaerber-l3A5Bk7waGM@public.gmane.org]
> > Sent: Tuesday, August 04, 2015 6:56 AM
> > To: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
> > Cc: Alex Courbot; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org;
> > Stephen Warren; Tom Warren; Guillaume Gardet
> > Subject: Re: [U-Boot] [PATCH 0/2] ARM: tegra: enable GPU DT node
> >
> > Am 23.07.2015 um 13:46 schrieb Andreas F=E4rber:
> > > Am 09.07.2015 um 09:32 schrieb Alexandre Courbot:
> > >> Tegra124 requires the bootloader to perform VPR initialization,
> > >> otherwise the GPU cannot be used by the system. Since using the =
GPU
> > >> without that initialization results in a hang, the GPU DT node i=
s
> > >> left disabled, and it is the task of the bootloader to enable it
> > >> after ensuring it is safe to use the GPU.
> > >>
> > >> VPR init is already performed since patch df3443dfa449, but the
> > >> device tree was left untouched. This patch series performs this
> > >> last step and prepares the GPU intialization code to receive mor=
e
> > >> code for
> > newer chips.
> > >
> > > Tested-by: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
> > >
> > > I've tested this patchset on v2015.07 with 4.2.0-rc3-00115-gc5dfd=
65
> > > - with these two patches I get a console login on HDMI again.
> >
> > Ping! Independent of the Linux and X11 discussions this thread has
> > drifted off into, these two patches are still missing in v2015.10-r=
c1
> > and don't apply any more (as reported by Guillaume). Can you please=
 rebase
> and merge them?
> Is that request for me? Sorry, lost track of these patches since it a=
ppeared that
> there was an on-going discussion.
> If you're sure they're OK within the context of Tegra U-Boot, I'll ap=
ply them and
> send them with the next PR.
>=20
> Tom
Applied to u-boot-tegra/next (along with some other pending Tegra patch=
es for clocks/PLL/SPI/ums/etc.). I added T210/P2571 support to this pat=
chset.

PTAL.  Also, there doesn't appear to be a 'gpu@0,57000000' property in =
any t124/t210 DT file. Is that coming in another patch or one I missed?

Thanks,

Tom
> >
> > Thanks,
> > Andreas
> >
> > --
> > SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> > GF: Felix Imend=F6rffer, Jane Smithard, Dilip Upmanyu, Graham Norto=
n;
> > HRB
> > 21284 (AG N=FCrnberg)
--
nvpublic
