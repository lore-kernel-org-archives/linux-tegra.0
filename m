From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 01/17] arm/tegra: board-dt: audio: Enable
 clocks, fix AUXDATA
Date: Wed, 23 Nov 2011 10:38:59 +0000
Message-ID: <20111123103858.GK4332@opensource.wolfsonmicro.com>
References: <1322011285-4002-1-git-send-email-swarren@nvidia.com>
	<1322011285-4002-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <1322011285-4002-2-git-send-email-swarren@nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@nvidia.com>
Cc: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, Mike Rapoport <mike@compulab.co.il>, Ian Lartey <ian@opensource.wolfsonmicro.com>, Rob Herring <rob.herring@calxeda.com>, Marc Dietrich <marvin24@gmx.de>, Grant Likely <grant.likely@secretlab.ca>, linux-tegra@vger.kernel.org, John Bonesio <bones@secretlab.ca>, Leon Romanovsky <leon@leon.nu>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Liam Girdwood <lrg@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 22, 2011 at 06:21:09PM -0700, Stephen Warren wrote:

>  	OF_DEV_AUXDATA("nvidia,tegra20-i2c", TEGRA_DVC_BASE, "tegra-i2c.3", NULL),
>  	OF_DEV_AUXDATA("nvidia,tegra20-i2s", TEGRA_I2S1_BASE, "tegra-i2s.0", NULL),
> -	OF_DEV_AUXDATA("nvidia,tegra20-i2s", TEGRA_I2S1_BASE, "tegra-i2s.1", NULL),
> +	OF_DEV_AUXDATA("nvidia,tegra20-i2s", TEGRA_I2S2_BASE, "tegra-i2s.1", NULL),

This looks like a straight bug fix which is independant of the below
change?
