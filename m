From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 2/2] clk: tegra20: Enable lock-status polling for
 PLLs
Date: Mon, 10 Dec 2018 03:58:36 +0300
Message-ID: <20181210035836.602757d5@dimatab>
References: <20180830184210.5369-1-digetx@gmail.com>
        <20180830184210.5369-2-digetx@gmail.com>
        <20180831092948.GP1636@tbergstrom-lnx.Nvidia.com>
        <1539773948.6233.23.camel@toradex.com>
        <2a011477-26cb-7e89-a468-54a84465f178@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2a011477-26cb-7e89-a468-54a84465f178@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, "pdeschrijver@nvidia.com" <pdeschrijver@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

=D0=92 Wed, 17 Oct 2018 14:41:35 +0300
Dmitry Osipenko <digetx@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> On 10/17/18 1:59 PM, Marcel Ziswiler wrote:
> > On Fri, 2018-08-31 at 12:29 +0300, Peter De Schrijver wrote: =20
> >> On Thu, Aug 30, 2018 at 09:42:10PM +0300, Dmitry Osipenko wrote: =20
> >>> Currently all PLL's on Tegra20 use a hardcoded delay despite of
> >>> having
> >>> a lock-status bit. The lock-status polling was disabled ~7 years
> >>> ago
> >>> because PLLE was failing to lock and was a suspicion that other
> >>> PLLs
> >>> might be faulty too. Other PLLs are okay, hence enable the lock-
> >>> status
> >>> polling for them. This reduces delay of any operation that require
> >>> PLL
> >>> to lock.
> >>>
> >>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>> ---
> >>>
> >>> Changelog:
> >>>
> >>> v2:	Don't enable polling for PLLE as it known to not being
> >>> able to lock.
> >>> =20
> >>
> >> This isn't correct. The lock bit of PLLE can declare lock too
> >> early, but the
> >> PLL itself does lock. =20
> >=20
> > Is there an errata documenting this? As I could not really find any
> > mentioning of this anywhere at least up to the v11 from Dec 21,
> > 2010 I still have access to.
> >=20
> > BTW: It looks like also PLLA may not always lock properly with those
> > changes. Is there anything known about that as well? Here is what I
> > get on various Colibri T20 modules (while random other ones seem to
> > work fine): =20
> Could you please try to increase the timeout value?

Hello Marcel,

Do you have any update on the PLL-lock-failure problem?
