From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ASoC: tegra: depend on ARCH_TEGRA,
	not ARCH_TEGRA_*
Date: Wed, 17 Jul 2013 12:23:03 -0600
Message-ID: <51E6E107.8020300@wwwdotorg.org>
References: <1374013667-21435-1-git-send-email-swarren@wwwdotorg.org>
 <20130717083003.GA22506@sirena.org.uk> <51E6CDEA.7060003@wwwdotorg.org>
 <20130717175701.GY22506@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20130717175701.GY22506@sirena.org.uk>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 07/17/2013 11:57 AM, Mark Brown wrote:
> On Wed, Jul 17, 2013 at 11:01:30AM -0600, Stephen Warren wrote:
>> On 07/17/2013 02:30 AM, Mark Brown wrote:
> 
>> -       select SND_SOC_TEGRA20_I2S if ARCH_TEGRA_2x_SOC -
>> select SND_SOC_TEGRA30_I2S if ARCH_TEGRA_3x_SOC +       select
>> SND_SOC_TEGRA20_I2S +       select SND_SOC_TEGRA30_I2S
> 
>> But then, it won't be possible to disable support for older
>> SoCs, since simply enabling a machine driver that might support
>> Tegra20 would force ASoC support for Tegra20 to be enabled, even
>> if the user only cares about Tegra30.
> 
> So how do they disable the core support for the older SoCs with the
> new model?

They don't; the core support is so small it's not worth having the
ifdefs in it; just a few K. As such, it seems simpler to just always
compile in the core support, and remove the need for all the ifdef
nests in mach-tegra/. The bulk of the differences are different
drivers for different chips.
