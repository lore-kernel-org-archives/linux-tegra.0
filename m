From: Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] mailbox: tegra-hsp: mark PM functions as __maybe_unused
Date: Wed, 19 Jun 2019 09:57:49 +0200
Message-ID: <CADYN=9KUXdnmpEHRY7CGCpQa3H4C0M=a3wyNueXkgpssSdik6A@mail.gmail.com>
References: <20190108143713.15120-1-anders.roxell@linaro.org>
 <20190110081615.GD5213@ulmo> <CADYN=9LtpcJMbcUHN0Eg4bsYoX7f+xm_KiJ_3fE15-5k6mwC5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CADYN=9LtpcJMbcUHN0Eg4bsYoX7f+xm_KiJ_3fE15-5k6mwC5g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: jassisinghbrar@gmail.com, jonathanh@nvidia.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, 19 Jun 2019 at 09:56, Anders Roxell <anders.roxell@linaro.org> wrot=
e:
>
> On Thu, 10 Jan 2019 at 09:16, Thierry Reding <thierry.reding@gmail.com> w=
rote:
> >
> > On Tue, Jan 08, 2019 at 03:37:13PM +0100, Anders Roxell wrote:
> > > Without CONFIG_PM_SLEEP, we get annoying warnings about unused
> > > functions:
> > >
> > > drivers/mailbox/tegra-hsp.c:782:12: warning: =E2=80=98tegra_hsp_resum=
e=E2=80=99 defined but not used [-Wunused-function]
> > >  static int tegra_hsp_resume(struct device *dev)
> > >             ^~~~~~~~~~~~~~~~
> > >
> > > Mark them as __maybe_unused to shut up the warning and silently drop =
the
> > > functions without having to add ugly #ifdefs.
> > >
> > > Fixes: 9a63f0f40599 ("mailbox: tegra-hsp: Add suspend/resume support"=
)
> > > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > > ---
> > >  drivers/mailbox/tegra-hsp.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Acked-by: Thierry Reding <treding@nvidia.com>
>
> Will this be picked up ?

its already solved.

Sorry for the noice. =3D/

Anders

>
> Cheers,
> Anders
