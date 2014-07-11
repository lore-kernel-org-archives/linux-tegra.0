From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 12/13] cpufreq: Add cpufreq driver for Tegra124
Date: Fri, 11 Jul 2014 14:44:07 +0530
Message-ID: <CAKohpokGOtdY2SyJuN1QcVoDy2wsMcveiyr1e4cr0oe2j__h5g@mail.gmail.com>
References: <1405028569-14253-1-git-send-email-ttynkkynen@nvidia.com>
	<1405028569-14253-13-git-send-email-ttynkkynen@nvidia.com>
	<CAKohpom9ORXFiUU4=V+CxgN0ZOFLMEhEjHiU8HsYUYDybNXgHQ@mail.gmail.com>
	<20140711091207.GY23218@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20140711091207.GY23218@tbergstrom-lnx.Nvidia.com>
Sender: linux-pm-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Tuomas Tynkkynen <ttynkkynen@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 11 July 2014 14:42, Peter De Schrijver <pdeschrijver@nvidia.com> wrote:
> I don't think that's going to work? The voltage scaling is handled in hw.

Ahh..

> cpufreq-cpu0 seems to assume explicit sw control of the vdd_cpu regulator?

Its optional. If it fails to find a regulator, it doesn't depend or
play with it.
