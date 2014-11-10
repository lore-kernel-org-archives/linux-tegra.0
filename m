From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v5 12/16] cpufreq: tegra: Rename tegra-cpufreq to tegra20-cpufreq
Date: Mon, 10 Nov 2014 10:22:15 +0530
Message-ID: <CAKohpo=Kdh2vuvSoQBLdWfZJn3xDezpNBjqM389u45_BdizPXQ@mail.gmail.com>
References: <1414161563-16812-1-git-send-email-mikko.perttunen@kapsi.fi>
	<1414161563-16812-13-git-send-email-mikko.perttunen@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1414161563-16812-13-git-send-email-mikko.perttunen@kapsi.fi>
Sender: linux-pm-owner@vger.kernel.org
To: Mikko Perttunen <mikko.perttunen@kapsi.fi>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mike Turquette <mturquette@linaro.org>, Paul Walmsley <pwalmsley@nvidia.com>, Vince Hsu <vinceh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Tuomas Tynkkynen <ttynkkynen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 24 October 2014 20:09, Mikko Perttunen <mikko.perttunen@kapsi.fi> wrote:
> From: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
>
> The Tegra124 will use a different driver for frequency scaling, so
> rename the old driver (which handles only Tegra20) appropriately.
>
> Signed-off-by: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
> Signed-off-by: Mikko Perttunen <mikko.perttunen@kapsi.fi>
> ---
>  drivers/cpufreq/Kconfig.arm       |   6 +-
>  drivers/cpufreq/Makefile          |   2 +-
>  drivers/cpufreq/tegra-cpufreq.c   | 218 --------------------------------------
>  drivers/cpufreq/tegra20-cpufreq.c | 218 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 222 insertions(+), 222 deletions(-)
>  delete mode 100644 drivers/cpufreq/tegra-cpufreq.c
>  create mode 100644 drivers/cpufreq/tegra20-cpufreq.c

Its just not readable enough.. You should have used: git format-patch -C -M
