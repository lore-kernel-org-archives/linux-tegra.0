From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3 09/11] cpufreq: tegra124-cpufreq: extend to support Tegra210
Date: Fri, 9 Mar 2018 14:41:39 +0530
Message-ID: <CAOh2x=kczewDo1wTR+46+M7SussWLQzMPZW2MgUnz3bmQq1Wkg@mail.gmail.com>
References: <1517934852-23255-1-git-send-email-pdeschrijver@nvidia.com> <1517934852-23255-10-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1517934852-23255-10-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 6, 2018 at 10:04 PM, Peter De Schrijver
<pdeschrijver@nvidia.com> wrote:
> Tegra210 has a very similar CPU clocking scheme than Tegra124. So add
> support in this driver. Also allow for the case where the CPU voltage is
> controlled directly by the DFLL rather than by a separate regulator object.
>
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/cpufreq/tegra124-cpufreq.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

You forgot to Cc maintainers and pm-list from the cpufreq world :(
