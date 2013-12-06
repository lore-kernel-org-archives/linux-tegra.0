From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 1/3] mfd: tps6586x: add version detection
Date: Fri, 6 Dec 2013 15:34:36 +0000
Message-ID: <20131206153436.GB23519@lee--X1>
References: <cover.1386333697.git.stefan@agner.ch>
 <7812fb79beac0a6a409090f43d129893f9f93b5b.1386333697.git.stefan@agner.ch>
 <20131206142605.GA32363@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131206142605.GA32363@ulmo.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>, swarren@wwwdotorg.org, dev@lynxeye.de, lgirdwood@gmail.com, broonie@kernel.org, kai.poggensee@avionic-design.de, sameo@linux.intel.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 06 Dec 2013, Thierry Reding wrote:

> On Fri, Dec 06, 2013 at 01:51:45PM +0100, Stefan Agner wrote:
> > Use the VERSIONCRC to determine the exact device version. According=
 to
> > the datasheet this register can be used as device identifier. The
> > identification is needed since some tps6586x regulators use a diffe=
rent
> > voltage table.
> >=20
> > Signed-off-by: Stefan Agner <stefan@agner.ch>
> > ---
> > Changes since v4:
> >   - Use variable named version instead of ret
> >=20
> > Changes since v2:
> >   - Avoid moving devm_kzalloc
> > ---
> >  drivers/mfd/tps6586x.c       | 50 ++++++++++++++++++++++++++++++++=
+++++-------
> >  include/linux/mfd/tps6586x.h |  7 +++++++
> >  2 files changed, 49 insertions(+), 8 deletions(-)
>=20
> I think I also already gave my Reviewed-by on both this and 2/3, neit=
her
> of which changed significantly enough to warrant that to be dropped. =
In
> general it's fine to keep Reviewed-by and Acked-by as long as you're
> only changing minor things.

Don't worry Thierry, I'll ensure they are applied.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
