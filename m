From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v1 5/6] soc/tegra: regulators: Add regulators coupler
 for Tegra20
Date: Wed, 8 May 2019 16:10:58 +0300
Message-ID: <9756d8ca-0778-5185-5b6b-3168d63819ec@gmail.com>
References: <20190414175939.12368-1-digetx@gmail.com>
 <20190414175939.12368-6-digetx@gmail.com>
 <20190508075706.GW14916@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508075706.GW14916@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

08.05.2019 10:57, Mark Brown пишет:
> On Sun, Apr 14, 2019 at 08:59:38PM +0300, Dmitry Osipenko wrote:
>> Add regulators coupler for Tegra20 SoC's that performs voltage balancing
>> of a coupled regulators and thus provides voltage scaling functionality.
> 
> Can you say what the rules that this is trying to follow are?
> 

There are three regulators: CPU, CORE and RTC.

Constraints:

1) CORE and RTC have max-spread voltage of 170mV.
2) CORE and RTC voltages must be higher than the CPU voltage by at least
120mV.
