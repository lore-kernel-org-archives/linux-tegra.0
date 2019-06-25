From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 2/5] regulator: core: Expose some of core functions
 needed by couplers
Date: Tue, 25 Jun 2019 17:40:01 +0300
Message-ID: <a0626c9d-c68b-9043-8b2f-870f594938b8@gmail.com>
References: <20190623210835.26281-1-digetx@gmail.com>
 <20190623210835.26281-3-digetx@gmail.com>
 <20190625111946.GP5316@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625111946.GP5316@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

25.06.2019 14:19, Mark Brown пишет:
> On Mon, Jun 24, 2019 at 12:08:32AM +0300, Dmitry Osipenko wrote:
>> Expose some of internal functions that are required for implementation of
>> customized regulator couplers.
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-couple-api
> 
> for you to fetch changes up to d22b85a1b97d12a4940ef9d778f6122546736f78:
> 
>   regulator: core: Expose some of core functions needed by couplers (2019-06-25 12:15:35 +0100)
> 
> ----------------------------------------------------------------
> regulator: Coupling API
> 
> This series introduces a way of specifying a customized regulators coupler
> which is necessary for cases like a non-trivial DVFS implementation.
> 
> ----------------------------------------------------------------
> Dmitry Osipenko (2):
>       regulator: core: Introduce API for regulators coupling customization
>       regulator: core: Expose some of core functions needed by couplers
> 
>  drivers/regulator/core.c          | 194 ++++++++++++++++++++++++++++----------
>  drivers/regulator/of_regulator.c  |  63 +++++++++----
>  include/linux/regulator/coupler.h |  97 +++++++++++++++++++
>  include/linux/regulator/driver.h  |   6 +-
>  include/linux/regulator/machine.h |   2 +-
>  5 files changed, 287 insertions(+), 75 deletions(-)
>  create mode 100644 include/linux/regulator/coupler.h
> 

Thank you very much! Very nice to see some more progress!
