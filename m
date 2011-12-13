From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v6 04/10] arm/tegra: prepare early init for multiple
 tegra variants
Date: Tue, 13 Dec 2011 13:18:57 +0200
Message-ID: <20111213111857.GV27578@tbergstrom-lnx.Nvidia.com>
References: <1323348254-29072-1-git-send-email-pdeschrijver@nvidia.com>
 <1323348254-29072-5-git-send-email-pdeschrijver@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1750B77A7E@HQMAIL01.nvidia.com>
 <CAMbhsRTD1rQBY7Sn2km=XsUYsHMdqQqZSKu4agc0GB6+QE79fA@mail.gmail.com>
 <20111209111925.GK27578@tbergstrom-lnx.Nvidia.com>
 <CAMbhsRR1HdG6QnNdrnD3y9DApnDR3RrUqFyTt5vZT0qR9n=ECg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMbhsRR1HdG6QnNdrnD3y9DApnDR3RrUqFyTt5vZT0qR9n=ECg@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Colin Cross <ccross@android.com>
Cc: Stephen Warren <swarren@nvidia.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Randy Dunlap <rdunlap@xenotime.net>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, Gary King <gking@nvidia.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 09, 2011 at 07:35:09PM +0100, Colin Cross wrote:
> On Fri, Dec 9, 2011 at 3:19 AM, Peter De Schrijver
> <pdeschrijver@nvidia.com> wrote:
> > On Thu, Dec 08, 2011 at 07:29:43PM +0100, Colin Cross wrote:
> >> On Thu, Dec 8, 2011 at 9:57 AM, Stephen Warren <swarren@nvidia.com=
> wrote:
> >> > Peter De Schrijver wrote at Thursday, December 08, 2011 5:44 AM:
> >> >> This patch splits the early init code in a common and a tegra20=
 specific part.
> >> >> L2 cache initialization is generalized and discovers the cache =
associativity
> >> >> at runtime. Also use arm_pm_restart instead of arm_arch_reset a=
nd reset the
> >> >> the system using the PMC reset feature rather then the CAR syst=
em reset.
> >> >
> >> > This one really should be at least 3 separate patches:
> >> > * s/tegra_init_early/tegra20_init_early/ in machine descriptions
> >> > * Switch reset mechanism from CAR to PMC
> >> > * tegra_init_cache modifications
> >> > * Not sure if all the ifdef additions go in the above, or if som=
e should be
> >> > =A0separate?
> >> >
> >> > Still, I think it's probably OK to go in as it is even if it isn=
't optimal.
> >>
> >> Please at least split out the reset change. =A0Does using the PMC =
reset
> >> instead of the CAR reset still result in a warm reset, or does it
> >> change to a cold reset?
> >
> > What do you consider a cold reset in the tegra world?
>=20
> Power rails turn off and on.  Some of our debugging tools rely on
> memory contents surviving across a reset, and that is generally true
> of a warm reset, but not a cold reset.

Neither of those methods result in a warm reset. In both cases the memo=
ry
controller is reset so the SDRAM won't be refreshed until the memory
controller is reintialized. So there is no guarantee the memory content=
s
will survive the reset.

Cheers,

Peter.
