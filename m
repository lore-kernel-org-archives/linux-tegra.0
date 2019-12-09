From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 09/15] ASoC: tegra: Add fallback for audio mclk
Date: Mon, 9 Dec 2019 23:31:59 +0300
Message-ID: <7fe879fd-dae3-1e64-1031-cd9f00e31552@gmail.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
 <20191209164027.GG5483@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191209164027.GG5483@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

09.12.2019 19:40, Mark Brown пишет:
> On Thu, Dec 05, 2019 at 06:48:49PM -0800, Sowjanya Komatineni wrote:
>> mclk is from clk_out_1 which is part of Tegra PMC block and pmc clocks
>> are moved to Tegra PMC driver with pmc as clock provider and using pmc
>> clock ids.
>>
>> New device tree uses clk_out_1 from pmc clock provider.
>>
>> So, this patch adds fallback to extern1 in case of retrieving mclk fails
>> to be backward compatible of new device tree with older kernels.
>>
>> Cc: stable@vger.kernel.org
> 
> Why would this need to be a stable fix?  Presumably people with stable
> kernels are using the old device tree anyway?
> 

Presumably, yes.

At least Rob Herring is asking to maintain backwards compatibility
because some ditros are using newer device-trees with stable kernels.
I'm personally also tending to use the newer DTB with older kernel
version whenever there is a need to check something using stable kernel.
Perhaps losing sound is not very important, but will be nicer if that
doesn't happen.
