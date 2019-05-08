From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v1 6/6] soc/tegra: regulators: Add regulators coupler
 for Tegra30
Date: Wed, 8 May 2019 16:27:42 +0300
Message-ID: <af6de446-ab45-1745-30e5-426c6b34421f@gmail.com>
References: <20190414175939.12368-1-digetx@gmail.com>
 <20190414175939.12368-7-digetx@gmail.com>
 <20190508075848.GX14916@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508075848.GX14916@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

08.05.2019 10:58, Mark Brown пишет:
> On Sun, Apr 14, 2019 at 08:59:39PM +0300, Dmitry Osipenko wrote:
>> Add regulators coupler for Tegra30 SoC's that performs voltage balancing
>> of a coupled regulators and thus provides voltage scaling functionality.
> 
> Same here, what are the requirements this is implementing?
> 

There are two coupled regulators: CPU and CORE.

Constraints:

1) The max-spread voltage is 300mV.

2) CORE voltage must be higher than the CPU by at least N mV, where N
varies depending on the CPU voltage.

3) There is a constraint on the maximum CORE voltage depending on
hardware model/revision (cpu_speedo_id) where a higher voltages
apparently may cause physical damage, so it's better to hardcode the
limitation in the code rather than to rely on a board's device-tree
description. This constraint is quite vaguely defined in the downstream
kernel, I'm not really sure if it's solely about the hardware safety.
