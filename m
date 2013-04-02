From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [RESEND/PATCH] usb: host: ehci-tegra: fix PHY error handling
Date: Tue, 2 Apr 2013 21:00:57 +0300
Message-ID: <20130402180057.GA21497@arwen.pp.htv.fi>
References: <1363868603-14525-1-git-send-email-balbi@ti.com>
 <514B4137.2020707@wwwdotorg.org>
 <20130402083604.GJ30286@arwen.pp.htv.fi>
 <515AFA64.3050107@wwwdotorg.org>
 <20130402154410.GL22014@arwen.pp.htv.fi>
 <515B17ED.7010709@cogentembedded.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <515B17ED.7010709-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 02, 2013 at 09:39:57PM +0400, Sergei Shtylyov wrote:
> >>>>On 03/21/2013 06:23 AM, Felipe Balbi wrote:
> >>>>>PHY layer no longer returns NULL, we must switch from
> >>>>>IS_ERR_OR_NULL() to IS_ERR().
> >>>>The patches that I'll put into my topic branch are not yet
> >>>>complete; Venu first posted them a couple days back and there are
> >>>>a number of issues that will require a repost.
> >>>is your topic branch ready now ? I'm about to close my tree for
> >>>v3.10, we already have -rc5 tagged and I want to leave my pull
> >>>request cooking in next for a while.
> >>Unfortunately not.
> >>
> >>Venu's patch series had a bunch of runtime bugs, and I also found out
> >>that the DT binding /still/ wasn't fully thought out. As such, this
> >>series won't be applied for 3.10.
> >>
> >>I still have a vague (and probably naive) hope that the updated
> >>bindings and DT file modifications can be applied on the Tegra side in
> >>the next few days so that for 3.11 there won't be any inter-tree
> >>dependencies. However, we'll just have to wait and see whether Venu
> >>has found the bugs yet.
> >alright, so I'll go ahead and close my 'next' branch for v3.10,
> >tomorrow. Leave it in linux-next for a few days and send my pull request
> >to Greg by Friday.
> >
> >Let me just check if there are any other important features to go in
> >v3.10 which won't cause big regressions.
>=20
>    I was going to post some cleanup/features for
> drivers/usb/phy/rcar-phy.c today
> or tomorrow. So am I already late for 3.10?

if it comes today (before midnight in UTC +2, so in less than 3 hours),
I can still apply.

--=20
balbi

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRWxzZAAoJEIaOsuA1yqRExUEP/0sBrV+/By4xZ1yHePQNoTfu
NStRbkERTxjCf5oo5E/2ZHOyyhrYY7POebQgG8aOSckXKS0iTrwIRESelpoOH+XI
MDMhCMc91JrSe4af7RqCyu9grFDUcv/wsm/EpRjHFX81LK8IjtBBNXCS2J2ETnkj
CGc0ySYecSnMJdtjtrtIYzCfp8ncyYRilTE/8LSddX/ZRB6QxkvTzEZwFEy9ec8t
0cSxuSgfG8R4oCdsD8elPE03vWgZMyeMghuywo1DCQAKKEzNehfQL3sNJJ8QToWe
o2sYKWTSjtTzmtdNp+WNvaqvgyVD7iFEAQ+NA193Opfcb2YYORrm7l9FDsXgzmYp
Eq6bDqKmQy6Ag/yz7s1Lg54S/sr9f6k0QBvf0V8z7xAL93JwNfGfBIEvovsUqiFk
MaYxu6jLs9kWB1icNsfHTtxPY7zfp4yQKAvxdrG1sx1VaBQsu++A1qmSJJ59UWEq
tpEm0Ke/KDZE5xWGYWtEMsb+ypPZv+1AwPwv0MVg+J+wST+GlH7L9FEd6cGj/vSD
XuXyc9mtyQABoV/Gb6ip9gdOfKm56sJWkLB9t71ZjgAPw1A5KUuFI+UeginXbdnB
FB4lgQrDTlGIyP9fHGdiFdT5CviqpyZX7GQg5Y5K5tmutPEO82JPHwlEv9d26CGP
h550B7Dtgmw03GDE97Im
=H8KC
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
