From: Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v1 07/17] cpufreq: tegra20: Use generic cpufreq-dt driver
 (Tegra30 supported now)
Date: Wed, 16 Oct 2019 10:58:25 -0400
Message-ID: <CAMdYzYoasuEobJLC4RLW_5WCNGnaKtTth0xKov0tUQuDhkX3EA@mail.gmail.com>
References: <20191015211618.20758-1-digetx@gmail.com> <20191015211618.20758-8-digetx@gmail.com>
 <20191016051802.rrxv56vtvxfm6qqe@vireshk-i7> <13a9ebd6-8dce-0217-d306-defb8eb6fb96@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <13a9ebd6-8dce-0217-d306-defb8eb6fb96@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 16, 2019 at 9:29 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 16.10.2019 08:18, Viresh Kumar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On 16-10-19, 00:16, Dmitry Osipenko wrote:
> >> Re-parenting to intermediate clock is supported now by the clock drive=
r
> >> and thus there is no need in a customized CPUFreq driver, all that cod=
e
> >> is common for both Tegra20 and Tegra30. The available CPU freqs are no=
w
> >> specified in device-tree in a form of OPPs, all users should update th=
eir
> >> device-trees.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/cpufreq/Kconfig.arm          |   4 +-
> >>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
> >>  drivers/cpufreq/tegra20-cpufreq.c    | 236 ++++++--------------------=
-
> >>  3 files changed, 55 insertions(+), 187 deletions(-)
> >>
> >> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> >> index a905796f7f85..2118c45d0acd 100644
> >> --- a/drivers/cpufreq/Kconfig.arm
> >> +++ b/drivers/cpufreq/Kconfig.arm
> >> @@ -301,8 +301,8 @@ config ARM_TANGO_CPUFREQ
> >>      default y
> >>
> >>  config ARM_TEGRA20_CPUFREQ
> >> -    tristate "Tegra20 CPUFreq support"
> >> -    depends on ARCH_TEGRA
> >> +    bool "Tegra20 CPUFreq support"
> >
> > Google is currently working on the GKI (generic kernel image) project w=
here they
> > want to use a single kernel image with modules for all kind of android =
devices.
> > And for that they need all such drivers to be built as module. Since th=
is is
> > already an module, I would ask you to keep it as is instead of moving i=
t to bool
> > here. Else some google guy will switch it back as module later on.
> >
> > LGTM otherwise. Nice work. Thanks.
> >
>
> Okay, I'll keep the modularity in v2.
>
> Although, tegra20-cpufreq isn't a driver anymore because now it merely
> prepares OPP table for the cpufreq-dt driver, which is really a one-shot
> action that is enough to do during boot and thus modularity is a bit
> redundant here.

I doubt Google will care much, since Android has moved on to aarch64.
Do they even support arm32 any more?
