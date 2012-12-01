From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC v2 1/8] video: tegra: Add nvhost driver
Date: Sat, 1 Dec 2012 14:42:18 +0100
Message-ID: <CAKMK7uGnm7M5ad=aeCNiFLYXbJZ9Nx-vsGrstjt5_3BcrqWVqA@mail.gmail.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	<1353935954-13763-2-git-send-email-tbergstrom@nvidia.com>
	<20121128212301.GA25531@avionic-0098.adnet.avionic-design.de>
	<50B73710.2040102@nvidia.com>
	<20121129114704.GB6150@avionic-0098.adnet.avionic-design.de>
	<50B874C7.5030208@nvidia.com>
	<20121130103850.GA28367@avionic-0098.adnet.avionic-design.de>
	<50B9EA76.10803@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50B9EA76.10803@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>
Cc: Thierry Reding <thierry.reding@avionic-design.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Dec 1, 2012 at 12:31 PM, Terje Bergstr=F6m <tbergstrom@nvidia.c=
om> wrote:
> We must've talked about a bit different things. For pure register def=
s,
> I can accommodate changing to #defines. We'd lose the code coverage
> analysis, though, but if the parentheses are a make-or-break question=
 to
> upstreaming, I can change.

Out of sheer curiosity: What are you using the coverage data of these
register definitions for? When I looked into coverage analysis the
resulting data seemed rather useless to me, since the important thing
is how well we cover the entire dynamic state space of the hw+sw (e.g.
crap left behind by the bios ...) and coverage seemed to be a poor
proxy for that. Hence why I wonder what you're doing with this data
=2E..
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
