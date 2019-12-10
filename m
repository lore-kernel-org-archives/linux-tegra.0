From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 09/15] ASoC: tegra: Add fallback for audio mclk
Date: Tue, 10 Dec 2019 21:24:43 +0300
Message-ID: <560185d9-32fd-a85e-5feb-105f79b953c6@gmail.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
 <20191209164027.GG5483@sirena.org.uk>
 <7fe879fd-dae3-1e64-1031-cd9f00e31552@gmail.com>
 <20191209204735.GK5483@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191209204735.GK5483@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

09.12.2019 23:47, Mark Brown пишет:
> On Mon, Dec 09, 2019 at 11:31:59PM +0300, Dmitry Osipenko wrote:
>> 09.12.2019 19:40, Mark Brown пишет:
> 
>>> Why would this need to be a stable fix?  Presumably people with stable
>>> kernels are using the old device tree anyway?
> 
>> At least Rob Herring is asking to maintain backwards compatibility
>> because some ditros are using newer device-trees with stable kernels.
> 
> You're talking about forwards compatibility not backwards here.  Are
> those distros actually using LTS kernels?

I think openSUSE Leap could be one of those distros that use LTS kernel
with newer device-trees, but that's not 100%. Maybe Rob could help
clarifying that.

>> I'm personally also tending to use the newer DTB with older kernel
>> version whenever there is a need to check something using stable kernel.
>> Perhaps losing sound is not very important, but will be nicer if that
>> doesn't happen.
> 
> That really does sound like a "you broke it, you get all the pieces"
> situation TBH...  I'd be a lot more comfortable if the stable kernels
> were sticking to bugfix only though I do appreciate that they're not
> really that any more.

In some cases it could be painful to maintain device-tree compatibility
for platforms like NVIDIA Tegra SoCs because hardware wasn't modeled
correctly from the start.

I agree that people should use relevant device-trees. It's quite a lot
of hassle to care about compatibility for platforms that are permanently
in a development state. It could be more reasonable to go through the
pain if kernel required a full-featured device tree for every SoC from
the start.

But maybe Tegra / device-tree maintainers have a different opinion.
IIUC, device-trees are meant to be stable and software-agnostic, at
least that was the case not so long time ago and I don't think that this
premise changed.
