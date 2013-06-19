From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/2] mfd: tps65910: Fix crash in i2c_driver .probe
Date: Wed, 19 Jun 2013 10:48:50 +0100
Message-ID: <20130619094850.GF22998@laptop>
References: <1371550481-28126-1-git-send-email-ttynkkynen@nvidia.com>
 <1371550481-28126-2-git-send-email-ttynkkynen@nvidia.com>
 <20130619081859.GA22998@laptop>
 <20130619082740.GT7161@zurbaran>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130619082740.GT7161@zurbaran>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Tuomas Tynkkynen <ttynkkynen@nvidia.com>, Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 19 Jun 2013, Samuel Ortiz wrote:

> Hi Lee,
>=20
> On Wed, Jun 19, 2013 at 09:18:59AM +0100, Lee Jones wrote:
> > On Tue, 18 Jun 2013, Tuomas Tynkkynen wrote:
> >=20
> > > Commit "i2c: core: make it possible to match a pure device tree d=
river"
> > > changed semantics of the i2c probing for device tree devices.
> > > Device tree probed devices now get a NULL i2c_device_id pointer.
> > > This caused kernel panics due to NULL dereference.
> > >=20
> > > Moves the of_match_device call from tps65910_parse_dt to .probe t=
o
> > > allow the chip type to be detected from device tree but with the
> > > device parameters coming from platform data.
> > >=20
> > > Signed-off-by: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
> >=20
> > Applied with Stephen's Reviewed-by, thanks.
> According to Wolfgang, this is not needed as he will revert the i2c
> commits that are causing those crashes.
> I would not take it for now.

=46air enough. Unapplied.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
