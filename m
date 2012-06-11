From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/2] ARM: dt: tegra: cardhu: register core regulator
 tps65911
Date: Tue, 12 Jun 2012 00:20:41 +0800
Message-ID: <20120611162040.GB4194@opensource.wolfsonmicro.com>
References: <4FBBCA8F.3050903@wwwdotorg.org>
 <4FBBD33C.8020802@nvidia.com>
 <4FBBDA97.6000006@wwwdotorg.org>
 <4FBBDE06.5080806@nvidia.com>
 <4FC916AC.4060804@wwwdotorg.org>
 <4FD250DB.2090207@nvidia.com>
 <20120609030608.GF3924@opensource.wolfsonmicro.com>
 <4FD2CFE6.9070500@wwwdotorg.org>
 <20120611025717.GE28211@opensource.wolfsonmicro.com>
 <4FD6151E.8010405@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FD6151E.8010405@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, "olof@lixom.net" <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 11, 2012 at 09:56:14AM -0600, Stephen Warren wrote:

> * Each regulator-id/regulator-compatible value identifies a specific
> individual regulator within the chip that contains it. There is only one
> of each named regulator, since that's what exists in HW. So, this is
> about configuring HW that we know exists (because it's part of the HW
> represented by the parent node for the chip) rather than defining which
> HW is present on unprobeable busses, as the device-level compatible does.

> Given those differences, I really think that using "compatible" in the
> name of the property is just going to cause confusion.

This doesn't seem terribly different to me especially in some of the
cases people want to use this for where we try to describe the
subfunctions of the chip using this mechanism.  You have a fixed set of
regulators that might exist in a superset device (possibly with some
incompatibilities, or with additional properties providing more data on
the hardware) and then you mix and match what's in the system based
on the nodes you register for the subset device you're using.  This sort
of thing is actually much more idiomatic with DT than it is with
platform data (look at how people want to put device nodes in for the
MFD subfunctions all the time...).

Really all compatible is saying to me is "here's how you understand
this, handle it like an X" and this feels exactly the same.

Of course, if someone could just fix the DT to actually be able to do
key/value pairs, or allow us to do something useful with the
"regulator" string we need to put in there...

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP1hrRAAoJEBus8iNuMP3d1MMQAJtqihNjR043SWYSWFqvAAWJ
uUWCiSzu1eXPx3V+fHTk8D0x8nXpIS1I+0+BveGb3MIhE26ghFK66hMxvUlQXl/Y
GMER0RP8aujorK/tHXVsfuZ9OJh+4NIbsrgThTUHBydP3RXlQZLUdNPRT7Okhvbw
nZhxDlkBzUHJPnMEG/HlFfTEw1ue9LENcwuYprB3H+DC6Q7JaoiCJUGDvPrqmDvk
oc4Br+PjFN0eqh2Fnm3u+t6Jl9w5TGzoBNfcyBIa/iiNzbp3GF0ZhHRBpTx6gIvG
v9R4DikztBzB+RLBG81LSYWm+/zYtWHuyV6fu0bJ8saV1R8Je36R8YK1oO8/BhQ9
UU5A45y/ejRJcwfjQhD+feLgTo9+raipdRpw9oLyXztJ7tPMnAYsHxOTd/FunPeL
uhsOzg35XMo4xZAKd5wt8QIAFiETM8oIYhi3VYSb800D+StgBIaD62XcJAgcEJQl
wmtor2Bo7eCtbmZGI55o/LU0YJehw+peGdnA3utoLPutVvZ8hFewO97EuSeel+wW
Fa0llrs1wRyvkUdztu59i0Ml+YREkKuIR8/xi2d1adiJaZXLxFV7M6ANX2NWXZ8b
wL1BZ2ZyrOMc+4Njvmo3mYmJX5cG1lJOIkSyx/6C75cHy1SI7CUExi8JydlbklZL
PCPntsdDbq2JQhcolziq
=plzL
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
